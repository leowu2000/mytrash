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
		<!-- <td class="title" rowspan="3">�����ƻ�</td>-->
		<td class="title" height="25">�ƻ����</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="WRAR" value="<%=bean.getWRAR() %>"/>��</td>
		<td class="title" height="25">�ƻ�����</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="WRMS" value="<%=bean.getWRMS() %>"/>������</td>
	</tr>
	<tr>
		<td class="title"  height="25">�Գ�����ɵ�Ӱ��</td>
		<td  bgcolor="#FFFFFF"><textarea rows="3" cols="20" name="LNINF" style="width:100%"><%=bean.getLNINF() %></textarea></td>
		<td class="title">����������</td>
		<td  bgcolor="#FFFFFF"><textarea rows="3" cols="20" name="HBGLCN" style="width:100%"><%=bean.getHBGLCN() %></textarea></td>
	</tr>

</table>
</div>
</body>
</html>
