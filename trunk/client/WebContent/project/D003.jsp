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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D003");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" height="30" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<!-- <td rowspan="2" class="title">漏洞</td>-->
		<td nowrap class="title">距堤顶高程:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="TODFTDI" value="<%=bean.getTODFTDI() %>" size="8"/>米</td>
		<td nowrap class="title">最大漏洞直径:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="LKDMT" value="<%=bean.getLKDMT() %>" size="8"/>米</td>
		<td nowrap class="title">漏洞流量:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="LKQ" value="<%=bean.getLKQ() %>"/>升/秒</td>
		
	<tr height="25" >
		<td nowrap class="title">漏洞浑清:</td>
		<td bgcolor="#FFFFFF">
			<select name="LKGTU">
				<option value="1"<%if(bean.getLKGTU().trim().equals("1")) {%>selected<%} %>>清</option>
				<option value="2"<%if(bean.getLKGTU().trim().equals("2")) {%>selected<%} %>>浑</option>
			</select>
		</td>
		<td nowrap class="title">漏洞群面积:</td>
		<td bgcolor="#FFFFFF"><input type="text" size="8" name="LKSAR" value="<%=bean.getLKSAR() %>"/>平方米</td>
		<td nowrap class="title">漏洞水柱高:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="LKWTLH" value="<%=bean.getLKWTLH() %>" size="10" />米</td>
	</tr>
</table>
</div>
</body>
</html>
