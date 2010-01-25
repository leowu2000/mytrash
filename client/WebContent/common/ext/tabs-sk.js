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
            title: '�ӻ����״��',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="BJWHZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '�����ȶ�״��',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="BTWDZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: '���»����ȶ����',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="HPHAWDQK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: 'ͨѶ�ֶμ�״��',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="TXSDJZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: 'йˮ������״��',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="XSJZWZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: 'й�ܹ����״��',
            iconCls: 'tabs',
            html: '<textarea cols="100" rows="6" name="XNGWHZK"></textarea>',
            closable:false
        }).show();
        tabs.add({
            title: 'բ�š���ջ�״��',
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