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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D020");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="3">基础破坏</td>-->
		<td class="title" height="25">基础不均匀沉降</td>
		<td  bgcolor="#FFFFFF" colspan="3"><input type="text" name="GRNUSB" value="<%=bean.getGRNUSB() %>" onblur="javascript:checkNan(this,'基础不均匀沉降')"/>米</td>
		
	</tr>
	<tr>
		<td class="title"  height="25">基础渗漏描述</td>
		<td  bgcolor="#FFFFFF" width="35%"><textarea rows="3" cols="80" name="GRNSPDSC" style="width:100%"><%=bean.getGRNSPDSC() %></textarea></td>
		<td class="title">基础超载破坏</td>
		<td  bgcolor="#FFFFFF" width="35%"><textarea rows="3" cols="80" name="GROVCHWR" style="width:100%"><%=bean.getGROVCHWR() %></textarea></td>
	</tr>

</table>
</div>
</body>
</html>
