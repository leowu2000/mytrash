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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D013");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="2">启闭失灵</td>-->
		<td class="title" height="25">停电</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getPOWCUT() %> </td>
		<td class="title"  height="25">起闭机失灵</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getHOMLF() %> </td>
		
	</tr>
	<tr>
		<td class="title"  height="25">闸门井变形</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getGSDST() %> </td>
		<td class="title"  height="25">失灵时开启状况</td>
		<td  bgcolor="#FFFFFF"> <%=bean.getMLFCN() %> </td>
	</tr>

</table>
</div>
</body>
</html>
