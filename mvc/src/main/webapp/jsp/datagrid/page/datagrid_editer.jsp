<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
String report_id = "1";
String tableInfoId = "CAN_BE_TABLE_NAME";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>DataGrid Editer</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/datagrid/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/datagrid/themes/icon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/datagrid/css/tables.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/datagrid/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/datagrid/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/datagrid/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/datagrid/json2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/datagrid/js/log4js-1.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/datagrid/js/datagrid-1.0.js"></script>
	
	
	<script>
		
		var products = [
		    {productid:'FI-SW-01',name:'&nbsp;&nbsp;&nbsp;&nbsp;Koi'},
		    {productid:'K9-DL-01',name:'&nbsp;&nbsp;&nbsp;Dalmation'},
		    {productid:'RP-SN-01',name:'&nbsp;&nbsp;Rattlesnake'},
		    {productid:'RP-LI-02',name:'&nbsp;Iguana'},
		    {productid:'FL-DSH-01',name:'Manx'},
		    {productid:'FL-DLH-02',name:'Persian'},
		    {productid:'AV-CB-01',name:'Amazon Parrot'}
		];
		/*浜у搧鏍煎紡鍣?/
		function formatter_product(value, rowData, rowIndex) {
			for(var i=0; i<products.length; i++){
				if (products[i].productid == value) return products[i].name;
			}
			return value;
		}
		/*鎴愭湰鏍煎紡鍣?/
		function formatter_unitcost(value, rowData, rowIndex) {
			if (null == value || "" == value) {
				//alert("瀵逛笉璧凤紒鎴愭湰涓嶈兘涓虹┖锛?);
				return 0.0;
			}
			
			return value;
		}
		
		/*鏍￠獙鍣?/
		function validator(rowIndex, rowData) {
			//鏍￠獙鎴愭湰
			if(null == rowData["unitcost"] || "" == rowData["unitcost"]){
				$.messager.alert('閿欒淇℃伅','瀵逛笉璧凤紒鎴愭湰涓嶈兘涓虹┖锛?,'error');
				//alert("瀵逛笉璧凤紒鎴愭湰涓嶈兘涓虹┖锛?);
				//瀹氫綅閲嶆柊淇敼
				$('#tt').datagrid('beginEdit', rowIndex);
				return false;
			}
		}
		
		/*鍒濆鍖栧璞?/
		//璁剧疆DataGrid鍙皟璇?		DataGrid.debug(true);
		
		var editer1 = new DataGrid('#table1');
		var editer2 = new DataGrid('#table2');
		
		/*鍒濆鍖栨柟娉?/
		$(function(){
			//鍒濆鍖杢abs
			$('#tabs').tabs({
				tools:[{
					iconCls:'icon-add',
					handler: function(){
						$.messager.alert('鎻愮ず淇℃伅','鍙互鍔ㄦ€佹坊鍔犳偍鎯宠缂栬緫鐨勮〃','info');
					}
				},{
					iconCls:'icon-save',
					handler: function(){
						$.messager.alert('鎻愮ず淇℃伅','鍙互鎵归噺淇濆瓨鎮ㄤ慨鏀逛簡鐨勮〃','info');	
					}
				}]
			});
					
			//鍒濆鍖杁atagrid锛屼竴瀹氳娉ㄦ剰杩欓噷
			var editer = editer1;
			<!-- datagrid start -->
			$('#table1').datagrid({
				toolbar:[{
					text:'娣诲姞',
					iconCls:'icon-add',
					handler:function(){
						editer.appendRow({
							REPORT_ID:editer.getQueryParams().report_id,
							itemid:'EST-',
							productid:'',
							listprice:'',
							unitcost:'',
							attr1:'',
							status:'P'
						});
					}
				},'-',{
					text:'鍒犻櫎',
					iconCls:'icon-remove',
					handler:function(){
						editer.deleteRow();
					}
				},'-',{
					text:'鎾ら攢',
					iconCls:'icon-undo',
					handler:function(){
						editer.rejectChanges();
					}
				},'-',{
					text:'淇濆瓨',
					iconCls:'icon-save',
					handler:function(){
						editer.saveData();
					}
				},'-',{
					text:"璋冭瘯淇℃伅",		
					iconCls:'icon-warning',			
					handler:function(){
						//editer.setDebug();
						//alert($('#table1').datagrid('options').toolbar[8].text);
						DataGrid.log("info:榛戣壊锛宔rror:绾㈣壊锛宮essage:钃濊壊","message");
						DataGrid.showLogs();
					}
				},'-',{
					text:"鍔ㄦ€佸垪",		
					iconCls:'icon-custom_display',			
					handler:function(){
						editer.customDisplay();						
					}
				}],
				collapsible:true,
				idField:'itemid',
				//frozenColumns:[[{field:'itemid',title:'Item ID',rowspan:2,width:80,sortable:true}]],
				queryParams:{report_id:'<%=report_id%>',tableInfoId:'<%=tableInfoId%>'},
				pagination:true,
				rownumbers:true,
				pageSize:10,
				pageList:[5,10,15,20],
				striped:true,
				fitColumns:true,
				showFooter:true,
				singleSelect:true,
				loadMsg:'姝ｅ湪鍔犺浇鏁版嵁锛岃绋嶅悗...',
				//loadFilter:editer.loadFilter,
				onBeforeLoad:function(){
					editer.rejectChanges();
				},
				onClickRow:function(rowIndex){
					editer.onClickRow(rowIndex);
				},				
				onAfterEdit:function(rowIndex, rowData, changes){
					//validator(rowIndex, rowData);					
				},	
				onLoadSuccess:function(data){
					editer.onLoadSuccess();
				}			
			});
			<!-- datagrid end -->
			
			//鍒濆鍖杁atagrid锛屼竴瀹氳娉ㄦ剰杩欓噷
			//var editer = editer2;
			<!-- datagrid start -->
			$('#table2').datagrid({
				toolbar:[{
					text:'娣诲姞',
					iconCls:'icon-add',
					handler:function(){
						editer2.appendRow({
							f1:'璇疯緭鍏ヨ〃鍚?,
							f2:'id',
							f3:1,
							f4:1,
							f5:'',
							f6:'',
							f7:''
						});
					}
				},'-',{
					text:'鍒犻櫎',
					iconCls:'icon-remove',
					handler:function(){
						editer2.deleteRow();
					}
				},'-',{
					text:'鎾ら攢',
					iconCls:'icon-undo',
					handler:function(){
						editer2.rejectChanges();
					}
				}
				,'-',{
					text:'淇濆瓨',
					iconCls:'icon-save',
					handler:function(){
						editer2.saveData();
					}
				}],
				queryParams:{tableInfoId:'TABLEINFO'},
				fitColumns:true,
				rownumbers:true,
				loadMsg:'姝ｅ湪鍔犺浇鏁版嵁锛岃绋嶅悗...',
				onBeforeLoad:function(){
					editer2.rejectChanges();
				},
				onClickRow:function(rowIndex){
					editer2.onClickRow(rowIndex);
				},				
				onAfterEdit:function(rowIndex, rowData, changes){
					//validator(rowIndex, rowData);					
				}				
			});
			<!-- datagrid end -->
			
			//鍒濆鍖栨暟鎹?			initSelect("productid", products);
			//鍔犺浇缂栬緫鍣?鐨勬暟鎹?			doQuery();
			//缁欑紪杈戝櫒2鍔犺浇鍏ㄩ儴鏁版嵁
			editer2.loadData();
			//鏀瑰彉浜嬩欢
			$( "#itemid2" ).change(function() {
				var newValue = "%"+this.value+"%";
				$('#itemid').val(newValue);
			});
			
		});
		/*鍔犺浇鏁版嵁*/
		function doQuery(){			
			/*鍔犺浇鏁版嵁锛屾敮鎸佸洓绉嶅弬鏁帮紝瀛楃涓诧紝jquery瀵硅薄锛屾櫘閫氬璞★紝鑷畾涔夊嚱鏁?/
			editer1.loadData("#form1 input,#form1 select:enabled");
			//editer1.loadData($("#form1 input:enabled,#form1 select:enabled"));
			//editer1.loadData({itemid:'e',unioncost:4});
			//editer1.loadData(addParams);//addParams is a function,etc function addParams(queryParams){...}
		}
		/*鍒濆鍖栨暟鎹?/
		function initSelect(selectId, datas) {
			var id = "#"+selectId;
			var selectObj = $(id);
			//alert("data="+jQuery.data(products[0],"productid"));
			//鍏堟坊鍔犱竴涓┖琛岋紝浠ヤ究鏌ヨ鍑哄叏閮ㄦ暟鎹?			$(id).append("<option ></option>"); 
			for (var i=0; i<products.length; i++) {
				$(id).append("<option value='"+products[i].productid+"'>"+products[i].name+"</option>"); 
			}
			
		}
		/*鎾斁鍔ㄧ敾鏁堟灉*/
		function animate() {
			$("#queryTable").hide("slow");
			$("#queryTable").show("slow");
		}
				
	</script>
</head>
<body>
	<div style="width:1000px;height:auto;">
	<!-- <h1 align="center">Editable DataGrid</h1> -->
	<!-- tab start -->
	<div id="tabs" >
		<div title="澧炲垹鏀规煡琛? style="padding:15px;font-size:14px;">
			<!-- form start -->
			<form name='form1' id='form1'>
			<table id="queryTable" class="genericTbl" >
			<tr>
			<td>
			<fieldset>
				<legend>鏌ヨ鏉′欢</legend>
		
						<table id="queryTable1">
							<tr>
								<td width="10%" align="right">
									itemid like
								</td>
								<td width="20%" align="left">
									<input type="hidden" name="itemid" id="itemid">
									<input type="text" name="itemid2" id="itemid2">
								</td>
								<td width="10%" align="right">
									浜у搧 =
								</td>
								<td width="20%" align="left">
									<select style="width:100%;" name="productid" id="productid"></select>
								</td>
								<td width="20%" align="center" nowrap>
									<a class="easyui-linkbutton" icon="icon-pointer" href="javascript:void(0)" onclick="document.forms[0].reset();">閲嶇疆</a>
								</td>
							</tr>
							<tr>
								<td style="" width="10%" align="right">
									浠锋牸 >
								</td>
								<td width="20%" align="left">
									<input type="text" name="listprice">
								</td>
								<td style="" width="10%" align="right">
									鎴愭湰 >
								</td>
								<td width="20%" align="left">
								<input type="text" name="unitcost">
								</td>
								<td width="20%" align="center" nowrap>
									<a class="easyui-linkbutton" icon="icon-search" href="javascript:void(0)" onclick="doQuery()">鏌ヨ</a>
								</td>
							</tr>
						</table>
					</fieldset>
					</td>
					</tr>
			</table>
			</form>
			<!-- form end -->
			<!-- dadagrid start -->
			<!-- url="${pageContext.request.contextPath}/datagrid/getData.htm?templet_id=1&report_id=1&tableInfoId=CAN_BE_TABLE_NAME" -->
			<table id="table1" 
					title="鏁版嵁缂栬緫鍣? iconCls="icon-edit" singleSelect="true"
					>
				<thead>
					<tr>
						<th field="itemid" width="80" rowspan='2' editor="{type:'text'}" >Item ID</th>
						<th field="productid" width="100" rowspan='2' formatter="formatter_product" editor="{type:'combobox',options:{valueField:'productid',textField:'name',data:products,required:true}}">浜у搧</th>
						<th colspan='2'>浜у搧灞炴€?</th>
						<!-- 
						<th field="productid" width="100" rowspan='2'>浜у搧</th>
						 -->
						<th colspan='2'>浜у搧灞炴€?</th>	
								
					</tr>
					<tr>				
						<th sorter="listpriceSorter" field="listprice" width="80" align="right" editor="{type:'numberbox',options:{precision:1,required:true}}">浠锋牸(锟?</th>
						<th field="unitcost" width="80" align="right" editor="numberbox" formatter="formatter_unitcost">鎴愭湰(锟?</th>
						<th field="attr1" width="100" editor="text">灞炴€?/th>
						<th field="status" width="60" align="center" editor="{type:'checkbox',options:{on:'P',off:''}}">鐘舵€?/th>
					</tr>
				</thead>
			</table>
			<!-- dadagrid end -->
			
		</div>
		<div title="缂栬緫TABLEINF琛? closable="true" style="padding:15px;" cache="false">
			<!-- dadagrid start -->
			<table id="table2" 
					singleSelect="true"
					idField="f1">
				<thead>
					<tr>
						<th field="f1" width="100" editor="{type:'text'}">琛ㄥ悕</th>
						<th field="f2" width="100" editor="{type:'text'}">涓婚敭鍚?/th>
						<th field="f3" width="80" align="right" editor="{type:'numberbox',options:{precision:0,required:true}}">閫掑閲?/th>
						<th field="f4" width="80" align="right" editor="{type:'numberbox',options:{precision:0,required:true}}">涓婚敭褰撳墠鍊?/th>
						<th field="f5" width="80" editor="text">涓婚敭鐢熸垚鏈哄埗</th>
						<th field="f6" width="60" align="center" editor="{type:'text'}">涓婚敭绫诲瀷</th>
						<th field="f7" width="60" align="center" editor="{type:'text'}">涓婚敭鍓嶇紑</th>
					</tr>
				</thead>
			</table>
			<!-- dadagrid end -->
		</div>
		<div title="鍐呭祵iframe" closable="true">
			<iframe scrolling="yes" frameborder="0"  src="" style="width:100%;height:100%;"></iframe>
		</div>
		<div title="DataGrid浠嬬粛" closable="false" align="left" style="padding:15px;" href="${pageContext.request.contextPath}/jsp/datagrid/page/datagrid_info.jsp">
				
			</div>
	</div>
	<!-- tab end -->
	</div>
</body>
</html>