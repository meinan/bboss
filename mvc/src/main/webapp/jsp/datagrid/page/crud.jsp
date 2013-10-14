<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>DataGrid Editer</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/datagrid/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/datagrid/themes/icon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/datagrid/css/tables.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/datagrid/jquery-1.4.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/datagrid/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/datagrid/json2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/datagrid/js/datagrid-1.0.js"></script>
	
	<script>
		
		var products = [
		    {productid:'FI-SW-01',name:'Koi'},
		    {productid:'K9-DL-01',name:'Dalmation'},
		    {productid:'RP-SN-01',name:'Rattlesnake'},
		    {productid:'RP-LI-02',name:'Iguana'},
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
		
		var editer_params = {	
			templet_id:'1',		
			report_id:'1',
			tableInfoId:'CAN_BE_TABLE_NAME'
			
		};
		/*鍒濆鍖栧璞?/
		var editer1 = new DataGrid('#tt',editer_params);
		
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
			$('#tt').datagrid({
				toolbar:[{
					text:'娣诲姞',
					iconCls:'icon-add',
					handler:function(){
						editer.appendRow({
							REPORT_ID:editer.params.report_id,
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
				}
				,'-',{
					text:'淇濆瓨',
					iconCls:'icon-save',
					handler:function(){
						editer.saveData();
					}
				}],
				fitColumns:true,
				loadMsg:'姝ｅ湪鍔犺浇鏁版嵁锛岃绋嶅悗...',
				onBeforeLoad:function(){
					editer.rejectChanges();
				},
				onClickRow:function(rowIndex){
					editer.onClickRow(rowIndex);
				},				
				onAfterEdit:function(rowIndex, rowData, changes){
					//validator(rowIndex, rowData);					
				}				
				<!-- datagrid end -->
			});
			
			//鍒濆鍖栨暟鎹?			initSelect("productid", products);
			//鍔犺浇鏁版嵁
			doQuery();
		});
		
		/*鍔犺浇鏁版嵁*/
		function doQuery(){			
			inputs = $("#form1 input,#form1 select");	
			//鏀寔涓ょ鏂瑰紡璋冪敤
			//editer1.loadData("itemid=i&a=33");
			editer1.loadData(inputs);
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
		<!-- form start -->
		<form name='form1' id='form1'>
		<table id="queryTable" class="genericTbl"  style="width:100%;height:auto">
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
								<input type="text" name="itemid">
							</td>
							<td width="10%" align="right">
								浜у搧 =
							</td>
							<td width="20%" align="left">
								<select style="width:100%;" name="productid" id="productid"></select>
							</td>
							<td width="20%" align="center" nowrap>
								<a class="easyui-linkbutton" icon="icon-add" href="javascript:void(0)" onclick="">閲嶇疆</a>
							</td>
						</tr>
						<tr>
							<td style="" width="10%" align="right">
								浠锋牸 >=
							</td>
							<td width="20%" align="left">
								<input type="text" name="listprice">
							</td>
							<td style="" width="10%" align="right">
								鎴愭湰 >=
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
		<!-- url="http://127.0.0.1:8000/bboss/datagrid/getData.htm?templet_id=1&report_id=1&tableInfoId=CAN_BE_TABLE_NAME" -->
		<table id="tt" 
				title="鏁版嵁缂栬緫鍣? iconCls="icon-edit" singleSelect="true"
				idField="itemid" url="http://172.16.81.53:8000/bboss/datagrid/getData.htm?templet_id=1&report_id=1&tableInfoId=CAN_BE_TABLE_NAME">
			<thead>
				<tr>
					<th field="itemid" width="80" rowspan='2' editor="{type:'text'}">Item ID</th>
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
					<th field="attr1" width="150" editor="text">灞炴€?/th>
					<th field="status" width="60" align="center" editor="{type:'checkbox',options:{on:'P',off:''}}">鐘舵€?/th>
				</tr>
			</thead>
		</table>
		<!-- dadagrid end -->
</body>
</html>