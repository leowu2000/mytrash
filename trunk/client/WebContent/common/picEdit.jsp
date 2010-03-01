<%@ page contentType="text/html;charset=GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk">
	<title>Advanced DataView Example</title>
	<link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" />
 	<script type="text/javascript" src="/common/ext/ext-base.js"></script>
    <script type="text/javascript" src="/common/ext/ext-all.js"></script>
	<link rel="stylesheet" type="text/css" href="/common/ext/chooser.css" />
	<script type="text/javascript" src="/common/ext/chooser-example.js"></script>
	<link rel="stylesheet" type="text/css" href="/common/ext/examples.css" />
</head>
<%
	String TBID = request.getParameter("tbid"); 
	String  DNCNO = request.getParameter("DNCNO"); 
	String PKNAME = request.getParameter("PKNAME");
%>
<style>
.input{
	color: #484833; 
	background-color: #F9FEF3; 
	border: #A59D9D;
	border-style: solid; 
	border-top-width: 1px; 
	border-right-width: 1px; 
	border-bottom-width: 1px; 
	border-left-width: 1px;
}
.title {
	font-size: 10pt;
	padding-top: 2px;
	font-weight: bolder;
	color: #15428B;
	background-color: #C6D4E4;
	text-align:left;
}
</style>
<body class="xtheme-gray">
	<!--<script type="text/javascript" src="../shared/examples.js"></script><!-- EXAMPLES -->
<script>
function updataPicMes(id,name,sj,ms){
	if(window.XMLHttpRequest){ //Mozilla
    	var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	xmlHttpReq.open("GET", "/BaseServlet?type=updatepic&zlbm="+id+"&name="+name+"&sj="+sj+"&ms="+ms+"&TBID=<%=TBID%>", false);
	xmlHttpReq.send(null);
	var result = xmlHttpReq.responseText;
	window.parent.ZPFRAME.location.reload();
}
Ext.onReady(function(){
  	
var ImageChooser = function(config){
		this.config = config;
	}

	ImageChooser.prototype = {
		// cache data by image name for easy lookup
		lookup : {},

		show : function(el, callback){
			if(!this.win){
				this.initTemplates();
				var reader = new Ext.data.ArrayReader(
				{id: 0},[
					{name: 'name', mapping: 1},
					{name: 'id', mapping: 2},
					{name: 'nrms', mapping: 3},
					{name: 'lastmod', mapping:4},
					{name: 'gs', mapping: 5},
					{name: 'url', mapping: 6}
					
				]);
				this.store=new Ext.data.Store({
					url:'createPic.jsp?tbid=<%=TBID%>&pkvalue=<%=DNCNO%>&pkname=<%=PKNAME%>',
					reader:reader});
				this.store.load();
				//this.store.loadData(arr);
				var formatSize = function(data){

				};

				var formatData = function(data){
					data.shortName = data.name.ellipse(15);

					data.nrmsString = data.nrms;
					data.dateString = data.lastmod;
					this.lookup[data.id] = data;
					return data;
				};

				this.view = new Ext.DataView({
					tpl: this.thumbTemplate,
					singleSelect: true,
					overClass:'x-view-over',
					itemSelector: 'div.thumb-wrap',
					emptyText : '<div style="padding:10px;">没有图片附件信息</div>',
					store: this.store,
					listeners: {
						'selectionchange': {fn:this.showDetails, scope:this, buffer:100},
						'loadexception'  : {fn:this.onLoadException, scope:this},
						'beforeselect'   : {fn:function(view){
							return view.store.getRange().length > 0;
						}}
					},
					prepareData: formatData.createDelegate(this)
				});

				var cfg = {
					title: '附件管理器',
					id: 'img-chooser-dlg',
					layout: 'border',
					draggable:false,
					resizable:false,
					modal: true,
					closeAction: 'hide',
					border: false,
					items:[{
						id: 'img-chooser-view',
						region: 'center',
						autoScroll: true,
						items: this.view
					},{
						id: 'img-detail-panel',
						region: 'east',
						split: true,
						width: '50%',
						autoScroll:true,
						minWidth: 150
					}],
					buttons: [{
						id: 'ok-btn',
						text: '修改',
						handler: this.doCallback,
						scope: this
					},{
						text: '删除',
						handler: function(){
							alert('取消修改');
						},
						scope: this
					}]
				};
				Ext.apply(cfg, this.config);
				this.win = new Ext.Window(cfg);
			}

			this.reset();
			this.win.show(el);
			this.callback = callback;
			this.animateTarget = el;
		},

		initTemplates : function(){
			this.thumbTemplate = new Ext.XTemplate(
				'<tpl for=".">',
					'<div class="thumb-wrap" id="{id}">',
					'<div class="thumb"><img src="{url}" title="{name}" ></div>',
					'<span>{shortName}</span></div>',
				'</tpl>'
			);
			this.thumbTemplate.compile();

			this.detailsTemplate = new Ext.XTemplate(
				'<div class="details">',
					'<tpl for=".">',
						//'<img src="{url}" width="120" height="100"><div class="details-info">',
						//'<div class="details-info">',
						'<table width=100% align=center cellspacing=1 bgcolor=#CCCCCC>',
						'<tr>',
							//'<td  bgcolor=#FFFFFF rowspan=3 width=30%><img src="{url}" width=150 height=100></td>',
							'<td width="40" height=25 class="title">标题:</td>',
							'<td bgcolor=#FFFFFF align=left><input name=pic_name type=text size=10 value="{shortName}"></td>',
							'<td nowrap class=title>采集时间:</td>',
							'<td bgcolor=#FFFFFF align=left><input type=text name=pic_cjsj size=10 value="{dateString}"></td>',
						'</tr>',
						'<tr>',
							'<td nowrap class=title>照片描述:</td>',
							'<td colspan=3 bgcolor=#FFFFFF><textarea cols=3 rows=3 name=pic_nrms style="width:98%">{nrmsString}</textarea></td>',
						'</tr>',

						'</table>',
						//'</div>',
					'</tpl>',
				'</div>'
			);
			this.detailsTemplate.compile();
		},

		showDetails : function(){
			var selNode = this.view.getSelectedNodes();
			var detailEl = Ext.getCmp('img-detail-panel').body;
			if(selNode && selNode.length > 0){
				selNode = selNode[0];
				//Ext.getCmp('ok-btn').enable();
				var data = this.lookup[selNode.id];
				detailEl.hide();
				this.detailsTemplate.overwrite(detailEl, data);
				detailEl.slideIn('l', {stopFx:true,duration:.2});
			}else{
				//Ext.getCmp('ok-btn').disable();
				detailEl.update('');
			}
		},

		filter : function(){
			var filter = Ext.getCmp('filter');
			this.view.store.filter('name', filter.getValue());
			this.view.select(0);
		},

		sortImages : function(){
			var v = Ext.getCmp('sortSelect').getValue();
			this.view.store.sort(v, v == 'name' ? 'asc' : 'desc');
			this.view.select(0);
		},

		reset : function(){
			if(this.win.rendered){
				Ext.getCmp('filter').reset();
				this.view.getEl().dom.scrollTop = 0;
			}
			this.view.store.clearFilter();
			this.view.select(0);
		},
		/**
		*修改数据
		*/
		doCallback : function(){
			var selNode = this.view.getSelectedNodes()[0];
			var picname = document.getElementById('pic_name').value;
			var piccjsj = document.getElementById('pic_cjsj').value;
			var picnrms = document.getElementById('pic_nrms').value;
			updataPicMes(selNode.id,picname,piccjsj,picnrms);
		},

		onLoadException : function(v,o){
			this.view.getEl().update('<div style="padding:10px;">Error loading images.</div>');
		}
	};

	String.prototype.ellipse = function(maxLength){
		if(this.length > maxLength){
			return this.substr(0, maxLength-3) + '...';
		}
		return this;
	};
	function insertImage(data){
    	Ext.DomHelper.append('images', {
    		tag: 'img', src: data.url, style:'margin:10px;visibility:hidden;'
    	}, true).show(true).frame();
    	btn.focus();
    };
	chooser = new ImageChooser({
		//url:'',
		width:'100%',
		height:160
	});
	chooser.show(insertImage);
});
</script>
	<div id="images" style="margin:20px;width:600px;"></div>
</body>
</html>