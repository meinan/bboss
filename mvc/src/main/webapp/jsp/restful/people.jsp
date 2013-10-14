﻿<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
<%

%>
<html>
  <head>
  <title>user</title>
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
<div >閿欒淇℃伅锛?pg:errors/></div>
<table class="genericTbl">

	<tr>
		<th class="order1 sorted">People id</th>
		<th class="order1 sorted">People name</th>
		<th class="order1 sorted">People title</th>
		<th class="order1 sorted"></th>
		<th class="order1 sorted"></th>
	</tr>
	<c:forEach items="${list}" var="people">
		<tr class="even">
			<td><input id="pid${people.id}" type="text" value='${people.id}'/></td>
			<td><input id="pna${people.id}" type="text" value='${people.name}'/></td>
			<td><input id="pti${people.id}" type="text" value='${people.title}'/></td>
			<td>
			 <div>
				<ul class="options">
					<li id="size">
						<a href="#"  onClick="upd('${people.id}')">鏇存柊</a>
					</li>
				</ul>
		    </div>
			</td>
			<td>
			<div>
				<ul class="options">
					<li id="abbreviations">
						<a href="#"  onClick="del('${people.id}')">鍒犻櫎</a>
					</li>
				</ul>
		   </div>
			</td>
		</tr>
	</c:forEach>



	<form id="upForm" action="${pageContext.request.contextPath}/rest/people" method="POST">
		<input id="people_id" name="id" type="hidden" />
		<input id="people_name" name="name" type="hidden" />
		<input id="people_title" name="title" type="hidden" />
		<input type="hidden" name="_method" value="put" />
	</form>

	<form id="delForm" action="${pageContext.request.contextPath}/rest/people/" method="POST"><input
		type="hidden" name="_method" value="delete" /></form>
	</table>


	<table >
		<form id="add" action="${pageContext.request.contextPath}/rest/people/" method="POST">
			<tr class="odd">
				<td >people_id:<input id="people_id" name="id" type="text" /><pg:error colName="id"/></td>
			</tr>
			<tr class="odd">
				<td>people_name:<input id="people_name" name="name" type="text" /></td>
			</tr>
			<tr class="odd">
				<td>people_title:<input id="people_title" name="title" type="text" /></td>
			</tr>
			<tr class="odd">
				<th class="order1 sorted">
			<div>
				<ul class="options">
					<li id="size">
						<a href="#"  onClick="add()">澧炲姞</a>
					</li>
				</ul>
		    </div>
				</th>
			</tr>		
		</form>
	</table>

</body>
<Script>
    function add(){
      document.getElementById('add').action = '${pageContext.request.contextPath}/rest/people/' ;
      document.getElementById('add').submit();
    }
    
	function del(id) {
		document.getElementById('delForm').action = '${pageContext.request.contextPath}/rest/people/' + id;
		//document.getElementById('delForm').method="delete"
		document.getElementById('delForm').submit();
	}

	function upd(id) {
		var form=document.getElementById('upForm');
		form.action = '${pageContext.request.contextPath}/rest/people/' + id;
		form.people_id.value=document.getElementById('pid'+id).value;
		form.people_name.value=document.getElementById('pna'+id).value;
		form.people_title.value=document.getElementById('pti'+id).value;
		form.submit();
	}
</Script>
</html>