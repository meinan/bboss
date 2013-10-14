<%--
 * Licensed under the GPL License. You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://probe.jstripe.com/d/license.shtml
 *
 * THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
 * WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 --%>

<%@ page contentType="text/html;charset=UTF-8" language="java"
	session="false"%>
<%@ page import="java.io.ByteArrayOutputStream"%>
<%@ page import="java.io.PrintStream"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.File,org.frameworkset.util.CodeUtils,
com.frameworkset.util.FileUtil,com.frameworkset.util.StringUtil"%>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
<%@ taglib uri="/WEB-INF/commontag.tld" prefix="common"%>

<%
String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/index.htm";
%>

<html>

	<head>
		<title>bboss-mvc - demo index</title>
		<base id="basehrefid" >
   <pg:config enablecontextmenu="false"/>
		<link rel="shortcut icon"
			href="${pageContext.request.contextPath}/css/favicon.gif">
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/css/classic/tables.css"
			type="text/css">
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/css/classic/main.css"
			type="text/css">
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/css/classic/mainnav.css"
			type="text/css">
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/css/classic/messages.css"
			type="text/css">
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/css/classic/tooltip.css"
			type="text/css">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/include/syntaxhighlighter/styles/SyntaxHighlighter.css"></link>
	<script language="javascript" src="${pageContext.request.contextPath}/include/syntaxhighlighter/shCore.js"></script>
	<script language="javascript" src="${pageContext.request.contextPath}/include/syntaxhighlighter/shBrushJava.js"></script>
	<script language="javascript" src="${pageContext.request.contextPath}/include/syntaxhighlighter/shBrushXml.js"></script>
	<script language="javascript" src="${pageContext.request.contextPath}/include/syntaxhighlighter/shBrushJScript.js"></script>
  <script type="text/javascript">
	  $(document).ready(function() {
		if($.browser.msie) {
		
			 $("#basehrefid").attr("href","<%=basePath%>");
			
		}
		else if($.browser.safari)
		{
			 $("#basehrefid").attr("href","<%=basePath%>");
		}
		else if($.browser.mozilla)
		{
			 $("#basehrefid").attr("href","#");
		}
		else if($.browser.opera)
		{
			 $("#basehrefid").attr("href","<%=basePath%>");
		} 
		else
		{
			 $("#basehrefid").attr("href","<%=basePath%>");
		}
	 });
 </script>
	</head>
	<body>
	<div id="caption">
	<a name="top"></a>
    <ul id="top">
        <li id="logo"><a href="index.htm"><img alt="LambdaProbe Logo" src="${pageContext.request.contextPath}/css/the-probe-logo.gif"></a></li>
        <li id="runtime">
            Bboss Version 3.6 authorfailed.jsp
            <span class="uptime"></span>
        </li><li id="title">/aop - mvc - persistent - taglib</li>
    </ul>
</div>

		<div id="mainBody">
			
    	<div class="embeddedBlockContainer">
			<h1>
				瀵逛笉璧凤紝鎮ㄦ病鏈夎闂〉闈㈢殑鏉冮檺
			</h1>
			<div class="shadow">
				<div class="info">
					<p>
						<ul>		
						<li><a href="#3719">鍙嬫儏閾炬帴</a></li>				
						<li><a href="#3720">Demo鍒楄〃涓寘鍚瘡涓猟emo鐨勫熀鏈俊鎭紝鍖呮嫭鍚嶇О锛岃闂湴鍧€娓呭崟锛屽姛鑳借鏄庯紝鏌ョ湅demo鐩稿叧鐨勬墍鏈変唬鐮佸拰閰嶇疆鏂囦欢鏄庣粏</a></li>
						<li>鐐瑰嚮demo鐨勮闂湴鍧€娓呭崟涓殑鍦板潃鍙互璁块棶demo鐨勫疄闄呭姛鑳藉苟杩涜鐩稿簲鐨勬搷浣?/li>
						<li>鐐瑰嚮浠ｇ爜鏄庣粏锛屽彲浠ヨ繘鍏ユ煡鐪媎emo鐨勫疄鐜颁唬鐮侊紝鍖呮嫭鎺у埗鍣ㄧ被锛屼笟鍔＄粍浠讹紝java瀵硅薄锛宮vc閰嶇疆鏂囦欢锛宩sp椤甸潰</li>
						<li><a href="#3721">bboss-mvc妗嗘灦demo鐨勯儴缃查儴鍒嗕粙缁嶄簡濡備綍涓嬭浇鍜岄儴缃瞕emo搴旂敤</a></li>
						<li><a href="#3722">璧勬簮鍜屾枃妗ｄ笅杞?/a></li>
						<li><a href="#3723">bboss-mvc妗嗘灦浣撶郴缁撴瀯鍥?/a></li>
						<li><a href="#3724">bboss-mvc妗嗘灦璇锋眰澶勭悊娴佺▼鍥?/a></li>
						<li><a href="#3725">web.xml閮ㄧ讲鏂囦欢閮ㄥ垎璇存槑浜唌vc妗嗘灦鐨勬秹鍙妛eb.xml涓昏閰嶇疆鍐呭</a></li>						
						
						<li><a href="#3726">妗嗘灦鏇存柊璁板綍</a></li>
						</ul>
					</p>
				</div>
			</div>
			
			<div class="blockContainer">
			<h1>鍙嬫儏閾炬帴<a href="#top" name="3719">
			<img border="0" src="<%=request.getContextPath() %>/jsp/top.gif" alt="Top">
			</a></h1>
			<p>
						<ul>						
						<li><a href="http://www.iteye.com/wiki/bbossgroups/3092-mvc-bboss-config" target="_blank">bbossgroups 寮€鍙戠郴鍒楁枃绔犱箣涓€ 鏈€浣冲疄璺?/a> </li>
						<li><a href="http://www.iteye.com/wiki/bbossgroups/3090-mvc-aop-bboss" target="_blank">鎼缓bboss mvc eclipse寮€鍙戝伐绋嬶紝缂栧啓绗竴涓疄渚?/a></li>
						<li><a href="http://www.iteye.com/wiki/bbossgroups/3094-persistent" target="_blank">bbossgroups SQLExecutor缁勪欢api浣跨敤瀹炰緥</a></li>
						<li><a href="http://www.iteye.com/wiki/bbossgroups/3091-webservice-bboss-aop" target="_blank">bbossgroups webservice寮曟搸浣跨敤鏂规硶</a></li>
						<li><a href="http://www.iteye.com/wiki/bbossgroups/3089-bbossgroups-aop-rmi" target="_blank">bbossgroups rmi缁勪欢鏈嶅姟鍙戝竷鍜宺mi瀹㈡湇绔幏鍙栨柟娉?/a></li>
						<li><a href="http://yin-bp.iteye.com/blog/1026245" target="_blank">bbossgroups mvc demo閮ㄧ讲鏂规硶</a></li>
						<li><a href="http://yin-bp.iteye.com/" target="_blank">bbossgroups瀹樻柟鍗氬</a></li>
						
						</ul>
					</p>
			
			</div>
		
        
			

			<h1>鍥炲埌椤堕儴<a href="#top" name="3727">
			<img border="0" src="<%=request.getContextPath() %>/jsp/top.gif" alt="Top">
			</a></h1>
	</body>

</html>