<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>

<!-- 
	bboss-mvc妗嗘灦瀹炵幇鏂囦欢涓婁紶鍔熻兘
-->
<html>
<head>
<title>bboss-mvc妗嗘灦瀹炵幇鏂囦欢涓婁紶鍔熻兘</title>
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
<head> 
 <title>jQuery Multiple File Upload Plugin v1.47 (2010-03-26)</title>
 <!--// documentation resources //-->
	<script src='../include/mutifile/jquery.js' type="text/javascript"></script>
	<script src='../include/mutifile/jquery.MultiFile.js' type="text/javascript"></script>




</head>
</head>
<body>
					<form action="<%=request.getContextPath() %>/demo/uploadFiles.htm" method="POST" enctype="multipart/form-data">
			<table class="genericTbl">
				<tr >
						<!--璁剧疆鍒嗛〉琛ㄥご-->

					<th  style="width:20%" class="order1 sorted">璇疯緭鍏ユ枃浠?鏈€澶氫袱涓枃浠?锛?					<input name="test" type="file" class="multi" maxlength="20" accept="*.doc,*.zip,*.rar,*.ppt,*.pptx,*.doc,*.docx"/></th>
					
					<th  style="width:5%" colspan="100"  class="order1 sorted">
					<input type="submit" name="submit" value="涓婁紶"> 
					<!-- <input type="button" name="submit" onclick="alert('瀵逛笉璧凤紝鏈嶅姟鍣ㄧ┖闂存湁闄愶紝鍏抽棴闄勪欢涓婁紶鍔熻兘銆?)"value="涓婁紶">-->
					</th>
					
				</tr>
			</table>
	</form>
</body>
</html>
