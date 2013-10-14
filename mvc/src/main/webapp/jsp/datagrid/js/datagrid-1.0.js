/**
 * 	DataGrid灏佽绫? *  id :褰㈠"#table1"
 *  params :瀵笵ataGrid鍒濆鍖栧璞″弬鏁? */
var DataGrid = function(id, statParams) {
	DataGrid.log("constructor().id="+id);
	try {
		//statParams:鎵╁睍鍙傛暟锛屼富瑕佹槸鐢ㄤ簬缁熻鏁版嵁
		this.statParams = statParams;
		if (null == this.statParams) {
			this.statParams = {};
		}
		
		if (null == id) {
			throw new Error(DataGrid.msg_init_lostparam);
			//jQuery.error(DataGrid.msg_init_lostparam)
		} else {
			//alert("data="+jQuery.data(editers,"productid"));
			this.id = id;
		}
		
		//褰撳墠姝ｅ湪缂栬緫琛?		//this.currRowIndex = 0;
		//鏈€鍚庣紪杈戣
		this.lastIndex = 0;
		this.hasError = false;
		
		/*娉ㄥ唽editer*/
		//$(this.id).editer = this;
		//alert($(this.id).editer);
	} catch(e) {
		DataGrid.log("constructor().error="+DataGrid.msg_init_error+e.description,'error');
		$.messager.alert('閿欒淇℃伅',DataGrid.msg_init_error+e.description,'error');
		return ;
	}
	
	/**鎴愬憳鏂规硶**/
	/*鍔犺浇鏁版嵁锛屾敮鎸佸洓绉嶅弬鏁帮紝瀛楃涓诧紝jquery瀵硅薄锛屾櫘閫氬璞★紝鑷畾涔夊嚱鏁?/
	this.loadData = function(params) {
		DataGrid.log("鏌ヨ鏁版嵁寮€濮?.....","message");
		DataGrid.log("loadData().params="+params);
		$(this.id).datagrid('options').url = DataGrid.getDataUrl;
		var queryParams = $(this.id).datagrid('options').queryParams;
		var params_type = typeof(params);
		DataGrid.log("loadData().params_type="+params_type);
		if (params_type == "string") {
			params = $(params);
			DataGrid.addQueryParams(queryParams, params);
		} else if (params_type == "object") {
			DataGrid.addQueryParams(queryParams, params);
		} else if (params_type == "function") {
			//jQuery.isFunction(params);
			params(queryParams);
		}
		
		DataGrid.log("loadData().queryParams="+jQuery.param(queryParams));
		//娓呯┖鏁版嵁锛屾垨鑰呭彲浠ュ皢columns=null
		$(this.id).datagrid('loadData',{"total":0,"rows":[]});
		$(this.id).datagrid('load',queryParams);
		DataGrid.log("鏌ヨ鏁版嵁缁撴潫......","message");
		/*
		var id = this.id;
		$.getJSON(DataGrid.getDataUrl+jQuery.param(this.params),
					params,
					function(data){
						if(null != data){
							$(id).datagrid('loadData', data);
						}else{
							$.messager.alert('閿欒淇℃伅','瀵逛笉璧凤紒鍔犺浇鏁版嵁澶辫触锛?,'error');
						};
		});
		*/
		//$(this.id).datagrid('loaded');
	}
	/*淇濆瓨鏁版嵁*/
	this.saveData = function() {
		DataGrid.log("淇濆瓨鏁版嵁寮€濮?.....","message");
		DataGrid.log("saveData()");
		try{
			//淇濆瓨褰撳墠鏇存敼
			//alert("this.lastIndex="+this.lastIndex);			
			$(this.id).datagrid('endEdit', this.lastIndex);	
			//杞崲涓簀soncode鐮佸苟鎻愪氦鍒板悗鍙版暟鎹簱				
			var rows = $(this.id).datagrid('getChanges');				
			if(rows.length>0){					
				this.submitData();
			}else{
				$.messager.alert('鎻愮ず淇℃伅',"瀵逛笉璧凤紒鏁版嵁娌℃湁鏇存敼鎴栬€呬粛鏈夐敊璇暟鎹紝璇峰～濂芥暟鎹紒",'info');
				return false;
			}				
		}catch(e){
			this.onSaveDataError(null, e.description, null);				
		}
		DataGrid.log("淇濆瓨鏁版嵁缁撴潫......","message");
	}
	
	/*鎻愪氦鏁版嵁*/
	this.submitData = function(data){
		DataGrid.log("submitData()");
		var deleted_rows = $(this.id).datagrid('getChanges','deleted');
		var updated_rows = $(this.id).datagrid('getChanges','updated');
		var inserted_rows = $(this.id).datagrid('getChanges','inserted');	
		
		var deleted_data = DataGrid.obj2json(deleted_rows);
		var updated_data = DataGrid.obj2json(updated_rows);
		var inserted_data = DataGrid.obj2json(inserted_rows);
		
		var data = "{\"deleted\":"+deleted_data+","
					+"\"updated\":"+updated_data+","
					+"\"inserted\":"+inserted_data+"}";
		DataGrid.log("submitData().data="+data);
		//var obj = JSON.parse(data);
		var url = DataGrid.saveDataUrl+jQuery.param($(this.id).datagrid('options').queryParams);
		param = "data="+data;
		//var data = encodeURIComponent(data);
		var r = $.ajax({
						type: "post",
						url: url,
						contentType: "application/x-www-form-urlencoded; charset=utf-8",
						dataType: "json",
						async: false,
						cache: false,
						timeout: 3000,	
						data: {data: data},						
						beforeSend: function(XMLHttpRequest){
							//ShowLoading();
						},
						success: this.onSaveDataSuccess,
						complete: function(XMLHttpRequest, textStatus){
							//HideLoading();
						},
						error: this.onSaveDataError
				});
		//var r = $.post(url,param,onSaveDataSuccess,"json");	
	}
	/*淇濆瓨鏁版嵁鍑洪敊*/
	this.onSaveDataError = function(XMLHttpRequest, textStatus, errorThrown) {	
		DataGrid.log("onSaveDataError().textStatus="+textStatus,'error');
		$.messager.alert('閿欒淇℃伅',"瀵逛笉璧凤紒淇濆瓨澶辫触:"+textStatus+"",'error');		
		//淇濆瓨澶辫触鍙栨秷瀹㈡埛绔湰娆℃洿鏀?		//$('#tt').datagrid('rejectChanges');
	}
	/*淇濆瓨鏁版嵁鍑洪敊*/
	this.onSaveDataSuccess = function(data, textStatus) {
		DataGrid.log("onSaveDataSuccess().data="+data);
		if (data.status == 1) {
			//淇濆瓨鎴愬姛纭瀹㈡埛绔湰娆℃洿鏀?			$(this.id).datagrid('acceptChanges');
			$.messager.alert('閿欒淇℃伅',data.msg,'info');
		} else {
			$.messager.alert('鎻愮ず淇℃伅',data.msg,'error');
		}
		//$.messager.show(0, data.msg);  
	}
	/*娣诲姞涓€琛?/
	this.appendRow = function(params) {
		DataGrid.log("appendRow().params="+params);
		$(this.id).datagrid('endEdit', this.lastIndex);
		$(this.id).datagrid('appendRow',params);
		this.lastIndex = $(this.id).datagrid('getRows').length-1;
		//$(this.id).datagrid('select', this.lastIndex);
		$(this.id).datagrid('beginEdit', this.lastIndex);	
	}
	/*鎻掑叆涓€琛?/
	this.insertRow = function(params) {alert(22);
		DataGrid.log("insertRow().params="+params);
		//$(this.id).datagrid('endEdit', this.lastIndex);
		alert(3);
		$(this.id).datagrid('insertRow',params);alert(33);
		//this.lastIndex = $(this.id).datagrid('getRows').length-1;
		//$(this.id).datagrid('select', this.lastIndex);
		//$(this.id).datagrid('beginEdit', this.lastIndex);	
	}
	/*鍒犻櫎涓€琛?/
	this.deleteRow = function(params) {
		DataGrid.log("deleteRow().params="+params);
		var row = $(this.id).datagrid('getSelected');
		if (row){
			var index = $(this.id).datagrid('getRowIndex', row);
			$(this.id).datagrid('deleteRow', index);
		}	
	}
	/*鐐瑰嚮涓€琛?/
	this.onClickRow = function(rowIndex) {
		DataGrid.log("onClickRow().rowIndex="+rowIndex);
		if (this.lastIndex != rowIndex){
			$(this.id).datagrid('endEdit', this.lastIndex);
			$(this.id).datagrid('beginEdit', rowIndex);
		}else{
			$(this.id).datagrid('beginEdit', rowIndex);
		}
		this.lastIndex = rowIndex;	
	}
	/*鎷掔粷淇敼*/
	this.rejectChanges = function() {
		DataGrid.log("rejectChanges()...");
		$(this.id).datagrid('rejectChanges');
	}
	/*鑾峰彇鏌ヨ鍙傛暟*/
	this.getQueryParams = function(){
		DataGrid.log("getQueryParams()...");
		var queryParams = $(this.id).datagrid('options').queryParams;
		DataGrid.log("getQueryParams().queryParams="+jQuery.param(queryParams));
		return queryParams;
	}
	/*鏂规硶浠ｇ悊*/
	this.run = function(){
		DataGrid.log("run()");
		//alert(1);
		//$(this.id).datagrid;
	};
	/*鏁版嵁杩囨护鍣?/
	this.onLoadSuccess = function(data) {
		//alert("statParams="+this.statParams);
		//return data;
	}
	/*鑷畾涔夊睍鐜?/
	this.customDisplay = function() {
		DataGrid.log("customDisplay()");
		$.messager.alert('鎻愮ず淇℃伅','姝ｅ湪寮€鍙戜腑......','info');
		var columns = $(this.id).datagrid('options').columns;
		var columns_json = DataGrid.obj2json(columns);
		alert(columns_json);
		
	}
}
/**闈欐€佽缃紑濮?*/
//鍐呯疆涓€涓棩蹇楄褰曞櫒
DataGrid.logger = new Logger();

/*閲嶈浇jQuery鐨勫唴閮ㄩ敊璇鐞?/
DataGrid.error = function(message) {
	DataGrid.log("jquery.error()="+message,"error");
}
//鏆傛椂璁剧疆涓嶆嫤鎴?//jQuery.error = DataGrid.error;
/*璁板綍鏃ュ織淇℃伅*/
DataGrid.debug = function(debug) {
	DataGrid.logger.debug = debug;
}
DataGrid.log = function(msg,level) {
	DataGrid.logger.log(msg,level);
}
/*鏄剧ず鏃ュ織淇℃伅*/
DataGrid.showLogs = function() {
	DataGrid.logger.showLogs();
}
/*娓呯┖鏃ュ織*/
DataGrid.clearLogs = function() {
	DataGrid.logger.clearLogs();
}
/*鎴彇涓婁笅鏂?/
DataGrid.getContextPath = function() {	
	DataGrid.log("DataGrid.getContextPath()");	
	var cp = location.pathname ;	
	cp = cp.substring(0,cp.indexOf("/",1));	
	if (cp.substring(0, 1) != "/") {
        cp = "/" + cp;
    }
	return cp;
}
/*闈欐€佸睘鎬?/
DataGrid.msg_init_error = "鏋勯€燚ataGrid澶辫触:";
DataGrid.msg_init_lostparam = "缂哄皯鍙傛暟";
DataGrid.getDataUrl = window.location.protocol+"//"+window.location.host+DataGrid.getContextPath()+"/datagrid/getData.page?";
DataGrid.saveDataUrl = window.location.protocol+"//"+window.location.host+DataGrid.getContextPath()+"/datagrid/saveData.page?";
DataGrid.getNextKeyUrl = window.location.protocol+"//"+window.location.host+DataGrid.getContextPath()+"/datagrid/getNextKey.page?";
DataGrid.getTableInfoUrl = window.location.protocol+"//"+window.location.host+DataGrid.getContextPath()+"/datagrid/getTableInfo.page?";
DataGrid.editers = {};
/*闈欐€佹柟娉?/
//鏌ユ壘editer
DataGrid.getEditer = function(id) {
	return DataGrid.editers.id;
}
/*鍥犱负鍙兘澶熷皢鍙傛暟璁剧疆鍒皅ueryParams涓紝甯﹁繘鏉ョ殑鍙傛暟鍙兘鏄痡Query瀵硅薄锛屾垨鑰呬竴鑸紝閭ｄ箞姝ゆ椂闇€瑕侀亶鍘嗚瀵硅薄鐨勫睘鎬э紝灏嗗叾璁剧疆鍒皅ueryParams涓?/
DataGrid.addQueryParams = function(queryParams, params) {
	try {
		//jQuery.isPlainObject(params);娴嬭瘯鏄惁涓€涓函绮圭殑瀵硅薄
		if (params instanceof jQuery) {
			DataGrid.log("DataGrid.addQueryParams().params is a jQuery Object");
			var json = "{";			
			$.each(params, function(i, o){
				json += "\""+o.name+"\":\""+o.value+"\",";
				//eval鍑芥暟涓嶅畨鍏紝鍦╥e涓婂彲浠ユ墽琛岋紝鍚屾椂鍦╢f娴忚鍣ㄤ笂涔熸棤娉曡繍琛岋紝鍙互鑰冭檻鐢ㄥ叾浠栨柟娉曞彇浠?			
				//window.eval("queryParams."+o.name+"=\""+o.value+"\"");
				
			});
			if (params.length>0) {
				json = json.substring(0,json.length-1);
			}
			json += "}"; 
			//閲嶆柊澶勭悊璇ュ弬鏁?			params = jQuery.parseJSON(json);
		} 
		
		DataGrid.log("DataGrid.addQueryParams()鍚堝苟鍓嶇殑params="+jQuery.param(params));
		//娣卞害閫掑綊鍚堝苟涓や釜瀵硅薄
		jQuery.extend(true,queryParams, params);
		DataGrid.log("DataGrid.addQueryParams()鍚堝苟鍚庣殑queryParams="+jQuery.param(queryParams));
	} catch(e) {
  		DataGrid.log("DataGrid.addQueryParams().params can not be eval!","error");
  		$.messager.alert('閿欒淇℃伅','瀵逛笉璧凤紒鏌ヨ澶辫触锛屽湪浼犻€掓煡璇㈠弬鏁扮殑鏃跺€欓亣鍒伴敊璇細'+e,'error');
  		throw e;
	}
}
/*灏佽鍙傛暟*/
DataGrid.encodeParams = function(params) {
	DataGrid.log("DataGrid.encodeParams().params="+params);
	return encodeURIComponent(params);
}
/*灏嗗璞¤浆鎹负jsoncode*/
DataGrid.obj2json = function(jsonObj){
	DataGrid.log("DataGrid.obj2json().jsonObj="+jsonObj);
	var jsoncode =  JSON.stringify(jsonObj); 
	//alert(jsoncode);			
	return jsoncode;
}
