<%
/*
 * <p>Title: 鐩戞帶绯荤粺鐜閰嶇疆淇℃伅 鎬讳俊鎭〉闈?/p>
 * <p>Description: 鐩戞帶bs鏁版嵁搴撻厤缃俊鎭笌鍦ㄧ嚎鐢ㄦ埛淇℃伅</p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: chinacreator</p>
 * @Date 2008-9-8
 * @author gao.tang
 * @version 1.0
 */
 %>
<%@page contentType="text/html;charset=UTF-8" session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>鐩戞帶</title>
<%@ include file="/include/css.jsp"%>
		<script src="../inc/js/func.js"></script>
		<script type="text/javascript">
		function openUrl(url){
			window.open(url);
			//window.open(url,"dialogWidth:"+screen.availWidth+";dialogHeight:"+screen.availHeight+";help:no;scroll:auto;status:no;maximize=yes;minimize=0");
		}
		</script>
	</head>

	<body class="contentbodymargin" onload="" scroll="no">
	<div style="width:100%;height:100%;overflow:auto">
	<table align="center">
	<tr>
	<td class="thin">鐩戞帶绯荤粺鐜閰嶇疆淇℃伅</td>
	</tr>
	</table>
	<table width="80%" height="" border="0" cellpadding="0" cellspacing="1" class="thin">
	
	<!-- <caption>鐩戞帶绯荤粺鐜閰嶇疆淇℃伅</caption><tr>
	<td align="center "class="thin">鐩戞帶绯荤粺鐜閰嶇疆淇℃伅</td>
	</tr> -->
	
	<tr>
	<td width="20%">webservice鏈嶅姟鐩戞帶</td><td><a href="../cxfservices" target="_blank">webservice鏈嶅姟鐩戞帶</a></td>
	
	</tr>
	
	<tr>
	<td width="20%">鏁版嵁搴撶洃鎺?/td><td><a href="dbmonitor_.jsp" target="_blank">鏁版嵁搴撶洃鎺ч〉闈?/a></td>
	
	</tr>
	
	<tr>
	<td>SPI鐩戞帶鏍?/td><td><a href="spiFrame.jsp" target="_blank"  >SPI绠＄悊</a></td>
	</tr>
	<tr>
	<td>铏氭嫙鏈哄唴瀛樹娇鐢ㄦ儏鍐?/td><td><table width="100%">
	<tr><td>FreeMemory锛?%= (Runtime.getRuntime().freeMemory() / 1024/1024 + "M")%></td></tr>
	<tr><td>TotalMemory锛?%= ( Runtime.getRuntime().totalMemory() / 1024/1024 + "M")%></td></tr>
	<tr><td>MaxMemory锛?%= (Runtime.getRuntime().maxMemory() / 1024/1024 + "M")%></td></tr></table></td>
	</tr>
	
	</table>
		</tab:tabContainer>
	</div>
				</body>
</html>