<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>


<html>
	<head>
		<title>鏂囦欢涓婁紶</title>

			</script>
	</head>
	<body>
	<h3>MultipartHttpServletRequest鏂瑰紡</h3>
		<form name="tableInfoForm" id="tableInfoForm" enctype="multipart/form-data" method="post" action="<%=request.getContextPath() %>/upload/uploadFile.page"> 
			<input type="hidden" value="0" name="type"/>
			<table width="600" border="0" cellspacing="0" cellpadding="0" class="tox5 bgcolor1">
				<tr>
					<td>
						<table id="upfileList" align="center">
							<tr>
								<td height="30">鏂囦欢锛?font style="color:#FF0000">*</font></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/></td>								
							</tr>													
						</table>
						<div align=center>
							
							<a href="<%=request.getContextPath() %>/upload/deletefiles.page" >鍒犻櫎</a>
							<input type="submit" class="xbutton1" id="subb" name="subb" value="涓?浼?/>
						</div>
					</td>
				</tr>
			</table>
		</form>	
		
		<h3>MultipartFile鏂瑰紡</h3>
		<form name="tableInfoForm1" id="tableInfoForm1" enctype="multipart/form-data" method="post" action="<%=request.getContextPath() %>/upload/uploadFileWithMultipartFile.page"> 
			<input type="hidden" value="0" name="type"/>
			<table width="600" border="0" cellspacing="0" cellpadding="0" class="tox5 bgcolor1">
				<tr>
					<td>
						<table id="upfileList" align="center">
							<tr>
								<td height="30">鏂囦欢锛?font style="color:#FF0000">*</font></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/></td>								
							</tr>													
						</table>
						<div align=center>
							
							
							<input type="submit" class="xbutton1" id="subb" name="subb" value="涓?浼?/>
						</div>
					</td>
				</tr>
			</table>
		</form>	
		
		<h3>MultipartFile[]鏂瑰紡</h3>
		<form name="tableInfoForm2" id="tableInfoForm2" enctype="multipart/form-data" method="post" 
		action="<%=request.getContextPath() %>/upload/uploadFileWithMultipartFiles.page"> 
			<input type="hidden" value="0" name="type"/>
			<table width="600" border="0" cellspacing="0" cellpadding="0" class="tox5 bgcolor1">
				<tr>
					<td>
						<table id="upfileList" align="center">
							<tr>
								<td height="30">鏂囦欢锛?font style="color:#FF0000">*</font></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/></td>								
							</tr>													
						</table>
						<div align=center>
							
							
							<input type="submit" class="xbutton1" id="subb" name="subb" value="涓?浼?/>
						</div>
					</td>
				</tr>
			</table>
		</form>	
		
		<h3>List BeanMultipartFile鏂瑰紡</h3>
		<form name="tableInfoForm21" id="tableInfoForm21" enctype="multipart/form-data" method="post" 
		action="<%=request.getContextPath() %>/upload/uploadFileWithListBean.page"> 
			<input type="hidden" value="0" name="type"/>
			<table width="600" border="0" cellspacing="0" cellpadding="0" class="tox5 bgcolor1">
				<tr>
					<td>
						<table id="upfileList" align="center">
							<tr>
								<td height="30">鏂囦欢锛?font style="color:#FF0000">*</font></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/> <input type="text" name="upload1des" style="width: 200px"/></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/> <input type="text" name="upload1des" style="width: 200px"/></td>	
															
							</tr>													
						</table>
						<div align=center>
							
							
							<input type="submit" class="xbutton1" id="subb" name="subb" value="涓?浼?/>
						</div>
					</td>
				</tr>
			</table>
		</form>	
		
		
		<h3>FileBean鏂瑰紡</h3>
		<form name="tableInfoForm3" id="tableInfoForm3" enctype="multipart/form-data" method="post" action="<%=request.getContextPath() %>/upload/uploadFileWithFileBean.page"> 
			<input type="hidden" value="0" name="type"/>
			<table width="600" border="0" cellspacing="0" cellpadding="0" class="tox5 bgcolor1">
				<tr>
					<td>
						<table id="upfileList" align="center">
							<tr>
								<td height="30">鏂囦欢锛?font style="color:#FF0000">*</font></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/></td>								
							</tr>													
						</table>
						<div align=center>
							
							
							<input type="submit" class="xbutton1" id="subb" name="subb" value="涓?浼?/>
						</div>
					</td>
				</tr>
			</table>
		</form>	
		
			<h3>clob multipartfile</h3>
		<form name="tableInfoForm4" id="tableInfoForm4" enctype="multipart/form-data" method="post" action="<%=request.getContextPath() %>/upload/uploadFileClobWithMultipartFile.page"> 
			<input type="hidden" value="0" name="type"/>
			<table width="600" border="0" cellspacing="0" cellpadding="0" class="tox5 bgcolor1">
				<tr>
					<td>
						<table id="upfileList" align="center">
							<tr>
								<td height="30">鏂囦欢锛?font style="color:#FF0000">*</font></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/></td>
																
							</tr>													
						</table>
						<div align=center>
							
							
							<input type="submit" class="xbutton1" id="subb" name="subb" value="涓?浼?/>
						</div>
					</td>
				</tr>
			</table>
		</form>	
		
			<h3>upload download multipartfile</h3>
		<form name="tableInfoForm4" id="tableInfoForm5" enctype="multipart/form-data" 
		method="post" action="<%=request.getContextPath() %>/upload/uploaddownFileWithMultipartFile.page"> 
			<input type="hidden" value="0" name="type"/>
			<table width="600" border="0" cellspacing="0" cellpadding="0" class="tox5 bgcolor1">
				<tr>
					<td>
						<table id="upfileList" align="center">
							<tr>
								<td height="30">鏂囦欢锛?font style="color:#FF0000">*</font></td>
								<td><input type="file" id="upload1" name="upload1" style="width: 200px"/></td>
																
							</tr>													
						</table>
						<div align=center>
							
							
							<input type="submit" class="xbutton1" id="subb" name="subb" value="涓?浼?/>
						</div>
						
					</td>
				</tr>
			</table>
		</form>	
		<table>
		<tr><td>blob鏂囦欢鍚嶇О</td><td>鏂囦欢涓嬭浇</td></tr>
		<pg:empty actual="${files}"><tr><td colspan="2">娌℃湁鏂囦欢淇℃伅</td></tr></pg:empty>
		<pg:list requestKey="files">
			<tr><td><pg:cell colName="FILENAME"/></td>
			<td><a href="<%=request.getContextPath() %>/upload/downloadFileFromBlob.page?fileid=<pg:cell colName="FILEID"/>">
			blob鏂瑰紡涓嬭浇</a>
			<a href="<%=request.getContextPath() %>/upload/downloadFileFromFile.page?fileid=<pg:cell colName="FILEID"/>">
			blob杞偍涓烘枃浠舵柟寮忎笅杞?/a>
   		</td></tr>
		</pg:list>
		</table>
		
		<table>
		<tr><td>clob鏂囦欢鍚嶇О</td><td>鏂囦欢涓嬭浇</td></tr>
		<pg:empty actual="${clobfiles}"><tr><td colspan="2">娌℃湁鏂囦欢淇℃伅</td></tr></pg:empty>
		<pg:list requestKey="clobfiles">
			<tr><td><pg:cell colName="FILENAME"/></td>
			<td><a href="<%=request.getContextPath() %>/upload/downloadFileFromClob.page?fileid=<pg:cell colName="FILEID"/>">
			clob鏂瑰紡涓嬭浇</a>
			<a href="<%=request.getContextPath() %>/upload/downloadFileFromClobFile.page?fileid=<pg:cell colName="FILEID"/>">
			clob杞偍涓烘枃浠舵柟寮忎笅杞?/a>
		</td></tr>
		</pg:list>
		</table>
	</body>
</html>
