<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.fredck.FCKeditor.FCKeditor"%>
<%@ page import="com.core.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ include file="/common/session.jsp"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    RandomAccessFileExample.delAllFile(relPath+"\\\\common\\\\pic");
    String fromwhere = request.getParameter("fromwhere");
    String RPJINCD = request.getParameter("RPJINCD");
    FXJBBean bean = BuinessDao.findFxjbcByID(relPath,RPJINCD);
    String content = bean.getACTICO();
    Connection conn = ConnectionPool.getConnection(relPath);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select ZLBM,DTCDT,TITLE,WJGS,LXZP,NRMS from TB_FXJB_M where RPJINCD="+RPJINCD);
	String filename = "";
	String picname = "";
	if (rs.next()) {
		long current = System.currentTimeMillis();
		java.io.InputStream in = null;
		OutputStream fos = null;
		String zlcode =String.valueOf(rs.getInt("ZLBM"));
		filename = relPath.replaceAll("\\\\","\\\\\\\\")+"\\\\common\\\\pic\\\\"+zlcode+"_"+current+".jpg";
		picname = zlcode+"_"+current+".jpg";
		in = (InputStream)rs.getBinaryStream("LXZP");
		fos = new FileOutputStream(new File(filename));
		
		int a = 0; 
		byte[] temp = new byte[1024]; 
		while((a = in.read(temp))>0){ 
		int b = 0; 
		b+=a; 
		fos.write(temp,0,b); 
		} 
		fos.flush(); 
		in.close(); 
		fos.close();
	}
	rs.close();
	conn.close();
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
</head>
<style type="text/css">
<!--

-->
</style>

<script language="JAVASCRIPT">
function toBack(){
	location.href="/report/fxjbManage.jsp";
}
function submiting(){
	document.frm.submit();
}
</script>
<body scroll="auto">
<%if(!"upload".trim().equals(fromwhere)) {%>
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4"><%=bean.getWTTT() %></span></td></tr>
</table>
<%} %>
<form name="frm" action="/buiness.do" method="post">
<input type="hidden" name="actionType" value="add_fxjb"/>
<input type="hidden" name="subActionType" value="update"/>
<input type="hidden" name="WTDPCD" value="WTDPCD"/>
<input type="hidden" name="RPJINCD" value="<%=RPJINCD %>">
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title" width="30%" ><%=configBean.getTBDW() %></td>
		<td nowrap align="center" class="title"  colspan="4">第<%=bean.getISSUE() %> 期</td>
		<td nowrap align="center" class="title" width="30%" ><%=UtilDateTime.nowDateStringCN() %></td>
	</tr>
	<tr height="25" >
		<td align="center" bgcolor="#FFFFFF" colspan="6"><img src="/common/pic/<%=picname %>" style="width=200;height=150;"></img></td>
	</tr>
	<tr>
	<td bgcolor="#FFFFFF" colspan="6">
	<%=content==null?"":content%>
	</td>
	</tr>
	<tr height="25" >
		<td nowrap align="center" class="title">签发(Q):</td>
		<td bgcolor="#FFFFFF"><%=bean.getQF() %></td>
		<td nowrap align="center" class="title">审核(H):</td>
		<td bgcolor="#FFFFFF"><%=bean.getSH() %></td>
		<td nowrap align="center" class="title">拟稿(N):</td>
		<td bgcolor="#FFFFFF"><%=bean.getNG() %></td>
	</tr>
</table>
</form>
<%if(!"upload".trim().equals(fromwhere)) {%>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
<%} %>
</body>
</html>
