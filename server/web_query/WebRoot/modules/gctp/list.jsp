<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.basesoft.core.*" %>
<%
String gclj = request.getAttribute("gclj").toString();
List listGctp = (List)request.getAttribute("listGctp");
%>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>工程图片管理</title>
		<style type="text/css">
		<!--
		input {
			width:80px;
		}
		th {
			white-space: nowrap;
		}
		.blk {
			margin-left: 20px;
		}
		-->
		</style>		
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

        <meta http-equiv="Cache-Control" content="no-store"/>
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>

<script src="/script/ext-2.2/ext-base.js" type="text/javascript"></script>
<script src="/script/ext-2.2/ext-all.js" type="text/javascript"></script>
<script src="/script/ext-2.2/ext-lang-zh_CN.js" type="text/javascript"></script>
<link href="/script/ext-2.2/resources/css/ext-all.css" type="text/css" rel="stylesheet">
<link href="/css/bs_base.css" type="text/css" rel="stylesheet">
<link href="/css/bs_custom.css" type="text/css" rel="stylesheet">
<link href="/css/bs_button.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
<!--
var win;
var action;
var url='/gctp.do';
Ext.onReady(function(){
	var tb = new Ext.Toolbar({renderTo:'toolbar'});
	tb.add({text: '增加',cls: 'x-btn-text-icon add',handler: onAddClick});
	tb.add({text: '修改',cls: 'x-btn-text-icon xiugai',handler: onUpdateClick});
	tb.add({text: '删除',cls: 'x-btn-text-icon delete',handler: onDeleteClick});

    if(!win){
        win = new Ext.Window({
        	el:'dlg',width:300,autoHeight:true,buttonAlign:'center',closeAction:'hide',
	        buttons: [
	        {text:'提交',handler: function(){Ext.getDom('dataForm').action=action; Ext.getDom('dataForm').submit();}},
	        {text:'关闭',handler: function(){win.hide();}}
	        ]
        });
    }

    function onAddClick(btn){
    	action = url+'?action=add';
    	document.getElementById('sel_image').style.display = '';
    	win.setTitle('增加');
       	Ext.getDom('dataForm').reset();
        win.show(btn.dom);
    }
    function onUpdateClick(btn){
		var selValue = Ext.DomQuery.selectValue('input[name=check]:checked/@value');
		if(selValue==undefined) {
			alert('请选择数据项！');
			return false;
		}
		Ext.Ajax.request({
			url: url+'?action=query&id='+selValue,
			success: function(transport) {
			var data = eval('('+transport.responseText+')');
			Ext.get('id').set({'value':data.item.id});
			Ext.get('name').set({'value':data.item.name});
			Ext.get('note').set({'value':data.item.note});
			document.getElementById('sel_image').style.display = 'none';
	    	action = url+'?action=update';
    		win.setTitle('修改');
	        win.show(btn.dom);
		  }
		});
    }
    function onDeleteClick(btn){
		var selValue = Ext.DomQuery.selectValue('input[name=check]:checked/@value');
		if(selValue==undefined) {
			alert('请选择数据项！');
			return false;
		}		
		
    	Ext.Msg.confirm('确认','确实要删除记录么？',function(btn){
    		if(btn=='yes'){    		    
            	Ext.getDom('listForm').action=url+'?action=delete&gclj=<%=gclj %>';  
            	Ext.getDom('listForm').submit();
    		}
    	});
    }
});

//-->
</script>
	</head>
	<body>
	<div id="toolbar"></div>
<form id="listForm" name="listForm" action="" method="post">
<table cellspacing="0" id="the-table" width="98%" align="center">
            <tr style="background-color:#EEEEEE;">
                <th width="40">选择</th>
                <th>图片名称</th>
                <th>图片描述</th>
                <th>图片</th>
            </tr>
<%
for(int i=0;i<listGctp.size();i++){
	Map map = (Map)listGctp.get(i);
%>        
            <tr>
                <td><input type="checkbox" name="check" id="check" value="<%=map.get("ID")%>"></td>
                <td><%=map.get("NAME") %></td>
                <td width="200"><%=map.get("NOTE") %></td>
                <td><img src="media.do?action=gctp&id=<%=map.get("ID")%>" style="width:100;"> </td>
            </tr> 
<%
}
 %>                     
</table>
</form>

<div id="dlg" class="x-hidden">
    <div class="x-window-header">Dialog</div>
    <div class="x-window-body" id="dlg-body">
	        <form id="dataForm" name="dataForm" action="" method="post" enctype="multipart/form-data">
	        	<input type="hidden" id="id" name="id">
	        	<input type="hidden" id="gclj" name="gclj" value="<%=gclj %>">
	        	<table>
				  <tr>
				    <th>图片名称</th>
				    <td><input type="text" id="name" name="name" style="width: 200"></td>
				  </tr>
				  <tr>
				    <th>图片描述</th>
				    <td><textarea name="note" id="note" rows="4" style="width:200"></textarea></td>
				  </tr>
				  <tr name="sel_image" id="sel_image">
				    <th>选择图片</th>
				    <td><input type="file" id="file" name="file" style="width: 200"></td>
				  </tr>
				</table>
	        </form>
    </div>
</div>


	</body>
</html>