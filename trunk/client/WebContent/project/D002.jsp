<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
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
<%
	String path = request.getRealPath("/");
	String DNCNO = request.getParameter("DNCNO");
	DNCNO=DNCNO==null?"0":DNCNO;
	String PJNO = request.getParameter("PJNO");
	PJNO=PJNO==null?"0":PJNO;
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D002");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" height="30" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" >漫溢</td>-->
		<td class="title" height="25">漫溢长度</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="OVFLL" value="<%=bean.getOVFLL() %>" size="8"/>米</td>
		<td class="title"  height="25">漫溢水位</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="OVFLZ" value="<%=bean.getOVFLZ() %>" size="8"/>米/秒</td>
		<td class="title"  height="25">漫溢流量</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="DSQ" value="<%=bean.getDSQ() %>" size="8"/>立方米/秒</td>
	</tr>
</table>
</div>
</body>
</html>
