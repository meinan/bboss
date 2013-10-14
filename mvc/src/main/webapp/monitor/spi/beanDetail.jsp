
<%@page import="org.frameworkset.spi.assemble.ProviderInfoQueue"%>
<%@page import="java.util.List,org.frameworkset.spi.assemble.Pro"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="org.frameworkset.web.servlet.context.WebApplicationContext"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%><%@page import="java.net.URLEncoder"%><%
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
<%@page import="org.frameworkset.spi.assemble.*,org.frameworkset.spi.BaseApplicationContext"%>
<%@ taglib prefix="tab" uri="/WEB-INF/tabpane-taglib.tld" %>		

<% 
	String rootpath = request.getContextPath();
	String selected = request.getParameter("selected");
	String nodePath = request.getParameter("nodePath");
	BaseApplicationContext context = BaseApplicationContext.getBaseApplicationContext(nodePath);
	
	 
	boolean isWebApplicationContext = false;
	if(context instanceof WebApplicationContext)
	{
		isWebApplicationContext = true;
	}
	
	//String classType = request.getParameter("classType");
	//绠＄悊鏈嶅姟鏄庣粏淇℃伅
	String proParentPath = request.getParameter("proParentPath");
	Pro providerManagerInfo =  null;
	if(proParentPath != null)
		providerManagerInfo = context.getInnerPro(proParentPath,selected) ;
	else
		providerManagerInfo = context.getProBean(selected) ;
	if(providerManagerInfo == null)
	{
		out.print("闈炲叏灞€bean缁勪欢");
		return ;
	}
	//鏈嶅姟鍚嶇О
	String name = proParentPath == null ?selected:proParentPath + "[" + selected + "]";
	String pro_name = providerManagerInfo.getName() == null?"":providerManagerInfo.getName() ;
	
	//鏄惁鏄崟瀹炰緥妯″紡
	boolean isSinglable = providerManagerInfo.isSinglable();
	
	//interceptor-绠＄悊鏈嶅姟鍣ㄧ殑鎷︽埅鍣?
	String interceptor = providerManagerInfo.getTransactionInterceptorClass();
	interceptor = interceptor==null?"娌℃湁閰嶇疆":interceptor;
	
	String beanclazz = providerManagerInfo.getClazz() == null?"":providerManagerInfo.getClazz();
	String factory_bean = providerManagerInfo.getFactory_bean() == null?"":providerManagerInfo.getFactory_bean();
	String factory_clazz = providerManagerInfo.getFactory_class() == null?"":providerManagerInfo.getFactory_class();
	String factory_method = providerManagerInfo.getFactory_method() == null?"":providerManagerInfo.getFactory_method();
	String init_method = providerManagerInfo.getInitMethod() == null?"":providerManagerInfo.getInitMethod();
	String destroy_method = providerManagerInfo.getDestroyMethod() == null?"":providerManagerInfo.getDestroyMethod();
	
	
	
	
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><%=pro_name %></title>
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/treeview.css">
<%@ include file="/include/css.jsp"%>
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/contentpage.css">
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/sysmanager/css/tab.winclassic.css">
		<tab:tabConfig/>	
	</head>
	
	<body class="contentbodymargin" scroll="no">
	<div style="width:100%;height:100%;overflow:auto">
	<table class="thin" width="100%">
		<tr><td colspan="3" class="headercolor">涓氬姟缁勪欢鎵€灞炲鍣ㄤ俊鎭?/td></tr>
		<tr>
		<td class="headercolor" width="20%">瀹瑰櫒鏍囪瘑</td>
		<td class="headercolor" width="30%">瀹瑰櫒绫诲瀷</td>
		<td class="headercolor" width="50%">缁勪欢鎵€灞為厤缃枃浠?/td>
		</tr>
		<tr>
		<td width="20%"><%=!isWebApplicationContext?nodePath:nodePath+"("+context.getConfigfile()+")" %></td>
		<td width="20%"><%=context.getClass().getCanonicalName() %></td>
		<td width="20%"><%=providerManagerInfo.getConfigFile() %></td>
		</tr>
	</table>
	<table class="thin" width="100%">
		<tr><td colspan="3" class="headercolor">涓氬姟缁勪欢灞炴€ч厤缃俊鎭?/td></tr>
		<tr>
		<td class="headercolor" width="20%">閰嶇疆灞炴€у悕</td>
		<td class="headercolor" width="30%">灞炴€у搴斿€?/td>
		
		<td class="headercolor" width="50%">鎻忚堪</td>
		</tr>
		<tr>
		<td width="20%">name</td><td width="30%"><%=pro_name %></td><td width="50%">name-缁勪欢鍚嶇О/鏍囪瘑</td>
		</tr>
		
		<tr>
		<td width="20%">缁勪欢瀹氫箟璺緞</td><td width="20%"><%=name %></td><td width="50%">缁勪欢瀹氫箟璺緞淇℃伅</td>
		
		</tr>
		
		<tr>
		<td width="20%">singlable</td><td width="30%"><%=isSinglable %></td><td width="50%">singlable-鏄惁鏄崟瀹炰緥妯″紡</td>
		</tr>
		
		<tr>
		<td width="20%">interceptor</td><td width="20%"><%=interceptor %></td><td width="50%">interceptor-缁勪欢鐨勬嫤鎴櫒</td>
		
		</tr>
		
		<tr>
		<td width="20%">class</td><td width="20%"><%=beanclazz %></td><td width="50%">class-缁勪欢瀹炵幇绫?/td>
		
		</tr>
		
		<tr>
		<td width="20%">factory_bean</td><td width="20%"><%
		if(factory_bean != null)
			{
				if(isWebApplicationContext)
				{
					factory_bean = factory_bean == ""?"":"<a href='beanDetail.jsp?isWebApplicationContext=true&selected="+factory_bean+"&nodePath="+nodePath+"' target='_blank'>"+factory_bean+"</a>";
				}
				else
				{
					factory_bean = factory_bean == ""?"":"<a href='beanDetail.jsp?isWebApplicationContext=false&selected="+factory_bean+"&nodePath="+nodePath+"' target='_blank'>"+factory_bean+"</a>";
				}
				out.print(factory_bean); 
								
			}%></td><td width="50%">factory_bean-缁勪欢瀹炵幇宸ュ巶鍒涘缓绫?/td>
		
		</tr>
		<tr>
		<td width="20%">factory_clazz</td><td width="20%"><%=factory_clazz %></td><td width="50%">factory_clazz-缁勪欢瀹炵幇宸ュ巶鍒涘缓绫?/td>
		
		</tr>
		<tr>
		<td width="20%">factory_method</td><td width="20%"><%=factory_method %></td><td width="50%">factory_method-缁勪欢瀹炵幇宸ュ巶鍒涘缓绫?/td>
		
		</tr>
		
		<tr>
		<td width="20%">init_method</td><td width="20%"><%=init_method %></td><td width="50%">init_method-缁勪欢瀹炰緥琚垱寤烘椂锛屼細璋冪敤鐨勬柟娉?/td>
		
		</tr>
		
		<tr>
		<td width="20%">destroy_method</td><td width="20%"><%=destroy_method %></td><td width="50%">destroy_method-缁勪欢瀹炰緥琚攢姣佹椂锛屼細璋冪敤鐨勬柟娉?/td>
		
		</tr>
	</table>
	<tab:tabContainer id="beanifoDetail" skin="amethyst">
		<tab:tabPane id="reference" tabTitle="灞炴€ф敞鍏? lazeload="true" >
			<% 
				List referencesList = providerManagerInfo.getReferences();
				
			%>
			<table class="thin" width="100%">
			<tr><td colspan="4">
				
				refid-寮曠敤鐨勭鐞嗘湇鍔＄殑id锛屽搴攎anager鑺傜偣鐨刬d灞炴€э紝蹇呴€夊睘鎬?br>
				
				value-瀵瑰簲瀛楁fieldname鐨勫€?br>
			</td></tr>
			<tr>
				<td class="headercolor">瀛楁鍚嶇О</td>
				<td class="headercolor">瀛楁鍚嶇О鐨勫€?/td>
				<td class="headercolor">閰嶇疆绫诲瀷</td>
				<td class="headercolor">鎻忚堪</td>
			</tr>
			<% 
			    
				if(referencesList != null && referencesList.size() > 0){
					String refproParentPath = proParentPath;
					if(refproParentPath == null)
					{
						refproParentPath = selected + "^^reference";
					}
					else
					{
						refproParentPath = refproParentPath +"#!#"+selected + "^^reference";
					}
					if(refproParentPath != null && !refproParentPath.equals(""))
		{
			refproParentPath = URLEncoder.encode(refproParentPath);
		}
					for(int i = 0; i < referencesList.size(); i++){
						Pro pro = (Pro)referencesList.get(i);
						
						String key = null;
						String _name = pro.getName();
						
						key = i + "";
	%>
	
		<tr>
	<td><%=key %></td>	
	<td>
	<%
		if(pro.isBean())
		{
			%>
	<a href="beanDetail.jsp?selected=<%=key %>&proParentPath=<%=refproParentPath %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" + (_name == null?key:_name) + "<br>");		
		out.print("class=" + pro.getClazz() + "<br>");	
		out.print("singlable=" + pro.isSinglable() + "<br>");	
		
		
	 %></a>
	<%
		}
		else if(pro.isRefereced())
		{
		%>
	
	<%
	if(pro.isAttributeRef()) { 
		String refid_ = pro.getRefid();
		Pro tmp_pro = context.getProBean(refid_);
		
	%>
	<a href="<%=tmp_pro !=null && tmp_pro.isBean()?"beanDetail.jsp":"proDetail.jsp"%>?selected=<%=refid_ %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" + (_name == null?key:_name) + "<br>");
		
		out.print("refid=" + pro.getRefid() + "<br>");
		
		
	 %></a>
	 <%} else if(pro.isServiceRef()) {
	 	String refserviceid = pro.getRefid();
	  %>
	<a href="../managerserviceDetail.jsp?selected=<%=refserviceid %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" +(_name == null?key:_name) + "<br>");
		
		out.print("refid=" + pro.getRefid() + "<br>");
		
		
	 %></a>
	 <%}%>
	 
	<%}
	else
		{
			%>
	<a href="proDetail.jsp?selected=<%=key %>&proParentPath=<%=refproParentPath %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" + (_name == null?key:_name) + "<br>");
		if(pro.getValue() != null)
		{
			if(pro.isList())
				out.print("value=[List set]<br>");
			else if(pro.isMap())
				out.print("value=<Map set><br>");
			else if(pro.isSet())
				out.print("value=<Set set><br>");
			else if(pro.isArray())
				out.print("value=<Array set><br>");
			else 
				out.print("value=" + pro.getValue() + "<br>");		
		}
		if(pro.getClazz() != null)
			out.print("class=" + pro.getClazz() + "<br>");		
		if(pro.getRefid() != null)
			out.print("refid=" + pro.getRefid() + "<br>");
		
		
	 %></a>
	<%
		}
	 %>
	</td>
	<td ><%
		if(pro.isBean())
		{
			out.print("缁勪欢");
		}
		else if(pro.isRefereced())
		{
			out.print("寮曠敤");
		}
		else
		{
			out.print("鍏ㄥ眬灞炴€?);
		}
	 %></td>
	 <td ><%
	  out.print(pro.getDescription() == null?"":pro.getDescription());
	  %></td>
	</tr>
	<% 
	   }
	   out.print("<tr><td colspan='4'>鎬诲叡閰嶇疆浜? + referencesList.size() + "涓睘鎬ф敞鍏ュ弬鏁帮紒</td></tr>");	
	  }else{ 
	%>
	<tr><td colspan="4">娌℃湁灞炴€ф敞鍏ュ弬鏁帮紒</td></tr>
	<%} %>
					
					</table>
					
		</tab:tabPane>
		<tab:tabPane id="construction" tabTitle="鏋勯€犲嚱鏁伴厤缃? >
				<% 
					Construction construction = providerManagerInfo.getConstruction();
					if(construction == null)
					{
						%>
						
						<table class="thin" width="100%">
				<tr><td colspan="4">
					娌℃湁瀹氫箟鏋勯€犲嚱鏁?
				</td></tr></table>
						<%
						
					}
					else
					{
						List constructionparams = providerManagerInfo.getConstructorParams();
						
					%>
					<table class="thin" width="100%">
					<tr><td colspan="4">
						fieldname-瀵瑰簲鐨勭鐞嗘湇鍔℃彁渚涜€呬腑鐨勫瓧娈靛悕绉帮紝蹇呴€夊睘鎬?br>						
						value-瀵瑰簲瀛楁fieldname鐨勫€?br>
					</td></tr>
					<tr>
						<td class="headercolor">瀛楁鍚嶇О</td>
						<td class="headercolor">瀛楁鍚嶇О鐨勫€?/td>
						<td class="headercolor">绫诲瀷</td>
						<td class="headercolor">鎻忚堪</td>
					</tr>
					<% 
					    
						if(constructionparams != null && constructionparams.size() > 0){
							String constructproParentPath = proParentPath;
							if(constructproParentPath == null)
							{
								constructproParentPath = selected + "^^construction";
							}
							else
							{
								constructproParentPath = constructproParentPath +"#!#"+selected + "^^construction";
							}
							if(constructproParentPath != null && !constructproParentPath.equals(""))
		{
			constructproParentPath = URLEncoder.encode(constructproParentPath);
		}
							for(int i = 0; i < constructionparams.size(); i++){
								Pro pro = (Pro)constructionparams.get(i);
								String key = null;
								String _name = pro.getName();
								key = i + "";
						
			
	%>
	
		<tr>
	<td><%=key %></td>	
	<td>
	<%
		if(pro.isBean())
		{
			%>
	<a href="beanDetail.jsp?selected=<%=key %>&proParentPath=<%=constructproParentPath %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" + (_name == null?key:_name) + "<br>");		
		out.print("class=" + pro.getClazz() + "<br>");	
		out.print("singlable=" + pro.isSinglable() + "<br>");	
		
		
	 %></a>
	<%
		}
		else if(pro.isRefereced())
		{
		%>
	
	<%
	if(pro.isAttributeRef()) { 
		String refid_ = pro.getRefid();
		Pro tmp_pro = context.getProBean(refid_);
		
	%>
	<a href="<%=tmp_pro !=null && tmp_pro.isBean()?"beanDetail.jsp":"proDetail.jsp"%>?selected=<%=refid_ %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" + (_name == null?key:_name) + "<br>");
		
		out.print("refid=" + pro.getRefid() + "<br>");
		//out.print("寮曠敤绫诲瀷锛? );out.print("缁勪欢鎴栬€呭睘鎬у紩鐢?);
		
	 %></a>
	 <%} else if(pro.isServiceRef()) {
	 	String refserviceid = pro.getRefid();
	  %>
	<a href="../managerserviceDetail.jsp?selected=<%=refserviceid %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" +(_name == null?key:_name) + "<br>");
		
		out.print("refid=" + pro.getRefid() + "<br>");
		//out.print("寮曠敤绫诲瀷锛? );out.print("绠＄悊鏈嶅姟寮曠敤");
		
	 %></a>
	 <%}%>
	 
	<%}
	else
		{
			String url = "proDetail.jsp?selected="+key +"&proParentPath="+constructproParentPath +"&nodePath="+nodePath;
			if(beanclazz != null && beanclazz.equals("com.frameworkset.common.poolman.ConfigSQLExecutor") && pro != null)
			{
				url = "sqlconfigfileDetail.jsp?selected=sql:"+ pro.getValue() +"&classType=sqlapplicationmodule&nodePath="+nodePath;
			}
			%>
	<a href="<%=url%>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" + (_name == null?key:_name) + "<br>");
		if(pro.getValue() != null)
		{
			if(pro.isList())
				out.print("value=[List set]<br>");
			else if(pro.isMap())
				out.print("value=[Map set]<br>");
			else if(pro.isSet())
				out.print("value=[Set set]<br>");
			else if(pro.isArray())
				out.print("value=[Array set]<br>");
			else 
				out.print("value=" + pro.getValue() + "<br>");		
		}
		if(pro.getClazz() != null)
			out.print("class=" + pro.getClazz() + "<br>");		
		if(pro.getRefid() != null)
			out.print("refid=" + pro.getRefid() + "<br>");
		//out.print("寮曠敤绫诲瀷锛? );out.print("缁勪欢鎴栬€呭睘鎬у紩鐢?);
		
	 %></a>
	<%
		}
	 %>
	</td>
	<td ><%
		if(pro.isBean())
		{
			out.print("缁勪欢");
		}
		else if(pro.isRefereced())
		{
			out.print("寮曠敤");
		}
		else
		{
			out.print("鍏ㄥ眬灞炴€?);
		}
	 %></td>
	 <td ><%
	 out.print(pro.getDescription() == null?"":pro.getDescription());
	  %></td>
	</tr>
	<% 
	   }
	   out.print("<tr><td colspan='4'>鎬诲叡閰嶇疆浜? + constructionparams.size() + "涓瀯閫犲嚱鏁板弬鏁帮紒</td></tr>");	
	  }else{ 
	%>
	<tr><td colspan="2">娌℃湁鏋勯€犲嚱鏁板弬鏁帮紒</td></tr>
	<%} %>
					
					</table>
					<%} %>
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
				NO_TRANSACTION锛?br>
				RW_TRANSACTION
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
					String txtype = synchronizedMethod.getTxtype() == null?"": synchronizedMethod.getTxtype().toString();
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
		
		<tab:tabPane id="mvcpaths" tabTitle="mvc璺緞鏄犲皠" lazeload="true" >
			<% 
				Map mvcpaths = providerManagerInfo.getMvcpaths();
				
			%>
			<table class="thin" width="100%">
			
			<tr><td class="headercolor">鏄犲皠鍚嶇О</td><td class="headercolor">鏄犲皠璺緞</td></tr>
			<%
				if(mvcpaths != null && mvcpaths.size() > 0)
				{
					Iterator its = mvcpaths.keySet().iterator();
					while(its.hasNext())
					{
						String namepath = (String)its.next();
			%>
			<tr><td><%=namepath %></td><td><%=mvcpaths.get(namepath) %></td></tr>		
			<%
					}
				}else{
			%>
			<tr><td></td></tr>
			<%	
				} 
			%>
			
			</table>
			
			<% 
			//mvc鎺у埗鍣ㄦ柟娉曚俊鎭?
				Map mvcpaths = providerManagerInfo.getMvcpaths();
				
			%>
			<table class="thin" width="100%">
			
			<tr><td class="headercolor">鏄犲皠鍚嶇О</td><td class="headercolor">鏄犲皠璺緞</td></tr>
			<%
				if(mvcpaths != null && mvcpaths.size() > 0)
				{
					Iterator its = mvcpaths.keySet().iterator();
					while(its.hasNext())
					{
						String namepath = (String)its.next();
			%>
			<tr><td><%=namepath %></td><td><%=mvcpaths.get(namepath) %></td></tr>		
			<%
					}
				}else{
			%>
			<tr><td></td></tr>
			<%	
				} 
			%>
			
			</table>
		</tab:tabPane>
		
		<tab:tabPane id="extendattrs" tabTitle="鎵╁睍灞炴€? lazeload="true" >
			<% 
				Map extendattrs = providerManagerInfo.getExtendsAttributes();
				
			%>
			<table class="thin" width="100%">
			
			<tr><td class="headercolor">鎵╁睍灞炴€у悕绉?/td><td class="headercolor">鎵╁睍灞炴€у€?/td></tr>
			<%
				if(extendattrs != null && extendattrs.size() > 0)
				{
					Iterator its = extendattrs.keySet().iterator();
					while(its.hasNext())
					{
						String namepath = (String)its.next();
			%>
			<tr><td><%=namepath %></td><td><%=extendattrs.get(namepath) %></td></tr>		
			<%
					}
				}else{
			%>
			<tr><td></td></tr>
			<%	
				} 
			%>
			
			</table>
		</tab:tabPane>
		
		<tab:tabPane id="webservices" tabTitle="webservice灞炴€? lazeload="true" >
			<% 
				Map webservices = providerManagerInfo.getWSAttributes();
				
			%>
			<table class="thin" width="100%">
			
			<tr><td class="headercolor">webservice灞炴€у悕绉?/td><td class="headercolor">webservice灞炴€у€?/td></tr>
			<%
				if(webservices != null && webservices.size() > 0)
				{
					Iterator its = webservices.keySet().iterator();
					while(its.hasNext())
					{
						String namepath = (String)its.next();
			%>
			<tr><td><%=namepath %></td><td><a href="<%=request.getContextPath()%>/cxfservices/<%=webservices.get(namepath) %>?wsdl" target="webservice"><%=webservices.get(namepath) %></a></td></tr>		
			<%
					}
				}else{
			%>
			<tr><td></td></tr>
			<%	
				} 
			%>
			
			</table>
		</tab:tabPane>
		
		<tab:tabPane id="rmiattrs" tabTitle="rmi閰嶇疆灞炴€? >
		<% 
				Map rmiattrs = providerManagerInfo.getRMIAttributes();
				
			%>
			<table class="thin" width="100%">
			
			<tr><td class="headercolor">rmi鏈嶅姟灞炴€у悕绉?/td><td class="headercolor">rmi鏈嶅姟灞炴€у€?/td></tr>
			<%
				if(rmiattrs != null && rmiattrs.size() > 0)
				{
					Iterator its = rmiattrs.keySet().iterator();
					while(its.hasNext())
					{
						String namepath = (String)its.next();
			%>
			<tr><td><%=namepath %></td><td><%=rmiattrs.get(namepath) %></td></tr>		
			<%
					}
				}else{
			%>
			<tr><td></td></tr>
			<%	
				} 
			%>
			
			</table>
		</tab:tabPane>
		
		
	</tab:tabContainer>
	
	
		
	</div>
	</body>
</html>