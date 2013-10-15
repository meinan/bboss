	 /**
	  鎸夐粯璁ゆ柟寮忥紝鏄剧ず鍗曠粍鐧惧垎姣旀暟鎹殑瓒嬪娍鍥?浠ユ椂闂翠负妯酱	  
	 */	 
	 function plotPercTrend(target_, data_, threshold_){
	 	 //璋冪敤plotTrend鏂规硶锛屾寚瀹歽杞存渶澶у€间负100,鏁板€煎崟浣嶄负%   
	 	 var plot = plotTrend(target_, data_, threshold_, 100, "%");           
               
         return plot;
	 }
	
	/**
	  鎸夐粯璁ゆ柟寮忥紝鏄剧ず鍗曠粍鏁版嵁鐨勮秼鍔垮浘,浠ユ椂闂翠负妯酱
	  @param target_ 鏄剧ず鍥惧舰鐨刣iv瀵硅薄锛坖Query瀵硅薄锛?
	  @param data_ json鏍囧噯鏍煎紡鐨勫崟缁勬垨澶氱粍鏁版嵁
	  	鍗曠粍鏁版嵁鏍煎紡涓句緥锛歿"label":"CPU浣跨敤淇℃伅","data":[[1270621129000,18.78121878121878],[1270621437000,0]]}
	  @param threshold_ y杞村垎鐣岀嚎鐨勯榾鍊?
	  @param ymax_ y杞寸殑鏈€澶у€?
	  @param unit_ y杞存暟鎹殑鍗曚綅
	 */	 
	 function plotTrend(target_, data_, threshold_, ymax_, unit_){
	 	 //鏁版嵁
	 	 var plotData = [];
	 	 
	 	 //濡傛灉浼犲叆鐨勬暟鎹璞′笉涓烘暟缁勶紝鍒欐瀯寤烘垚鏁扮粍
	 	 if ($.isArray(data_)){
	 	 	plotData = data_;	 	 	
	 	 }
	 	 else{
	 	 	plotData.push(data_);
	 	 }
	 	 
	 	 //鍒嗙晫绾跨殑璁剧疆
	 	 var crosshairOption = {};	 	 
	 	 //y杞磋缃?
	 	 var yaxisOption = {min:0 };
	 	 
	 	 //濡傛灉鎸囧畾浜嗗垎鐣岀嚎闃€鍊硷紝鍒欏惎鐢▂杞村垎鐣岀嚎
	 	 if (threshold_){         	
          	crosshairOption = { mode: "y" };
         }   
         
         //濡傛灉鎸囧畾浜唝杞存渶澶у€硷紝鍒欒繘琛岃缃?
         if (ymax_){
         	yaxisOption = {min:0 ,max:ymax_};
         }
	 	 
	 	 //缁勮plot闇€瑕佺殑璁剧疆鍙傛暟
	 	 var options = {
	               series: {
	                   lines: { show: true },
	                   points: { show: false }
	               },	               
	               grid: { hoverable: true, clickable: true },
	               xaxis: { mode: 'time' },
	               yaxis: yaxisOption,               
               	   crosshair: crosshairOption  
            	 }
         
         //鐢熸垚plot鍥惧舰   	 
	 	 var plot = $.plot(target_,
	          			   plotData,
	          			   options
	          			  );
	          			  
         //榧犳爣绉诲姩鍒版暟鎹偣鏃讹紝鏄剧ず鎻愮ず淇℃伅    
         bindTooltip(target_, unit_);
         
         //濡傛灉鎸囧畾浜嗗垎鐣岀嚎闃€鍊硷紝鍒欏垝涓€鏉＄嚎
         if (threshold_){         	
          	plot.lockCrosshair({ y: threshold_ });
         }   
               
         return plot;
	 }
	 
	 /**鏄剧ず鏁版嵁鐐圭殑鎻愮ず淇℃伅
	 	@param x x鍧愭爣鍊?
	 	@param y y鍧愭爣鍊?
	 	@param contents 鎻愮ず淇℃伅鍐呭
	 */
	 function showTooltip(x, y, contents) {
        $('<div id="tooltip">' + contents + '</div>').css( {
            position: 'absolute',
            display: 'none',
            top: y + 5,
            left: x + 5,
            border: '1px solid #fdd',
            padding: '2px',
            'background-color': '#fee',
            'font-size': '12px',
            opacity: 0.80            
        }).appendTo("body").fadeIn(200);
    }
    
    //鍓嶄竴娆￠紶鏍囨墍鍦ㄦ暟鎹偣
    var toolTipPreviousPoint = null;
    
    function bindTooltip(target_, unit_){
    	target_.bind("plothover", function (event, pos, item) {      
	        if (true) {
	            if (item) {
	                if (toolTipPreviousPoint != item.datapoint) {
	                    toolTipPreviousPoint = item.datapoint;
	                    
	                    $("#tooltip").remove();
	                    var x = item.datapoint[0].toFixed(2),
	                        y = item.datapoint[1].toFixed(2);
	                    
	                    var dateTime = new Date();
	                    dateTime.setTime(x);	
	                    //灏唋ong鍨嬬殑鏃堕棿杞崲鎴愭湰鍦版椂闂存牸寮?
						var dateTimeStr = dateTime.toLocaleString();
						dateTimeStr = dateTimeStr.replace(' ','');						
						
						if(unit_){
							y = y + unit_;
						}						
						var content =  item.series.label + "(" + dateTimeStr + " = " + y+  ")";					
	                    
	                    showTooltip(item.pageX, item.pageY,
	                                content);
	                }
	            }
	            else {
	                $("#tooltip").remove();
	                toolTipPreviousPoint = null;            
	            }
	        }
   	 	});
   	}   	
   	
