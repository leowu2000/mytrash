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
<jsp:include page="/project/loadJs.jsp"></jsp:include>
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
		title  : '详细信息',
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
		            title: '险情预测',
		            iconCls: 'tabs',
		            html: '<textarea cols="50" rows="5" name="XQYC" style="width:99%"><%=pjrcbbean.getDNCFC().replaceAll("\r\n","")%></textarea>',
		            closable:false
		        }		        
			]
		}
	}).show();
	Ext.getCmp('myTPanel').add(
			{
	            title: '堤防建筑状况',
	            iconCls: 'tabs',
	            html: '<textarea cols="50" rows="5" name="DFJZZK" style="width:99%"><%=pjrcbbean.getRDERESCN().replaceAll("\r\n","")%></textarea>',
	            closable:false
	        }
	).show();
	Ext.getCmp('myTPanel').add(
			{
	            title: '其他',
	            iconCls: 'tabs',
	            html: '<textarea cols="50" rows="5" name="QT" style="width:99%"><%=pjrcbbean.getNT().replaceAll("\r\n","")%></textarea>',
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
