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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D026");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<td class="title"  height="25">灾害类型</td>
		<td bgcolor="#FFFFFF"><%=bean.getDSSTP() %></td>
		<td class="title"  height="25">受灾面积</td>
		<td bgcolor="#FFFFFF"><%=bean.getDSSAREA() %></td>
		<td class="title"  height="25">受灾人口</td>
		<td bgcolor="#FFFFFF"> <%=bean.getDSSPN() %> 人</td>
	</tr>
	<tr>
		<td class="title"  height="25">死亡人数</td>
		<td bgcolor="#FFFFFF"> <%=bean.getDTHPN() %> 人</td>
		<td class="title"  height="25">倒塌房屋</td>
		<td bgcolor="#FFFFFF"> <%=bean.getWRHS() %> 间</td>
		<td class="title"  height="25">经济损失</td>
		<td bgcolor="#FFFFFF"> <%=bean.getDRCECLS() %> 万元</td>
	</tr>
	<tr>
		<td class="title"  height="25">日最大降雨量</td>
		<td bgcolor="#FFFFFF"> <%=bean.getDAYDP() %> mm</td>
		<td class="title"  height="25">时段降雨量</td>
		<td bgcolor="#FFFFFF" colspan="3"> <%=bean.getTDP() %> mm</td>
	</tr>
</table>
</div>
</body>
</html>
