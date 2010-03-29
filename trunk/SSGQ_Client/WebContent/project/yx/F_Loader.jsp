<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<%
	String path = request.getSession().getServletContext().getRealPath("/");
	String RPJINCD = request.getParameter("RPJINCD");
	String GCFLDM = request.getParameter("GCFLDM");
	String tabname = BuinessDao.getTabNameFromGcfldm(GCFLDM);
	RPJINCD=RPJINCD==null?"0":RPJINCD;tabname=tabname==""?"TB_RSR":tabname;
	PjrDetailBean bean = BuinessDao.getPjrDetailBean(path,RPJINCD,tabname,GCFLDM);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Advanced Tabs</title>
<jsp:include page="/project/loadJs.jsp"></jsp:include>
<script language="JavaScript">
Ext.onReady(function() {
	Ext.QuickTips.init();
	// Create our instance of tabScrollerMenu
	var scrollerMenu2 = new Ext.ux.TabScrollerMenu({
		maxText  : 15,
		pageSize : 5
	});
	new Ext.Window({
		height : 140,
		draggable:false,
		resizable:false, 
		
		width  : '100%',
		layout : 'fit',
		title  : '蓄滞(行)洪区运行信息',
		items  : {
			xtype           : 'tabpanel',
			activeTab       : 0,
			id              : 'myTPanel2',
			enableTabScroll : true,
			resizeTabs      : false,
			minTabWidth     : 75,
			border          : false,
			//plugins         : [ scrollerMenu2 ],
			items           : [
				 {
		            title: '避水救生设施状况',
		            iconCls: 'tabs',
		            html: '<textarea cols="50" rows="5" name="SFSRCN" style="width:99%"><%=bean.getSFSRCN()%></textarea>',
		            closable:false
		        }
			]
		}
	}).show();
	Ext.getCmp('myTPanel2').add({
        title: '分洪设施描述',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="FLFADSC" style="width:99%"><%=bean.getFLFADSC()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel2').add({
        title: '退水设施状况',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="IDSTCN" style="width:99%"><%=bean.getIDSTCN()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel2').add({
        title: '人员转移情况',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="TRFCN" style="width:99%"><%=bean.getTRFCN()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel2').add({
        title: '圩堤状况',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="DKCN" style="width:99%"><%=bean.getDKCN()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel2').add({
        title: '通讯预警设施状况',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="CWFCCN" style="width:99%"><%=bean.getCWFCCN()%></textarea>',
        closable:false
    }).show();
	// Add a bunch of tabs dynamically

});
</script>
</head>
<style>
.body {
margin:0px auto; padding:0px;
}
</style>
<body>
<div align="center">
<div id="SKDIV" style="vertical-align:middle;"></div>
</div>
</body>
</html>
