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
	DetailBean bean = BuinessDao.getDetailBean(path,PJNO,DNCNO,"D015");
	
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<!-- <td class="title" rowspan="4">溃坝</td>-->
		<td class="title" height="25">溃坝宽度</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="BRDMW" value="<%=bean.getBRDMW() %>" size="8"/>米</td>
		<td class="title"  height="25">溃坝时库容</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="BRV" value="<%=bean.getBRV() %>" size="8"/>万立方米</td>
		<td class="title"  height="25">溃坝流量</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="BRDMQ" value="<%=bean.getBRDMQ() %>" size="8"/>米</td>
		<td class="title"  height="25">库水位距坝鼎高差</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="BRZDMCDI" value="<%=bean.getBRZDMCDI() %>" size="8"/>米</td>
	</tr>
	<tr>
		<td class="title"  height="25">受灾人口</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="DSSPN" value="<%=bean.getDSSPN() %>" size="8"/>人</td>
		<td class="title"  height="25">受伤人口</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="INPN" value="<%=bean.getINPN() %>" size="8"/>人</td>
		<td class="title"  height="25">死亡人口</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="DTHPN" value="<%=bean.getDTHPN() %>" size="8"/>人</td>
		<td class="title"  height="25">倒塌房屋</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="WRHS" value="<%=bean.getWRHS() %>" size="8"/>间</td>
	</tr>
	<tr>
		<td class="title"  colspan="2" height="25">农作物受害面积</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="CRPDSSAR" value="<%=bean.getCRPDSSAR() %>" size="8"/>公顷</td>
		<td class="title"  height="25">毁坏耕地面积</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="SCDMFMAR" value="<%=bean.getSCDMFMAR() %>" size="8"/>公顷</td>
		<td class="title" colspan="2" height="25">直接经济损失</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="DRCECLS" value="<%=bean.getDRCECLS() %>" size="8"/>万元</td>
	</tr>
	<tr>
		<td class="title" colspan="2">溃坝处地址地形条件</td>
		<td  bgcolor="#FFFFFF" colspan="3"><textarea rows="4" cols="35" name="BRDMLDGL" style="width:100%"><%=bean.getBRDMLDGL() %></textarea></td>
		<td class="title">工程现状</td>
		<td  bgcolor="#FFFFFF" colspan="2"><textarea rows="4" cols="35" name="PJPS" style="width:100%"><%=bean.getPJPS() %></textarea></td>
	</tr>

</table>
</div>
</body>
</html>
