<%
/**
 * 
 * <p>Title: SPI绠＄悊閰嶇疆鏂囦欢鏄庣粏淇℃伅鏄剧ず椤甸潰</p>
 *
 * <p>Description: SPI绠＄悊閰嶇疆鏂囦欢鏄庣粏淇℃伅鏄剧ず椤甸潰</p>
 *
 * <p>Copyright: Copyright (c) 2008</p>
 *
 * <p>Company: chinacreator</p>
 * @Date 2008-9-19
 * @author gao.tang
 * @version 1.0
 */
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8" session="false"%>
<%@page import="org.frameworkset.spi.BaseApplicationContext,org.frameworkset.spi.assemble.Pro"%>
<%@page import="org.frameworkset.spi.assemble.LinkConfigFile"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@ taglib prefix="tab" uri="/WEB-INF/tabpane-taglib.tld" %>	

<% 
	String rootpath = request.getContextPath();
	String selected = request.getParameter("selected");
	String classType = request.getParameter("classType");
	String nodePath = request.getParameter("nodePath");
	BaseApplicationContext contextbase = BaseApplicationContext.getBaseApplicationContext(nodePath);
	LinkConfigFile lnk = contextbase.getLinkConfigFile(selected);
	List list = null;
	Map map = null;
	Map pros = null;
	
	if(lnk != null){
	
		//瀛愭枃浠?
		list = lnk.getLinkConfigFiles();
		//绠＄悊鏈嶅姟
		map = lnk.getMgrServices();
		pros = lnk.getProperties();
		
	}
	//System.out.println(lnk.getLinkConfigFiles().size());
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/treeview.css">
<%@ include file="/include/css.jsp"%>
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/contentpage.css">
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/tab.winclassic.css">
		<tab:tabConfig/>	
	</head>
	
	<body class="contentbodymargin" scroll="auto">
	<table height="10%"  width="100%" border="0" cellpadding="0" cellspacing="0" class="thin">
	<tr><td>
		<%if(selected != null){out.println("閰嶇疆鏂囦欢锛? + selected); }
		  else
		  {
		  out.println("璇烽€夋嫨spi绠＄悊鑺傜偣锛?);
		  return;
		  }%>
	</td></tr>
	<tr><td>
		<%if(selected != null){out.println("瀹瑰櫒鏍囪瘑锛? + nodePath); }
		 %>
	</td></tr>
	
	<tr><td>
		<%if(selected != null){out.println("瀹瑰櫒绫诲瀷锛? + contextbase.getClass().getCanonicalName()); }
		 %>
	</td></tr>
	</table >
	
	<tab:tabContainer id="compsitents" skin="amethyst">
	
	
	<tab:tabPane id="bussinessbeans" tabTitle="涓氬姟缁勪欢" >		
	<table class="thin" width="100%">
	<tr>
	<td class="headercolor">涓氬姟缁勪欢ID</td>
	<td class="headercolor">涓氬姟缁勪欢鏄庣粏</td>  
	<td class="headercolor">涓氬姟缁勪欢绫诲瀷</td>
	<td class="headercolor">涓氬姟缁勪欢鎻忚堪</td>
	</tr>
	<%if(pros != null && !pros.isEmpty()){ 
		Iterator iterator = pros.keySet().iterator();
		while(iterator.hasNext()){
			String key = (String)iterator.next();
			Pro pro = (Pro)pros.get(key);
	%>
	<tr>
	<td><%=key %></td>	
	<%
		if(pro.isBean())
		{
			%>
	<td><a href="spi/beanDetail.jsp?selected=<%=key %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" + pro.getName() + "<br>");		
		out.print("class=" + pro.getClazz() + "<br>");	
		out.print("singlable=" + pro.isSinglable() + "<br>");	
	
		
	 %></a></td>
	<%
		}
		else if(pro.isRefereced())
		{
		%>
	<td>
	<%
	if(pro.isAttributeRef()) { 
		String refid_ = pro.getRefid();
	%>
	<a href="spi/proDetail.jsp?selected=<%=refid_ %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" + pro.getName() + "<br>");
				
		out.print("refid=" + pro.getRefid() + "<br>");
		out.print("寮曠敤绫诲瀷锛? );out.print("缁勪欢鎴栬€呭睘鎬у紩鐢?);
		
	 %></a>
	 <%} else if(pro.isServiceRef()) {
	 	String refserviceid = pro.getRefid();
	  %>
	<a href="managerserviceDetail.jsp?selected=<%=refserviceid %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" + pro.getName() + "<br>");
		
		out.print("refid=" + pro.getRefid() + "<br>");
		out.print("寮曠敤绫诲瀷锛? );out.print("绠＄悊鏈嶅姟寮曠敤");
		
	 %></a>
	 <%}%>
	 </td>
	<%}
	else
		{
			%>
	<td><a href="spi/proDetail.jsp?selected=<%=key %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		if(pro.getName() != null)
			out.print("name=" + pro.getName() + "<br>");
		if(pro.getValue() != null)
		{
			if(pro.isList())
				out.print("value=[List set]");
			else if(pro.isMap())
				out.print("value=[Map set]");
			else if(pro.isSet())
				out.print("value=[Set set]");
			else if(pro.isArray())
				out.print("value=[Array set]");
			else 
				out.print("value=" + pro.getValue() );		
		}
		
		if(pro.getClazz() != null)
			out.print("class=" + pro.getClazz() + "<br>");
			
		if(pro.getLabel() != null)
			out.print("label=" + pro.getLabel() + "<br>");
		if(pro.getEditorString() != null)
			out.print("灞炴€х紪杈戝櫒锛? + pro.getEditorString() + "<br>");	
		
		
		
		
		
	 %></a></td>
	<%
		}
	 %>
	
	<td ><%
		if(pro.isBean())
		{
			out.print("缁勪欢");
		}
		else if(pro.isRefereced())
		{
			out.print("寮曠敤");
		}
		else
		{
			out.print("鍏ㄥ眬灞炴€?);
		}
	 %></td>
	 <td ><%
	 if(pro.getDescription() != null)
	 	out.print(pro.getDescription());
	  %></td>
	</tr>
	<% 
	   }
	   out.print("<tr><td colspan='4'>鎬诲叡閰嶇疆浜? + pros.size() + "涓笟鍔＄粍浠讹紒</td></tr>");	
	  }else{ 
	%>
	<tr><td colspan="2">娌℃湁閰嶇疆涓氬姟缁勪欢锛?/td></tr>
	<%} %>
	</table>		
	</tab:tabPane>
	
	<tab:tabPane id="subfiles" tabTitle="瀛愭ā鍧楁枃浠? lazeload="true" >
	<table class="thin" width="100%">
	<tr height=100% width="100%"><td height=100% width="100%">
	
	<fieldset height=100% width="100%">
	<LEGEND align=left><strong>&nbsp;绠＄悊鏈嶅姟瀛愭ā鍧楁枃浠?nbsp;</strong></LEGEND>
	<table height=100% width="100%" border="0" cellpadding="0" cellspacing="0" class="table">
	
	<tr ><td class="headercolor">瀛愭ā鍧楁枃浠跺湴鍧€</td><td class="headercolor">鏄庣粏鏌ョ湅</td></tr>
	<%if(list != null && list.size() > 0){
		for(int i = 0; i < list.size(); i++){
			LinkConfigFile linkConfigFile = (LinkConfigFile)list.get(i);
			String path = linkConfigFile.getConfigFile();
	%>
	<tr>
		<td><%=path %></td>
		<td><a href="configfileDetail.jsp?selected=<%=path %>&nodePath=<%=nodePath %>" target="_blank" name="fileDetail" >鏄庣粏鏌ョ湅</a></td>
	</tr>
	<%
		}
		out.print("<tr><td colspan='2'>鎬诲叡閰嶇疆浜? + list.size() + "涓鐞嗘湇鍔″瓙妯″潡鏂囦欢锛?/td></tr>");
	  }else{ 
	%>
	<tr height=100% width="100%"><td height=100% width="100%" colspan="2">娌℃湁閰嶇疆绠＄悊鏈嶅姟瀛愭ā鍧楁枃浠讹紒</td></tr>
	<%} %>
	</table>
	
	</fieldset>
	</td></tr>
	</table>
	</tab:tabPane>
	<tab:tabPane id="managers" tabTitle="绠＄悊鏈嶅姟">
	<table class="thin" width="100%">
	<tr height=100% width="100%"><td height=100% width="100%">
	<fieldset height=100% width="100%">
	<LEGEND align=left><strong>&nbsp;绠＄悊鏈嶅姟&nbsp;</strong></LEGEND>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
	<td class="headercolor">绠＄悊鏈嶅姟ID</td>
	<td class="headercolor">绠＄悊鏈嶅姟鏄庣粏</td>
	</tr>
	<%if(map != null && !map.isEmpty()){ 
		Iterator iterator = map.keySet().iterator();
		while(iterator.hasNext()){
			String key = (String)iterator.next();
	%>
	<tr>
	<td><%=key %></td>
	<td><a href="managerserviceDetail.jsp?selected=<%=key %>" target="_blank" name="serviceDetail"  >鏄庣粏鏌ョ湅</a></td>
	</tr>
	<% 
	   }
	   out.print("<tr><td colspan='2'>鎬诲叡閰嶇疆浜? + map.size() + "涓鐞嗘湇鍔★紒</td></tr>");	
	  }else{ 
	%>
	<tr><td colspan="2">娌℃湁閰嶇疆绠＄悊鏈嶅姟锛?/td></tr>
	<%} %>
	</table>
	</fieldset>
	</td></tr>
	</table>
	
	</tab:tabPane>
	
	
	
	
	</tab:tabContainer>
	
	</body>
</html>