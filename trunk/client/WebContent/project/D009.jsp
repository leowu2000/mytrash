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
		<td class="title" rowspan="4">崩岸</td>
		<td class="title" height="25">距堤脚距离</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="TODFTDI" value="0" size="8"/>米</td>
		<td class="title"  height="25">河岸高度</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="RVH" value="0" size="8"/>米</td>
		<td class="title"  height="25">崩塌长度</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="CVL" value="" size="8"/>米</td>
	</tr>
	<tr>
		<td class="title"  height="25">河道流量</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="WDQ" value="" size="8"/>立方米/秒</td>
		<td class="title"  height="25">崩塌体积</td>
		<td  bgcolor="#FFFFFF" colspan="5"><input type="text" name="CVBU" value="" size="8"/>立方米</td>

	</tr>
	<tr>
		<td class="title" colspan="2">水流情况</td>
		<td  bgcolor="#FFFFFF" colspan="6"><textarea rows="4" cols="80" name="FLCNDSC"></textarea></td>
	</tr>

</table>
</div>
</body>
</html>
