<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.fredck.FCKeditor.FCKeditor"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    String path = request.getRealPath("/");
    String RPJINCD = request.getParameter("RPJINCD");
    FXJBBean bean = BuinessDao.findFxjbcByID(path,RPJINCD);
    String content = bean.getACTICO();
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
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">防汛抗旱简报</span></td></tr>
</table>
<form name="frm" action="/buiness.do" method="post">
<input type="hidden" name="actionType" value="add_fxjb"/>
<input type="hidden" name="subActionType" value="update"/>
<input type="hidden" name="WTDPCD" value="WTDPCD"/>
<input type="hidden" name="RPJINCD" value="<%=RPJINCD %>">
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title" width="30%" >单位</td>
		<td nowrap align="center" class="title"  colspan="4">第<%=bean.getISSUE() %> 期</td>
		<td nowrap align="center" class="title" width="30%" ><%=UtilDateTime.nowDateStringCN() %></td>
	</tr>
	<tr height="25" >
		<td align="center" class="title">标题:</td>
		<td align="center" bgcolor="#FFFFFF" colspan="3"><%=bean.getWTTT() %></td>
		<td align="center" class="title2">附件:</td>
		<td bgcolor="#FFFFFF">
		<input type="file" name="UpFile" size="20"> 
		</td>
	</tr>
	<tr>
	<td bgcolor="#FFFFFF" colspan="6" align="center">
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
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:submiting()">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
