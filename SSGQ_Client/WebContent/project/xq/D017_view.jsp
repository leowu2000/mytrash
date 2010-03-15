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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D017");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" height="30" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="2">应力过大</td>-->
		<td class="title" height="25">最大拉应力:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getMXTNST() %> 牛/平方毫米</td>
		<td class="title" height="25">最大压应力:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getMXCMST() %> 牛/平方毫米</td>
	</tr>
	<tr>
		<td class="title" height="25">混凝土标号:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getCONGR() %> </td>
		<td class="title" height="25">允许应力值:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getASTR() %> 牛/平方毫米</td>
		
	</tr>
</table>
</div>
</body>
</html>
