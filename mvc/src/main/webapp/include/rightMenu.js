﻿/**
  * ????????????????
  * add by xinwang.jiao 2007-9-3
  */

//????????????????
function openWin(url,swidth,sheight)
{
	var w = showModalDialog(url,window,"dialogWidth:"+swidth+"px;dialogHeight:"+sheight+"px;help:no;scroll:auto;status:no");
	return w;
}
//????????
function sortOrg(orgId,orgName)
{
	openWin("sortOrg.jsp?orgId=" + orgId + "&orgName=" + orgName,500,500);
}

//da.wei,200711071134
//??????????
function changeOrgAdmin(orgId)
{
	openWin("orgAdmin.jsp?orgId=" + orgId,600,500);
}