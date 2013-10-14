<%
/*
 * <p>Title: 鐩戞帶鍦ㄧ嚎鐢ㄦ埛鏁?/p>
 * <p>Description: 鍦ㄧ嚎鐢ㄦ埛鐧婚檰绯荤粺鐨勬儏鍐?/p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: chinacreator</p>
 * @Date 2008-9-8
 * @author gao.tang
 * @version 1.0
 */
 %>
<%@page contentType="text/html;charset=UTF-8" session="false"%>
<%@page import="java.util.Map"%>
<%@page import="com.frameworkset.platform.remote.Utils"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.jgroups.util.Rsp"%>
<%@page import="java.util.Vector"%>
<%@page import="org.jgroups.stack.IpAddress"%>
<%@page import="com.frameworkset.common.poolman.DBUtil"%>
<%@page import="com.frameworkset.platform.config.ConfigManager"%>

<%


%>

<html>
<head><title>鍦ㄧ嚎鐢ㄦ埛鏁扮粺璁?/title>
<%@ include file="/include/css.jsp"%>
		<tab:tabConfig/>	
		<script src="../inc/js/func.js"></script>
		<script type="text/javascript" languge="Javascript">
	function flushButton(){
		document.location = document.location;
	}
	
	
	</script>
</head>

<body class="contentbodymargin" onload="" scroll="no">

<div style="width:100%;height:100%;overflow:auto">
<form  name="LogForm"  method="post">
	<fieldset>
	<LEGEND align=left><strong>&nbsp;BS鍦ㄧ嚎浜烘暟缁熻淇℃伅&nbsp;</strong></LEGEND>
	<table width="100%" height="" border="0" cellpadding="0" cellspacing="1" class="thin">
	<div align="right" ><input type="button" value="鍒锋柊椤甸潰" class="input" onclick="flushButton()"></div>
	<tr>
	<th>鏈嶅姟鍣ㄥ悕</th>
	<th>鍦ㄧ嚎鐢ㄦ埛鏁?/th>
	</tr>
	<% 
		Map onlineUserCount = Utils.getOnlineUserCount();
		
		Vector appServers = Utils.getAppservers();
		//Set countinfo = onlineUserCount.entrySet();
		//Iterator countIte = countinfo.iterator();
		int allUsercount = 0;
		int i = 1;
		for(int appCount = 0; appCount < appServers.size(); appCount++){
			IpAddress ipAddress = (IpAddress)appServers.get(appCount);
			String ipPort = ipAddress.toString();
			Rsp rsp = (Rsp)onlineUserCount.get(ipAddress);
		//}
		//while(countIte.hasNext()){
		//	Map.Entry entry = (Map.Entry)countIte.next();
		//	String ipPort = entry.getKey().toString();
		//	Rsp rsp = (Rsp)entry.getValue();
		
			int userCount = ((Integer)rsp.getValue()).intValue();
			allUsercount += userCount;
	%>
	<tr>
	<td><strong>server<%=i++ %>-----<%=ipPort %></strong></td>
	<td><%=userCount %></td>
	</tr>
	<% 
		}
	%>
	<tr>
	<td colspan="2"><strong>BS鎬诲湪绾夸汉鏁颁负锛?%=allUsercount %></strong></td>
	</tr>
	</table>
	</fieldset>
	<br>
	<% 
		if(ConfigManager.getInstance().getConfigBooleanValue("cs.menu.swtich",true)){
		
	
	%>
	<fieldset>
	<LEGEND align=left><strong>&nbsp;CS鍦ㄧ嚎浜烘暟缁熻淇℃伅&nbsp;</strong></LEGEND>
	<table width="100%" height="" border="0" cellpadding="0" cellspacing="1" class="thin">
	<% 
		int CScount = 0;
		try
		{
			DBUtil db = new DBUtil();
			db.executeSelect("bspf","select count(*) from td_sm_user t where t.logon_ip is not null");
			CScount = db.getInt(0,0);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
	<div align="right" ><input type="button" value="鍒锋柊椤甸潰" class="input" onclick="flushButton()"></div>
	<TR>
	<TD COLSPAN="2">
	<strong>CS鎬诲湪绾夸汉鏁颁负锛?%=CScount %></strong>
	</TD>
	</TR>
	</table>
	</fieldset>
	<%} %>
</form>
</div>
</body>


</html>