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
	tabname=tabname==null?"TB_RSR":tabname;
	tabname=tabname==""?"TB_RSR":tabname;
	PjrDetailBean bean = BuinessDao.getPjrDetailBean(path,RPJINCD,tabname,GCFLDM);
%>
<body>
<div align="center"> 
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<td class="title" nowrap height="25">ˮ�����</td>
		<td  bgcolor="#FFFFFF">
			<select name="RSCLS">
				<option value="1" <%if(bean.getRSCLS().trim().equals("1")){ %>selected<%} %>>һ��</option>
				<option value="2" <%if(bean.getRSCLS().trim().equals("2")){ %>selected<%} %>>����</option>
				<option value="3" <%if(bean.getRSCLS().trim().equals("3")){ %>selected<%} %>>����</option>
			</select>
		</td>
		<td class="title"  height="25">��ǰ����ˮλ</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="RZ" value="<%=bean.getRZ() %>" size="8" onblur="javascript:checkNan(this,'��ǰ����ˮλ')"/>��</td>
		<td nowrap class="title">��ǰ����</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RV" value="<%=bean.getRV() %>" size="8" onblur="javascript:checkNan(this,'��ǰ����')"/>��������</td>
		
	</tr>
	<tr>
		<td nowrap class="title">��ǰк��</td>
		<td bgcolor="#FFFFFF" colspan="5"><input type="text" name="RQ" value="<%=bean.getRQ() %>" size="8" onblur="javascript:checkNan(this,'��ǰк��')"/>������/��</td>
	</tr>
</table>
</div>
</body>
</html>
