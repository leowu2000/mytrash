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
	PJRCNBean pjrcbbean = BuinessDao.findPjrcnById(path,RPJINCD);
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>Advanced Tabs</title>
    <link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" />
 	<script type="text/javascript" src="/common/ext/ext-base.js"></script>
    <script type="text/javascript" src="/common/ext/ext-all-debug.js"></script>
    <link rel="stylesheet" type="text/css" href="/common/ext/tab-scroller-menu.css" />
    <script type="text/javascript" src="/common/ext/TabScrollerMenu.js"></script>
    <link rel="stylesheet" type="text/css" href="/common/ext/examples.css" />
<script language="javascript">
Ext.onReady(function() {
	Ext.QuickTips.init();
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
		title  : '��ϸ��Ϣ',
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
		            title: '����Ԥ��',
		            iconCls: 'tabs',
		            html: '<textarea cols="50" rows="5" name="XQYC" style="width:99%"><%=pjrcbbean.getDNCFC()%></textarea>',
		            closable:false
		        }		        
			]
		}
	}).show();
	Ext.getCmp('myTPanel').add(
			{
	            title: '�̷�����״��',
	            iconCls: 'tabs',
	            html: '<textarea cols="50" rows="5" name="DFJZZK" style="width:99%"><%=pjrcbbean.getRDERESCN()%></textarea>',
	            closable:false
	        }
	).show();
	Ext.getCmp('myTPanel').add(
			{
	            title: '����',
	            iconCls: 'tabs',
	            html: '<textarea cols="50" rows="5" name="QT" style="width:99%"><%=pjrcbbean.getNT()%></textarea>',
	            closable:false
	        }
	).show();
	// Add a bunch of tabs dynamically

});
</script>
</head>
<style>
.body {
margin:0px auto; padding:0px;
}
</style >
<body>
</body>
</html>