<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>实时工情信息采集传输管理</title>
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
	<tr><td align="center" ><span  class="style4">防汛行动管理</span></td></tr>
</table>
<form name="frm" action="" method="post">
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#E8EFFF" height="30" >
		<td><input name=all class="input3" onclick=rcheckall() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title">简报期数</td>
		<td nowrap align="center" class="title">简报标题</td>
		<td nowrap align="center" class="title">日期</td>
		<td nowrap align="center" class="title">签发人</td>
	</tr>
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type=checkbox class="input3" value=""></td>
		<td>简报期数</td>
		<td>简报标题</td>
		<td>日期</td>
		<td>签发人</td>
	</tr>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td><input type="button" name="" value="查  询">
	&nbsp;
	<input type="button" name="" value="新  增" onclick="javascript:toAdd()">
	&nbsp;
	<input type="button" name="" value="修  改" onclick="javascript:toEdit()">
	&nbsp;
	<input type="button" name="" value="删  除" onclick=""></td>
	</tr>
</table>
</body>
</html>
