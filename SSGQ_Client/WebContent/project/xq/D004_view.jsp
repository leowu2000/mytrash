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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D004");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" height="30" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<!-- <td rowspan="2" class="title">管涌</td>-->
		<td nowrap class="title" height="25">距堤脚距离:</td>
		<td bgcolor="#FFFFFF"> <%=bean.getTODFTDI() %> 米  </td>
		<td nowrap class="title">出水流量:</td>
		<td bgcolor="#FFFFFF"> <%=bean.getPPQ() %> 升/秒 </td>
		<td nowrap class="title">水柱高:</td>
		<td bgcolor="#FFFFFF" colspan="4"> <%=bean.getWTLH() %> 米 </td>
		
	<tr height="25" >
		<td nowrap class="title">出水浑清:</td>
		<td bgcolor="#FFFFFF"> <%=bean.getLKGTU() %>  </td>
		<td nowrap class="title">管涌群面积:</td>
		<td bgcolor="#FFFFFF" colspan="6"> <%=bean.getPPSAR() %> 平方米 </td>
	</tr>
</table>
</div>
</body>
</html>
