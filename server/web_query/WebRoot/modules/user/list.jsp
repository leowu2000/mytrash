<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.basesoft.core.*" %>
<%
	PageList pageList = (PageList)request.getAttribute("pageList");

	int pagenum = pageList.getPageInfo().getCurPage(); 
%>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>User</title>
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
var url='/user.do';
Ext.onReady(function(){
	var tb = new Ext.Toolbar({renderTo:'toolbar'});
	tb.add({text: '增加',cls: 'x-btn-text-icon add',handler: onAddClick});
	tb.add({text: '修改',cls: 'x-btn-text-icon xiugai',handler: onUpdateClick});
	tb.add({text: '删除',cls: 'x-btn-text-icon delete',handler: onDeleteClick});

    if(!win){
        win = new Ext.Window({
        	el:'dlg',width:200,autoHeight:true,buttonAlign:'center',closeAction:'hide',
	        buttons: [
	        {text:'提交',handler: function(){if(validate()){Ext.getDom('dataForm').action=action; Ext.getDom('dataForm').submit();}}},
	        {text:'关闭',handler: function(){win.hide();}}
	        ]
        });
    }

    function onAddClick(btn){
    	action = url+'?action=add&page=<%=pagenum %>';
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
			Ext.get('id').set({'value':data.item.name});
			Ext.get('name').set({'value':data.item.name});
			Ext.get('nt').set({'value':data.item.nt});
			Ext.get('auth').set({'value':data.item.auth});
			Ext.get('pass').set({'value':data.item.pass});
	    	action = url+'?action=update&page=<%=pagenum %>';
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
            	Ext.getDom('listForm').action=url+'?action=delete&page=<%=pagenum %>';  
            	Ext.getDom('listForm').submit();
    		}
    	});
    }
});

function validate(){
	if(window.XMLHttpRequest){ //Mozilla 
        var xmlHttpReq=new XMLHttpRequest();
    }else if(window.ActiveXObject){
 	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
    }
    var id = document.getElementById('name').value;
    xmlHttpReq.open("GET", "/user.do?action=validate&id=" + id, false);
    xmlHttpReq.send();
    if(xmlHttpReq.responseText=='false'){
    	alert('已存在相同记录，请更改用户名！');
    	return false;
    }else {
        return true;
    }
}

//-->
</script>
	</head>
	<body>
	<h1 class="blk">用户管理</h1>
	<div id="toolbar" class="blk"></div>
		<div id="tabs1" class="blk">
			<div id="address" class="tab-content">
<form id="listForm" name="listForm" action="" method="post">
<%=pageList.getPageInfo().getHtml("/user.do?action=list") %>
<div id="div1" style="width:100%;overflow-x:scroll">
<table cellspacing="0" id="the-table" width="100%" align="center">
        <thead>
            <tr style="background-color:#EEEEEE;">
                <th width="40">选择</th>
                <th>用户名称</th>
                <th>密码</th>
                <th>真实姓名</th>
                <th>角色</th>
            </tr>
        </thead>
        <tbody>
<%
List list = pageList.getList();
for(int i=0;i<list.size();i++){
	Map map = (Map)list.get(i);
	String auth = map.get("AUTH").toString();
	if("0".equals(auth)){
		auth = "管理员";
	}else {
		auth = "普通用户";
	}
%>        
            <tr>
                <td><input type="checkbox" name="check" id="check" value="<%=map.get("name")%>"></td>
                <td><%=map.get("name") %></td>
                <td>******</td>
                <td><%=map.get("nt") %></td>
                <td><%=auth %></td>   
            </tr> 
<%
}
 %>                     
		</tbody>
</table></div>
</form>
			</div>
		</div>


<div id="dlg" class="x-hidden">
    <div class="x-window-header">Dialog</div>
    <div class="x-window-body" id="dlg-body">
	        <form id="dataForm" name="dataForm" action="" method="post">
	        	<input type="hidden" id="id" name="id" value="">
	        	<table>
				  <tr>
				    <th>用户名</th>
				    <td><input type="text" id="name" name="name"></td>
				  </tr>
				  <tr>
				    <th>密码</th>
				    <td><input type="password" id="pass" name="pass"></td>
				  </tr>
				  <tr>
				    <th>真实姓名</th>
				    <td><input type="text" id="nt" name="nt"></td>
				  </tr>
				  <tr>
				    <th>角色</th>
				    <td>
				    <select id="auth" name="auth">
				    	<option value="1">普通用户</option>
				    	<option value="0">管理员</option>
				    </select>
				    </td>
				  </tr>
				</table>
	        </form>
    </div>
</div>


	</body>
</html>