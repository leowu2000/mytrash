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
	RPJINCD=RPJINCD==null?"0":RPJINCD;
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
		title  : '����(��)����������Ϣ',
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
		            title: '��ˮ������ʩ״��',
		            iconCls: 'tabs',
		            html: '<%=bean.getSFSRCN().replaceAll("\r\n","<br/>")%>',
		            closable:false
		        }
			]
		}
	}).show();
	Ext.getCmp('myTPanel2').add({
        title: '�ֺ���ʩ����',
        iconCls: 'tabs',
        html: '<%=bean.getFLFADSC().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel2').add({
        title: '��ˮ��ʩ״��',
        iconCls: 'tabs',
        html: '<%=bean.getIDSTCN().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel2').add({
        title: '��Աת�����',
        iconCls: 'tabs',
        html: '<%=bean.getTRFCN().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel2').add({
        title: '�׵�״��',
        iconCls: 'tabs',
        html: '<%=bean.getDKCN().replaceAll("\r\n","<br/>")%>',
        closable:false
    }).show();
	Ext.getCmp('myTPanel2').add({
        title: 'ͨѶԤ����ʩ״��',
        iconCls: 'tabs',
        html: '<%=bean.getCWFCCN().replaceAll("\r\n","<br/>")%>',
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