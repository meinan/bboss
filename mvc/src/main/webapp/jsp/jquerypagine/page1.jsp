﻿<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
<%@ taglib uri="/WEB-INF/commontag.tld" prefix="common"%>
<%
String path = request.getContextPath();
%>
<div id="pagecontent">
              <div class="genericTbl">
				<!--鍒嗛〉鏄剧ず寮€濮?鍒嗛〉鏍囩鍒濆鍖?->
			   	<pg:pager scope="request" data="users" 
						  isList="false" containerid="pagecontainer1" selector="pagecontent">
				<pg:beanparams name="user"/>
				
				<div><pg:index/></div>
			  
			<table class="genericTbl">
					<tr >
						<th width="2%" align=center style="width:5%" class="order1 sorted">
						  &nbsp;&nbsp;鍏ㄩ€?input class="checkbox" 
							type="checkBox" hidefocus=true 
							name="checkBoxAll1" 
							onClick="checkAll('checkBoxAll1','id1')"> 
						</th>
						<th width="8%" class="order1 sorted">
							鐢ㄦ埛ID:				</th>
						<th width="8%" class="order1 sorted">
							鐢ㄦ埛NAME:				</th>
						<th width="8%" class="order1 sorted">
							鐢ㄦ埛鍙ｄ护:					</th>
						
					</tr>

					
					<pg:notify>
					<tr class="cms_report_tr">
					<td width="10%" align=center colspan="100" style="width:5%">
						娌℃湁鏁版嵁
					</td>
					</tr>				
				</pg:notify>
				<pg:list >
					<tr class="even">
						<td width="2%" align=center style="width:5%">
							<input class="checkbox"  onClick="checkOne('checkBoxAll1','id1')" 
							type="checkbox" name="id1" value="<pg:cell colName="userId" defaultValue=""/>"></td>
						 <td ><pg:cell colName="userId" defaultValue=""/>  
                         </td>  
                         <td width="8%" >  
                             <pg:cell colName="userName" defaultValue=""/></td>  
                         <td width="8%" >  
                             <pg:cell colName="userPassword" defaultValue=""/>         
                       </td>  
					</tr>
					
				</pg:list>
		
			</table>
			<div><pg:index/></div>
			</pg:pager> 
			</div>
	
</div>