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
			plugins         : [ scrollerMenu ],
			items           : [
				{
			            title: '��������',
			            iconCls: 'tabs',
			            html: '<textarea cols="50" rows="5" name="BCMS" style="width:99%"><%=bean.getDNCADDSC()%></textarea>',
			            closable:false
					}
			]
		}
	}).show();
	Ext.getCmp('myTPanel').add({
        title: '���շ���',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="QXFA" style="width:99%"><%=bean.getRDEPL()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '������Դ�䱸',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="JXZYPB" style="width:99%"><%=bean.getRDERESCN()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '��չ�����',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="JZJJG" style="width:99%"><%=bean.getRDECNRL()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '����ԭ�����',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="XQYYFX" style="width:99%"><%=bean.getDNCCUAN()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '���鷢չ����',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="XQFZQS" style="width:99%"><%=bean.getDNCESTDV()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '����Ӱ�췶Χ',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="KNYXFW" style="width:99%"><%=bean.getDNCPBNFZ()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: '����ʱ����',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="QXSQX" style="width:99%"><%=bean.getWTHCN()%></textarea>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel').add({
        title: 'δ��ˮ������',
        iconCls: 'tabs',
        html: '<textarea cols="50" rows="5" name="WLSWQS"  style="width:99%"><%=bean.getFHYWTHCN()%></textarea>',
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
