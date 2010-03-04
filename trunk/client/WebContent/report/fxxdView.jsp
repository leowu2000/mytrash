<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.fredck.FCKeditor.FCKeditor"%>
<%@ include file="/common/session.jsp"%>
<% 
	String fromwhere = request.getParameter("fromwhere");
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    RandomAccessFileExample.delAllFile(relPath+"\\\\common\\\\pic");
    String RPJINCD = request.getParameter("RPJINCD");
    FPACTIBean bean = BuinessDao.findFpactiByID(relPath,RPJINCD);
    String content = bean.getACTICO();
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="/common/js/reportCommon.js"></script>
</head>
<style type="text/css">
<!--
#newPreview
{
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
	width :150px; 
	height:100px; 
	borde:6px double #ccc;
}
-->
</style>

<script language="JAVASCRIPT">
function toBack(){
	location.href="/report/TB_FPACTIManage.jsp";
}
</script>
<body scroll="auto">
<%if(!"upload".trim().equals(fromwhere)) {%>
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4"><%=bean.getWTTT() %></span></td></tr>
</table>
<%} %>
<form name="frm" action="/buiness.do"  method="POST">
<input type="hidden" name="DNCNO" value="<%=bean.getRPJINCD() %>"/>
<input type="hidden" name="actionType" value="add_report"/>
<input type="hidden" name="WTDPCD" value="<%=configBean.getTBDW() %>"/>
<input type="hidden" name="picid" value=""/>
<input type="hidden" name="check" value="1"/><!-- 是否删除多媒体临时表数据标志1,删除,2不删除 -->
<input type="hidden" name="uptype" value=""/>
<input type="hidden" name="TABLENAME" value=""/>
<input type="hidden" name="subAction" value="edit"/>
<input type="hidden" name="FILEDNAME" value="ACTICO"/>
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#FFFFFF" >
		<td nowrap class="title" width="20%">照片标题:</td> 
		<td bgcolor="#FFFFFF" width="40%"><div id="TITLE">&nbsp;</div></td>
		
		<td bgcolor="#FFFFFF" rowspan="3" align="center"><div id="newPreview" ></div></td>
	</tr>
	<tr>
		<td nowrap class="title">拍摄时间:</td> 
		<td bgcolor="#FFFFFF" ><div id="DTCDT">&nbsp;</div></td>
	</tr>
	<tr height="25" bgcolor="#FFFFFF" >
		<td nowrap class="title">照片描述:</td> 
		<td bgcolor="#FFFFFF"><div id="NRMS">&nbsp;</div></td>
	</tr>
	<tr height="25" >
		<td nowrap bgcolor="#FFFFFF" colspan="4" align="center">
		<iframe id="ZPFRAME" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0"  src="/common/picView.jsp?temp= <%=Math.random()%>&tablename=TB_FPACTI_M&pkvalue=<%=RPJINCD %>&pkname=RPJINCD" height="110" width="100%">
		</iframe>	
		</td> 
	</tr>
	<tr height="25" >
	<td bgcolor="#FFFFFF" colspan="6" align="left">
	<%=content%>
	</td>
	</tr>
	
</table>
</form>
<%if(!"upload".trim().equals(fromwhere)) {%>
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
