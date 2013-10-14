<%
/**
 * @Title: generalAjaxForm.jsp 
 * @Package WebRoot/demo/formsubmint/
 * @Description TODO(鏅€歛jax鏂规硶鎻愪氦鏁版嵁)  
 * @Copyright:Copyright (c) 2012
 * @Company: 婀栧崡绉戝垱
 * @author: yahui.hu 
 * @Date:2012-01-07
 * 
 */
 %>
<%@ page language="java"  pageEncoding="utf-8"%>
<%@page import="com.chinacreator.security.AccessControl"%>
<%@ include file="/common/jsp/accessControl.jsp"%>
<%@ include file="/common/jsp/importAndTaglib.jsp"%>
<%@ taglib prefix="tab" uri="/WEB-INF/tabpane-taglib.tld"%>
<%@ include file="/common/jsp/commonCssScript.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>鏅€欰jax琛ㄥ崟鎻愪氦婕旂ず(GET)</title>
	<%@ include file="/common/jsp/jqureyEasyui.jsp"%>
	<%@ include file="/common/scripts/dialog/dialog.include.jsp"%>
	<script type="text/javascript">
		$(function(){
			//鏂囨。鍔犺浇鍚?
			$("input[value='鎻愪氦']").click(function(){
				//鑾峰彇琛ㄥ崟鍊?
				var id =$("input[name='id']").val();				
				var name=$("input[name='name']").val();
				var remark=$("#remark").val();
				$.ajax({
					url:'${pageContext.request.contextPath}/utf8/generalAjaxGet.page',
					contentType : "application/x-www-form-urlencoded",    
					type:'get',
					dataType:'json',
					data:{
							id:id,
							name:name,
							remark:remark
						},
					success:function(json){
						alert(json.data);
					}	
				});
			});			
		});	
	</script>
  </head> 
  <body>
  		<div>
	  		<form method="post" action="">
	  			<table>
	  				<tr>
	  					<td width="20%">Id</td>
	  					<td width="*%"><input type="text"  name="id"/></td>
	  				</tr>
	  				<tr>
	  					<td width="20%">name:</td>
	  					<td width="*%" ><input type="text"  name="name"/></td>
	  				</tr>
	  				<tr>
	  					<td width="20%">remark:</td>
	  					<td width="*%">
	  						<textarea rows="3" cols="25" name="remark" id="remark"></textarea>
	  					</td>
	  				</tr>
	  				<tr>
	  					<td colspan="2" align="center">
	  						<input type="button" value="鎻愪氦" class="button" />
	  						<input type="reset"" value="閲嶈" class="button">
	  					</td>
	  				</tr>
	  			</table>
	  		</form>
  		</div> 					
  </body>
</html>

