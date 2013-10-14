/**
 * 	Log灏佽绫? */
var Logger = function(debug) {
	//榛樿涓嶅紑鍚皟璇曞姛鑳?	if (null == debug) {debug = false};
	this.debug = debug;
	//璁板綍鏃ュ織
	this.logs = "";
	//鏄惁鏈夐敊璇棩蹇?	this.hasError = false;
	
	/*閲嶈浇jQuery鐨勫唴閮ㄩ敊璇鐞?/
	this.error = function(message) {
		this.log("jquery.error()="+message,"error");
		this.hasError = true;
	}
	//鏆傛椂璁剧疆涓嶆嫤鎴?	//jQuery.error = this.error;
	/*璁板綍鏃ュ織淇℃伅*/
	this.log = function(msg,level) {
		if (null == level || "" == level) {
			level = "info";
		}
		if (this.debug) { 
			var prefix = level+">>";
			if (typeof(msg) == "string") {
				var html =  prefix+msg+"<br>";
				//閿欒淇℃伅鐢ㄧ孩鑹茶〃绀?				if ("error" == level) {
					html = "<font color='red'>"+html+"</font>";
					this.hasError = true;
				} else if ("message" == level) {
					//璋冭瘯淇℃伅鐢ㄨ摑鑹茶〃绀?					html = "<font color='blue'>"+html+"</font>";
				}
				this.logs += "<"+(new Date()).toTimeString()+"><br>"+html;		
			} else {
				//params = jQuery.param(params);
			}
			
		}
	}
	/*鏄剧ず鏃ュ織淇℃伅*/
	this.showLogs = function() {
		if (true != this.debug) {
			this.logs = "<font color='red'>闇€瑕佽缃负debug=true鍚庢墠鍙褰曡皟璇曚俊鎭紒</font>";
		}
		var fn = "<center><a href='javascript:void(0)' onclick=\"Logger.mailtoAdmin($('#logdiv').html())\">鍙戦€侀偖浠?/a>&nbsp;&nbsp;&nbsp;&nbsp;"
		fn += "<a href='javascript:void(0)' onclick=\"Logger.copyToClipboard($('#logdiv').text())\">澶嶅埗</a></center>"
		var logdiv = "<div id='logdiv'>"+this.logs+"</div>"
		$.messager.alert('璋冭瘯淇℃伅',logdiv+fn);
		this.clearLogs();
	}
	/*娓呯┖鏃ュ織*/
	this.clearLogs = function() {
		this.logs = "";
		this.hasError = false;
	}
}
/**闈欐€佽缃紑濮?*/
/*鎴彇涓婁笅鏂?/
Logger.getContextPath = function() {	
	//this.log("this.getContextPath()");	
	var cp = location.pathname ;	
	cp = cp.substring(0,cp.indexOf("/",1));	
	if (cp.substring(0, 1) != "/") {
        cp = "/" + cp;
    }
	return cp;
}
/*闈欐€佸睘鎬?/
Logger.mailtoAdminUrl = window.location.protocol+"//"+window.location.host+Logger.getContextPath()+"/log/mailtoAdmin.htm?";
/*闈欐€佹柟娉?/
/*鍙戦€侀偖浠?/
Logger.mailtoAdmin = function(msg) {
	//alert(msg);
	var url = Logger.mailtoAdminUrl;
	$.messager.alert('鎻愮ず淇℃伅','鎭枩鎮紝閭欢鍙戦€佹垚鍔燂紝鎴戜滑灏嗗敖蹇鐞嗚繖涓棶棰?,'info');
}
/*澶嶅埗鍒板壀鍒囨澘*/
Logger.copyToClipboard = function(msg) {
	//alert(msg);
	if ($.browser.msie){//鍒ゆ柇IE
		window.clipboardData.setData('text', msg);
		$.messager.alert('鎻愮ず淇℃伅','鎭枩鎮紝宸茬粡澶嶅埗鍒颁簡鍓创鏉匡紒','info');
	}else{
		$.messager.alert('鎻愮ず淇℃伅','鎮ㄧ殑娴忚鍣ㄤ笉鏀寔鍓创鏉挎搷浣滐紝璇疯嚜琛屽鍒讹紒','error');
	}
			
	
}
