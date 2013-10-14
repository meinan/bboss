<%--

 *  Copyright 2008-2011 biaoping.yin
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.

 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	session="false"%>

<%@ taglib uri="/WEB-INF/commontag.tld" prefix="common"%>	
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>

<head>
	<title>bboss-mvc - hello world,data bind!</title>
	<script type="text/javascript"
			src="<%=request.getContextPath() %>/jsp/datepicker/My97DatePicker/WdatePicker.js"></script>
	<pg:config enablecontextmenu="false"/>
		<script type="text/javascript">
		
			function doquery(){
			 
			 //  var value = $("#form1:checkbox").fieldValue();
			 //  alert(value.length);
			 
				$("#queryresult").load("sayHelloEnum.page",{sex:$("#sex").val()});
			}
			
			function domutiquery(){
			 
			 //  var value = $("#form1:checkbox").fieldValue();
			 //  alert(value.length);
			 
				$("#queryresult").load("sayHelloEnums.page",{sex:$("#sex").val(),<pg:dtoken element="json"/>});
			}
			
			
		
		</script>		

</head>


<body>
			<h3>
				Hello World number bind Example.
			</h3>
			<form action="sayHelloNumber.page" method="post">
			<pg:dtoken/>
			
			<table cellspacing="0" >
				<tbody>
					<tr><td>
							璇疯緭鍏ユ偍鐨勫垢杩愭暟瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<common:request name="serverHelloNumber"/>
							<pg:error colName="name"/>
							aaa:<pg:cell actual="${param.name}"/>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			<h3>
				Hello World String  bind Example.
			</h3>
			<form action="sayHelloString.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
						
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:empty requestKey="sayHelloString">
								娌℃湁鍚嶅瓧锛屼笉闂€欍€?
							</pg:empty>
							<pg:notempty requestKey="sayHelloString">
								<common:request name="sayHelloString"/>
							</pg:notempty>
						</td>
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
		
			<h3>
				Hello World String with name variable bind Example.
			</h3>
			<form action="sayHelloStringVar.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
						<input name="id" value="0" type="hidden"/>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name0" type="text">
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:empty requestKey="sayHelloStringVar">
								娌℃湁鍚嶅瓧锛屼笉闂€欍€?
							</pg:empty>
							<pg:notempty requestKey="sayHelloStringVar">
								<common:request name="sayHelloStringVar"/>
							</pg:notempty>
						</td>
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			
			<h3>
				Hello World Time List bean bind Example.
			</h3>
			<form action="dataListBeanBind.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td colspan="2">
							璇疯緭鍏ユ偍鐨勫垢杩愭棩鏈燂細<input name="id" value="1" type="text">
						
						</td>
					</tr>
					<tr >
	   
					    <td align="right">					   
					     <input id="d12s" name="d12s" type="text"
				        onclick="WdatePicker()" src="<%=request.getContextPath() %>/jsp/datepicker/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"/>
					    </td>
					    <td>
					   <input id="d13s" name="d13s" type="text"
				        onclick="WdatePicker()" src="<%=request.getContextPath() %>/jsp/datepicker/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"/>
					   </td>
					   </tr>
					   
					   <tr>
						
						

						<td colspan="2">
							璇疯緭鍏ユ偍鐨勫垢杩愭棩鏈燂細<input name="id" value="2" type="text">
						
						</td>
					</tr>
					<tr >
	   
					    <td align="right">			
					     <input id="d12s" name="d12s" type="text"
				        onclick="WdatePicker()" src="<%=request.getContextPath() %>/jsp/datepicker/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"/>		   
					    </td>
					    <td>
					   <input id="d13s" name="d13s" type="text"
				        onclick="WdatePicker()" src="<%=request.getContextPath() %>/jsp/datepicker/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"/>
					   </td>
					   </tr>
					   <tr>
						<td colspan="2">
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑鏃ユ湡闂€欙細
							<pg:list actual="${dataListBeanBind}">
								<pg:cell colName="id"/>
								<pg:cell colName="d12" dateformat="yyyy-MM-dd"/>
								<pg:cell colName="d14" dateformat="yyyy-MM-dd"/>
								<pg:cell colName="d13s" dateformat="yyyy-MM-dd"/>
							</pg:list>
							
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
			    </tbody>
			</table>
			<h3>
				Hello World Time bind Example.
			</h3>
			<form action="sayHelloTime.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td colspan="2">
							璇疯緭鍏ユ偍鐨勫垢杩愭棩鏈燂細
						
						</td>
					</tr>
					<tr >
	   
					    <td align="right">
					   鏅€氭棩鏈燂細
					    </td>
					    <td>
					   <input id="d12" name="d12" type="text"
				        onclick="WdatePicker()" src="<%=request.getContextPath() %>/jsp/datepicker/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"/>
					   </td>
					   </tr>
						
						<tr >
					    <td align="right">
						sql鏃ユ湡锛?
						</td>
					    <td>
						<input class="Wdate" type="text" name="stringdate" onClick="WdatePicker()">
						</td>
					   </tr>
					   <tr >
					    <td align="right">
						timestamp绮剧‘鍏蜂綋鏃堕棿锛?
						</td>
					    <td>
						<input class="Wdate" type="text" name="stringdatetimestamp" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH/mm/ss'})">
						</td>
					    </tr>
					
					<tr>
						<td colspan="2">
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑鏃ユ湡闂€欙細
							<common:request name="utilDate" dateformat="yyyy-MM-dd"/>
							
							<common:request name="sqlDate" dateformat="yyyy-MM-dd"/>
							
							<common:request name="sqlTimestamp" dateformat="yyyy-MM-dd HH/mm/ss"/>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			<h3>
				Hello World Time Array bind Example.
			</h3>
			<form action="sayHelloTimes.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td colspan="2">
							璇疯緭鍏ユ偍鐨勫垢杩愭棩鏈燂細
						
						</td>
					</tr>
					<tr >
	   
					    <td align="right">
					   鏅€氭棩鏈燂細
					    </td>
					    <td>
					   <input id="d12s" name="d12s" type="text"
				        onclick="WdatePicker()" src="<%=request.getContextPath() %>/jsp/datepicker/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"/>
					   </td>
					   </tr>
						
						<tr >
					    <td align="right">
						sql鏃ユ湡锛?
						</td>
					    <td>
						<input class="Wdate" type="text" name="stringdates" onClick="WdatePicker()">
						</td>
					   </tr>
					   <tr >
					    <td align="right">
						timestamp绮剧‘鍏蜂綋鏃堕棿锛?
						</td>
					    <td>
						<input class="Wdate" type="text" name="stringdatetimestamps" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH/mm/ss'})">
						</td>
					    </tr>
					
					<tr>
						<td colspan="2">
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑鏃ユ湡闂€欙細
							<common:request name="utilDates" dateformat="yyyy-MM-dd"/>
							
							<common:request name="sqlDates" dateformat="yyyy-MM-dd"/>
							
							<common:request name="sqlTimestamps" dateformat="yyyy-MM-dd HH/mm/ss"/>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			
			<h3>
				Hello World Bean bind Example.
			</h3>
			<form action="sayHelloBean.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
						<input name="id" type="hidden" value="0">
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						
						
					</tr>
					
					<tr>
						
						

						<td>
						
							鍠滃ソ锛?
						<input name="favovate0" type="radio" checked="true"  value="0"> 涔掍箵鐞?
						<input name="favovate0" type="radio" value="1"> 绡悆
						<input name="favovate0" type="radio" value="2"> 鎺掔悆
						</td>
						
						
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:null actual="${serverHelloBean}">
								娌℃湁鍚嶅瓧锛屼笉闂€欍€?
							</pg:null>
							<pg:notnull actual="${serverHelloBean}">
								<pg:beaninfo requestKey="serverHelloBean" >
									濮撳悕锛?pg:cell colName="name"/>
									鐖卞ソ锛?pg:equal colName="favovate" value="0">涔掍箵鐞?/pg:equal>
									<pg:equal colName="favovate" value="1">绡悆</pg:equal>
									<pg:equal colName="favovate" value="2">鎺掔悆</pg:equal>
								</pg:beaninfo>
							</pg:notnull>
							
						</td>
						

						
					</tr>
					
					
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			<h3>
				Hello World EditorBean bind Example.
			</h3>
			<form action="sayHelloEditorBean.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						
						
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:null actual="${serverHelloBean}">
								娌℃湁鍚嶅瓧锛屼笉闂€欍€?
							</pg:null>
							<pg:notnull actual="${serverHelloBean}">
								<common:request name="serverHelloBean" property="name"/>
							</pg:notnull>
							
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			
			<h3>
				Hello World EditorBeans bind Example.
			</h3>
			<form action="sayHelloEditorBeans.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						
						
					</tr>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						
						
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:null actual="${serverHelloBean}">
								娌℃湁鍚嶅瓧锛屼笉闂€欍€?
							</pg:null>
							<pg:notnull actual="${serverHelloBean}">
								<common:request name="serverHelloBean"/>
							</pg:notnull>
							
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			
			<h3>
				Hello World Editor bind Example.
			</h3>
			<form action="sayHelloEditor.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						
						
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:null actual="${serverHelloBean}">
								娌℃湁鍚嶅瓧锛屼笉闂€欍€?
							</pg:null>
							<pg:notnull actual="${serverHelloBean}">
								<common:request name="serverHelloBean"/>
							</pg:notnull>
							
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			
			<h3>
				Hello World ListStringArrayEditor bind Example.
			</h3>
			<form action="sayHelloEditors.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						
						
					</tr>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						
						
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:null actual="${serverHelloBean}">
								娌℃湁鍚嶅瓧锛屼笉闂€欍€?
							</pg:null>
							<pg:notnull actual="${serverHelloBean}">
								<common:request name="serverHelloBean"/>
							</pg:notnull>
							
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			<h3>
				Hello World ListEditor bind Example.
			</h3>
			<form action="sayHelloListEditor.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						
						
					</tr>
					
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:null actual="${serverHelloBean}">
								娌℃湁鍚嶅瓧锛屼笉闂€欍€?
							</pg:null>
							<pg:notnull actual="${serverHelloBean}">
								<common:request name="serverHelloBean"/>
							</pg:notnull>
							
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			<h3>
				Hello World List PO bind  Example.
			</h3>
			<form action="sayHelloBeanList.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
						<input name="id" type="hidden" value="0">
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					<tr>
						
						

						<td>
						
							鍠滃ソ锛?
						<input name="favovate0" type="radio" checked="true"  value="0"> 涔掍箵鐞?
						<input name="favovate0" type="radio" value="1"> 绡悆
						<input name="favovate0" type="radio" value="2"> 鎺掔悆
						</td>
						
						
					</tr>
					
					<tr>
						
						

						<td>
						<input name="id" type="hidden" value="1">
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					<tr>
						
						

						<td>
						
							鍠滃ソ锛?
						<input name="favovate1" type="radio" checked="true"  value="0"> 涔掍箵鐞?
						<input name="favovate1" type="radio" value="1"> 绡悆
						<input name="favovate1" type="radio" value="2"> 鎺掔悆
						</td>
						
						
					</tr>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
							<input name="id" type="hidden" value="2">
						<input name="name" type="text">
						</td>
					</tr>
					<tr>
						
						

						<td>
						
							鍠滃ソ锛?
						<input name="favovate2" type="radio" checked="true"  value="0"> 涔掍箵鐞?
						<input name="favovate2" type="radio" value="1"> 绡悆
						<input name="favovate2" type="radio" value="2"> 鎺掔悆
						</td>
						
						
					</tr>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
							<input name="id" type="hidden" value="3">
						<input name="name" type="text">
						</td>
					</tr>
					<tr>
						
						

						<td>
						
							鍠滃ソ锛?
						<input name="favovate3" type="radio" checked="true"  value="0"> 涔掍箵鐞?
						<input name="favovate3" type="radio" value="1"> 绡悆
						<input name="favovate3" type="radio" value="2"> 鎺掔悆
						</td>
						
						
					</tr>
					<tr>
						<td>
							
							<pg:list requestKey="serverHelloListBean" >
							    濮撳悕锛?pg:cell colName="name"/>
									鐖卞ソ锛?pg:equal colName="favovate" value="0">涔掍箵鐞?/pg:equal>
									<pg:equal colName="favovate" value="1">绡悆</pg:equal>
									<pg:equal colName="favovate" value="2">鎺掔悆</pg:equal>
							</pg:list>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			
			<h3>
				Hello World List String bind  Example.
			</h3>
			<form action="sayHelloStringList.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:list requestKey="sayHelloStringList" >
							    <pg:cell />
								<pg:equal expression="{rowid} + {offset}" expressionValue="{rowcount}-1">鎬昏褰曟渶鍚庝竴琛?/pg:equal>
								
								<pg:equal expression="{rowid}" expressionValue="{pagesize}-1">褰撻〉鏁版嵁鏈€鍚庝竴琛?/pg:equal>
								椤甸潰璁板綍鏁帮細<pg:pagesize/>
							</pg:list>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			
			<h3>
				Hello World List int bind  Example.
			</h3>
			<form action="sayHelloIntList.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬暟瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬暟瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬暟瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬暟瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑鏁板瓧闂€欙細
							<pg:list requestKey="sayHelloIntList" >
							    <pg:cell />
								<pg:equal expression="{rowid} + {offset}" expressionValue="{rowcount}-1">鎬昏褰曟渶鍚庝竴琛?/pg:equal>
								
								<pg:equal expression="{rowid}" expressionValue="{pagesize}-1">褰撻〉鏁版嵁鏈€鍚庝竴琛?/pg:equal>
								椤甸潰璁板綍鏁帮細<pg:pagesize/>
							</pg:list>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			<h3>
				Hello World List int bind  Example with param mapping.
			</h3>
			<form action="sayHelloIntListWithNameMapping.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬暟瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬暟瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬暟瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬暟瀛楋細
						<input name="name" type="text">
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑鏁板瓧闂€欙細
							<pg:list requestKey="sayHelloIntListWithNameMapping" >
							    <pg:cell />
								<pg:equal expression="{rowid} + {offset}" expressionValue="{rowcount}-1">鎬昏褰曟渶鍚庝竴琛?/pg:equal>
								
								<pg:equal expression="{rowid}" expressionValue="{pagesize}-1">褰撻〉鏁版嵁鏈€鍚庝竴琛?/pg:equal>
								椤甸潰璁板綍鏁帮細<pg:pagesize/>
							</pg:list>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			
			<h3>
				Hello World List enum bind  Example .
			</h3>
			<form action="sayHelloEnumList.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬€у埆锛?
						<select name="sex" id="sex">
							<option value="F">F</option>
							<option value="M">M</option>
							<option value="UN">UN</option>
							</select>
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬€у埆锛?
						<select name="sex" id="sex">
							<option value="F">F</option>
							<option value="M">M</option>
							<option value="UN">UN</option>
							</select>
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬€у埆锛?
						<select name="sex" id="sex">
							<option value="F">F</option>
							<option value="M">M</option>
							<option value="UN">UN</option>
							</select>
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勬€у埆锛?
						<select name="sex" id="sex">
							<option value="F">F</option>
							<option value="M">M</option>
							<option value="UN">UN</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑鎬у埆闂€欙細
							<pg:list requestKey="sayHelloEnumList" >
							    <pg:cell />
								<pg:equal expression="{rowid} + {offset}" expressionValue="{rowcount}-1">鎬昏褰曟渶鍚庝竴琛?/pg:equal>
								
								<pg:equal expression="{rowid}" expressionValue="{pagesize}-1">褰撻〉鏁版嵁鏈€鍚庝竴琛?/pg:equal>
								椤甸潰璁板綍鏁帮細<pg:pagesize/>
							</pg:list>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			<h3>
				Hello World Map String,PO bind  Example.
			</h3>
			<form action="sayHelloBeanMap.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
				
						
					
					
					<tr>
						
						

						<td>
						<input name="id" type="hidden" value="0">
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
							璇疯緭鍏ユ偍鐨勬€у埆锛?
						<input name="sex" type="text">
						</td>
					</tr>
					<tr>
						
						

						<td>
						
							鍠滃ソ锛?
						<input name="favovate0" type="radio" checked="true"  value="0"> 涔掍箵鐞?
						<input name="favovate0" type="radio" value="1"> 绡悆
						<input name="favovate0" type="radio" value="2"> 鎺掔悆
						</td>
						
						
					</tr>
					
					<tr>
						
						

						<td>
						<input name="id" type="hidden" value="1">
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						璇疯緭鍏ユ偍鐨勬€у埆锛?
						<input name="sex" type="text">
						</td>
					</tr>
					<tr>
						
						

						<td>
						
							鍠滃ソ锛?
						<input name="favovate1" type="radio" checked="true"  value="0"> 涔掍箵鐞?
						<input name="favovate1" type="radio" value="1"> 绡悆
						<input name="favovate1" type="radio" value="2"> 鎺掔悆
						</td>
						
						
					</tr>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
							<input name="id" type="hidden" value="2">
						<input name="name" type="text">	璇疯緭鍏ユ偍鐨勬€у埆锛?
						<input name="sex" type="text">
						</td>
					</tr>
					<tr>
						
						

						<td>
						
							鍠滃ソ锛?
						<input name="favovate2" type="radio" checked="true"  value="0"> 涔掍箵鐞?
						<input name="favovate2" type="radio" value="1"> 绡悆
						<input name="favovate2" type="radio" value="2"> 鎺掔悆
						</td>
						
						
					</tr>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
							<input name="id" type="hidden" value="3">
						<input name="name" type="text">	璇疯緭鍏ユ偍鐨勬€у埆锛?
						<input name="sex" type="text">
						</td>
					</tr>
					<tr>
						
						

						<td>
						
							鍠滃ソ锛?
						<input name="favovate3" type="radio" checked="true"  value="0"> 涔掍箵鐞?
						<input name="favovate3" type="radio" value="1"> 绡悆
						<input name="favovate3" type="radio" value="2"> 鎺掔悆
						</td>
						
						
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:map requestKey="sayHelloBeanMap" >
									<ul>
							       <li> mapkey: <pg:mapkey/></li>
									 <li>name灞炴€у€硷細<pg:cell colName="name"/></li>
									 <li>sex灞炴€у€硷細<pg:cell colName="sex"/></li>
									 
									
									<li>鐖卞ソ锛?pg:equal colName="favovate" value="0">涔掍箵鐞?/pg:equal>
									<pg:equal colName="favovate" value="1">绡悆</pg:equal>
									<pg:equal colName="favovate" value="2">鎺掔悆</pg:equal>
									</li>
									</ul>
							</pg:map>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			<h3>
				Hello World Bean with list property bind  Example.
			</h3>
			<form action="listExampleBean.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
				
						
						<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						<td>
							璇疯緭鍏ユ偍鐨刟ge锛?
						<input name="age" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						<td>
							璇疯緭鍏ユ偍鐨刟ge锛?
						<input name="age" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						
						<td>
							璇疯緭鍏ユ偍鐨刟ge锛?
						<input name="age" type="text">
						</td>
					</tr>
					
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						<td>
							璇疯緭鍏ユ偍鐨刟ge锛?
						<input name="age" type="text">
						</td>
					</tr>

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						<td>
							璇疯緭鍏ユ偍鐨刟ge锛?
						<input name="age" type="text">
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:beaninfo requestKey="listExampleBean" >
									<ul>							      
									 <pg:list colName="name"><li>name灞炴€у€硷細<pg:cell/></li></pg:list>
									  <pg:list colName="names"><li>names灞炴€у€硷細<pg:cell/></li></pg:list>
									   <pg:list colName="age"><li>age灞炴€у€硷細<pg:cell/></li></pg:list>
									   <pg:list colName="ages"><li>ages灞炴€у€硷細<pg:cell/></li></pg:list>
									</ul>
							</pg:beaninfo>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			<h3>
				Hello World Map String bind  Example.
			</h3>
			<form action="sayHelloStringMap.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
				
						
						
					<tr>
						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						<td>
							璇疯緭鍏ユ偍鐨勬€у埆锛?
						<input name="sex" type="text">
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:map requestKey="sayHelloStringMap" >
									<ul>
							       <li> mapkey: <pg:mapkey/></li>
									 <li>value灞炴€у€硷細<pg:cell/></li>
									
									</ul>
							</pg:map>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="sub" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			<h3>
				Hello World Map String with pattern bind  Example.
			</h3>
			<form action="sayHelloStringMapWithFilter.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
				
						
						
					<tr>
						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛楋細
						<input name="name" type="text">
						</td>
						<td>
							璇疯緭鍏ユ偍鐨勬€у埆锛?
						<input name="sex" type="text">
						</td>
						
						<td>
							璇疯緭鍏ユ偍鐨勬ā寮忓悕锛?
						<input name="pre.cc.name" type="text">
						</td>
						
						
						<td>
							璇疯緭鍏ユ偍鐨勬ā寮忔€у埆锛?
						<input name="pre.cc.sex" type="text">
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:map requestKey="sayHelloStringMapWithFilter" >
									<ul>
							       <li> mapkey: <pg:mapkey/></li>
									 <li>value灞炴€у€硷細<pg:cell/></li>
									
									</ul>
							</pg:map>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="sub" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			<h3>
				Hello World Array bind  Example.
			</h3>
			<form action="sayHelloArray.page" method="post">
			<pg:dtoken/>
			<table cellspacing="0" >
				<tbody>
					<tr>
						
						

						<td>
							璇疯緭鍏ユ偍鐨勫悕瀛椾袱娆★紙涓€瀹氳涓ゆ鍝︼級锛?
						<input name="name" type="text">
						<input name="name" type="text">
						</td>
					</tr>
					<tr>
						<td>
							鏉ヨ嚜鏈嶅姟鍣ㄧ殑闂€欙細
							<pg:list requestKey="serverHelloArray" >
								<pg:rowid increament="1"/> <pg:cell />
							</pg:list>
						</td>
						

						
					</tr>
					<tr>
						<td><input type="submit" name="纭畾" value="纭畾"></td>						
					</tr>
				</tbody>
			</table>
				
			</form>
			
			
			<h3>
				Hello World Enum bind  Example.
			</h3>
			
			
			
			<table >
				
				<!--鍒嗛〉鏄剧ず寮€濮?鍒嗛〉鏍囩鍒濆鍖?->
				
					<tr >
						<th align="center">
							NAME:<select id="sex">
							<option value="F">F</option>
							<option value="M">M</option>
							<option value="UN">UN</option>
							</select>
						</th>
						 
						<th>
							<input type="button" value="鎬у埆鏌ヨ" onclick="doquery()"/>
							<input type="button" value="澶氭€у埆鏌ヨ" onclick="domutiquery()"/>
						</th>
						
						 
					</tr>
					
					<tr >
						<td align="center">
							缁撴灉
						</td>
						 
						<td id="queryresult"></td>
						
						 
					</tr>
			</table>	
				
			

</body>