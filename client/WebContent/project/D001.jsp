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
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<td class="title" rowspan="4">决口</td>
		<td class="title" height="25">决口宽度</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="BUW" value="0" size="8"/>米</td>
		<td class="title"  height="25">决口流速</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="BUVL" value="0" size="8"/>米/秒</td>
		<td class="title"  height="25">决口水头差</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="BUZDF" value="" size="8"/>米</td>
		<td class="title"  height="25">决口流量</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="BUQ" value="" size="8"/>立方米/秒</td>
	</tr>
	<tr>
		<td class="title"  height="25">受灾人口</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="DSSPN" value="" size="8"/>人</td>
		<td class="title"  height="25">受伤人口</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="INPN" value="" size="8"/>人</td>
		<td class="title"  height="25">死亡人口</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="DTHPN" value="" size="8"/>人</td>
		<td class="title"  height="25">倒塌房屋</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="WRHS" value="" size="8"/>间</td>
	</tr>
	<tr>
		<td class="title"  colspan="2" height="25">农作物受害面积</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="CRPDSSAR" value="" size="8"/>公顷</td>
		<td class="title"  height="25">毁坏耕地面积</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="SCDMFMAR" value="" size="8"/>公顷</td>
		<td class="title" colspan="2" height="25">直接经济损失</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="DRCECLS" value="" size="8"/>万元</td>
	</tr>
	<tr>
		<td class="title" colspan="2">决口处地质地形条件</td>
		<td  bgcolor="#FFFFFF" colspan="6"><textarea rows="4" cols="80" name="BURLDGL"></textarea></td>
	</tr>

</table>
</div>
</body>
</html>
