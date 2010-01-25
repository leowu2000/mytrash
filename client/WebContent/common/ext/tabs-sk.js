/*
 * Ext JS Library 2.0 RC 1
 * Copyright(c) 2006-2007, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.onReady(function(){

    var tabs = new Ext.TabPanel({
        renderTo:'SKDIV',
        resizeTabs:true, // turn on tab resizing
        minTabWidth: 160,
        tabWidth:135,
        enableTabScroll:true,
        width:750,
        height:130,
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
            title: '坝基完好状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="BJWHZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '坝体稳定状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="BTWDZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '护坡护岸稳定情况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="HPHAWDQK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '通讯手段及状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="TXSDJZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '泄水建筑物状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="XSJZWZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '泄能工完好状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="XNGWHZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '闸门、起闭机状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="ZMQBJZK"></textarea>',
            closable:false
        }).show();
    }

    //new Ext.Button({
    //    text: 'Add Tab',
    //    handler: addTab,
    //    iconCls:'new-tab'
    //}).render(document.body, 'tabs');
});