/*
 * Ext JS Library 2.0 RC 1
 * Copyright(c) 2006-2007, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.onReady(function(){

    var tabs = new Ext.TabPanel({
        renderTo:'gqxx',
        resizeTabs:true, // turn on tab resizing
        minTabWidth: 125,
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
            title: '险情预测',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="XQYC"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '堤防建筑状况',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="DFJZZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '其他',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="QT"></textarea>',
            closable:false
        }).show();
    }

    //new Ext.Button({
    //    text: 'Add Tab',
    //    handler: addTab,
    //    iconCls:'new-tab'
    //}).render(document.body, 'tabs');
});