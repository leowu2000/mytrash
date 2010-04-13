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
<input type="hidden" name="RV" value=""></input>
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr>
		<td class="title" nowrap height="25">�̷�����</td>
		<td  bgcolor="#FFFFFF">
			<select name="DKGR">
				<option value="1" <%if(bean.getDKGR().trim().equals("1")){ %>selected<%} %>>1</option>
				<option value="2" <%if(bean.getDKGR().trim().equals("2")){ %>selected<%} %>>2</option>
				<option value="3" <%if(bean.getDKGR().trim().equals("3")){ %>selected<%} %>>3</option>
				<option value="4" <%if(bean.getDKGR().trim().equals("4")){ %>selected<%} %>>4</option>
				<option value="5" <%if(bean.getDKGR().trim().equals("5")){ %>selected<%} %>>5</option>
			</select>
		</td>
		<td class="title" nowrap height="25">���ڰ���</td>
		<td  bgcolor="#FFFFFF">
			<select name="BKOT">
				<option value="1" <%if(bean.getBKOT().trim().equals("1")){ %>selected<%} %>>��</option>
				<option value="2" <%if(bean.getBKOT().trim().equals("2")){ %>selected<%} %>>��</option>
			</select>
		</td>
		<td nowrap class="title">��ֹ׮��</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="STECH" value="<%=bean.getSTECH() %>"/></td>
	</tr>
	<tr>
		<td class="title"  height="25">��ǰˮλ</td>
		<td  bgcolor="#FFFFFF"><input type="text" name="RZ" value="<%=bean.getRZ() %>" size="8" onblur="javascript:checkNan(this,'��ǰˮλ')"/> ��</td>
		<td nowrap class="title">��ǰ����</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RQ" value="<%=bean.getRQ() %>" size="8" onblur="javascript:checkNan(this,'��ǰ����')"/> ������/��</td>
		<td nowrap class="title">ˮ���̶�����</td>
		<td bgcolor="#FFFFFF"><input type="text" name="WSTODC" value="<%=bean.getWSTODC() %>" size="8" onblur="javascript:checkNan(this,'ˮ���̶�����')"/> ��</td>
	</tr>
</table>
</div>
</body>
</html>
