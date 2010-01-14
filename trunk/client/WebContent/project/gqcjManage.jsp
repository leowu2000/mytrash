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
.lt1{

	font-family: "宋体";
	font-size: 9pt;
	font-weight: normal;
	color: #484833;
	text-decoration: none;
	text-align:center;
	background-color: #FFFFFF;
}
.lt2 {

	font-family: "宋体";
	font-size: 9pt;
	font-weight: normal;
	color: #484833;
	text-decoration: none;
	text-align:center;
	background-color: #F2F5EB;
}
.title {
	font-size: 10pt;
	padding-top: 2px;
	font-weight: bolder;
	color: #000000;
	background-color: #E8EFFF;
	text-align:center;
}
-->
</style>
<script language="JAVASCRIPT">
function toAdd(){
	document.forms[0].action="/project/gqcjAdd.jsp";
	document.forms[0].submit();
}
function toEdit(){
	document.forms[0].action="/project/gqcjEdit.jsp";
	document.forms[0].submit();
}
</script>
<body>
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">工程采集信息</span></td></tr>
</table>
<form name="frm" action="" method="post">
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#E8EFFF" height="30" >
		<td><input name=all class="input3" onclick=rcheckall() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title">工程名称</td>
		<td nowrap align="center" class="title">险情分类</td>
		<td nowrap align="center" class="title">出险部位</td>
		<td nowrap align="center" class="title">险情标题</td>
		<td nowrap align="center" class="title">填报单位</td>
		<td nowrap align="center" class="title">出险时间</td>
	</tr>
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type=checkbox class="input3" value=""></td>
		<td>工程名称</td>
		<td>险情分类</td>
		<td>出险部位</td>
		<td>险情标题</td>
		<td>填报单位</td>
		<td>出险时间</td>
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
