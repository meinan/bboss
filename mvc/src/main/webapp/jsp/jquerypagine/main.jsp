﻿<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
<%@ taglib uri="/WEB-INF/commontag.tld" prefix="common"%>
<%@ page import="org.frameworkset.web.servlet.support.RequestContext" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		

		<title>鐢↗Query瀹炵幇鍒嗛〉鍒楄〃鏌ヨ</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	
		<pg:config/>
		<script type="text/javascript">
			
		
			function deleteUsers(){
			  $("#form1").action="<%=path%>/jquerypagine/deleteusers.htm";
			  $("#form1").submit();
			 //  var value = $("#form1:checkbox").fieldValue();
			 //  alert(value.length);
			//	$("#pagecontainer").load("deleteusers.htm #pagecontent",{id:$("checkbox").val()});
			}
			
			
			function doquery()
			{
				//$("#pagecontainer").load("pagerqueryuser.htm #pagecontent",{userName:encodeURIComponent($("#userName").val())});
				$("#pagecontainer").load("pagerqueryuser.htm?name=璇荤牬鑲氱毊 #pagecontent",
				               { userName: [$("#userName").val(),$("#userName").val(),$("#userName").val()] } );
				
			}
			
			function dobeanparamsquery()
			{
				$("#pagecontainer1").load("pagerqueryuser1.htm #pagecontent",{ name:"澶氬",userName: [$("#beanuserName").val(),$("#beanuserName").val(),$("#beanuserName").val()] });
			}
			
			function domapparamsquery()
			{
				$("#pagecontainer2").load("pagerqueryuser2.htm #pagecontent",{ name:"澶氬",userName: [$("#mapuserName").val(),$("#mapuserName").val(),$("#mapuserName").val()] });
			}
		</script>
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
	</head>

	<body>
	       <form action="" id="form1" method="post">
			<table class="genericTbl">
				
				<!--鍒嗛〉鏄剧ず寮€濮?鍒嗛〉鏍囩鍒濆鍖?->
				
					<tr >
						<th align="center">
							NAME:<input id="userName" name="userName" value=""/>
						</th>
						
						<th>
							<input type="button" value="鏁扮粍鏉′欢鏌ヨ" onclick="doquery()"/>
						</th>
						
					</tr>
			</table>
			</form>		
			<div id="pagecontainer">
				<script type="text/javascript">
				$(document).ready(function(){
					  $("#pagecontainer").load("pagerqueryuser.htm #pagecontent");
					});
				</script>
			</div>
			<table class="genericTbl">
				
				<!--鍒嗛〉鏄剧ず寮€濮?鍒嗛〉鏍囩鍒濆鍖?->
				
					<tr >
						<th align="center">
							NAME:<input id="beanuserName" name="beanuserName" value=""/>
						</th>
						
						<th>
							<input type="button" value="bean鍙傛暟鏌ヨ" onclick="dobeanparamsquery()"/>
						</th>
						
					</tr>
			</table>
			<div id="pagecontainer1">
				<script type="text/javascript">
				$(document).ready(function(){
					  $("#pagecontainer1").load("pagerqueryuser1.htm #pagecontent");
					});
				</script>
			</div>
			
			
			<table class="genericTbl">
				
				
				
					<tr >
						<th align="center">
							NAME:<input id="mapuserName" name="mapuserName" value=""/>
						</th>
						
						<th>
							<input type="button" value="map鍙傛暟鏌ヨ" onclick="domapparamsquery()"/>
						</th>
						
					</tr>
			</table>
			<div id="pagecontainer2">
				<script type="text/javascript">
				$(document).ready(function(){
					  $("#pagecontainer2").load("pagerqueryuser2.htm #pagecontent");
					});
				</script>
			</div>
			
			
	</body>
</html>
