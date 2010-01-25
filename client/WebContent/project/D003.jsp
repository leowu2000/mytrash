<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
</head>
<style>
.body {
margin:0px auto; padding:0px;
}
</style>
<body>
<div align="center"> 
<table border="0" align="center" height="30" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td rowspan="2" class="title">漏洞</td>
		<td nowrap class="title">距堤顶高程:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="TODFTDI" value="0" size="8"/>米<font color="red">*</font></td>
		<td nowrap class="title">最大漏洞直径:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="LKDMT" value="0" size="8"/>米<font color="red">*</font></td>
		<td nowrap class="title">漏洞流量:</td>
		<td bgcolor="#FFFFFF" colspan="4"><input type="text" name="LKQ" value="0"/>升/秒<font color="red">*</font></td>
		
	<tr height="25" >
		<td nowrap class="title" colspan=2>当前水位距离堤顶高差:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="0" size="8"/>米<font color="red">*</font></td>
		<td nowrap class="title">漏洞浑清:</td>
		<td bgcolor="#FFFFFF">
			<select name="LKGTU">
				<option value="1">清</option>
				<option value="2">浑</option>
			</select>
		</td>
		<td nowrap class="title">漏洞群面积:</td>
		<td bgcolor="#FFFFFF" colspan=3><input type="text" size="8" name="LKSAR" value="0"/>平方米<font color="red">*</font></td>
	</tr>
</table>
</div>
</body>
</html>
