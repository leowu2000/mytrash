<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
<%@ page import="com.fredck.FCKeditor.FCKeditor"%>
<% 
	String relPath = request.getRealPath("/"); 
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
#newPreview
{
filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
width :200px; 
height:120px; 
borde:6px double #ccc;
}
-->
</style>

<script language="JAVASCRIPT">
function toBack(){
	location.href="/project/prgManage.jsp";
}
function PreviewImg(imgFile) 
{ 
 
	//新的预览代码，支持 IE6、IE7。 
	var newPreview = document.getElementById("newPreview"); 
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value; 
	newPreview.style.width = "200px"; 
	newPreview.style.height = "120px"; 
	newPreview.style.border= "6px double #ccc";
}
</script>
<body>
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">新增灾情报告</span></td></tr>
</table>
<form name="frm" action="/buiness.do"  method="POST">
<input type="hidden" name="TABLENAME" value=""/>
<input type="hidden" name="DNCNO" value="<%=UUIdFactory.getMaxId(relPath, "TB_SD") %>"/>
<input type="hidden" name="WTDPCD" value="WTDPCD"/>
<input type="hidden" name="FILEDNAME" value="SDDSC"/>
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<input type="hidden" name="actionType" value="add_report"/>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title" width="30%" >单位</td>
		<td nowrap align="center" class="title"  colspan="4">单位</td>
		<td nowrap align="center" class="title" width="30%" ><%=UtilDateTime.nowDateStringCN() %></td>
	</tr>
	<tr height="25" >
		<td align="center" class="title" >灾情标题:</td>
		<td align="center" class="title2" colspan="5">
		<input type="text" name="MAINTITLE" value="" size="50"/></td>
	</tr>
	<tr height="25" >
	<td class="title" colspan="6">
	<%	           
	    FCKeditor oFCKeditor ;
	    oFCKeditor = new FCKeditor( request, "CONTENT") ;
	    oFCKeditor.setBasePath( "/FCKeditor/" ) ;
		oFCKeditor.setToolbarSet( "NowUse" ) ;
	    oFCKeditor.setHeight("200");
	    //oFCKeditor.setValue( content==null?"":content );
	    out.println(oFCKeditor.create());
     %>
	</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2">照片列表</td> 
		<td nowrap class="title">照片标题</td> 
		<td bgcolor="#FFFFFF"><input type="text" name="TITLE" value=""/></td>
		<td nowrap class="title2">选择照片</td> 
		<td class="title2"><input type="file" name="UpFile" size="20" onchange="javascript:PreviewImg(this);"> </td>
	</tr>
	<tr height="25" >
		<td bgcolor="#FFFFFF" colspan="2" rowspan="3"><div id="PICLIST" class="divStyle"></div></td>
		<td nowrap class="title">拍摄时间:</td> 
		<td bgcolor="#FFFFFF"><input type="text" class="lines" name="DTCDT" value="<%=UtilDateTime.nowDateString() %>" size="18"/></td>
		<td class="title" rowspan="2" colspan="2"><div id="newPreview" ></div></td>
	</tr>
	<tr height="80" >
		<td nowrap class="title">照片描述</td> 
		<td bgcolor="#FFFFFF"><textarea rows="6" cols="20" name="NRMS"></textarea></td>
		
	</tr>
	<tr>
		<td class="title" colspan="4">
			<input type="button" name="" value="保存照片" onclick="javascript:uplaodReportPhotos('TB_SD_M')"/>
		</td>
	</tr>
</table>
</form>

<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:submitingReport('TB_SD')">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
