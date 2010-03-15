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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D011");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<!-- <td rowspan="2" class="title">浪坎</td>-->
		<td nowrap class="title" height="25">河道流量:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="WDQ" value="<%=bean.getWDQ() %>" size="8" onblur="javascript:checkNan(this,'河道流量')"/>立方米/秒 </td>
		<td nowrap class="title" height="25">浪高:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="BLH" value="<%=bean.getBLH() %>" size="8" onblur="javascript:checkNan(this,'浪高')"/>米 </td>
		<td nowrap class="title">风力:</td>
		<td bgcolor="#FFFFFF">
		<input type="text" name="WNS" value="<%=bean.getWNS() %>" onblur="javascript:checkNan(this,'风力')"/>级 </td>
	</tr>
</table>
</div>
</body>
</html>
