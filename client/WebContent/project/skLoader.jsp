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
	RSRBean rsrbean = BuinessDao.findRsrById(path,RPJINCD);
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" />
<link rel="stylesheet" type="text/css" href="/common/ext/tabs-example.css" />
<link rel="stylesheet" type="text/css" href="/common/examples.css" />
<title></title>
<script Language="JavaScript" src="/common/ext/ext-base.js"></script>
<script Language="JavaScript" src="/common/ext/ext-all.js"></script>
<script Language="JavaScript" src="/common/ext/TabCloseMenu.js"></script>
<!--<script Language="JavaScript" src="/common/ext/tabs-sk.js"></script>-->
<script Language="JavaScript" src="/common/ext/examples.js"></script>
<script language="JavaScript">
Ext.onReady(function(){

    var tabs = new Ext.TabPanel({
        renderTo:'SKDIV',
        resizeTabs:true, // turn on tab resizing
        minTabWidth: 160,
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
            title: '坝基完好状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="BJWHZK" style="width:100%;heigth:100%"><%=rsrbean.getDFPFCN()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '坝体稳定状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="BTWDZK" style="width:100%"><%=rsrbean.getDBSTBCN()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '护坡护岸稳定情况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="HPHAWDQK" style="width:100%"><%=rsrbean.getBRBPPFCN()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '通讯手段及状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="TXSDJZK" style="width:100%"><%=rsrbean.getCOMMCN()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '泄水建筑物状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="XSJZWZK" style="width:100%"><%=rsrbean.getESPFCN()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '泄能工完好状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="XNGWHZK" style="width:100%"><%=rsrbean.getEDDPFCN()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '闸门、起闭机状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="ZMQBJZK" style="width:100%"><%=rsrbean.getGTHOPFCN()%></textarea>',
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
</style>
<body>
<div align="center"> 
<div id="SKDIV" style="vertical-align:middle;"></div>
</div>
</body>
</html>
