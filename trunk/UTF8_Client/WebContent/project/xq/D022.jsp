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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D022");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<!-- <td rowspan="2" class="title">������ˮʧЧ</td>-->
		<td class="title" height="25">��ˮ�׶���</td>
		<td bgcolor="#FFFFFF" width="35%"><textarea rows="3" cols="40" name="WPPLU"  style="width:100%"><%=bean.getWPPLU() %></textarea></td>
		<td class="title">��ˮ�豸ʧ��</td>
		<td bgcolor="#FFFFFF" width="35%">
		<textarea rows="3" cols="40" name="WPEQML" style="width:100%"><%=bean.getWPEQML() %></textarea></td>
	</tr>
</table>
</div>
</body>
</html>
