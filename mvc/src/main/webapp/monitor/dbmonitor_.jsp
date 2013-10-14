<%
/*
 * <p>Title: 鐩戞帶杩炴帴姹犱俊鎭?/p>
 * <p>Description: 杩炴帴姹犱娇鐢ㄦ儏鍐?/p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: chinacreator</p>
 * @Date 2008-9-8
 * @author gao.tang
 * @version 1.0
 */
 %>
<%@ page session="false" contentType="text/html; charset=UTF-8" language="java" import="java.util.List"%>
<%@ page import="com.frameworkset.common.poolman.DBUtil"%>

<%@page import="java.util.*"%>
<%@page import="com.frameworkset.common.poolman.util.JDBCPoolMetaData"%>

<%@ taglib prefix="tab" uri="/WEB-INF/tabpane-taglib.tld" %>	
		
<%

	String userAccount = "admin";
	
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>bboss杩炴帴姹犱娇鐢ㄦ儏鍐典笌閰嶇疆淇℃伅</title>
<%@ include file="/include/css.jsp"%>
		<tab:tabConfig/>	
		<script src="../../inc/js/func.js"></script>
		<script type="text/javascript" language="Javascript">
		function flushBotton(){
			document.location = document.location;
		}
		
		
		</script>
		</head>

	<body class="contentbodymargin" onload="" scroll="no">
	<div style="width:100%;height:100%;overflow:auto">
	<div align="right"><input type="button" class="input" value="鍒锋柊椤甸潰" onclick="flushBotton()"></div>
	
		
	
	
	<tab:tabContainer id="singleMonitorinfo">
	<% 
		//List poollist = new ArrayList();
		DBUtil dbUtil = new DBUtil();
		Enumeration enum_ = dbUtil.getAllPoolnames();
		while(enum_.hasMoreElements()){
			String poolname = (String)enum_.nextElement();
			JDBCPoolMetaData metadata = DBUtil.getPool(poolname).getJDBCPoolMetadata();
		String title = "鏁版嵁搴擄細"+poolname+" 鐨勯摼鎺ユ儏鍐?;
	%>
	
	<tab:tabPane id="<%=poolname %>" tabTitle="<%=title%>" >
	
	<form  name="LogForm"  method="post">
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="1" class="thin">
					<tr>
					<table>
					<% 
						//鏄惁鏄閮ㄦ暟鎹簮,false涓嶆槸锛宼rue鏄?
						boolean isExternal = false;
						String exterJNDI = metadata.getExternaljndiName();
						if(exterJNDI != null && !"".equals(exterJNDI)){
							isExternal = true;
						}
						if(metadata.getDatasourceFile() != null)
						{
					%>
					<tr><td colspan="3">
						
						鏁版嵁婧愬搴旀枃浠讹細<a href="configfileDetail.jsp?selected=<%=metadata.getDatasourceFile() %>&classType=configfile&nodeMemo=&nodePath=<%=metadata.getDatasourceFile() %>" target="ds"><%=metadata.getDatasourceFile() %></a>
						
						<%if(metadata.getDatasourceFile().startsWith("druid") ) {%>
						   <a href="../druid/index.html" target="m">鏌ョ湅鐩戞帶淇℃伅</a>
						<%} %>
						
						
						
					</td>
					</tr>
						<tr>
						<table border="1">
						<caption>鏁版嵁搴擄細<%=poolname %>鐨勯厤缃俊鎭?/caption>
						<tr>
						<th>閰嶇疆灞炴€у悕</th>
						<th>灞炴€у搴斿€?/th>
						<th>缂虹渷鍊?/th>
						<th>鎻忚堪</th>
						</tr>
						
						<tr>
						<td>dbname</td>
						<td height="25"><%=metadata.getDbname() %></td>
						<td>鏃犵己鐪佸€?/td>
						<td>鏁版嵁搴撳悕绉?/td>
						</tr>
						
						
						
						<tr>
						<td>loadmetadata</td>
						<td height="25"><%=metadata.getLoadmetadata() %></td>
						<td>false</td>
						<td>鏄惁鍔犺浇鏁版嵁搴撴簮鏁版嵁</td>
						</tr>
						<tr>
						<td>showsql</td>
						<td height="25"><%=metadata.isShowsql() %></td>
						<td>false</td>
						<td>鏄惁鍦ㄥ悗鍙拌緭鍑烘墽琛岀殑sql璇彞锛宼rue杈撳嚭鎵ц鐨剆ql璇彞
						</td>
						</tr>
						
						
						
						<tr>
						<td>enablejta</td>
						<td height="25"><%=metadata.isEnablejta() %></td>
						<td>false</td>
						<td>鏄惁鍚敤jta datasource锛屽鏋滃惎鐢ㄥ皢鍦╦ndi context涓敞鍐屼竴涓?
						  TXDatasource
						  jta datasource鐨刯ndiname涓?jndiName灞炴€ф寚瀹氱殑鍊?
						  榛樿涓轰笉鍚敤锛岃灞炴€у湪鎵樼绗笁鏂规暟鎹簮鏃舵湁鐢?
						  褰揺nablejta == true鏃讹紝蹇呴』鍦╬oolman.xml鏂囦欢涓寚瀹歫ndiName灞炴€?
						</td>
						</tr>
						</table>
						</tr>	
					  <%} 
						else
						{
					  %>
					<tr><td colspan="3">
						<%if(!isExternal){ %>
						鏁版嵁婧愶細<%=poolname %> 鐨勯摼鎺ユ儏鍐?
						<%}else{ %>
						澶栭儴鏁版嵁婧愶細<%=poolname %> 鐨勯摼鎺ユ儏鍐?
						<%} %>
					</td>
					</tr>
					<tr class="tr">
						
						<td width="16%" height="25" class="detailtitle" align="right">绌洪棽杩炴帴锛?/td>
						<td height="25">
						<%=DBUtil.getNumIdle(poolname)%>
						</td>
						</tr>
						
						<tr class="tr">
						<td width="16%" height="25" class="detailtitle" align="right">姝ｅ湪浣跨敤杩炴帴锛?/td>
						<td height="25" >
						<%=DBUtil.getNumActive(poolname)%>
						</td>
						</tr>
						
						<tr class="tr">
						<td width="16%" height="25" class="detailtitle" align="right">浣跨敤杩炴帴楂樺嘲鍊硷細</td>
						<td height="25" >
						<%=DBUtil.getMaxNumActive(poolname)%>
						</td>
						</tr>
					</table>
					
					
						<tr>
						<table border="1">
						<caption>鏁版嵁搴擄細<%=poolname %>鐨勯厤缃俊鎭?/caption>
						<tr>
						<th>閰嶇疆灞炴€у悕</th>
						<th>灞炴€у搴斿€?/th>
						<th>缂虹渷鍊?/th>
						<th>鎻忚堪</th>
						</tr>
						
						<tr>
						<td>dbname</td>
						<td height="25"><%=metadata.getDbname() %></td>
						<td>鏃犵己鐪佸€?/td>
						<td>鏁版嵁搴撳悕绉?/td>
						</tr>
						
						<tr>
						<td>driver</td>
						<td height="25"><%=metadata.getDriver() %></td>
						<td>鏃犵己鐪佸€?/td>
						<td>鏁版嵁搴撻┍鍔?/td>
						</tr>
						
						<tr>
						<td>url</td>
						<td height="25">
						<%if(userAccount.equals("admin")){ %><%=metadata.getURL() %><%}else{ %>
						******
						<%} %>
						</td>
						<td>鏃犵己鐪佸€?/td>
						<td>鏁版嵁搴撻摼鎺ュ湴鍧€</td>
						</tr>
						
						<tr>
						<td>jndiName</td>
						<td height="25">
						<%=metadata.getJNDIName() %>
						</td>
						<td>鏃犵己鐪佸€?/td>
						<td>jndi鍚嶇О</td>
						</tr>
						
						<tr>
						<td>external</td>
						<td height="25">
						<%=metadata.isExternal() %>
						</td>
						<td>false</td>
						<td>鏍囪瘑鏁版嵁婧愭槸鍚︽槸澶栭儴DataSource锛屽鏋滄槸澶栭儴DataSource鍒欏繀椤绘寚瀹氬閮╠atasource鐨刯ndi鍚嶇О锛?
							true鏄閮―ataSource
						</td>
						</tr>
						
						<tr>
						<td>externaljndiName</td>
						<td height="25">
						<%=exterJNDI %>
						</td>
						<td>鏃犵己鐪佸€?/td>
						<td>澶栭儴鏁版嵁婧愬搴旂殑jndi鍚嶇О锛屽鏋滀笉涓簄ull璇存槑瀵瑰簲鐨勫氨鏄閮ㄦ暟鎹簮锛屾牴鎹jndi鍚嶇О鎵惧埌瀵瑰簲鐨勭湡瀹炴暟鎹簮</td>
						</tr>
						
						
						<tr>
						<td>username</td>
						<td height="25">
						<%if(userAccount.equals("admin")){ %><%=metadata.getUserName() %>
						<%}else{ %>
						******
						<%} %></td>
						<td>鏃犵己鐪佸€?/td>
						<td>鏁版嵁搴撶敤鎴峰悕</td>
						</tr>
						
						<tr>
						<td>password</td>
						<td height="25"><%if(userAccount.equals("admin")){ %><%=metadata.getPassword() %><%}else{ %>
						******
						<%} %></td>
						<td>鏃犵己鐪佸€?/td>
						<td>鏁版嵁搴撳瘑鐮?/td>
						</tr>
						
						<tr>
						<td>loadmetadata</td>
						<td height="25"><%=metadata.getLoadmetadata() %></td>
						<td>false</td>
						<td>鏄惁鍔犺浇鏁版嵁搴撴簮鏁版嵁</td>
						</tr>
						
						<tr>
						<td>txIsolationLevel</td>
						<td height="25"><%=metadata.getTxIsolationLevel() %></td>
						<td>READ_COMMITTED</td>
						<td>浜嬪姟鍒嗙绾у埆</td>
						</tr>
						
						<tr>
						<td>initialConnections</td>
						<td height="25"><%=metadata.getInitialConnections() %></td>
						<td>1</td>
						<td>鍒濆閾炬帴鏁?缂虹渷涓?</td>
						</tr>
						
						<tr>
						<td>minimumSize</td>
						<td height="25"><%=metadata.getMinimumSize() %></td>
						<td>0</td>
						<td>鏈€灏忕┖闂查摼鎺ユ暟,缂虹渷涓?锛屾牴鎹厤缃殑涓嶅悓鍙敼涓簃aximumSize鐨勪竴鍗婏紝濡傛灉maximumSize涓?00鍒檓inimumSize閰嶄负100</td>
						</tr>
						
						<tr>
						<td>maximumSize</td>
						<td height="25"><%=metadata.getMaximumSize() %></td>
						<td>鏁存暟鐨勬渶澶у€?/td>
						<td>鍏佽鐨勬渶澶ч摼鎺ユ暟,缂虹渷鍊间负鏁存暟鐨勬渶澶у€?</td>
						</tr>
						
						<tr>
						<td>maximumSoft</td>
						<td height="25"><%=metadata.isMaximumSoft() %></td>
						<td>false</td>
						<td>鎺у埗connection杈惧埌maximumSize鏄惁鍏佽鍐嶅垱寤烘柊鐨刢onnection鈥斺€攖rue锛氬厑璁革紝缂虹渷鍊?;false锛氫笉鍏佽 </td>
						</tr>
						
						<tr>
						<td>removeAbandoned</td>
						<td height="25"><%=metadata.getRemoveAbandoned() %></td>
						<td>false</td>
						<td>鏄惁妫€娴嬭秴鏃堕摼鎺ワ紙浜嬪姟瓒呮椂閾炬帴锛?
    						true-妫€娴嬶紝濡傛灉妫€娴嬪埌鏈変簨鍔¤秴鏃剁殑閾炬帴锛岀郴缁熷皢寮哄埗鍥炴敹锛堥噴鏀撅級璇ラ摼鎺?
    						false-涓嶆娴嬶紝榛樿鍊?
    					</td>
						</tr>
						
						<tr>
						<td>userTimeout</td>
						<td height="25"><%=metadata.getUserTimeout() %></td>
						<td>60 绉?/td>
						<td>閾炬帴浣跨敤瓒呮椂鏃堕棿锛堜簨鍔¤秴鏃舵椂闂达級  鍗曚綅锛氱
    					</td>
						</tr>
						
						<tr>
						<td>logAbandoned</td>
						<td height="25"><%=metadata.isLogAbandoned() %></td>
						<td>true</td>
						<td>绯荤粺寮哄埗鍥炴敹閾炬帴鏃讹紝鏄惁杈撳嚭鍚庡彴鏃ュ織鈥斺€斺€斺€攖rue-杈撳嚭锛岄粯璁ゅ€?false-涓嶈緭鍑?
    					</td>
						</tr>
						
						<tr>
						<td>readOnly</td>
						<td height="25"><%=metadata.isReadOnly() %></td>
						<td>true</td>
						<td>鏁版嵁搴撲細璇濇槸鍚︽槸readonly锛岀己鐪佷负true
    					</td>
						</tr>
						
						<tr>
						<td>skimmerFrequency</td>
						<td height="25"><%=metadata.getSkimmerFrequency() %></td>
						<td>60 绉?/td>
						<td>鍥炴敹绌洪棽閾炬帴鎿嶄綔闂撮殧鏃堕棿,绉掞紙s锛変负鍗曚綅锛岀己鐪佷负60绉?/td>
						</tr>
						
						
						<tr>
						<td>connectionTimeout</td>
						<td height="25"><%=metadata.getConnectionTimeout() %></td>
						<td>1200 绉?/td>
						<td>
						鍗曚綅锛氱;
						绌洪棽閾炬帴鍥炴敹鏃堕棿锛岀┖闂叉椂闂磋秴杩囨寚瀹氱殑鍊兼椂锛屽皢琚洖鏀?缂虹渷涓?200绉?/td>
						</tr>
						
						<tr>
						<td>shrinkBy</td>
						<td height="25"><%=metadata.getShrinkBy() %></td>
						<td>5</td>
						<td>姣忔鍥炴敹鐨勯摼鎺ユ暟,鍥炴敹杩涚▼姣忔鏈€澶氬洖鏀剁殑绌洪棽閾炬帴鏁帮紝缂虹渷鍊兼槸5</td>
						</tr>
						
						<tr>
						<td>testWhileidle</td>
						<td height="25"><%=metadata.isTestWhileidle() %></td>
						<td>false</td>
						<td> 妫€娴嬬┖闂查摼鎺ュ鐞嗘椂锛屾槸鍚﹀绌洪棽閾炬帴杩涜鏈夋晥鎬ф鏌ユ帶鍒跺紑鍏斥€斺€?
      						 true-妫€鏌ワ紝閮芥鏌ュ埌鏈夋棤鏁堥摼鎺ユ椂锛岀洿鎺ラ攢姣佹棤鏁堥摼鎺ワ紱
     						false-涓嶆鏌ワ紝缂虹渷鍊?/td>
						</tr>
						
						
						<tr>
						<td>keygenerate</td>
						<td height="25"><%=metadata.getKeygenerate() %></td>
						<td>auto</td>
						<td>瀹氫箟鏁版嵁搴撲富閿敓鎴愭満鍒?
        缂虹渷鐨勯噰鐢ㄧ郴缁熻嚜甯︾殑涓婚敭鐢熸垚鏈哄埗锛?
        澶栨绋嬪簭鍙互瑕嗙洊绯荤粺涓婚敭鐢熸垚鏈哄埗
        鐢卞€兼潵鍐冲畾鈥斺€?
        auto:鑷姩锛屼竴鑸湪鐢熶骇鐜涓嬮噰鐢ㄨ绉嶆ā寮忥紝
               瑙ｅ喅浜嗗崟涓簲鐢ㄥ苟鍙戣闂暟鎹簱娣诲姞璁板綍浜х敓鍐茬獊鐨勯棶棰橈紝鏁堢巼楂橈紝濡傛灉鐢熶骇鐜涓嬫湁澶氫釜搴旂敤骞跺彂璁块棶鍚屼竴鏁版嵁搴撴椂锛屽繀椤婚噰鐢╟omposite妯″紡;
        composite锛氱粨鍚堣嚜鍔ㄥ拰瀹炴椂浠庢暟鎹簱涓幏鍙栨渶澶х殑涓婚敭鍊间袱绉嶆柟寮忔潵澶勭悊锛屽紑鍙戠幆澧冧笅寤鸿閲囩敤璇ョ妯″紡锛?
                   瑙ｅ喅浜嗗涓簲鐢ㄥ悓鏃惰闂暟鎹簱娣诲姞璁板綍鏃朵骇鐢熷啿绐佺殑闂锛屾晥鐜囩浉瀵硅緝浣庯紝 濡傛灉鐢熶骇鐜涓嬫湁澶氫釜搴旂敤骞跺彂璁块棶鍚屼竴鏁版嵁搴撴椂锛屽繀椤婚噰鐢╟omposite妯″紡</td>
						</tr>
						
						<tr>
						<td>maxWait</td>
						<td height="25"><%=metadata.getMaxWait() %>&nbsp;绉?/td>
						<td>30 绉?/td>
						<td>鑾峰彇閾炬帴绛夊緟瓒呮椂鏃堕棿,鍗曚綅锛氱锛岀己鐪佺瓑寰呮椂闂?0绉掋€傚綋搴旂敤绋嬪簭璇锋眰閾炬帴鏃讹紝閾炬帴姹犱腑鎵€鏈夌殑閾炬帴閮藉浜庝娇鐢ㄧ姸鎬侊紝骞朵笖宸茬粡杈惧埌鏈€澶ц繛鎺ユ暟鏃讹紝璇ヨ姹傚氨浼氬浜庣瓑寰呯姸鎬侊紝濡傛灉绛夊緟鐨勬椂闂磋秴杩?0绉掞紙maxWait閰嶇疆鐨勫€硷級鏃讹紝绯荤粺灏嗘姏鍑鸿姹傞摼鎺ヨ秴鏃跺紓甯搞€?/td>
						</tr>
						
						<tr>
						<td>validationQuery</td>
						<td height="25"><%=metadata.getValidationQuery() %></td>
						<td>鏃犵己鐪佸€?/td>
						<td>鏍￠獙sql璇彞銆傚簲鐢ㄧ▼搴忎粠閾炬帴姹犵敵璇烽摼鎺ユ椂锛岃繛鎺ユ睜瀵圭敵璇风殑閾炬帴鎵ц鏍￠獙sql璇彞锛屽鏋滄墽琛屾垚鍔燂紝鍒欐爣璇嗚閾炬帴鏄湁鏁堢殑锛岀洿鎺ヨ繑鍥炵粰搴旂敤绋嬪簭锛屽惁鍒欏皢璇ヨ繛鎺ョ洿鎺ヤ粠閾炬帴姹犱腑閿€姣侊紝骞朵笖閲嶆柊鍒版睜涓幏鍙栨柊鐨勯摼鎺?
						濡傛鍙嶅鎵ц锛岀洿鎺ヨ幏鍙栧埌鏈夋晥鐨勮繛鎺ヤ负姝?
						</td>
						</tr>
						
						<tr>
						<td>poolingPreparedStatements</td>
						<td height="25"><%=metadata.isPoolPreparedStatements() %></td>
						<td>false</td>
						<td>棰勭紪璇憇tatement姹犲寲鏍囪--true锛氭睜鍖?false锛氫笉姹犲寲锛岄粯璁ゅ€?
						</td>
						</tr>
						
						<tr>
						<td>maxOpenPreparedStatements</td>
						<td height="25"><%=metadata.getMaxOpenPreparedStatements() %></td>
						<td>-1</td>
						<td>姣忎釜connection鏈€澶ф墦寮€鐨勯缂栬瘧statements鏁?榛樿鍊间负-1
						</td>
						</tr>
						
					
						
						<tr>
						<td>showsql</td>
						<td height="25"><%=metadata.isShowsql() %></td>
						<td>false</td>
						<td>鏄惁鍦ㄥ悗鍙拌緭鍑烘墽琛岀殑sql璇彞锛宼rue杈撳嚭鎵ц鐨剆ql璇彞
						</td>
						</tr>
						
						
						
						<tr>
						<td>enablejta</td>
						<td height="25"><%=metadata.isEnablejta() %></td>
						<td>false</td>
						<td>鏄惁鍚敤jta datasource锛屽鏋滃惎鐢ㄥ皢鍦╦ndi context涓敞鍐屼竴涓?
						  TXDatasource
						  jta datasource鐨刯ndiname涓?jndiName灞炴€ф寚瀹氱殑鍊?
						  榛樿涓轰笉鍚敤锛岃灞炴€у湪鎵樼绗笁鏂规暟鎹簮鏃舵湁鐢?
						  褰揺nablejta == true鏃讹紝蹇呴』鍦╬oolman.xml鏂囦欢涓寚瀹歫ndiName灞炴€?
						</td>
						</tr>
						<tr>
						<td>encryptdbinfo</td>
						<td height="25"><%=metadata.isEncryptdbinfo() %></td>
						<td>false</td>
						<td>鏄惁鍔犲瘑鏁版嵁搴撲俊鎭紝鍖呮嫭url锛寀seraccount,password,鎻愪緵浠ヤ笅鎻掍欢锛?
						
						#DESDBInfoEncrypt-閲囩敤des绠楁硶瀵规暟鎹簱url锛岃处鍙凤紝瀵嗙爜杩涜鍔犲瘑鍜岃В瀵嗘搷浣?
						#DBInfoEncryptclass=com.frameworkset.common.poolman.security.DESDBInfoEncrypt
						
						#DESDBPasswordEncrypt-閲囩敤des绠楁硶瀵规暟鎹簱瀵嗙爜杩涜鍔犲瘑鍜岃В瀵嗘搷浣?
						DBInfoEncryptclass=com.frameworkset.common.poolman.security.DESDBPasswordEncrypt
						
						#DESDBUserEncrypt-閲囩敤des绠楁硶瀵规暟鎹簱鐢ㄦ埛鍚嶈繘琛屽姞瀵嗗拰瑙ｅ瘑鎿嶄綔
						#DBInfoEncryptclass=com.frameworkset.common.poolman.security.DESDBUserEncrypt
						
						#DESDBUrlEncrypt-閲囩敤des绠楁硶瀵规暟鎹簱url杩涜鍔犲瘑鍜岃В瀵嗘搷浣?
						#DBInfoEncryptclass=com.frameworkset.common.poolman.security.DESDBUrlEncrypt
						#DESDBUserAndPasswordEncrypt-閲囩敤des绠楁硶瀵规暟鎹簱鐢ㄦ埛鍚?鍙ｄ护杩涜鍔犲瘑鍜岃В瀵嗘搷浣?
						#DBInfoEncryptclass=com.frameworkset.common.poolman.security.DESDBUserAndPasswordEncrypt
						
						瀵瑰簲鐨勯厤缃湪bboss-aop.jar/aop.properties鏂囦欢涓紝浣犲彧闇€瑕佹斁寮€闇€瑕佺殑鍔犲瘑鎻掍欢锛屽叧闂彟澶栫殑鎻掍欢鍗冲彲锛屾暟鎹簱淇℃伅鐨勫姞瀵嗚浣跨敤濡備笅鏂规硶锛?
						com.frameworkset.common.poolman.security.DESCipher aa = new com.frameworkset.common.poolman.security.DESCipher();
						String password = aa.encrypt("123456");		
						String user = aa.encrypt("root");		
						String url = aa.encrypt("jdbc:mysql://localhost:3306/cim");
						</td>
						</tr>
						
						</table>
						</tr>
						<%} %>
						
						
						<tr>
						<td>
						*********************************************************************************
						</td>
						
						</tr>
						
			
			  </table>
			  </form>
			  
			  </tab:tabPane>
			  <% 
				}	
			%>
	
	</tab:tabContainer>

	</div>
				</body>
</html>