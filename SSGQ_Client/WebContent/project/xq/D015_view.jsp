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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D015");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="4">����</td>-->
		<td class="title" height="25">���ӿ��:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getBRDMW() %> ��</td>
		<td class="title"  height="25">����ʱ����:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getBRV() %> ��������</td>
		<td class="title"  height="25">��������:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getBRDMQ() %> ��</td>
		<td class="title"  height="25">��ˮλ��Ӷ��߲�:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getBRZDMCDI() %> ��</td>
	</tr>
	<tr>
		<td class="title"  height="25">�����˿�:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getDSSPN() %> ��</td>
		<td class="title"  height="25">�����˿�:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getINPN() %> ��</td>
		<td class="title"  height="25">�����˿�:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getDTHPN() %> ��</td>
		<td class="title"  height="25">��������:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getWRHS() %> ��</td>
	</tr>
	<tr>
		<td class="title"  colspan="2" height="25">ũ�����ܺ����:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getCRPDSSAR() %> ����</td>
		<td class="title"  height="25">�ٻ��������:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getSCDMFMAR() %> ����</td>
		<td class="title" colspan="2" height="25">ֱ�Ӿ�����ʧ:</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getDRCECLS() %> ��Ԫ</td>
	</tr>
	<tr>
		<td class="title" colspan="2">���Ӵ���ַ��������:</td>
		<td  bgcolor="#FFFFFF" colspan="3"> <%=bean.getBRDMLDGL() %> </td>
		<td class="title">������״:</td>
		<td  bgcolor="#FFFFFF" colspan="2"> <%=bean.getPJPS() %> </td>
	</tr>

</table>
</div>
</body>
</html>
