﻿<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Image demo</title>
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
		
		<script type="text/javascript">
		   function dosubmit(){
		     document.getElementById("frm").submit();
		   }
		
		</script>	
			
</head>
<body>
<form id="frm" method="post" action="${pageContext.request.contextPath}/rest/imagevalidator">
Image demo<br/>
checkCode:<img src="${pageContext.request.contextPath}/rest/imagevalidator/abcdefghijk123456/5"><br/>
please input the checkCode:<input type="text" name="imagecode" value=""><br/>
<table>
<tr>
<td><div>
				<ul class="options">
					<li id="size">
						<a href="#" onClick="dosubmit()">check</a>
					</li>
				</ul>
		</div></td>
</tr>
</table>
</form> 

 <pg:message code="${message}"/>  
</body>
</html>
