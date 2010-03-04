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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D018");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" height="30" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="2">坍塌</td>-->
		<td class="title" height="25">坍塌面积</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="SLIAR" value="<%=bean.getSLIAR() %>" />平方米<font color="red">*</font></td>
		<td class="title" height="25">坍塌方量</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="SLIMS" value="<%=bean.getSLIMS() %>" />立方米<font color="red">*</font></td>
		
	</tr>
</table>
</div>
</body>
</html>
