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
	<tr><td align="center" ><span  class="style4">�޸ķ�Ѵ������</span></td></tr>
</table>
<form name="frm" action="/buiness.do" method="post">
<input type="hidden" name="actionType" value="add_fxjb"/>
<input type="hidden" name="subActionType" value="update"/>
<input type="hidden" name="WTDPCD" value="WTDPCD"/>
<input type="hidden" name="RPJINCD" value="<%=RPJINCD %>">
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<!-- <tr height="25" >
		<td nowrap align="center" class="title" width="30%" >��λ</td>
		<td nowrap align="center" class="title"  colspan="4">��<input type="text" class="lines" name="ISSUE" value="" size="8"/> ��</td>
		<td nowrap align="center" class="title" width="30%" ><%=UtilDateTime.nowDateStringCN() %></td>
	</tr>-->
	<tr height="25" >
		<td nowrap align="center" class="title">��<input type="text" class="lines" name="ISSUE" value="<%=bean.getISSUE() %>" size="8"/> ��</td>
		<td align="center" class="title">����:</td>
		<td align="center" class="title" colspan="2">
		<input type="text" name="WTTT" value="<%=bean.getWTTT() %>" size="25"/></td>
		<td align="center" class="title2">����:</td>
		<td bgcolor="#FFFFFF">
		<input type="file" name="UpFile" size="20"> 
		</td>
	</tr>
	<tr height="25" >
	<td class="title" colspan="6">
	<%	           
	    FCKeditor oFCKeditor ;
	    oFCKeditor = new FCKeditor( request, "ACTICO") ;
	    oFCKeditor.setBasePath( "/FCKeditor/" ) ;
		oFCKeditor.setToolbarSet( "NowUse" ) ;
	    oFCKeditor.setHeight("260");
	    oFCKeditor.setValue( content==null?"":content );
	    out.println(oFCKeditor.create());
     %>
	</td>
	</tr>
	<tr height="25" >
		<td nowrap align="center" class="title">ǩ��(Q):</td>
		<td bgcolor="#FFFFFF"><input type="text" name="QF" value="<%=bean.getQF() %>" /></td>
		<td nowrap align="center" class="title">���(H):</td>
		<td bgcolor="#FFFFFF"><input type="text" name="SH" value="<%=bean.getSH() %>"/></td>
		<td nowrap align="center" class="title">���(N):</td>
		<td bgcolor="#FFFFFF"><input type="text" name="NG" value="<%=bean.getNG() %>" /></td>
	</tr>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="��  ��" onclick="javascript:submiting()">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>