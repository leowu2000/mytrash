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
<script Language="JavaScript" src="/common/js/check.js"></script>
</head>
<style>
.body {
margin:0px auto; padding:0px;
}
</style>
<%
	String path = request.getSession().getServletContext().getRealPath("/");
	String DNCNO = request.getParameter("DNCNO");
	DNCNO=DNCNO==null?"0":DNCNO;
	String PJNO = request.getParameter("PJNO");
	PJNO=PJNO==null?"0":PJNO;
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D005");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<!-- <td rowspan="2" class="title">陷坑</td>-->
		<td nowrap class="title" height="25">陷坑深度</td>
		<td bgcolor="#FFFFFF"><input type="text" name="SBDSP" value="<%=bean.getSBDSP() %>" size="8" onblur="javascript:checkNan(this,'陷坑深度')"/>米 </td>
		<td nowrap class="title">陷坑面积</td>
		<td bgcolor="#FFFFFF">
		<input type="text" name="SBAR" value="<%=bean.getSBAR() %>" onblur="javascript:checkNan(this,'陷坑面积')"/>平方米 </td>
	</tr>
</table>
</div>
</body>
</html>
