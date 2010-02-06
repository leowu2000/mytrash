<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<%
	String path = request.getRealPath("/");
	String RPJINCD = request.getParameter("RPJINCD");
	PJRCNBean pjrcbbean = BuinessDao.findPjrcnById(path,RPJINCD);
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" />
<link rel="stylesheet" type="text/css" href="/common/ext/tabs-example.css" />
<link rel="stylesheet" type="text/css" href="/common/examples.css" />
<title></title>
<script Language="JavaScript" src="/common/ext/ext-base.js"></script>
<script Language="JavaScript" src="/common/ext/ext-all.js"></script>
<script Language="JavaScript" src="/common/ext/TabCloseMenu.js"></script>
<!--<script Language="JavaScript" src="/common/ext/tabs-gqxx.js"></script>-->
<script Language="JavaScript" src="/common/ext/examples.js"></script>
<script language="javascript">
Ext.onReady(function(){

    var tabs = new Ext.TabPanel({
        renderTo:'gqxx',
        resizeTabs:true, // turn on tab resizing
        minTabWidth: 125,
        tabWidth:135,
        enableTabScroll:true,
        width:'100%',
        height:110,
        defaults: {autoScroll:true}
    });
    var index = 0;
       addTab();
    function addTab(){
        tabs.add({
            title: '险情预测',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="XQYC" style="width:100%"><%=pjrcbbean.getDNCFC()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '堤防建筑状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="DFJZZK" style="width:100%"><%=pjrcbbean.getRDERESCN()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '其他',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="QT" style="width:100%"><%=pjrcbbean.getNT()%></textarea>',
            closable:false
        }).show();
    }
});
</script>
</head>
<style>
.body {
margin:0px auto; padding:0px;
}
</style >
<body>
<div align="center"> 
<div id="gqxx" style="vertical-align:middle;"></div>
</div>
</body>
</html>
