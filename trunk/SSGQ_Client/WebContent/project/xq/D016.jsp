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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D016");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" height="30" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="2">허림</td>-->
		<td class="title" height="25">허림렘蕨:</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="OVTUDR" value="<%=bean.getOVTUDR() %>" /></td>
		<td class="title" height="25">허림실똑:</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="OVTUAG" value="<%=bean.getOVTUAG() %>"  onblur="javascript:checkNan(this,'허림실똑')"/>똑</td>
		
	</tr>
</table>
</div>
</body>
</html>
