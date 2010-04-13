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
	String RPJINCD = request.getParameter("RPJINCD");
	String GCFLDM = request.getParameter("GCFLDM");
	String tabname = BuinessDao.getTabNameFromGcfldm(GCFLDM);
	RPJINCD=RPJINCD==null?"0":RPJINCD;
	
	PjrDetailBean bean = BuinessDao.getPjrDetailBean(path,RPJINCD,tabname,GCFLDM);
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<td class="title" nowrap height="25">水闸级别</td>
		<td  bgcolor="#FFFFFF">
			<%if(bean.getWLGR().trim().equals("1")){ %>&nbsp;&nbsp;大&nbsp;&nbsp;<%} %>
			<%if(bean.getWLGR().trim().equals("2")){ %>&nbsp;&nbsp;中&nbsp;&nbsp;<%} %>
			<%if(bean.getWLGR().trim().equals("3")){ %>&nbsp;&nbsp;小&nbsp;&nbsp;<%} %>
		</td>
		<td class="title"  height="25">当前闸上水位</td>
		<td  bgcolor="#FFFFFF"><%=bean.getRUPGZ() %> 米</td>
		<td nowrap class="title">当前闸下水位</td>
		<td bgcolor="#FFFFFF" ><%=bean.getRDWGZ() %>  米</td>
		
	</tr>
	<tr>
		<td nowrap class="title">水面距闸顶高程</td>
		<td bgcolor="#FFFFFF"> <%=bean.getRWSTOWLT() %>  米</td>
		<td nowrap class="title">当前过闸流量</td>
		<td bgcolor="#FFFFFF" colspan="3"> <%=bean.getRQO() %> 立方米/秒</td>
	</tr>
</table>
</div>
</body>
</html>
