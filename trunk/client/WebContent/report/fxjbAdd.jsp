<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.fredck.FCKeditor.FCKeditor"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
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
	<tr><td align="center" ><span  class="style4">新增防汛抗旱简报</span></td></tr>
</table>
<form name="frm" action="/buiness.do" method="post">
<input type="hidden" name="actionType" value="add_fxjb"/>
<input type="hidden" name="WTDPCD" value="WTDPCD"/>
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<!-- <tr height="25" >
		<td nowrap align="center" class="title" width="30%" >单位</td>
		<td nowrap align="center" class="title"  colspan="4">第<input type="text" class="lines" name="ISSUE" value="" size="8"/> 期</td>
		<td nowrap align="center" class="title" width="30%" ><%=UtilDateTime.nowDateStringCN() %></td>
	</tr>-->
	<tr height="25" >
		<td nowrap align="center" class="title">第<input type="text" class="lines" name="ISSUE" value="" size="8"/> 期</td>
		<td align="center" class="title">标题:</td>
		<td align="center" class="title" colspan="2">
		<input type="text" name="WTTT" value="" size="25"/></td>
		<td align="center" class="title2">附件:</td>
		<td bgcolor="#FFFFFF">
		<input type="file" name="UpFile" size="20"> 
		</td>
	</tr>
	<tr height="25" >
	<td class="title" colspan="6">
	<%	           
	    FCKeditor oFCKeditor3 ;
	    oFCKeditor3 = new FCKeditor( request, "ACTICO") ;
	    oFCKeditor3.setBasePath( "/FCKeditor/" ) ;
		oFCKeditor3.setToolbarSet( "NowUse" ) ;
	    oFCKeditor3.setHeight("260");
	    //oFCKeditor.setValue( content==null?"":content );
	    out.println(oFCKeditor3.create());
     %>
	</td>
	</tr>
	<tr height="25" >
		<td nowrap align="center" class="title">签发(Q):</td>
		<td bgcolor="#FFFFFF"><input type="text" name="QF" value="" /></td>
		<td nowrap align="center" class="title">审核(H):</td>
		<td bgcolor="#FFFFFF"><input type="text" name="SH" value=""/></td>
		<td nowrap align="center" class="title">拟稿(N):</td>
		<td bgcolor="#FFFFFF"><input type="text" name="NG" value="" /></td>
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
