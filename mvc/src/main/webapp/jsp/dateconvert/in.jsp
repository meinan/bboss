﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>DatePicker</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/jsp/datepicker/My97DatePicker/WdatePicker.js"></script>
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
	</head>
 
	<body>
	<h1>鏃ユ湡鏍煎紡杞崲demo</h1>
	<form action="converStringToDate.html" method="post">
	<table class="genericTbl">
	   <tr>
	   <th class="order1 sorted" >demo鎻忚堪
	   </th>
	   <th class="order1 sorted">婕旂ず鍖?	   </th>
	   </tr>
	 <tr class="even" >
	   
	    <td align="right">
	   鏅€氳Е鍙戯細
	    </td>
	    <td>
	   <input id="d12" name="d12" type="text"
        onclick="WdatePicker({el:'d12'})" src="${pageContext.request.contextPath}/jsp/datepicker/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"/>
	   </td>
	   </tr>
	  
	
		
		<tr class="even">
	    <td align="right">
		绮剧‘鍒版棩鏈燂細
		</td>
	    <td>
		<input class="Wdate" type="text" name="stringdate" onClick="WdatePicker()">
		</td>
	   </tr>
	   <tr class="even">
	    <td align="right">
		绮剧‘鍏蜂綋鏃堕棿锛?		</td>
	    <td>
		<input class="Wdate" type="text" name="stringdatetimestamp" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH/mm/ss'})">
		</td>
	    </tr>
	    
	     <tr class="even">
	    <td align="right">
		鎻愪氦锛?		</td>
	    <td>
		<input type="submit" value="鎻愪氦杞崲"/>
		</td>
	    </tr>
		
		</table>
		</form>
	</body>
</html>