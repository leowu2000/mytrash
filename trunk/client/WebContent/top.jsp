<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.whitefount {
	font-size: 12px;
	color: #FFFFFF;
	text-decoration: none;
	width: 36px;
	padding: 1px 5px 0px;
}
.bluefount {
	font-size: 12px;
	color: #1166B2;
}
a:hover {
	border: 1px solid #1065B6;
	width: 34px;
	padding: 1px 4px 0px;
	background-image: url(images/0729top_btn.jpg);
}

-->
</style></head>
<script language="javascript">
function helpSubmt(){
	window.open('/help/help.htm','', 'height=600, width=800, top=100, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no');
}
</script>
<body  scroll="no">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left" valign="top" background="/images/0729top_bg.jpg"><img src="images/0729top_01.jpg" width="664" height="82"></td>
    <td background="/images/0729top_bg.jpg">&nbsp;</td>
    <td width="314" align="right" valign="top" background="/images/0729top_02.jpg"><table width="314" height="82" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="171" height="59">&nbsp;</td>
        <td width="37" align="left"><a href="index.jsp" target="_top" class="whitefount" title="点击返回首页">首页</a></td>
        <td width="37" align="left"><a href="#" class="whitefount" onclick="javascript:helpSubmt()" title="点击查看帮助">帮助</a></td>
        <td width="72" align="left"><a href="logout.jsp" class="whitefount" title="点击退出系统">退出</a></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>