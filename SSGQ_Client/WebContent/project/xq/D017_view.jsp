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
		<!-- <td class="title" rowspan="2">Ӧ������</td>-->
		<td class="title" height="25">�����Ӧ��:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getMXTNST() %> ţ/ƽ������</td>
		<td class="title" height="25">���ѹӦ��:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getMXCMST() %> ţ/ƽ������</td>
	</tr>
	<tr>
		<td class="title" height="25">���������:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getCONGR() %> </td>
		<td class="title" height="25">����Ӧ��ֵ:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getASTR() %> ţ/ƽ������</td>
		
	</tr>
</table>
</div>
</body>
</html>
