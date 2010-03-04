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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D009");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="4">崩岸</td>-->
		<td nowrap class="title" height="25">距堤脚距离</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="TODFTDI" value="<%=bean.getTODFTDI() %>" size="8"/>米</td>
		<td class="title"  height="25">河岸高度</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="RVH" value="<%=bean.getRVH() %>" size="8"/>米</td>
		<td class="title"  height="25">崩塌长度</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="CVL" value="<%=bean.getCVL() %>" size="8"/>米</td>
	</tr>
	<tr>
		<td class="title"  height="25">河道流量</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="WDQ" value="<%=bean.getWDQ() %>" size="8"/>立方米/秒</td>
		<td class="title"  height="25">崩塌体积</td>
		<td  bgcolor="#FFFFFF" colspan="5"><input type="text" name="CVBU" value="<%=bean.getCVBU() %>" size="8"/>立方米</td>

	</tr>
	<tr>
		<td class="title" >水流情况</td>
		<td  bgcolor="#FFFFFF" colspan="6"><textarea rows="4" cols="80" name="FLCNDSC" style="width:100%"><%=bean.getFLCNDSC() %></textarea></td>
	</tr>

</table>
</div>
</body>
</html>
