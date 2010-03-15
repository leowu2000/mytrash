/*!
 * Ext JS Library 3.1.0
 * Copyright(c) 2006-2009 Ext JS, LLC
 * licensing@extjs.com
 * http://www.extjs.com/license
 */

Ext.onReady(function() {
	Ext.QuickTips.init();
	// Create our instance of tabScrollerMenu
	var scrollerMenu = new Ext.ux.TabScrollerMenu({
		maxText  : 15,
		pageSize : 5
	});
	new Ext.Window({
		height : 200,
		width  : '100%',
		layout : 'fit',
		title  : 'Exercising scrollable tabs with a tabscroller menu',
		items  : {
			xtype           : 'tabpanel',
			activeTab       : 0,
			id              : 'myTPanel',
			enableTabScroll : true,
			resizeTabs      : true,
			minTabWidth     : 75,
			border          : false,
			plugins         : [ scrollerMenu ],
			items           : [
				{
					title : 'our first tab'
				}
			]
		}
	}).show();
	
	// Add a bunch of tabs dynamically
	var tabLimit = 22;
	(function (num) {
		for (var i = 1; i <= tabLimit; i++) {
			var title = 'Tab # ' + i;
			Ext.getCmp('myTPanel').add({
				title    : title,
				html     : 'Hi, i am tab ' + i,
				tabTip   : title,
				closable : true
			});
		}
	}).defer(1000);

});