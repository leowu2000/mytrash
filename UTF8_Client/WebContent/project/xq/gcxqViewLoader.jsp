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
<jsp:include page="/project/loadJs.jsp"></jsp:include>
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
		title  : '��ϸ��Ϣ',
		items  : {
			xtype           : 'tabpanel',
			activeTab       : 0,
			id              : 'myTPanel',
			enableTabScroll : true,
			resizeTabs      : false,
			minTabWidth     : 75,
			border          : false,
			//plugins         : [ scrollerMenu ],
			items           : [
				{
			            title: '��������',
			            iconCls: 'tabs',
			            html: '<%=bean.getDNCADDSC().replaceAll("\r\n","<br/>")%>',
			            closable:false
					}
			]
		}
	}).show();
	Ext.getCmp('myTPanel').add({
        title: '���շ���',
        iconCls: 'tabs',
        html: '<%=bean.getRDEPL().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '������Դ�䱸',
        iconCls: 'tabs',
        html: '<%=bean.getRDERESCN().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '��չ�����',
        iconCls: 'tabs',
        html: '<%=bean.getRDECNRL().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '����ԭ�����',
        iconCls: 'tabs',
        html: '<%=bean.getDNCCUAN().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '���鷢չ����',
        iconCls: 'tabs',
        html: '<%=bean.getDNCESTDV().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '����Ӱ�췶Χ',
        iconCls: 'tabs',
        html: '<%=bean.getDNCPBNFZ().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '����ʱ����',
        iconCls: 'tabs',
        html: '<%=bean.getWTHCN().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: 'δ��ˮ������',
        iconCls: 'tabs',
        html: '<%=bean.getFHYWTHCN().replaceAll("\r\n","<br/>")%>',
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