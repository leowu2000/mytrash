<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.fredck.FCKeditor.FCKeditor"%>
<%@ include file="/common/session.jsp"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>

</head>
<style type="text/css">
<!--

-->
</style>

<script language="JAVASCRIPT">
function toBack(){
	location.href="/report/fxjbManage.jsp";
}
function submiting(){
	if(document.frm.ISSUE.value==""){
		alert("����д��������");
		return false;
	}
	if(document.frm.WTTT.value==""){
		alert("����д�򱨱��⣡");
		return false;
	}
	if(document.frm.UpFile.value==""){
		if(confirm("û����Ӹ������Ƿ�������棿")){
			document.frm.submit();
		}
	}
	document.frm.submit();
}
function checkNumber(obj,name){
	if(obj.vlaue==""){
		alert("����д������");
		return false;
	}
	if(obj.value!=""){
		if(isNaN(obj.value)){
			alert(name+"ֻ������������������д");
			obj.value="";
			return false;
		}else{
			if(obj.value.indexOf('.')>0){
				alert(name+"ֻ������������������д");
				obj.value="";
				return false;
			}
		}
	}
	//У���Ƿ������ͬ�����ļ�
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/BaseServlet?type=checkIssue&ISSUE="+obj.value, false);
	  xmlHttpReq.send(null);
	  var result = xmlHttpReq.responseText;
	  if(result=="0"){
			alert("�Ѿ���������Ϊ��"+obj.value+"���ķ�Ѵ�򱨣���������д��");
			obj.value="";
			return false;
		}
}
</script>
<body >
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">������Ѵ������</span></td></tr>
</table>
<form name="frm" action="/buiness.do" method="post">
<input type="hidden" name="actionType" value="add_fxjb"/>
<input type="hidden" name="WTDPCD" value="<%=configBean.getTBDW() %>"/>
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<!-- <tr height="25" >
		<td nowrap align="center" class="title" width="30%" >��λ</td>
		<td nowrap align="center" class="title"  colspan="4">��<input type="text" class="lines" name="ISSUE" value="" size="8"/> ��</td>
		<td nowrap align="center" class="title" width="30%" ><%=UtilDateTime.nowDateStringCN() %></td>
	</tr>-->
	<tr height="25" >
		<td nowrap class="title"><%=configBean.getTBDW() %></td>
		<td nowrap align="center" class="title_center">��<input type="text" class="lines" name="ISSUE" value="" size="8" onblur="javascript:checkNumber(this,'����')"/> ��</td>
		<td align="center" class="title">����</td>
		<td align="center" class="title">
		<input type="text" name="WTTT" value="" size="25"/></td>
		<td align="center" class="title">����</td>
		<td bgcolor="#FFFFFF">
		<input type="file" name="UpFile" size="20"> 
		</td>
	</tr>
	<tr height="25" >
	<td class="title" colspan="6">
	<%	           
	    FCKeditor oFCKeditor3 ;
	    oFCKeditor3 = new FCKeditor( request, "ACTICO") ;
	    oFCKeditor3.setBasePath( "/FCKeditor/" ) ;
		oFCKeditor3.setToolbarSet( "NowUse" ) ;
	    oFCKeditor3.setHeight("260");
	    //oFCKeditor.setValue( content==null?"":content );
	    out.println(oFCKeditor3.create());
     %>
	</td>
	</tr>
	<tr height="25" >
		<td nowrap align="center" class="title">ǩ��</td>
		<td bgcolor="#FFFFFF"><input type="text" name="QF" value="<%=configBean.getQF() %>" /></td>
		<td nowrap align="center" class="title">���</td>
		<td bgcolor="#FFFFFF"><input type="text" name="SH" value="<%=configBean.getSH() %>"/></td>
		<td nowrap align="center" class="title">���</td>
		<td bgcolor="#FFFFFF"><input type="text" name="NG" value="<%=configBean.getNG() %>" /></td>
	</tr>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="��  ��" onclick="javascript:submiting()">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
