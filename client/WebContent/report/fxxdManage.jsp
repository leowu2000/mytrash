<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>ʵʱ������Ϣ�ɼ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
</head>
<style type="text/css">
<!--

-->
</style>
<script language="JAVASCRIPT">
function toAdd(){
	document.forms[0].action="/report/fxxdAdd.jsp";
	document.forms[0].submit();
}
function toEdit(){
	document.forms[0].action="/report/fxjbEdit.jsp";
	document.forms[0].submit();
}
</script>
<body>
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">��Ѵ�ж�����</span></td></tr>
</table>
<form name="frm" action="" method="post">
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#E8EFFF" height="30" >
		<td><input name=all class="input3" onclick=rcheckall() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title">������</td>
		<td nowrap align="center" class="title">�򱨱���</td>
		<td nowrap align="center" class="title">����</td>
		<td nowrap align="center" class="title">ǩ����</td>
	</tr>
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type=checkbox class="input3" value=""></td>
		<td>������</td>
		<td>�򱨱���</td>
		<td>����</td>
		<td>ǩ����</td>
	</tr>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td><input type="button" name="" value="��  ѯ">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:toAdd()">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:toEdit()">
	&nbsp;
	<input type="button" name="" value="ɾ  ��" onclick=""></td>
	</tr>
</table>
</body>
</html>
