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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D021");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<!-- <td rowspan="2" class="title">消能工破坏</td>-->
		<td nowrap class="title" height="25">底板掀起:</td>
		<td bgcolor="#FFFFFF" width="35%"><textarea rows="3" cols="80" name="APWR" style="width:100%"><%=bean.getAPWR() %></textarea></td>
		<td nowrap class="title">止水破坏:</td>
		<td bgcolor="#FFFFFF" width="35%">
		<textarea rows="3" cols="80" name="WSTWR" style="width:100%"><%=bean.getWSTWR() %></textarea></td>
	</tr>
</table>
</div>
</body>
</html>
