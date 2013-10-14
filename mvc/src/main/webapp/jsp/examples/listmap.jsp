<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>listmap澶嶆潅鏍囩婕旂ず绀轰緥</title>

</head>
<body>
	<div data-role="page">
	
		
		<form>
			<div class="detail">
				<div class="tab">
				1.鐩存帴閫氳繃list鏍囩杈撳嚭nameList涓殑鎵€鏈塳ey
					<ul id="tabul">
						<pg:list requestKey="nameList">
							<li class="current"><a href="javascript:void(0);"><pg:cell /></a></li>
						</pg:list>
					</ul>
					<div class="tabdiv">
						<span></span>
					</div>
				</div>
				<div class="pannle">
				2.鏍规嵁list涓璳ey鐨勯『搴忔湁搴忛亶鍘嗗苟杈撳嚭map涓璴ist涓繚鎸佺殑bean鐨勫睘鎬у€?
				<ol>
					<pg:list requestKey="nameList">
						
							<pg:equal value="handlerModel"><!-- 缁忓姙鍒楄〃 -->
								<pg:map requestKey="billDataMap" keycell="true">
									<li class="pannelol"><span></span> 
									<pg:list><!-- 鐩存帴閬嶅巻杈撳嚭map涓瓨鍌ㄧ殑list,鍚岀悊涔熷彲浠ョ洿鎺ラ亶鍘嗚緭鍑簃ap涓瓨鍌ㄧ殑map鍜屾暟缁?-->
											<ul>
												<li><label>鍚嶇О锛?/label><pg:cell colName="name" /></li>
												<li><label>鎬у埆锛?/label><pg:cell colName="sex" /></li>												
											</ul>
									</pg:list></li>
								</pg:map>
							</pg:equal>
							<pg:equal value="applyUnionModel"><!-- 鍏宠仈鐢宠 -->
								<pg:map requestKey="billDataMap" keycell="true">
									<li class="pannelol"><span></span> 
									<pg:list><!-- 鐩存帴閬嶅巻杈撳嚭map涓瓨鍌ㄧ殑list,鍚岀悊涔熷彲浠ョ洿鎺ラ亶鍘嗚緭鍑簃ap涓瓨鍌ㄧ殑map鍜屾暟缁?-->
											<ul>
												<li><label>鍚嶇О锛?/label><pg:cell colName="name" /></li>
												<li><label>鎬у埆锛?/label><pg:cell colName="sex" /></li>	
											</ul>
									</pg:list></li>
								</pg:map>
							</pg:equal>
							<pg:equal value="billLoanModel"><!-- 鍊熸鍒楄〃 -->
								<pg:map requestKey="billDataMap" keycell="true">
									<li class="pannelol"><span></span> 
									<pg:list><!-- 鐩存帴閬嶅巻杈撳嚭map涓瓨鍌ㄧ殑list,鍚岀悊涔熷彲浠ョ洿鎺ラ亶鍘嗚緭鍑簃ap涓瓨鍌ㄧ殑map鍜屾暟缁?-->
											<ul>
												<li><label>鍚嶇О锛?/label><pg:cell colName="name" /></li>
												<li><label>鎬у埆锛?/label><pg:cell colName="sex" /></li>	
											</ul>
										</pg:list></li>
								</pg:map>
							</pg:equal>
							<pg:equal value="loanPayModel"><!-- 鍐茶处鍒楄〃 -->
								<pg:map requestKey="billDataMap" keycell="true">
									<li class="pannelol"><span></span> 
									<pg:list><!-- 鐩存帴閬嶅巻杈撳嚭map涓瓨鍌ㄧ殑list,鍚岀悊涔熷彲浠ョ洿鎺ラ亶鍘嗚緭鍑簃ap涓瓨鍌ㄧ殑map鍜屾暟缁?-->
											<ul>
												<li><label>鍚嶇О锛?/label><pg:cell colName="name" /></li>
												<li><label>鎬у埆锛?/label><pg:cell colName="sex" /></li>	
											</ul>
										</pg:list></li>
								</pg:map>
							</pg:equal>
							<pg:equal value="budgetModel"><!-- 棰勭畻鍒楄〃 -->
								<pg:map requestKey="billDataMap" keycell="true">
									<li class="pannelol"><span></span> 
									<pg:list><!-- 鐩存帴閬嶅巻杈撳嚭map涓瓨鍌ㄧ殑list,鍚岀悊涔熷彲浠ョ洿鎺ラ亶鍘嗚緭鍑簃ap涓瓨鍌ㄧ殑map鍜屾暟缁?-->
											<ul>
												<li><label>鍚嶇О锛?/label><pg:cell colName="name" /></li>
												<li><label>鎬у埆锛?/label><pg:cell colName="sex" /></li>	
											</ul>
										</pg:list></li>
								</pg:map>
							</pg:equal>
							<pg:equal value="outgoModel"><!-- 鍒嗘憡鍒楄〃 -->
								<pg:map requestKey="billDataMap" keycell="true">
									<li class="pannelol"><span></span> 
									<pg:list><!-- 鐩存帴閬嶅巻杈撳嚭map涓瓨鍌ㄧ殑list,鍚岀悊涔熷彲浠ョ洿鎺ラ亶鍘嗚緭鍑簃ap涓瓨鍌ㄧ殑map鍜屾暟缁?-->
											<ul>
												<li><label>鍚嶇О锛?/label><pg:cell colName="name" /></li>
												<li><label>鎬у埆锛?/label><pg:cell colName="sex" /></li>	
											</ul>
										</pg:list></li>
								</pg:map>
							</pg:equal>
							<pg:equal value="billItemModel"><!-- 鏀舵鍒楄〃 -->
								<pg:map requestKey="billDataMap" keycell="true">
									<li class="pannelol"><span></span> 
									<pg:list><!-- 鐩存帴閬嶅巻杈撳嚭map涓瓨鍌ㄧ殑list,鍚岀悊涔熷彲浠ョ洿鎺ラ亶鍘嗚緭鍑簃ap涓瓨鍌ㄧ殑map鍜屾暟缁?-->
											<ul>
												<li><label>鍚嶇О锛?/label><pg:cell colName="name" /></li>
												<li><label>鎬у埆锛?/label><pg:cell colName="sex" /></li>	
											</ul>
										</pg:list></li>
								</pg:map>
							</pg:equal>
							<pg:equal value="billAttachment"><!-- 闄勪欢鍒楄〃 -->
								<pg:map requestKey="billDataMap" keycell="true">
									<li class="pannelol"><span></span> 
									<pg:list><!-- 鐩存帴閬嶅巻杈撳嚭map涓瓨鍌ㄧ殑list,鍚岀悊涔熷彲浠ョ洿鎺ラ亶鍘嗚緭鍑簃ap涓瓨鍌ㄧ殑map鍜屾暟缁?-->
											<ul>
												<li><label>鍚嶇О锛?/label><pg:cell colName="name" /></li>
												<li><label>鎬у埆锛?/label><pg:cell colName="sex" /></li>	
											</ul>
										</pg:list></li>
								</pg:map>
							</pg:equal>
							<pg:equal value="billSapModel"><!-- SAP鍒楄〃淇℃伅 婕旂ずkey灞炴€э紝閫氳繃key灞炴€х洿鎺ヨ幏鍙杕ap涓殑list鍊?->
								<pg:map requestKey="billDataMap" key="billSapModel">
									<li class="pannelol"><span></span> 
									<pg:list><!-- 鐩存帴閬嶅巻杈撳嚭map涓瓨鍌ㄧ殑list,鍚岀悊涔熷彲浠ョ洿鎺ラ亶鍘嗚緭鍑簃ap涓瓨鍌ㄧ殑map鍜屾暟缁?-->
											<ul>
												<li><label>鍚嶇О锛?/label><pg:cell colName="name" /></li>
												<li><label>鎬у埆锛?/label><pg:cell colName="sex" /></li>	
											</ul>
									</pg:list></li>
								</pg:map>
								
								
								
							</pg:equal>
						
					</pg:list>
					</ol>
				</div>
				<div class="pannle">
				3.鐩存帴閬嶅巻骞惰緭鍑簃ap涓璴ist涓繚鎸佺殑bean鐨勫睘鎬у€?
				<ol>
					<pg:map requestKey="billDataMap">
						<li class="pannelol"><span></span> 
						<pg:list><!-- 鐩存帴閬嶅巻杈撳嚭map涓瓨鍌ㄧ殑list,鍚岀悊涔熷彲浠ョ洿鎺ラ亶鍘嗚緭鍑簃ap涓瓨鍌ㄧ殑map鍜屾暟缁?-->
								<ul>
									<li><label>鍚嶇О锛?/label><pg:cell colName="name" /></li>
									<li><label>鎬у埆锛?/label><pg:cell colName="sex" /></li>	
								</ul>
						</pg:list></li>
					</pg:map>
				</ol>
				</div>
			</div>
		</form>
	</div>
</body>
</html>