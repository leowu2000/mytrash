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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D024");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="3">�ص����ֲ̾��ƻ�</td>-->
		<td class="title" height="25">�ƻ����</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="WRAR" value="<%=bean.getWRAR() %>"/>��</td>
		<td class="title" height="25">�ƻ����</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="WRD" value="<%=bean.getWRD() %>"/>��</td>
		<td class="title" height="25">�ƻ�����</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="WRL" value="<%=bean.getWRL() %>"/>��</td>
	</tr>
	<tr>
		<td nowrap class="title">�ƻ��������</td>
		<td  bgcolor="#FFFFFF" colspan="5"><textarea rows="3" cols="80" name="WRGLCN" style="width:100%"><%=bean.getWRGLCN() %></textarea></td>
	</tr>

</table>
</div>
</body>
</html>
