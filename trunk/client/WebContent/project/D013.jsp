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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D013");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="2">����ʧ��</td>-->
		<td class="title" height="25">ͣ��</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="POWCUT" value="<%=bean.getPOWCUT() %>"/></td>
		<td class="title"  height="25">��ջ�ʧ��</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="HOMLF" value="<%=bean.getHOMLF() %>"/></td>
		
	</tr>
	<tr>
		<td class="title"  height="25">բ�ž�����</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="GSDST" value="<%=bean.getGSDST() %>" width="100%"/></td>
		<td class="title"  height="25">ʧ��ʱ����״��</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="MLFCN" value="<%=bean.getMLFCN() %>"/></td>
	</tr>

</table>
</div>
</body>
</html>
