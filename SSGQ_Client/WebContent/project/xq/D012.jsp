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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D012");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="4">滑动</td>-->
		<td class="title" height="25">滑动面角度:</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="SLUPAG" value="<%=bean.getSLUPAG() %>" size="8" onblur="javascript:checkNan(this,'滑动面角度')"/>度</td>
		<td class="title"  height="25">滑动位移:</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="SLUDSP" value="<%=bean.getSLUDSP() %>" size="8" onblur="javascript:checkNan(this,'滑动位移')"/>米</td>
		<td class="title"  height="25">滑动类型:</td>
		<td  bgcolor="#FFFFFF" ><input type="text" name="SLUTP" value="<%=bean.getSLUTP() %>" /></td>
	</tr>
	<tr>
		<td nowrap class="title" >滑动面地质情况:</td>
		<td  bgcolor="#FFFFFF" colspan="5"><textarea rows="4" cols="40" name="SLUGLCN" style="width:100%"><%=bean.getSLUGLCN() %></textarea></td>
	</tr>

</table>
</div>
</body>
</html>
