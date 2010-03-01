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
	String dncno = request.getParameter("DNCNO");
	STDNCBean bean = BuinessDao.findStdncById(path,dncno);
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>Advanced Tabs</title>
    <link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" />
    <!-- GC -->
 	<!-- LIBS -->
 	<script type="text/javascript" src="/common/ext/ext-base.js"></script>
 	<!-- ENDLIBS -->
    <script type="text/javascript" src="/common/ext/ext-all-debug.js"></script>
    <link rel="stylesheet" type="text/css" href="/common/ext/tab-scroller-menu.css" />
    <script type="text/javascript" src="/common/ext/TabScrollerMenu.js"></script>
    <!-- Common Styles for the examples -->
    <link rel="stylesheet" type="text/css" href="/common/ext/examples.css" />
<script>
Ext.onReady(function() {
	Ext.QuickTips.init();
	// Create our instance of tabScrollerMenu
	var scrollerMenu = new Ext.ux.TabScrollerMenu({
		maxText  : 15,
		pageSize : 5
	});
	new Ext.Window({
		height : 140,
		draggable:false,
		resizable:false, 
		
		width  : '100%',
		layout : 'fit',
		title  : '详细信息',
		items  : {
			xtype           : 'tabpanel',
			activeTab       : 0,
			id              : 'myTPanel',
			enableTabScroll : true,
			resizeTabs      : false,
			minTabWidth     : 75,
			border          : false,
			plugins         : [ scrollerMenu ],
			items           : [
				{
			            title: '补充描述',
			            iconCls: 'tabs',
			            html: '<%=bean.getDNCADDSC()%>',
			            closable:false
					}
			]
		}
	}).show();
	Ext.getCmp('myTPanel').add({
        title: '抢险方案',
        iconCls: 'tabs',
        html: '<%=bean.getRDEPL()%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '抢险资源配备',
        iconCls: 'tabs',
        html: '<%=bean.getRDERESCN()%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '进展及结果',
        iconCls: 'tabs',
        html: '<%=bean.getRDECNRL()%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '险情原因分析',
        iconCls: 'tabs',
        html: '<%=bean.getDNCCUAN()%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '险情发展趋势',
        iconCls: 'tabs',
        html: '<%=bean.getDNCESTDV()%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '可能影响范围',
        iconCls: 'tabs',
        html: '<%=bean.getDNCPBNFZ()%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '抢险时气象',
        iconCls: 'tabs',
        html: '<%=bean.getWTHCN()%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '未来水文气象',
        iconCls: 'tabs',
        html: '<%=bean.getFHYWTHCN()%>',
        closable:false
    }).show();
	// Add a bunch of tabs dynamically

});
</script>
</head>

<style>
.body {
margin:1px auto; padding:1px;
}
</style >
<body>
</body>
</html>
