(function($){
		$.extend($.fn.validatebox.defaults.rules, {
			number : {
				validator : function(value, param) {
					return /^[0-9]+$/.test(value);
				},
				message : '* 璇疯緭鍏ユ暟瀛?'
			},
			float :{
				validator : function(value, param) {
					return /^\d+(\.\d+)?$/.test(value);
				},
				message : '* 璇疯緭鏁板瓧.'
			} ,
			landline :{
				validator : function(value, param) {
					if(value.length < 12){
						return false;
					}
					return /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(value);
				},
				message : '* 璇疯緭鍏ユ纭殑搴ф満鏍煎紡.'
			} ,
			photo :{
				validator : function(value, param) {
					return /^1[3458]\d{9}$/.test(value);
				},
				message : '* 璇疯緭鍏ユ纭殑鎵嬫満鍙风爜.'
			} ,
			ip : {
				validator : function(value, param) {
					return /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(value);
				},
				message : '* 璇疯緭鍏ユ湁鏁堢殑IP.'
			},
			serverURL : {
				validator : function(value, param) {
					return /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\:[0-9]{1,5}([0-9a-zA-Z|.]*)$/.test(value);
				},
				message : '* 璇疯緭鍏ユ湁鏁堢殑URL,渚嬪:127.0.0.1:8080'
			},
			date : {
				validator : function(value, param) {
					return /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29))$/.test(value);
				},
				message : '* 璇疯緭鍏ユ湁鏁堢殑鏃ユ湡.'
			},
			letter : {
				validator : function(value, param) {
				return /^[a-zA-Z]+$/.test(value);
				},
				message : '* 鍙兘杈撳叆鑻辨枃瀛楁瘝.'
			},
			Caracters : {
				validator:function(value,param)
				{
					if(value=="") return true;
					return /^[0-9a-zA-Z|\u4e00-\u9fa5]+$/.test(value);
				},
				message : '* 鍙兘杈撳叆鑻辨枃瀛楁瘝銆佹暟瀛楀拰涓枃.'
			},
			noSpecialCaracters : {
				validator : function(value, param) {
				return /^[0-9a-zA-Z]+$/.test(value);
				},
				message : '* 鍙兘杈撳叆鑻辨枃瀛楁瘝鎴栨暟瀛?'
			},
			zipcode : {
				validator : function(value, param) {
				return /^[1-9]\d{5}$/.test(value);
				},
				message : '* 璇疯緭鍏ユ湁鏁堢殑閭斂缂栫爜.'
			},
			keyVale:{
				validator : function(value,param)
				{
					var valid = true;
					var arrs = value.split("\n");
					var item;
					var kevals;
					
					for(var i=0;i<arrs.length;i++)
					{
						item = arrs[i];
						kevals= item.split("=");
						if(kevals.length!=2)
						{
							valid = false;
							break;
						}
						
						//楠岃瘉key涓巚alue鐨勬纭€?\s*[.A-Za-z0-9_-]
						valid = /^[0-9a-zA-Z|_]+$/.test(kevals[0]) && /^[0-9a-zA-Z|_|:|//|.]+$/.test(kevals[1].replace(/[\r\n]/g,""));
						if(!valid)
						{
						 	break;
						} 
					} 
					return valid;
				},
				message : '杈撳叆鐨勫弬鏁版牸寮忎笉姝ｇ‘.'
			}
		});	
})(jQuery);