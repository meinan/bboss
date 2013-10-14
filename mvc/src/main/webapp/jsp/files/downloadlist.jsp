<%@ page language="java" import="java.util.*,java.io.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>璧勬簮涓嬭浇鍒楄〃</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
     <table class="genericTbl">
       <tr>
       <th class="order1 sorted">
            鏂囦欢鍚?       </th>
       <th class="order1 sorted">
          鏂囦欢绫诲瀷
       </th>
       <th class="order1 sorted">
           鏂囦欢澶у皬
       </th>
       <th class="order1 sorted">
           鏈€鏂颁慨鏀规棩鏈?       </th>
       <th class="order1 sorted">
             涓嬭浇
       </th>
       </tr>
       <pg:list requestKey="files">
       <tr class="even">
         <td >
            <pg:equal actual="${filetype }" value="file">      
            <a href="<%=request.getContextPath() %>/file/download.htm?fileName=<pg:cell colName="fileName"/>"><pg:cell colName="fileName"/></a>
            </pg:equal>
            <pg:equal actual="${filetype }" value="vidio">      
            <a href="<%=request.getContextPath() %>/vidio/download.htm?fileName=<pg:cell colName="fileName"/>"><pg:cell colName="fileName"/></a>
            </pg:equal>  
            <pg:equal actual="${filetype }" value="tool">      
            <a href="<%=request.getContextPath() %>/tool/download.htm?fileName=<pg:cell colName="fileName"/>"><pg:cell colName="fileName"/></a>
            </pg:equal>
         </td>
         <td >
            <pg:cell colName="fileType"></pg:cell>
         </td>
         <td >
            <pg:cell colName="fileSize"></pg:cell>&nbsp;byte
         </td>
         <td>
		    <pg:cell colName="lastModified"></pg:cell>
         </td>
         <td >
          <pg:equal actual="${filetype }" value="file">     
            <a href="<%=request.getContextPath() %>/file/download.htm?fileName=<pg:cell  colName="fileName"/>">涓嬭浇姝ゆ枃浠?/a>
           </pg:equal>
           <pg:equal actual="${filetype }" value="vidio">     
            <a href="<%=request.getContextPath() %>/vidio/download.htm?fileName=<pg:cell  colName="fileName"/>">涓嬭浇姝ゆ枃浠?/a>
           </pg:equal>
           <pg:equal actual="${filetype }" value="tool">     
            <a href="<%=request.getContextPath() %>/tool/download.htm?fileName=<pg:cell  colName="fileName"/>">涓嬭浇姝ゆ枃浠?/a>
           </pg:equal>
         </td>
         
        </tr>
        </pg:list>
     </table>
  
  
  </body>
</html>
