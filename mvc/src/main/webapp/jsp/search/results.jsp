﻿
 <%@ page contentType="text/html; charset=utf-8" language="java" %>
 <%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
 

<head><title>bboss-mvc - 鍏ㄦ枃妫€绱?/title></head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/classic/main.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/classic/messages.css" type="text/css"/>
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
      document.getElementById("search").submit();
     
     }
   
</script>


<body>
<div id="errors">
    <h2>鍏ㄦ枃妫€绱㈢ず渚?/h2>
</div>


<%
/*

        This jsp page is deliberatly written in the horrible java directly embedded 
        in the page style for an easy and concise demonstration of Lucene.
        Due note...if you write pages that look like this...sooner or later
        you'll have a maintenance nightmare.  If you use jsps...use taglibs
        and beans!  That being said, this should be acceptable for a small
        page demonstrating how one uses Lucene in a web app. 

        This is also deliberately overcommented. ;-)

*/
%>
<center> 
	<form id="search" action="${pageContext.request.contextPath}/rest/search/dosearch" method="get">
		<p>
			<input name="query" size="44" value="${queryString }"/>&nbsp;鏌ヨ鏉′欢
		</p>
		<p>
			<input name="maxresults" size="4" value="${maxpage }"/>
		</p>
			<table>
			<tr><td>
			<div>
				<ul class="options">
					<li id="size">
						<a href="#" onClick="dosubmit()">search</a>
					</li>
				</ul>
		</div>
		</td></tr></table>
		
		<p>鏌ヨ鍒?{totalHits }鏉＄粨鏋?鑰楁椂${times }</p>
        </form>
</center>
<c:choose>
    <c:when test="${!empty parsingerrorcode}">

                   
                  <p>Error while parsing query: ${parsingerrorcode}</p>
	</c:when>
</c:choose>    

    
                      
	<c:choose>
	    <c:when test="${ !empty emptycode}">
	                <p> ${emptycode } </p>
	 	</c:when>
	    <c:otherwise>
                <table class="genericTbl">
                <tr>
                        <th class="order1 sorted">Document</th>
                        <th class="order1 sorted">Summary</th>
                </tr>
				<pg:list requestKey="docs">
	                <tr class="even">
	                        <td><a href="<pg:cell colName="url"/>"><pg:cell colName="doctitle"/></a></td>
	                        <td><pg:cell colName="summary"/></td>
	                </tr>
				</pg:list>
				<c:choose>
				<c:when test="${ !empty moreurl}">
	                <tr>
	                        <td></td><td><a href="${moreurl }">More Results>></a></td>
	                </tr>
 				</c:when>
 				</c:choose>
                </table>

	    </c:otherwise>
	</c:choose>