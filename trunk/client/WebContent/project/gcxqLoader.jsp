<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<%
	String path = request.getRealPath("/");
	String dncno = request.getParameter("DNCNO");
	STDNCBean bean = BuinessDao.findStdncById(path,dncno);
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" />
<link rel="stylesheet" type="text/css" href="/common/ext/tabs-example.css" />
<link rel="stylesheet" type="text/css" href="/common/examples.css" />
<title></title>
<script Language="JavaScript" src="/common/ext/ext-base.js"></script>
<script Language="JavaScript" src="/common/ext/ext-all.js"></script>
<script Language="JavaScript" src="/common/ext/TabCloseMenu.js"></script>
<!-- <script Language="JavaScript" src="/common/ext/tabs-adv.js"></script>-->
<script Language="JavaScript" src="/common/ext/examples.js"></script>
<script Language="JavaScript">
Ext.onReady(function(){
    var tabs = new Ext.TabPanel({
        renderTo:'tabs',
        resizeTabs:true, // turn on tab resizing
        minTabWidth: 125,
        tabWidth:135,
        enableTabScroll:true,
        //width:750,
        width:'100%',
        height:110,
        defaults: {autoScroll:true}
    });

    // tab generation code
    var index = 0;
    //while(index < 7){
       addTab();
    //}
    function addTab(){
        tabs.add({
            title: '补充描述',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="BCMS" style="width:100%"><%=bean.getDNCADDSC()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '抢险方案',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="QXFA" style="width:100%"><%=bean.getRDEPL()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '抢险资源配备',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="JXZYPB" style="width:100%"><%=bean.getRDERESCN()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '进展及结果',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="JZJJG" style="width:100%"><%=bean.getRDECNRL()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '险情原因分析',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="XQYYFX" style="width:100%"><%=bean.getDNCCUAN()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '险情发展趋势',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="XQFZQS" style="width:100%"><%=bean.getDNCESTDV()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '可能影响范围',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="KNYXFW" style="width:100%"><%=bean.getDNCPBNFZ()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '抢险时气象',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="QXSQX" style="width:100%"><%=bean.getWTHCN()%></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '未来水文气象',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="5" name="WLSWQS"  style="width:100%"><%=bean.getFHYWTHCN()%></textarea>',
            closable:false
        }).show();
    }

    //new Ext.Button({
    //    text: 'Add Tab',
    //    handler: addTab,
    //    iconCls:'new-tab'
    //}).render(document.body, 'tabs');
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
<div id="tabs" style="vertical-align:middle;"></div>
</div>
</body>
</html>
