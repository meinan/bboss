<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>DatePicker</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/jsp/datepicker/My97DatePicker/WdatePicker.js"></script>
         <link rel="shortcut icon"
		href="${pageContext.request.contextPath}/css/favicon.gif">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/classic/tables.css"
		type="text/css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/classic/main.css"
		type="text/css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/classic/mainnav.css"
		type="text/css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/classic/messages.css"
		type="text/css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/css/classic/tooltip.css"
		type="text/css">
	</head>
 
	<body>
	<h1>DatePicker鎺т欢鐨勪娇鐢╠emo</h1>
	<table class="genericTbl">
	   <tr>
	   <th class="order1 sorted" >demo鎻忚堪
	   </th>
	   <th class="order1 sorted">婕旂ず鍖?	   </th>
	   </tr>
	 <tr class="even" >
	   
	    <td align="right">
	   鏅€氳Е鍙戯細
	    </td>
	    <td>
	   <input id="d12" type="text"
        onclick="WdatePicker({el:'d12'})" src="${pageContext.request.contextPath}/jsp/datepicker/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"/>
	   </td>
	   </tr>
	   
	   <tr class="even">
	    <td align="right">
	   鍥炬爣瑙﹀彂锛?	   </td>
	    <td>
	   <input id="d123" type="text"/>
       <img onclick="WdatePicker({el:'d123'})" src="${pageContext.request.contextPath}/jsp/datepicker/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle">
	   </td>
	   </tr>
	   <tr class="even">
	    <td align="right">
	   鍛ㄦ樉绀虹畝鍗曞簲鐢?	   </td>
	    <td>
	   <input id="d121" type="text" onfocus="WdatePicker({isShowWeek:true})"/>
	   </td>
	   </tr>
		 <tr class="even">
	    <td align="right">
		鍒╃敤onpicked浜嬩欢鎶婂懆璧嬪€肩粰鍙﹀鐨勬枃鏈
		</td>
	    <td>
		<input type="text" class="Wdate" id="d122" onFocus="WdatePicker({isShowWeek:true,onpicked:function() {$dp.$('d122_1').value=$dp.cal.getP('W','W');$dp.$('d122_2').value=$dp.cal.getP('W','WW');}})"/>
		鎮ㄩ€夋嫨浜嗙<input style="width: 20px" type="text" id="d122_1" />(W鏍煎紡)鍛紝
		鍙﹀鎮ㄥ彲浠ヤ娇鐢?<input style="width: 20px" type="text" id="d122_2" />(WW鏍煎紡)鍛?br/>
		</td>
	   </tr>
		
		<tr class="even">
	    <td align="right">
		绮剧‘鍒版棩鏈燂細
		</td>
	    <td>
		<input class="Wdate" type="text" onClick="WdatePicker()">
		</td>
	   </tr>
	   <tr class="even">
	    <td align="right">
		绮剧‘鍏蜂綋鏃堕棿锛?		</td>
	    <td>
		<input class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
		</td>
	    </tr>
	    <tr class="even">
	    <td align="right">
		onpicking浜嬩欢婕旂ず:
		</td>
	    <td>
		<input type="text" id="5421"
			onFocus="WdatePicker({onpicking:function(dp){if(!confirm('鏃ユ湡妗嗗師鏉ョ殑鍊间负: '+dp.cal.getDateStr()+', 瑕佺敤鏂伴€夋嫨鐨勫€?' + dp.cal.getNewDateStr() + '瑕嗙洊鍚?')) return true;}})"
			class="Wdate" />
		</td>
	    </tr>

       <tr class="even">
	    <td align="right">
		浣跨敤onpicked瀹炵幇鏃ユ湡閫夋嫨鑱斿姩:
		</td>
	    <td>
		<input id="d5221" class="Wdate" type="text"
			onFocus="var d5222=$dp.$('d5222');WdatePicker({onpicked:function(){d5222.focus();},maxDate:'#F{$dp.$D(\'d5222\')}'})" />
		鑷?		<input id="d5222" class="Wdate" type="text"
			onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d5221\')}'})" />
		</td>
	    </tr>
		
		
		<tr class="even">
	    <td align="right">
		 浠ユ槦鏈熶竴浣滀负绗竴澶?		 </td>
	    <td>
		<input class="Wdate" type="text" id="d17" onfocus="WdatePicker({firstDayOfWeek:1})"/>
        </td>
	    </tr>
        
        <tr class="even">
	    <td align="right">
		閫氳繃position灞炴€?鑷畾涔夊脊鍑轰綅缃畃osition:{left:100,top:50}
		</td>
	    <td>
		<input class="Wdate" type="text" id="d16" onfocus="WdatePicker({position:{left:100,top:50}})"/>
        </td>
	    </tr>
        
        <tr class="even">
	    <td align="right">
        绂佺敤娓呯┖鍔熻兘
        </td>
	    <td>
        <input class="Wdate" type="text" id="d15" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/><br/>
        </td>
	    </tr>
        
        <tr class="even">
	    <td align="right">
        楂樹寒姣忓懆 鍛ㄤ竴 鍛ㄤ簲
        </td>
	    <td>
		<input id="d471" type="text" class="Wdate" onFocus="WdatePicker({specialDays:[1,5]})"/> 
		</td>
	    </tr>
		
		<tr class="even">
	    <td align="right">
		鍙惎鐢?姣忎釜鏈堜唤鐨?5鏃?15鏃?25鏃?		</td>
	    <td>
		<input id="d46" type="text" class="Wdate" onFocus="WdatePicker({opposite:true,disabledDates:['5$']})"/>
		</td>
	    </tr>
		
		<tr class="even">
	    <td align="right">
		闄愬埗鏃ユ湡鐨勮寖鍥存槸 2006-09-10鍒?008-12-20
		</td>
	    <td>
		<input id="d411" class="Wdate" type="text" onfocus="WdatePicker({skin:'whyGreen',minDate:'2006-09-10',maxDate:'2008-12-20'})"/>
		</td>
	    </tr>
		
		<tr class="even">
	    <td align="right">
		闄愬埗鏃ユ湡鐨勮寖鍥存槸 20011-3-28 11:30:00 鍒?2011-4-10 20:59:30
		</td>
	    <td>
		<input type="text" class="Wdate" id="d412" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2011-03-28 11:30:00',maxDate:'2011-04-10 20:59:30'})" value="20011-03-29 11:00:00"/>
		</td>
	    </tr>
		
		<tr class="even">
	    <td align="right">
		闄愬埗鏃ユ湡鐨勮寖鍥存槸 2008骞?鏈?鍒?2008骞?0鏈?		</td>
	    <td>
		<input type="text" class="Wdate" id="d413" onfocus="WdatePicker({dateFmt:'yyyy骞碝鏈?,minDate:'2008-2',maxDate:'2008-10'})"/>
		</td>
	    </tr>
		
		<tr class="even">
	    <td align="right">
		 闄愬埗鏃ユ湡鐨勮寖鍥存槸 8:00:00 鍒?11:30:00
		 </td>
	    <td>
		<input type="text" class="Wdate" id="d414" onfocus="WdatePicker({dateFmt:'H:mm:ss',minDate:'8:00:00',maxDate:'11:30:00'})"/>
		</td>
	    </tr>
		
		<tr class="even">
	    <td align="right">
		鍙兘閫夋嫨浠婂ぉ浠ュ墠鐨勬棩鏈?鍖呮嫭浠婂ぉ)
		</td>
	    <td>
		<input id="d421" class="Wdate" type="text" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"/>
		</td>
	    </tr>
		
		<tr class="even">
	    <td align="right">
		鍙兘閫夋嫨浠婂ぉ浠ュ悗鐨勬棩鏈?涓嶅寘鎷粖澶?		</td>
	    <td>
		<input id="d422" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}'})"/>
		</td>
	    </tr>
		
		<tr class="even">
	    <td align="right">
		鍙兘閫夋嫨鏈湀鐨勬棩鏈?鍙疯嚦鏈湀鏈€鍚庝竴澶?		</td>
	    <td>
		<input id="d423" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-%M-01',maxDate:'%y-%M-%ld'})"/>
		</td>
	    </tr>
		
		<tr class="even">
	    <td align="right">
		鍓嶉潰鐨勬棩鏈熶笉鑳藉ぇ浜庡悗闈㈢殑鏃ユ湡涓斾袱涓棩鏈熼兘涓嶈兘澶т簬 2020-10-01
		</td>
	    <td>
		鍚堝悓鏈夋晥鏈熶粠<input id="d4311" class="Wdate" type="text" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/> 
         鍒?input id="d4312" class="Wdate" type="text" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
        </td>
	    </tr>
        
        <tr class="even">
	    <td align="right">
        绂佺敤 鍛ㄥ叚 鍛ㄦ棩 鎵€瀵瑰簲鐨勬棩鏈?        </td>
	    <td>
        <input id="d442" type="text" class="Wdate" onFocus="WdatePicker({disabledDays:[0,6]})"/>
        </td>
	    </tr>
		</table>
	</body>
</html>