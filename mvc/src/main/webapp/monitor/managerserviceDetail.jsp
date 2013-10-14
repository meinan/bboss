
<%@page import="org.frameworkset.spi.assemble.ProviderInfoQueue"%>
<%@page import="java.util.List,org.frameworkset.spi.assemble.Pro"%><%
/**
 * 
 * <p>Title: 绠＄悊鏈嶅姟鏄庣粏淇℃伅鏄剧ず椤甸潰</p>
 *
 * <p>Description: 绠＄悊鏈嶅姟鏄庣粏淇℃伅鏄剧ず椤甸潰</p>
 *
 * <p>Copyright: Copyright (c) 2008</p>
 *
 * <p>Company: chinacreator</p>
 * @Date 2008-9-19
 * @author gao.tang
 * @version 1.0
 */
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8" session="false"%>
<%@page import="org.frameworkset.spi.assemble.*,org.frameworkset.spi.ApplicationContext"%>
<%@ taglib prefix="tab" uri="/WEB-INF/tabpane-taglib.tld" %>		

<% 
	String rootpath = request.getContextPath();
	String selected = request.getParameter("selected");
	String nodePath = request.getParameter("nodePath");
	//String classType = request.getParameter("classType");
	//绠＄悊鏈嶅姟鏄庣粏淇℃伅
	ProviderManagerInfo providerManagerInfo = ApplicationContext.getApplicationContext(nodePath).getServiceProviderManager().getProviderManagerInfo(selected) ;
	//绠＄悊鏈嶅姟鑰卛d
	String mgrid = providerManagerInfo.getId();
	//绠＄悊鏈嶅姟鑰卝ndi灞炴€э紝鐩墠鏈娇鐢?
	String mgrjndiname = providerManagerInfo.getJndiName();
	mgrjndiname = mgrjndiname==null?"娌℃湁閰嶇疆":mgrjndiname;
	//鏄惁鏄崟瀹炰緥妯″紡
	boolean isSinglable = providerManagerInfo.isSinglable();
	//default-鏄惁鏄己鐪佺鐞嗘湇鍔?
	boolean isDefault = providerManagerInfo.isDefaultable();
	//interceptor-绠＄悊鏈嶅姟鍣ㄧ殑鎷︽埅鍣?
	String interceptor = providerManagerInfo.getTransactionInterceptorClass();
	interceptor = interceptor==null?"娌℃湁閰嶇疆":interceptor;
	
	
	
	
	
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/treeview.css">
<%@ include file="/include/css.jsp"%>
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/contentpage.css">
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/tab.winclassic.css">
		<tab:tabConfig/>	
	</head>
	
	<body class="contentbodymargin" scroll="no">
	<div style="width:100%;height:100%;overflow:auto">
	<table class="thin" width="100%">
		<tr><td colspan="3" class="headercolor">绠＄悊鏈嶅姟灞炴€ч厤缃俊鎭?/td></tr>
		<tr>
		<td class="headercolor" width="20%">閰嶇疆灞炴€у悕</td>
		<td class="headercolor" width="30%">灞炴€у搴斿€?/td>
		<td class="headercolor" width="50%">鎻忚堪</td>
		</tr>
		<tr>
		<td width="20%">id</td><td width="30%"><%=mgrid %></td><td width="50%">id-绠＄悊鏈嶅姟鑰卛d</td>
		</tr>
		<tr>
		<td width="20%">jndiname</td><td width="30%"><%=mgrjndiname %></td><td width="50%">jndiname-绠＄悊鏈嶅姟鑰卝ndi灞炴€э紝鐩墠鏈娇鐢?/td>
		</tr>
		<tr>
		<td width="20%">singlable</td><td width="30%"><%=isSinglable %></td><td width="50%">singlable-鏄惁鏄崟瀹炰緥妯″紡</td>
		</tr>
		<tr>
		<td width="20%">default</td><td width="30%"><%=isDefault %></td><td width="50%">default-鏄惁鏄己鐪佺鐞嗘湇鍔?/td>
		</tr>
		<tr>
		<td width="20%">interceptor</td><td width="20%"><%=interceptor %></td><td width="50%">interceptor-绠＄悊鏈嶅姟鍣ㄧ殑鎷︽埅鍣?/td>
		</tr>
	</table>
	<tab:tabContainer id="managerserviceDetail" skin="amethyst">
	
		<tab:tabPane id="provider" tabTitle="鏈嶅姟鎻愪緵鑰? lazeload="true" >
			<table class="thin" width="100%">
			<tr><td colspan="3" class="headercolor">鏈嶅姟鎻愪緵鑰呴厤缃俊鎭?/td></tr>
				
			<% 
				//鏈嶅姟鎻愪緵鑰?
				ProviderInfoQueue providerInfoQueue = providerManagerInfo.getProviderInfoQueue();
				for(int i = 0; i < providerInfoQueue.size(); i++){
					SecurityProviderInfo SecurityProviderInfo = providerInfoQueue.getSecurityProviderInfo(i);
					
					//type-鏈嶅姟鎻愪緵鑰呮爣璇唅d
					String type = SecurityProviderInfo.getType();
					//used-鏈嶅姟鎻愪緵鑰呮槸鍚﹁鍚敤,缂虹渷鍊间负false
					boolean used = SecurityProviderInfo.isUsed();
					//class-鏈嶅姟鎻愪緵鑰呭搴旂殑class绫?
					String clazz = SecurityProviderInfo.getProviderClass();
					//prior-provider璋冪敤鐨勪紭鍏堢骇
					int priorProvider = SecurityProviderInfo.getPrior();
					//default-鏄惁鏄己鐪佺殑鏈嶅姟鎻愪緵鑰?
					boolean isdefault = SecurityProviderInfo.isIsdefault();
			%>
				<tr>
				<td width="100%" colspan="3" height="30"><strong>&lt;provider&gt;鏈嶅姟鎻愪緵鑰?<%=type %>鐨勯厤缃俊鎭?/strong><br/>
				&lt;provider type=&quot;<%=type %>&quot; default=&quot;<%=isdefault %>&quot; class=&quot;<%=clazz %>&quot; /&gt;
				</td>
				</tr>
				<tr>
				<td class="headercolor" width="20%">閰嶇疆灞炴€у悕</td>
				<td class="headercolor" width="30%">灞炴€у搴斿€?/td>
				<td class="headercolor" width="50%">鎻忚堪</td>
				</tr>
				<tr>
				<tr>
				<td width="20%">used</td><td width="20%"><%=used %></td>
				<td width="50%">
				used-鏈嶅姟鎻愪緵鑰呮槸鍚﹁鍚敤,缂虹渷鍊间负false锛?
				榛樿浣跨敤鐨勭鐞嗘湇鍔″櫒鍙互涓嶉厤缃畊sed灞炴€э紙鍙兘鏈変竴涓粯璁ょ殑绠＄悊鏈嶅姟鍣級锛屽繀椤诲皢default灞炴€ч厤缃垚true
				</td>
				</tr>
				<tr>
				<td width="20%">class</td><td width="20%"><%=clazz %></td><td width="50%">class-鏈嶅姟鎻愪緵鑰呭搴旂殑class绫?/td>
				</tr>
				<tr>
				<td width="20%">prior-provider</td><td width="20%"><%=priorProvider %></td><td width="50%">prior-provider璋冪敤鐨勪紭鍏堢骇</td>
				</tr>
				</tr>
				<tr>
				<td width="20%">default</td><td width="20%"><%=isdefault %></td>
				<td width="50%">
					default-鏄惁鏄己鐪佺殑鏈嶅姟鎻愪緵鑰?
				</td>
				</tr>
			<%
				}
			%>
			
			</table>
		</tab:tabPane>
		
		<tab:tabPane id="synchronize" tabTitle="鍚屾鏂规硶" lazeload="true" >
			<table class="thin" width="100%">
			<tr><td colspan="3">鏄惁鍚敤鍚屾鏈哄埗锛?%=providerManagerInfo.isSynchronizedEnabled()%></td></tr>
			<tr><td class="headercolor">鏂规硶鍚?/td><td class="headercolor">妯″紡</td><td class="headercolor">鎻忚堪</td></tr>
			<% 
				List synchronizedMethodLists = providerManagerInfo.getSynchronizedMethodLists();;
				for(int i = 0; synchronizedMethodLists != null && i < synchronizedMethodLists.size(); i++){
					SynchronizedMethod synchronizedMethod = (SynchronizedMethod)synchronizedMethodLists.get(i);
					//enabled-鏄惁鍚敤鍚屾鍔熻兘锛屽鏋滄病鏈夊惎鐢ㄥ悓姝ュ姛鑳藉嵆浣块厤缃簡澶氫釜鏈嶅姟鎻愪緵鑰呯殑鍚屾鏂规硶锛屾墍鏈夌殑鍚屾鍔熻兘灏嗕笉璧蜂綔鐢?
					String methodName = synchronizedMethod.getMethodName();
					List mathodParam = synchronizedMethod.getParams();
					String pattern = synchronizedMethod.getPattern();
					if(pattern != null){
			%>
				<tr>
				<td><%=pattern %></td>
				<td>姝ｅ垯琛ㄨ揪寮?/td>
				<td>
				濡傛灉娑夊強鐨勬柟娉曞悕绉版槸涓€涓鍒欒〃杈惧紡鐨勫尮閰嶆ā寮忥紝鍒欐棤闇€閰嶇疆鏂规硶鍙傛暟,<br/>
					妯″紡涓? 琛ㄧず鍖归厤鎵€鏈夌殑鏂规硶銆?
				妯″紡鍖归厤锛屾ā寮忓尮閰嶇殑椤哄簭鍙楅厤缃綅缃殑褰卞搷锛屽鏋滈厤缃湪鍚庨潰鎴栬€呬腑闂达紝閭ｄ箞浼氬厛鎵ц涔嬪墠鐨勬柟娉曞尮閰嶏紝濡傛灉鍖归厤涓婁簡灏变笉浼?
			瀵硅妯″紡鏂规硶杩涜鍖归厤浜嗭紝鍚﹀垯鎵ц鍖归厤鎿嶄綔銆?br/>
			濡傛灉鍖归厤涓婄壒瀹氱殑鏂规硶鍚嶇О锛岄偅涔堣繖涓柟娉曞氨鏄渶瑕佽繘琛屽悓姝ョ殑鏂规硶<br/>
			渚嬪锛氭ā寮弔estInt.*鍖归厤鎺ュ彛涓互testInt寮€澶寸殑浠讳綍鏂规硶锛屽叿浣撶殑妯″紡瀹氫箟瑙勫垯鍙傝€僇AVA姝ｅ垯琛ㄨ揪寮忕殑瑙勫垯</td>
				</tr>
			<%			
					}else{
			%>
				<tr><td><%=methodName %>(
			<% 
						for(int j = 0; mathodParam != null && j < mathodParam.size(); j++){
							Pro param = (Pro)mathodParam.get(j);
							if(j < mathodParam.size() - 1){
								out.print(param.getClazz()+",");
							}else{
								out.print(param.getClazz());
							}		
			%>	
			<%
						}
			%>
				)</td>
				<td>鏂规硶鍏ㄥ悕</td>
				<td>鍖归厤鏂规硶</td>
				</tr>
			<%				
					}
				}
			%>
			</table>
		</tab:tabPane>
		
		<tab:tabPane id="transactions" tabTitle="浜嬪姟鏂规硶" lazeload="true" >
		<% 
			List transactionMethodsList = providerManagerInfo.getTransactionMethods();
		%>
			<table class="thin" width="100%">
			<tr>
			<td colspan="4">
				瀹氫箟闇€瑕佽繘琛屼簨鍔℃帶鍒剁殑鏂规硶<br>
				灞炴€ц鏄庯細<br>
				name-鏂规硶鍚嶇О锛屽彲浠ユ槸涓€涓鍒欒〃杈惧紡锛屾鍒欒〃杈惧紡鐨勮娉曡鍙傝€僯akarta-oro鐨勭浉鍏虫枃妗ｏ紝濡傛灉浣跨敤<br>
				姝ｅ垯琛ㄨ揪寮忕殑鎯呭喌鏃讹紝鍒欐柟娉曚腑澹版槑鐨勬柟娉曞弬鏁板皢琚拷鐣ワ紝浣嗘槸鍥炴粴寮傚父鏈夋晥銆?br>
				pattern-鏂规硶鍚嶇О鐨勬鍒欒〃杈惧紡鍖归厤妯″紡锛屾ā寮忓尮閰嶇殑椤哄簭鍙楅厤缃綅缃殑褰卞搷锛屽鏋滈厤缃湪鍚庨潰鎴栬€呬腑闂达紝<br>
						閭ｄ箞浼氬厛鎵ц涔嬪墠鐨勬柟娉曞尮閰嶏紝濡傛灉鍖归厤涓婁簡灏变笉浼氬璇ユā寮忔柟娉曡繘琛屽尮閰嶄簡锛屽惁鍒欐墽琛屽尮閰嶆搷浣溿€?br>
						濡傛灉鍖归厤涓婄壒瀹氱殑鏂规硶鍚嶇О锛岄偅涔堣繖涓柟娉曞氨鏄渶瑕佽繘琛屼簨鍔℃帶鍒剁殑鏂规硶<br>
						渚嬪锛氭ā寮弔estInt.*鍖归厤鎺ュ彛涓互testInt寮€澶寸殑浠讳綍鏂规硶<br>
				txtype-闇€瑕佹帶鍒剁殑浜嬪姟绫诲瀷锛屽彇鍊艰寖鍥达細<br>
				NEW_TRANSACTION锛?br>
				REQUIRED_TRANSACTION锛?br>
				MAYBE_TRANSACTION锛?br>
				NO_TRANSACTION<br>
			</td>
			</tr>
			<%if(transactionMethodsList == null || transactionMethodsList.size() == 0){ %>
			<tr><td>娌℃湁瀹氫箟闇€瑕佽繘琛屼簨鍔℃帶鍒剁殑鏂规硶锛?/td></tr>
			<%} %>
			</table>
			
			<% 
				
				for(int i = 0; transactionMethodsList != null && i < transactionMethodsList.size(); i++){
					SynchronizedMethod synchronizedMethod = (SynchronizedMethod)transactionMethodsList.get(i);
					//鏂规硶鍚嶇О锛宯ame鍜宲attern涓嶈兘鍚屾椂鍑虹幇
					String methodName = synchronizedMethod.getMethodName();
					//pattern-鍖归厤鏂规硶鍚嶇О鐨勬鍒欒〃杈惧紡
					String pattern = synchronizedMethod.getPattern();
					//txtype-闇€瑕佹帶鍒剁殑浜嬪姟绫诲瀷锛屽彇鍊艰寖鍥达細NEW_TRANSACTION锛孯EQUIRED_TRANSACTION锛孧AYBE_TRANSACTION锛孨O_TRANSACTION
					String txtype = String.valueOf(synchronizedMethod.getTxtype());
					//鍥炴粴寮傚父
					List rollbackExceptionsList = synchronizedMethod.getRollbackExceptions();
					//鍙傛暟鍒楄〃
					List paramList = synchronizedMethod.getParams();
			%>
			<table class="thin" width="100%">
			<tr>
			<td class="bginputcolor" height="30" colspan="4"><strong>&lt;method&gt;
			<%
				if(pattern != null){
					out.print(pattern);
				}else{
					out.print(methodName);
				}
				out.print("(");
				for(int txt = 0; paramList != null && txt < paramList.size(); txt ++){
					Pro paramTxt = (Pro)paramList.get(txt);
					if(txt < paramList.size() - 1){
						out.print(paramTxt.getClazz() + ",");
					}else{
						out.print(paramTxt.getClazz());
					}
				}
				out.print(")");
				if(pattern != null && paramList != null){
					out.print("<br>姝ｅ垯琛ㄨ揪寮忓尮閰嶇殑鏂规硶涓嶉渶瑕侀厤缃弬鏁帮紒");
				} 
			%>
			</strong></td>
			</tr>
			<tr>
			<td width="200">浜嬪姟绫诲瀷</td><td colspan="3"><%=txtype %></td>
			</tr>
			<tr>
			<td width="200" rowspan="<%=rollbackExceptionsList.size()+1 %>">浜嬪姟鍥炴粴寮傚父</td>
			<td class="headercolor">寮傚父绫?/td><td class="headercolor" >寮傚父妫€娴嬭寖鍥?/td><td class="headercolor" >鎻忚堪</td>
			</tr>
			<%if(rollbackExceptionsList != null && rollbackExceptionsList.size() > 0) {
				for(int ep = 0; ep < rollbackExceptionsList.size(); ep++){
					RollbackException rollbackException = (RollbackException)rollbackExceptionsList.get(ep);
					//寮傚父绫?
					String epClass = rollbackException.getExceptionName();
					//INSTANCEOF = 1; IMPLEMENTS = 0;
					String type = "INSTANCEOF";
					if(rollbackException.getExceptionType() == 0){
						type = "IMPLEMENTS";
					}
			%>
			<tr>
			<td ><%=epClass %></td><td ><%=type %></td>
			<td>
			<%
				if(type.equals("IMPLEMENTS")){
					out.print("IMPLEMENTS鍙娴嬪紓甯哥被鏈韩锛屽拷鐣ュ紓甯哥被鐨勫瓙绫?);
				}
				else if(type.equals("INSTANCEOF")){
					out.print("INSTANCEOF妫€鏌ュ紓甯哥被鏈韩鍙婂叾鎵€鏈夊瓙绫?);
				} 
				
			%>
			</td>
			</tr>
			<%}
			}else{ %>
			<tr>
			<td colspan="4" align="center">娌℃湁閰嶇疆鍥炴粴寮傚父</td>
			</tr>
			<%} %>
			</table>
			<br>
			<%
				}
			%>
			
		</tab:tabPane>
		
		<tab:tabPane id="reference" tabTitle="寮曠敤閰嶇疆" lazeload="true" >
			<% 
				List referencesList = providerManagerInfo.getReferences();
				
			%>
			<table class="thin" width="100%">
			<tr><td colspan="4">
				fieldname-瀵瑰簲鐨勭鐞嗘湇鍔℃彁渚涜€呬腑鐨勫瓧娈靛悕绉帮紝蹇呴€夊睘鎬?br>
				refid-寮曠敤鐨勭鐞嗘湇鍔＄殑id锛屽搴攎anager鑺傜偣鐨刬d灞炴€э紝蹇呴€夊睘鎬?br>
				reftype-瀵瑰簲鐨勭鐞嗘湇鍔℃彁渚涜€呮爣璇嗭紝鍙€夊睘鎬?br>
				value-瀵瑰簲瀛楁fieldname鐨勫€?br>
			</td></tr>
			<tr>
				<td class="headercolor">瀛楁鍚嶇О</td>
				<td class="headercolor">寮曠敤瀛楁鐨勫€?/td>
				<td class="headercolor">瀵瑰簲鐨勭鐞嗘湇鍔℃彁渚涜€呮爣璇?/td>
				<td class="headercolor">寮曠敤瀛楁绫诲瀷</td>
				
			</tr>
			<% 
				if(referencesList != null && referencesList.size() > 0){
					for(int rf = 0; rf < referencesList.size(); rf++){
						Pro reference = (Pro)referencesList.get(rf);
						//fieldname-瀵瑰簲鐨勭鐞嗘湇鍔℃彁渚涜€呬腑鐨勫瓧娈靛悕绉帮紝蹇呴€夊睘鎬?
						String fieldname = reference.getName();
						//refid-寮曠敤鐨勭鐞嗘湇鍔＄殑id锛屽搴攎anager鑺傜偣鐨刬d灞炴€э紝蹇呴€夊睘鎬?
						String refid = reference.getRefid();
						refid = refid == null?"娌℃湁閰嶇疆":"<a href='managerserviceDetail.jsp?selected="+refid+"' target='_blank'>"+refid+"</a>";
						//reftype-瀵瑰簲鐨勭鐞嗘湇鍔℃彁渚涜€呯被鍨嬶紝鍙€夊睘鎬?
						String reftype = reference.getReftype();
						
						
						String clazz = reference.getClazz();
						reftype = reftype == null?clazz:reftype;
						reftype = reftype == null?"娌℃湁閰嶇疆":reftype;
						//value-瀵瑰簲瀛楁fieldname鐨勫€?
						Object value = reference.getValue();
						value = value == null?"娌℃湁閰嶇疆":value;
			%>
			<tr>
				<td ><%=fieldname %></td>
				<td ><%=value %></td>
				<td ><%=refid %></td>
				<td ><%=reftype %></td>
			</tr>		
			<%
					}
				}else{
			%>
				<tr><td colspan="4">娌℃湁閰嶇疆寮曠敤锛?/td></tr>
			<%		
				}
			%>
			
			</table>
		</tab:tabPane>
		
		<tab:tabPane id="interceptor" tabTitle="鎷︽埅鍣? lazeload="true" >
			<% 
				List interceptorsList = providerManagerInfo.getInterceptors();
				
			%>
			<table class="thin" width="100%">
			<tr><td>
				class-鎷︽埅鍣ㄧ殑瀹炵幇绫伙紝鎵€鏈夌殑鎷︽埅鍣ㄩ兘蹇呴』瀹炵幇<br>
		      	com.frameworkset.proxy.Interceptor鎺ュ彛<br>
		      	鐩墠绯荤粺涓彁渚涗簡浠ヤ笅缂虹渷鎷︽埅鍣細<br>
		      	鏁版嵁搴撲簨鍔＄鐞嗘嫤鎴櫒锛坥rg.frameworkset.spi.<br>
		      	interceptor.TransactionInterceptor锛?鏀寔瀵瑰０鏄庡紡浜嬪姟鐨勭鐞?br>
			</td></tr>
			<tr><td class="headercolor">鎷︽埅鍣ㄧ被</td></tr>
			<%
				if(interceptorsList != null && interceptorsList.size() > 0){
					for(int ip = 0; ip < interceptorsList.size(); ip ++){
						InterceptorInfo interceptorInfo = (InterceptorInfo)interceptorsList.get(ip);
						String clazz = interceptorInfo.getClazz();
			%>
			<tr><td><%=clazz %></td></tr>		
			<%
					}
				}else{
			%>
			<tr><td>娌℃湁閰嶇疆鎷︽埅鍣紒</td></tr>
			<%	
				} 
			%>
			
			</table>
		</tab:tabPane>
		
	</tab:tabContainer>
	</div>
	</body>
</html>