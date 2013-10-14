
<%@page import="org.frameworkset.spi.assemble.ProviderInfoQueue"%>
<%@page import="java.util.List,org.frameworkset.spi.assemble.Pro"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="org.frameworkset.web.servlet.context.WebApplicationContext"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator,org.frameworkset.persitent.util.SQLUtil.SQLRef"%><%
/**
 * 
 * <p>Title: 绠＄悊鏈嶅姟鏄庣粏淇℃伅鏄剧ず椤甸潰</p>
 *
 * <p>Description: 绠＄悊鏈嶅姟鏄庣粏淇℃伅鏄剧ず椤甸潰</p>
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
<%@page import="org.frameworkset.spi.assemble.*,java.util.*,org.frameworkset.spi.BaseApplicationContext"%>
<%@ taglib prefix="tab" uri="/WEB-INF/tabpane-taglib.tld" %>		

<% 
	String rootpath = request.getContextPath();
	String selected = request.getParameter("selected");
	org.frameworkset.persitent.util.SQLUtil sqlutil = org.frameworkset.persitent.util.SQLUtil.getInstance(selected.substring(4));
	BaseApplicationContext context = sqlutil.getSqlcontext();
	
	java.util.Set<String> keys = context.getPropertyKeys();
	 Map<String,org.frameworkset.persitent.util.SQLUtil.SQLRef> refs = sqlutil.getSQLRefers();
	Iterator<String> its = keys == null ? null:keys.iterator();
	String sqlname = request.getParameter("sqlname");
	
	if(sqlname == null)
		sqlname = "";
	
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><%=context.getConfigfile() %></title>
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/treeview.css">
<%@ include file="/include/css.jsp"%>
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/contentpage.css">
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/tab.winclassic.css">
		<tab:tabConfig/>	
	</head>
	
	<body class="contentbodymargin" scroll="yes">
	
		<table class="thin" >
			<tr><td colspan="3" class="headercolor">SQL鏂囦欢姒傝淇℃伅</td></tr>
			<tr>
			<td  width="20%">SQL鏂囦欢鍚嶇О锛?%=selected.substring(4) %></td>
			
			</tr>
			<tr>
			
			<td  width="20%">SQL鏂囦欢鏇存柊妫€娴嬫満鍒讹細<%=sqlutil.getRefresh_interval() > 0?"寮€鍚?:"鍏抽棴" %></td>
			
			</tr>
			<tr>
			
			<td width="50%">SQL鏂囦欢鏇存柊妫€娴嬫椂闂撮棿闅旓細<%=sqlutil.getRefresh_interval() +"" %></td>
			</tr>
			<tr>
			
			<td width="50%">寮€鍚疭QL鏂囦欢鏇存柊妫€娴嬫満鍒跺拰妫€娴嬫椂闂撮棿闅旈厤缃柟娉曪細<br>
			鍦╞boss-aop.jar鍖呬腑鐨刟op.properties鏂囦欢涓紝閰嶇疆鍙傛暟sqlfile.refresh_interval<br>
			sqlfile.refresh_interval=5000<br>
			鍗曚綅涓烘绉掞紝濡傛灉閰嶇疆涓?鎴栬€呰礋鏁帮紝鍒欏叧闂埛鏂版満鍒?
			</td>
			</tr>
			
			<tr>
			
			<td width="50%">SQL鏂囦欢瀹瑰櫒绫诲瀷锛?%=context.getClass().getCanonicalName() %></td>
			</tr>
			
		</table>
		<table class="thin" >
			<tr><td colspan="3" class="headercolor">SQL閰嶇疆淇℃伅</td></tr>
			<tr>
			<td class="headercolor" >SQL鍚嶇О</td>
			<td class="headercolor" >sql</td>
			<td class="headercolor" >鎻忚堪</td>
			</tr>
			<%while(its != null && its.hasNext() ){
				Pro pro = context.getProBean(its.next());
				
			 %>
			<tr>
			<td class="headercolor"><%=pro.getName() %></td>
			<td wrap <%if(pro.getName().equals(sqlname))
			{
				%>
				 style="background-color:yellow;"
				<%
			}%>><%=pro.getValue() %></td>
			<td width="40" <%if(pro.getName().equals(sqlname))
			{
				%>
				 style="background-color:yellow"
				<%
			}%>><%=pro.getDescription() == null?"":pro.getDescription() %></td>
			</tr>
			<%} %>
		
		<%if(sqlutil.hasrefs()) {%>
		
			<tr><td colspan="10" class="headercolor">寮曠敤SQL閰嶇疆淇℃伅</td></tr>
			<tr>
			<td class="headercolor" >SQL鍚嶇О</td>
			<td class="headercolor" >琚紩鐢╯qlfile</td>
			<td class="headercolor" >寮曠敤SQL鍚嶇О</td>
			
			
			</tr>
			<%
			Iterator<Map.Entry<String, SQLRef>> refit = refs.entrySet().iterator();
			while( refit.hasNext() ){
				Map.Entry<String, SQLRef> entry = refit.next();
				SQLRef ref = entry.getValue();
				
			 %>
			<tr>
			<td class="headercolor"><%=ref.getName() %></td>
			<td wrap <%if(ref.getName().equals(sqlname))
			{
				%>
				 style="background-color:yellow"
				<%
			}%>><a href="sqlconfigfileDetail.jsp?selected=sql:<%=ref.getSqlfile() %>&classType=sqlapplicationmodule&sqlname=<%=ref.getSqlname() %>" target="_blank">
			
			<%=ref.getSqlfile() %></a></td>
			<td width="40" <%if(ref.getName().equals(sqlname))
			{
				%>
				 style="background-color:yellow"
				<%
			}%>><%=ref.getSqlname() %></td>
			</tr>
			<%} %>
		
	<%} %></table>

	</body>
</html>