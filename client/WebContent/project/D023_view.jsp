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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D023");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="3">洞身破坏</td>-->
		<td class="title" height="25">破坏面积</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getWRAR() %> 米</td>
		<td class="title" height="25">破坏方量</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getWRMS() %> 立方米</td>
	</tr>
	<tr>
		<td class="title"  height="25">对衬砌造成的影响</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getLNINF() %> </td>
		<td class="title">洞身地质情况</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getHBGLCN() %> </td>
	</tr>

</table>
</div>
</body>
</html>
