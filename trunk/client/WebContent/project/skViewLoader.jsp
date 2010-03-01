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
	RSRBean rsrbean = BuinessDao.findRsrById(path,RPJINCD);
	
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
		title  : 'ˮ����Ϣ',
		items  : {
			xtype           : 'tabpanel',
			activeTab       : 0,
			id              : 'myTPanel2',
			enableTabScroll : true,
			resizeTabs      : false,
			minTabWidth     : 75,
			border          : false,
			plugins         : [ scrollerMenu2 ],
			items           : [
				 {
		            title: '�ӻ����״��',
		            iconCls: 'tabs',
		            html: '<%=rsrbean.getDFPFCN()%>',
		            closable:false
		        },{
		            title: '�����ȶ�״��',
		            iconCls: 'tabs',
		            html: '<%=rsrbean.getDBSTBCN()%>',
		            closable:false
		        },{
		            title: '���»����ȶ����',
		            iconCls: 'tabs',
		            html: '<%=rsrbean.getBRBPPFCN()%>',
		            closable:false
		        },{
		            title: 'ͨѶ�ֶμ�״��',
		            iconCls: 'tabs',
		            html: '<%=rsrbean.getCOMMCN()%>',
		            closable:false
		        },{
		            title: 'йˮ������״��',
		            iconCls: 'tabs',
		            html: '<%=rsrbean.getESPFCN()%>',
		            closable:false
		        },{
		            title: 'й�ܹ����״��',
		            iconCls: 'tabs',
		            html: '<%=rsrbean.getEDDPFCN()%>',
		            closable:false
		        },{
		            title: 'բ�š���ջ�״��',
		            iconCls: 'tabs',
		            html: '<%=rsrbean.getGTHOPFCN()%>',
		            closable:false
		        }
			]
		}
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
