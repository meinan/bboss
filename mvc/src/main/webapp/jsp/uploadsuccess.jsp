<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>

<!-- 
	bboss-mvc妗嗘灦瀹炵幇鏂囦欢涓婁紶鍔熻兘
-->
<html>
<head>
<title>bboss-mvc妗嗘灦瀹炵幇鏂囦欢涓婁紶鍔熻兘-ok</title>
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
					
	<table class="genericTbl">
	<tr >
						<!--璁剧疆鍒嗛〉琛ㄥご-->

					<th  style="width:20%" class="order1 sorted">鏂囦欢鍚嶇О</th>
					
					<th  style="width:50%" class="order1 sorted">鏂囦欢璺緞锛?/th>
					
					<th  style="width:20%" class="order1 sorted">鏂囦欢澶у皬锛?/th>
					
				</tr>
	<pg:list requestKey="uploadfiles">
				<tr class="even">
						<!--璁剧疆鍒嗛〉琛ㄥご-->

					
					<td  style="width:20%"><pg:cell colName="fileName" defaultValue=""/></td>
					
					<td  style="width:50%"><pg:cell colName="filePath" defaultValue=""/></td>
					
					<td  style="width:5%" ><pg:cell colName="fileSize" defaultValue=""/> bytes</td>
					
				</tr>
				</pg:list>
	</table>
	
</body>
</html>
