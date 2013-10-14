<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
<%@ taglib uri="/WEB-INF/commontag.tld" prefix="common"%>
<%@ page import="org.frameworkset.web.servlet.support.RequestContext" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		

		<title>鎬у埆鏌ヨ-鏋氫妇绫诲瀷杞崲demo</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	
		<pg:config/>
		<script type="text/javascript">
		
			function doquery(){
			 
			 //  var value = $("#form1:checkbox").fieldValue();
			 //  alert(value.length);
			 
				$("#queryresult").load("querySex.html",{sex:$("#sex").val()});
			}
			
			function domutiquery(){
			 
			 //  var value = $("#form1:checkbox").fieldValue();
			 //  alert(value.length);
			 
				$("#queryresult").load("queryMutiSex.html",{sex:$("#sex").val()});
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
							NAME:<select id="sex">
							<option value="F">F</option>
							<option value="M">M</option>
							<option value="UN">UN</option>
							</select>
						</th>
						 
						<th>
							<input type="button" value="鎬у埆鏌ヨ" onclick="doquery()"/>
							<input type="button" value="澶氭€у埆鏌ヨ" onclick="domutiquery()"/>
						</th>
						
						 
					</tr>
					
					<tr >
						<td align="center">
							缁撴灉
						</td>
						 
						<td id="queryresult"></td>
						
						 
					</tr>
			</table>		
			
			</form>
	</body>
</html>
