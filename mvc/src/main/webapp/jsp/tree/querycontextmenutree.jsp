<%
/**
 * 绠€鍗曠殑鍙抽敭鑿滃崟娴嬭瘯鏍? */
 %>

 <%     
	response.setHeader("Cache-Control", "no-cache"); 
	response.setHeader("Pragma", "no-cache"); 
	response.setDateHeader("Expires", -1);  
	response.setDateHeader("max-age", 0); 
%>
<%@ taglib uri="/WEB-INF/treetag.tld" prefix="tree" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
String treetype = request.getParameter("treetype");
String id = treetype+"root";
%>

		
		<div id="treebody" class="shadow">
		
				<div class="info">
					<p><tree:query/>
		        <!-- 
		        	閫氳繃涓€鏁村鐨勬爲鏍囩锛岀敓鎴愭爲
		        	tree 灞炴€ф寚瀹氭爲鐨勫敮涓€鍚嶇О
		        	imageFolder 鎸囧畾鏍戣妭鐐圭殑鍥炬爣鐩綍
		        	collapse 鎸囧畾鏍戣妭鐐规槸鍚﹀叏閮ㄩ摵寮€锛屽苟涓斾笉鑳芥姌鍙狅紝true鍙互鎶樺彔锛宖alse鍏ㄩ儴灞曞紑浣嗘槸涓嶈兘鎶樺彔
		        	includeRootNode 鏄惁鍖呭惈鏍硅妭鐐?		        	href 鑺傜偣鍏ㄥ眬url鍦板潃
		        	target 鑺傜偣url寮瑰嚭绐楀彛
		        	mode 鎺у埗鏍戠殑灞曠ず妯″紡锛屼负鍔ㄩ潤妯″紡
		         -->
		         <tree:tree tree="TreeWithContextMenu"
		    	           node="TreeWithContextMenu.node"
		    	           imageFolder="/jsp/tree/tree_images"
		    	           collapse="true"
		    			   includeRootNode="true"			   
		    			   href="/jsp/tree/testtreenode.jsp"    			   
		    			   target="_blank"
		    			   mode="static-dynamic"
		    			   jquery="true"
		    			   > 
		    			   <!--
		    			   		鏍戠殑灞曞紑鍜屾姌鍙犳椂  淇濇寔椤甸潰鐨勫弬鏁?		    			   -->                        
		                   <tree:param name="treetype"/>
		                   <!-- 鎸囧畾鏍戠殑鏁版嵁鍔犺浇鍣ㄥ拰鏍硅妭鐐逛俊鎭?		                   		treetype-鏁版嵁鍔犺浇鍣ㄧ殑瀹炵幇绫伙紝杩欓噷鏄痶est.tree.TestTree
		                   		scope 鏁版嵁鍔犺浇鍣ㄥ璞＄殑瀛樺偍鑼冨洿锛屼竴鑸槸request绾у埆
		                   		
		                   		鎸囧畾鏍硅妭鐐圭殑淇℃伅锛?		                   		rootid 鏍硅妭鐐圭殑id
		                   		rootName 鏍硅妭鐐圭殑鍚嶇О
		                   		
		                   		expandLevel 榛樿灞曞紑澶氬皯绾?		                   		enablecontextmenu 鏄惁鍚敤鍙抽敭鑿滃崟锛宼rue鍚敤锛宖alse涓嶅惎鐢?		                    -->
		    			   <tree:treedata treetype="org.frameworkset.web.tree.TreeWithContextMenu1"
		    	                   scope="request"
		    	                   rootid="<%=id %>"  
		    	                   rootName="娴嬭瘯鏍?
		    	                   expandLevel="2"
		    	                   showRootHref="true"
		    	                   needObserver="false"
		    	                   refreshNode="false"
		    	                   enablecontextmenu="true" 
		    	                   />
		
		    	</tree:tree>
		         	</p>
				</div>
			</div>

