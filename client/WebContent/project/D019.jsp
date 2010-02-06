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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D019");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" height="30" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="2">堵塞</td>-->
		<td class="title" height="25">堵塞物名称</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="PLTNM" value="<%=bean.getPLTNM() %>" /><font color="red">*</font></td>
		<td class="title" height="25">堵塞物体积</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="PLTBU" value="<%=bean.getPLTBU() %>" />立方米<font color="red">*</font></td>
		
	</tr>
</table>
</div>
</body>
</html>
