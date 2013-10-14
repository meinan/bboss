
<%@page import="org.frameworkset.spi.assemble.ProviderInfoQueue"%>
<%@page import="java.util.List,org.frameworkset.spi.assemble.Pro"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="org.frameworkset.web.servlet.context.WebApplicationContext"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.net.URLEncoder"%><%
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
<%@page import="org.frameworkset.spi.assemble.*,org.frameworkset.spi.BaseApplicationContext,java.util.Iterator,java.util.Map"%>
<%@ taglib prefix="tab" uri="/WEB-INF/tabpane-taglib.tld" %>		

<% 
	String rootpath = request.getContextPath();
	String selected = request.getParameter("selected");
	String nodePath = request.getParameter("nodePath");	
	ProArray array = null;
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
	String name = proParentPath == null ?selected:proParentPath +  "[" + selected + "]";
	String pro_name = providerManagerInfo.getName() == null?"":providerManagerInfo.getName() ;
		Iterator iterator = null;
		boolean ismap = false;
		boolean isarray = false;
		String title = "";
		String componetType = "";
		int size = 0;
		if(providerManagerInfo.isList())
		{
			iterator = providerManagerInfo.getList().iterator();
			size = providerManagerInfo.getList().size();
			title = "List";
			componetType = providerManagerInfo.getList().getComponentType();
			if(proParentPath == null)
			{
				/**
				* vvvv^^list^^0#!#cccc^^map#!#dddd^^map
	 			* vvvv^^list^^0#!#cccc^^map#!#list^^0
				*/
				proParentPath = selected + "^^list";
			}
			else
			{
				proParentPath = proParentPath + "#!#" + selected + "^^list";
			}
		}
		else if(providerManagerInfo.isSet())
		{
			iterator = providerManagerInfo.getSet().iterator();
			title = "Set";
			size = providerManagerInfo.getSet().size();
			if(proParentPath == null)
			{
				/**
				* vvvv^^list^^0#!#cccc^^map#!#dddd^^map
	 			* vvvv^^list^^0#!#cccc^^map#!#list^^0
				*/
				proParentPath = selected + "^^set";
			}
			else
			{
				proParentPath = proParentPath + "#!#" + selected + "^^set";
			}
		}
		
		else if(providerManagerInfo.isMap())
		{
			iterator = providerManagerInfo.getMap().keySet().iterator();
			ismap = true;
			title = "Map";
			size = providerManagerInfo.getMap().size();
			componetType = providerManagerInfo.getMap().getComponentType();
			if(proParentPath == null)
			{
				/**
				* vvvv^^list^^0#!#cccc^^map#!#dddd^^map
	 			* vvvv^^list^^0#!#cccc^^map#!#list^^0
				*/
				proParentPath = selected + "^^map";
			}
			else
			{
				proParentPath = proParentPath + "#!#" + selected + "^^map";
			}
		}
		else if(providerManagerInfo.isArray())
		{
			//iterator = providerManagerInfo.getArray().keySet().iterator();
			array = providerManagerInfo.getArray();
			isarray = true;
			title = "Array";
			size = array.size();
			componetType = array.getComponentType();
			if(proParentPath == null)
			{
				/**
				* vvvv^^list^^0#!#cccc^^map#!#dddd^^map
	 			* vvvv^^list^^0#!#cccc^^map#!#list^^0
				*/
				proParentPath = selected + "^^array";
			}
			else
			{
				proParentPath = proParentPath + "#!#" + selected + "^^array";
			}
		}
		
		
		String editor = "";
		if(providerManagerInfo.getEditorString() != null)
		{
			editor = providerManagerInfo.getEditorString();
		}
		
		if(proParentPath != null && !proParentPath.equals(""))
		{
			proParentPath = URLEncoder.encode(proParentPath);
		}
		
	 %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><%=pro_name %></title>
		
<%@ include file="/include/css.jsp"%>
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/include/contentpage.css">
		<link rel="stylesheet" type="text/css" href="<%=rootpath%>/include/tab.winclassic.css">
		<tab:tabConfig/>	
	</head>
	
	<body class="contentbodymargin" scroll="no">
	<div style="width:100%;height:100%;overflow:auto">
	<fieldset height=100% width="100%">
	<LEGEND align=left><strong>&nbsp;鍏ㄥ眬灞炴€ч厤缃?<%=pro_name %>&nbsp;缁勪欢鍏冪礌绫诲瀷:<%=componetType == null?"灞炴€у璞?:componetType %></strong></LEGEND>
	<table class="thin" width="100%">
		<tr><td colspan="3" class="headercolor">鍏ㄥ眬灞炴€ч厤缃俊鎭?/td></tr>
		<tr>
		<td class="headercolor" width="20%">閰嶇疆灞炴€у悕</td>
		<td class="headercolor" width="30%">灞炴€у搴斿€?/td>
		
		<td class="headercolor" width="50%">鎻忚堪</td>
		
		</tr>
		<tr>
		<td width="20%">name</td><td width="30%"><%=pro_name %></td><td width="50%">鍏ㄥ眬灞炴€у悕绉帮紝鍞竴鏍囪瘑涓€涓叏灞€灞炴€э紝淇濇寔鍏ㄥ眬鍞竴鎬?/td>
		</tr>
		<tr>
		<td width="20%">灞炴€у畾涔夎矾寰?/td><td width="20%"><%=name %></td><td width="50%">灞炴€у畾涔夎矾寰勪俊鎭?/td>
		
		</tr>
		<tr>
		<td width="20%">value</td><td width="30%"><%
		
		if(providerManagerInfo.getValue() != null)
		{
			if(providerManagerInfo.isList())
				out.print("value=[List set]");
			else if(providerManagerInfo.isMap())
				out.print("value=[Map set]");
			else if(providerManagerInfo.isSet())
				out.print("value=[Set set]");
			else if(providerManagerInfo.isArray())
				out.print("value=[Array set]");
			else 
				out.print("value=" + providerManagerInfo.getValue() );		
		}
		
		
		%></td><td width="50%">鍏ㄥ眬灞炴€у€?/td>
		</tr>
		<tr>
		
		<td width="20%">editor</td><td width="30%"><%=editor %></td><td width="50%">灞炴€х紪杈戝櫒</td>
		</tr>
		<tr>
		<td width="20%">label</td><td width="30%"><%=providerManagerInfo.getLabel() != null?providerManagerInfo.getLabel():"" %></td><td width="50%">鍏ㄥ眬灞炴€abel灞炴€э紝鐢ㄦ潵鍋氶〉闈㈡椂鏈夌敤</td>
		
		</tr>			
	</table>
	</fieldset>
	
	
	
	
	<fieldset height=100% width="100%">
	<LEGEND align=left><strong>&nbsp;<%=title %>鏄庣粏:<%=pro_name %>&nbsp;</strong></LEGEND>
	<table  height="50%"  width="100%" border="0" cellpadding="0" cellspacing="0"  class="thin">
	
	<tr>
		<td class="headercolor" width="20%">灞炴€у悕</td>
		<td class="headercolor" width="30%">鏄庣粏</td>
		<td class="headercolor" width="10%">绫诲瀷</td>
		<td class="headercolor" width="50%">鎻忚堪</td>
		</tr>
	<%if(iterator != null || array != null){ 
	
	Pro pro = null;
	String key = null;
		int i = 0;
		while(true){
			if(!isarray)
			{
				if(iterator.hasNext()){
				
					if(ismap)
					{
						key = (String)iterator.next();
						pro = (Pro)providerManagerInfo.getMap().get(key);
					}
					else
					{
						pro = (Pro)iterator.next();
						key = i + "";
						i ++;
						
					}
				}
				else
				{
					break;
				}
			}
			else
			{
				if(i < array.size())
				{
					pro = array.getPro(i);
					key = i + "";
					i ++;
				}
				else
				{
					break;
				}
			}
			String __name = pro.getName();
	%>
	
		<tr>
	<td><%=(__name == null?key:__name) %></td>	
	<td>
	<%
		if(pro.isBean())
		{
			%>
	<a href="beanDetail.jsp?selected=<%=key %>&proParentPath=<%=proParentPath %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print((__name == null?"":"name=" + __name+ "<br>") );	
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
		out.print((__name == null?"":"name=" + __name+ "<br>") );	
	
		out.print("refid=" + pro.getRefid() + "<br>");
		//out.print("寮曠敤绫诲瀷锛? );out.print("缁勪欢鎴栬€呭睘鎬у紩鐢?);
		
	 %></a>
	 <%} else if(pro.isServiceRef()) {
	 	String refserviceid = pro.getRefid();
	  %>
	<a href="../managerserviceDetail.jsp?selected=<%=refserviceid %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		//out.print("name=" +(__name == null?key:__name) + "<br>");
		out.print((__name == null?"":"name=" + __name+ "<br>") );	
	
		out.print("refid=" + pro.getRefid() + "<br>");
		//out.print("寮曠敤绫诲瀷锛? );out.print("绠＄悊鏈嶅姟寮曠敤");
		
	 %></a>
	 <%}%>
	 
	<%}
	else
		{
			%>
	<a href="proDetail.jsp?selected=<%=key %>&proParentPath=<%=proParentPath %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print((ismap || __name == null?"":"name=" + __name+ "<br>") );	
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
	   out.print("<tr><td colspan='4'>鎬诲叡閰嶇疆浜? + size + "涓睘鎬э紒</td></tr>");	
	  }else{ 
	%>
	<tr><td colspan="100">
	
	<%
	String key = "";
		if(providerManagerInfo.isBean())
		{
		 
			%>
			<a href="beanDetail.jsp?selected=<%=providerManagerInfo.getName() %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  >
	<%
		out.print("name=" + providerManagerInfo.getName() + "<br>");		
		out.print("class=" + providerManagerInfo.getClazz() + "<br>");	
		out.print("singlable=" + providerManagerInfo.isSinglable() + "<br>");	
		
		
	 %>
	<%
		}
		else if(providerManagerInfo.isRefereced())
		{
		%>
	
	<%
	if(providerManagerInfo.isAttributeRef()) { 
		String refid_ = providerManagerInfo.getRefid();
		Pro tmp_pro = context.getProBean(refid_);
		
	%>
	<a href="<%=tmp_pro !=null && tmp_pro.isBean()?"beanDetail.jsp":"proDetail.jsp"%>?selected=<%=refid_ %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" + refid_ + "<br>");
			
		out.print("refid=" + providerManagerInfo.getRefid() + "<br>");
		//out.print("寮曠敤绫诲瀷锛? );out.print("缁勪欢鎴栬€呭睘鎬у紩鐢?);
		
	 %></a>
	 <%} else if(providerManagerInfo.isServiceRef()) {
	 	String refserviceid = providerManagerInfo.getRefid();
	  %>
	<a href="../managerserviceDetail.jsp?selected=<%=refserviceid %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print("name=" +refserviceid + "<br>");
			
		out.print("refid=" + providerManagerInfo.getRefid() + "<br>");
		//out.print("寮曠敤绫诲瀷锛? );out.print("绠＄悊鏈嶅姟寮曠敤");
		
	 %></a>
	 <%}%>
	 
	<%}
	
	%></td></tr><%
	} %>
	</table>
	</fieldset>
	
	<fieldset height=100% width="100%">
	<LEGEND align=left><strong>&nbsp;鎵╁睍灞炴€?nbsp;</strong></LEGEND>
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
	</fieldset>
	
	<fieldset height=100% width="100%">
	<LEGEND align=left><strong>&nbsp;灞炴€ф瀯閫犲弬鏁?nbsp;</strong></LEGEND>
				<% 
					Construction construction = providerManagerInfo.getConstruction();
					if(construction == null)
					{
						%>
						
						<table class="thin" width="100%">
				<tr><td colspan="4">
					
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
						refid-寮曠敤鐨勭鐞嗘湇鍔＄殑id锛屽搴攎anager鑺傜偣鐨刬d灞炴€э紝蹇呴€夊睘鎬?br>
						
						value-瀵瑰簲瀛楁fieldname鐨勫€?br>
					</td></tr>
					<tr>
						<td class="headercolor">瀛楁鍚嶇О</td>
						<td class="headercolor">瀛楁鍚嶇О鐨勫€?/td>
						<td class="headercolor">寮曠敤绠＄悊鏈嶅姟鐨刬d</td>
						<td class="headercolor">绠＄悊鏈嶅姟鎻愪緵鑰呮爣璇?/td>
					</tr>
					<% 
					    /**
					    vvvv^^list#!#cccc^^map#!#dddd^^map
	 * vvvv^^list#!#cccc^^map#!#0^^list
					    */
						if(constructionparams != null && constructionparams.size() > 0){
						if(proParentPath == null)
						{
							proParentPath = selected + "^^construction";
						}
						else
						{
							proParentPath = proParentPath +"#!#"+selected + "^^construction";
						}
							for(int i = 0; i < constructionparams.size(); i++){
								Pro pro = (Pro)constructionparams.get(i);
								String key = null;
								String _name = pro.getName();
								key = i + "";
						
			
	%>
	
		<tr>
	<td><%=(_name == null?key:_name) %></td>	
	<td>
	<%
		if(pro.isBean())
		{
			%>
	<a href="beanDetail.jsp?selected=<%=key %>&proParentPath=<%=proParentPath %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print((_name == null?"":"name=" + _name+ "<br>") );		
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
		out.print((_name == null?"":"name=" + _name+ "<br>") );	
		
		out.print("refid=" + pro.getRefid() + "<br>");
		//out.print("寮曠敤绫诲瀷锛? );out.print("缁勪欢鎴栬€呭睘鎬у紩鐢?);
		
	 %></a>
	 <%} else if(pro.isServiceRef()) {
	 	String refserviceid = pro.getRefid();
	  %>
	<a href="../managerserviceDetail.jsp?selected=<%=refserviceid %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print((_name == null?"":"name=" + _name+ "<br>") );	
		
	
		out.print("refid=" + pro.getRefid() + "<br>");
		//out.print("寮曠敤绫诲瀷锛? );out.print("绠＄悊鏈嶅姟寮曠敤");
		
	 %></a>
	 <%}%>
	 
	<%}
	else
		{
			%>
	<a href="proDetail.jsp?selected=<%=key %>&proParentPath=<%=proParentPath %>&nodePath=<%=nodePath %>" target="_blank" name="serviceDetail"  ><%
		out.print((_name == null?"":"name=" + _name+ "<br>") );	
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
				
	</fieldset>
	</div>
	</body>
</html>