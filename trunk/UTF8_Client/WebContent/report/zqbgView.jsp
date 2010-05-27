<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="net.fckeditor.*"%>
<% 
	String relPath = request.getSession().getServletContext().getRealPath("/");
	String fromwhere = request.getParameter("fromwhere");
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    RandomAccessFileTool.delAllFile(relPath+"\\\\common\\\\pic");
    String RPJINCD = request.getParameter("RPJINCD");
    SDBean bean = BuinessDao.findSDByID(relPath,RPJINCD);
    String content = bean.getSDDSC();
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
	location.href="/report/TB_SDManage.jsp";
}

</script>
<body>

<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4"><%=bean.getWTTT() %></span></td></tr>
</table>

<form name="frm" action="/buiness.do"  method="POST">
<input type="hidden" name="TABLENAME" value=""/>
<input type="hidden" name="picid" value=""/>
<input type="hidden" name="check" value="1"/><!-- 是否删除多媒体临时表数据标志1,删除,2不删除 -->
<input type="hidden" name="uptype" value=""/>
<input type="hidden" name="FILEDNAME" value="SDDSC"/>
<input type="hidden" name="actionType" value="add_report"/>
<input type="hidden" name="PicServerUrl" value=""/>
<input type="hidden" name="toviewpic" value="2"/>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">

	<tr bgcolor="#FFFFFF" >
		<td nowrap class="title" width="20%">照片标题</td> 
		<td bgcolor="#FFFFFF" width="40%"><div id="TITLE">&nbsp;</div></td>
		
		<td bgcolor="#FFFFFF" rowspan="3" align="center"><div id="newPreview" onclick="divHref()" style="cursor:pointer;"></div></td>
	</tr>
	<tr>
		<td nowrap class="title">拍摄时间</td> 
		<td bgcolor="#FFFFFF" ><div id="DTCDT">&nbsp;</div></td>
	</tr>
	<tr height="25" bgcolor="#FFFFFF" >
		<td nowrap class="title">照片描述</td> 
		<td bgcolor="#FFFFFF"><div id="NRMS">&nbsp;</div></td>
	</tr>
	<tr height="25" >
		<td nowrap bgcolor="#FFFFFF" colspan="4" align="center">
		<iframe id="ZPFRAME" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0"  src="/common/picView.jsp?temp= <%=Math.random()%>&tablename=TB_SD_M&pkvalue=<%=RPJINCD %>&pkname=RPJINCD" height="110" width="100%">
		</iframe>	
		</td> 
	</tr>
	<tr height="25" >
	<td bgcolor="#FFFFFF" colspan="4">
	<%=content%>
	</td>
	</tr>
</table>
</form>
<%if(!"upload".trim().equals(fromwhere)) {%>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:submitingReport('TB_SD')">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
<%} %>
</body>
</html>
