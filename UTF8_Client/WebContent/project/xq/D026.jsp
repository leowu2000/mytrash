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
<script Language="JavaScript" src="/common/js/check.js"></script>
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
		<td class="title"  height="25">�ֺ�����</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DSSTP" value="<%=bean.getDSSTP() %>" /></td>
		<td class="title"  height="25">�������</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DSSAREA" value="<%=bean.getDSSAREA() %>" size="8" onblur="javascript:checkNan(this,'�������')"/> ƽ����</td>
		<td class="title"  height="25">�����˿�</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DSSPN" value="<%=bean.getDSSPN() %>" size="8" onblur="javascript:checkNumber(this,'�����˿�')"/> ��</td>
	</tr>
	<tr>
		<td class="title"  height="25">��������</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DTHPN" value="<%=bean.getDTHPN() %>" size="8" onblur="javascript:checkNumber(this,'�����˿�')"/> ��</td>
		<td class="title"  height="25">��������</td>
		<td bgcolor="#FFFFFF"><input type="text" name="WRHS" value="<%=bean.getWRHS() %>" size="8" onblur="javascript:checkNan(this,'��������')"/> ��</td>
		<td class="title"  height="25">������ʧ</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DRCECLS" value="<%=bean.getDRCECLS() %>" size="8" onblur="javascript:checkNan(this,'ֱ�Ӿ�����ʧ')"/> ��Ԫ</td>
	</tr>
	<tr>
		<td class="title"  height="25">���������</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DAYDP" value="<%=bean.getDAYDP() %>" size="8" onblur="javascript:checkNan(this,'���������')"/> mm</td>
		<td class="title"  height="25">ʱ�ν�����</td>
		<td bgcolor="#FFFFFF" colspan="3"><input type="text" name="TDP" value="<%=bean.getTDP() %>" size="8" onblur="javascript:checkNan(this,'ʱ�ν�����')"/> mm</td>
	</tr>
</table>
</div>
</body>
</html>
