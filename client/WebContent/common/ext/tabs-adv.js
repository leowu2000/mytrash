/*
 * Ext JS Library 2.0 RC 1
 * Copyright(c) 2006-2007, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.onReady(function(){

    var tabs = new Ext.TabPanel({
        renderTo:'tabs',
        resizeTabs:true, // turn on tab resizing
        minTabWidth: 125,
        tabWidth:135,
        enableTabScroll:true,
        width:750,
        height:170,
        defaults: {autoScroll:true}
    
    //,
    //    plugins: new Ext.ux.TabCloseMenu()
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
            html: '<textarea cols="100" rows="9" name="BCMS"></textarea>',
            closable:true
        }).show();
        tabs.add({
            title: '抢险方案',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="9" name="JXFA"></textarea>',
            closable:true
        }).show();
        tabs.add({
            title: '抢险资源配备',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="9" name="JXZYPB"></textarea>',
            closable:true
        }).show();
        tabs.add({
            title: '进展及结果',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="9" name="JZJJG"></textarea>',
            closable:true
        }).show();
        tabs.add({
            title: '险情原因分析',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="9" name="XQYYFX"></textarea>',
            closable:true
        }).show();
        tabs.add({
            title: '险情发展趋势',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="9" name="XQFZQS"></textarea>',
            closable:true
        }).show();
        tabs.add({
            title: '可能影响范围',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="9" name="KNYXFW"></textarea>',
            closable:true
        }).show();
        tabs.add({
            title: '抢险时气象',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="9" name="QXSQX"></textarea>',
            closable:true
        }).show();
        tabs.add({
            title: '未来水文气象',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="9" name="WLSWQS"></textarea>',
            closable:true
        }).show();
    }

    //new Ext.Button({
    //    text: 'Add Tab',
    //    handler: addTab,
    //    iconCls:'new-tab'
    //}).render(document.body, 'tabs');
});