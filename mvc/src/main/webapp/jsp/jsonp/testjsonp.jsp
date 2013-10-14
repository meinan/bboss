<%@ page contentType="text/html;charset=UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Test Jsonp</title>
   
	<!-- 鏅€氱殑jsonp璋冪敤绀轰緥寮€濮嬶紝瀹氫箟璺ㄥ煙鍥炶皟鍑芥暟 -->
	<script type="text/javascript">
        	function jsonpCallback(result)
        	{
				alert("aaa:" + result.symbol);//寮瑰嚭璺ㄧ珯 璇锋眰杩斿洖鐨刯son鏁版嵁瀵硅薄鐨剆ymbol灞炴€х殑鍊?
        	}
    	</script>
    <!-- 鏅€氱殑jsonp璋冪敤绀轰緥锛屽悜鍙︿竴涓簲鐢╠emoproject鍙戣捣mvc璇锋眰锛屽苟鎸囧弬鏁癱allback锛堝弬鏁板悕瀛楀彲浠绘剰鎸囧畾锛夋寚瀹氬洖璋冨嚱鏁癹sonpCallback-->
	<script type="text/javascript" src="http://localhost:8081/demoproject/examples/jsonp.page?jsonp_callback=jsonpCallback"></script>
	<!-- 鏅€氱殑jsonp璋冪敤绀轰緥缁撴潫-->
	
	<!-- 閲囩敤jquery瀹炵幇jsonp璋冪敤绀轰緥寮€濮?->
	<script src="<%=request.getContextPath() %>/include/jquery-1.4.2.min.js" type="text/javascript"></script>   
	<!-- 閲囩敤jquery瀹炵幇jsonp璋冪敤绀轰緥--> 
	<script type="text/javascript">
        $(function() {
            $.getJSON("http://localhost:8081/demoproject/examples/jsonpwithjquery.page?jsonp_callback=?", function(data) {
            	alert("bbb:" + data.symbol);//寮瑰嚭璺ㄧ珯 璇锋眰杩斿洖鐨刯son鏁版嵁瀵硅薄鐨剆ymbol灞炴€х殑鍊?
            });
            //jsonp1337140657188({"postalcodes":[{"adminName2":"Westchester","adminCode2":"119","postalcode":"10504","adminCode1":"NY","countryCode":"US","lng":-73.700942,"placeName":"Armonk","lat":41.136002,"adminName1":"New York"}]});
            $.getJSON("http://www.geonames.org/postalCodeLookupJSON?postalcode=10504&country=US&callback=?", function(data) {
            	alert( data.postalcodes[0].adminName2);//寮瑰嚭璺ㄧ珯 璇锋眰杩斿洖鐨刯son鏁版嵁瀵硅薄鐨剆ymbol灞炴€х殑鍊?
            }); 


        });        
    </script>
	<!-- 閲囩敤jquery瀹炵幇jsonp璋冪敤绀轰緥缁撴潫-->
</head>
<body>
</body>
</html>&nbsp;