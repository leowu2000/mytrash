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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D001");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<td class="title" height="25">���ڿ��</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getBUW() %> ��</td>
		<td class="title"  height="25">��������</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getBUVL() %> ��/��</td>
		<td class="title"  height="25">����ˮͷ��</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getBUZDF() %> ��</td>
		<td class="title"  height="25">��������</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getBUQ() %> ������/��</td>
	</tr>
	<tr>
		<td class="title"  height="25">�����˿�</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getDSSPN() %> ��</td>
		<td class="title"  height="25">�����˿�</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getINPN() %> ��</td>
		<td class="title"  height="25">�����˿�</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getDTHPN() %> ��</td>
		<td class="title"  height="25">��������</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getWRHS() %> ��</td>
	</tr>
	<tr>
		<td class="title" height="25">ũ�����ܺ����</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getCRPDSSAR() %> ����</td>
		<td class="title"  height="25">�ٻ��������</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getSCDMFMAR() %> ����</td>
		<td class="title" height="25">ֱ�Ӿ�����ʧ</td>
		<td  bgcolor="#FFFFFF" colspan="3"> <%=bean.getDRCECLS() %> >��Ԫ</td>
	</tr>
	<tr>
		<td class="title" >���ڴ����ʵ�������</td>
		<td  bgcolor="#FFFFFF" colspan="7">
		 
		<%=bean.getBURLDGL().trim() %>
		 </td>
	</tr>
</table>
</div>
</body>
</html>
