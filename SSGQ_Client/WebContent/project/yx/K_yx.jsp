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
	tabname=tabname==null?"TB_RSR":tabname;tabname=tabname==""?"TB_RSR":tabname;
	PjrDetailBean bean = BuinessDao.getPjrDetailBean(path,RPJINCD,tabname,GCFLDM);
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<td class="title" nowrap height="25">水闸级别</td>
		<td  bgcolor="#FFFFFF">
			<select name="WLGR">
				<option value="1" <%if(bean.getWLGR().trim().equals("1")){ %>selected<%} %>>大</option>
				<option value="2" <%if(bean.getWLGR().trim().equals("2")){ %>selected<%} %>>中</option>
				<option value="3" <%if(bean.getWLGR().trim().equals("3")){ %>selected<%} %>>小</option>
			</select>
		</td>
		<td class="title"  height="25">当前闸上水位</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="RUPGZ" value="<%=bean.getRUPGZ() %>" size="8" onblur="javascript:checkNan(this,'当前闸上水位')"/>米</td>
		<td nowrap class="title">当前闸下水位</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RDWGZ" value="<%=bean.getRDWGZ() %>" size="8" onblur="javascript:checkNan(this,'当前闸下水位')"/> 米</td>
		
	</tr>
	<tr>
		<td nowrap class="title">水面距闸顶高程:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="RWSTOWLT" value="<%=bean.getRWSTOWLT() %>" size="8"/> 米</td>
		<td nowrap class="title">当前过闸流量:</td>
		<td bgcolor="#FFFFFF" colspan="3"><input type="text" name="RQO" value="<%=bean.getRQO() %>" size="8"/>立方米/秒</td>
	</tr>
</table>
</div>
</body>
</html>
