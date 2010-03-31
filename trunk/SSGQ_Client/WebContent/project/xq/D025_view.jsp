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
	String path = request.getSession().getServletContext().getRealPath("/");
	String DNCNO = request.getParameter("DNCNO");
	DNCNO=DNCNO==null?"0":DNCNO;
	String PJNO = request.getParameter("PJNO");
	PJNO=PJNO==null?"0":PJNO;
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D025");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="3">控导工程冲毁</td>-->
		<td class="title" height="25">冲毁体积</td>
		<td  bgcolor="#FFFFFF" > <%=bean.getSCDMBU() %> 立方米</td>
		<td class="title" height="25">冲毁长度</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getSCDML() %> 米</td>
		<td class="title" height="25">冲毁深度</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getSCDMD() %> 米</td>
	</tr>
	<tr>
		<td nowrap class="title">冲毁处地质情况</td>
		<td  bgcolor="#FFFFFF" colspan="5"> <%=bean.getSCDMGLCN() %> </td>
	</tr>

</table>
</div>
</body>
</html>
