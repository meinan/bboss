<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
<html>
	<head>
		<title>濮撳悕鏌ヨ</title>
		<pg:config enablecontextmenu="false"/>
		<script type="text/javascript">
			function doquery(){
			 
				if($("#loginName3").val() == null || $("#loginName3").val() == "")
				{
					alert("璇疯緭鍏ヨ鏌ヨ鐨勫鍚?")
					return false;
				}
			 	var resturl = "<%=request.getContextPath() %>/query/loginnamequery/" + encodeURIComponent(encodeURIComponent($("#loginName3").val()));
				$("#queryresult").load(resturl);
				return false;
			}
		</script>
	</head>

	<body>
		    <table> 
		        <tr> 
		            <td>鏌ヨ鐧诲綍鍚嶏細<input type="text" name="loginName3" id="loginName3"/> 
		            </td> 
		            
		            <td><input type="button" value="鏌ヨ" onclick="doquery()"/> 
		            </td> 
		        </tr> 
		        <tr> 
		            <td>鏌ヨ缁撴灉锛?		            </td> 
		            <td id="queryresult"></td> 
		        </tr> 
		    </table>
	</body>
</html>
