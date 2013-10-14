<%
/*
 * <p>Title: 鐩戞帶鏁版嵁搴撲俊鎭〉闈?/p>
 * <p>Description: 鏈嶅姟鍣ㄩ摼鎺ユ暟鎹簱鐨勭姸鎬侊紝鍜屼娇鐢ㄦ儏鍐?/p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: chinacreator</p>
 * @Date 2008-9-8
 * @author gao.tang
 * @version 1.0
 */
 %>

<%@ page session="false" contentType="text/html; charset=UTF-8" language="java" import="java.util.List"%>
<%@ page import="com.frameworkset.common.poolman.DBUtil"%>
<%@page import="com.frameworkset.platform.security.AccessControl"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Enumeration,
				com.frameworkset.common.poolman.util.JDBCPoolMetaData"%>
<%@page import="com.frameworkset.platform.remote.Utils"%>
<%@page import="org.jgroups.blocks.GroupRequest"%>
<%@page import="java.util.Iterator"%>
<%@ taglib prefix="tab" uri="/WEB-INF/tabpane-taglib.tld" %>				
<%
	AccessControl accessControl = AccessControl.getInstance();
	accessControl.checkAccess(request,response,false);
	String userAccount = accessControl.getUserAccount();
	//System.out.println("ip = " + accessControl.getlocalIpAdd());
	boolean isCluster = Utils.clusterstarted();
	

	
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>poolman杩炴帴姹犱娇鐢ㄦ儏鍐典笌閰嶇疆淇℃伅</title>
<%@ include file="/include/css.jsp"%>
		<tab:tabConfig/>	
		<script src="../inc/js/func.js"></script>
		</head>

	<body class="contentbodymargin" onload="" scroll="no">
	<div style="width:100%;height:100%;overflow:auto">
	<tab:tabContainer id="monitor" skin="amethyst">
	
	<tab:tabPane id="allServerMonitorInfo" tabTitle="鎵€鏈夋湇鍔″櫒poolman淇℃伅" lazeload="true" >
		<tab:iframe id="allServer-monitorinfo" src="allServerMonitorInfo.jsp" frameborder="0" scrolling="no" width="100%" height="580">
		</tab:iframe>
	</tab:tabPane>
	
	<%if(isCluster){ %>
	<tab:tabPane id="allMonitor" tabTitle="鎵€鏈夋湇鍔″櫒poolman瀹炴椂淇℃伅" lazeload="true" >
		<tab:iframe id="all-monitor" src="clusterMonitor.jsp" frameborder="0" scrolling="no" width="100%" height="580">
		</tab:iframe>
	</tab:tabPane>
	
	<tab:tabPane id="allServerState" tabTitle="鎵€鏈夋湇鍔″櫒鐘舵€? lazeload="true" >
		<tab:iframe id="allServer-State" src="allServerState.jsp" frameborder="0" scrolling="no" width="100%" height="580">
		</tab:iframe>
	</tab:tabPane>
	
	<% 
		}
	%>
	
	
	
	</tab:tabContainer>
	</div>
				</body>
</html>