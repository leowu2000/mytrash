<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="net.fckeditor.*"%>
<%@ include file="/common/session.jsp"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    BuinessDao.deleteDB("delete from TB_SUB_TEMP",relPath);
    String uuid = String.valueOf(UUIdFactory.getMaxId(relPath, "TB_FPACTI","RPJINCD")) ;
    
  	//防止刷新页面重复提交
    long _nowtime = System.currentTimeMillis();
    session.setAttribute("sessiontime",_nowtime);
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="/common/js/reportCommon.js"></script>
<script Language="JavaScript" src="/common/My97DatePicker/WdatePicker.js"></script>
</head>
<style type="text/css">
<!--
#newPreview
{
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
	width :150px; 
	height:90px; 
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
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">新增防汛行动</span></td></tr>
</table>
<form name="frm" action="/buiness.do"  method="POST">
<input type="hidden" name="DNCNO" value="<%=uuid%>"/>
<INPUT type='hidden' name='sessiontime' value="<%=_nowtime%>">
<input type="hidden" name="actionType" value="add_report"/>
<input type="hidden" name="WTDPCD" value="<%=configBean.getTBDW() %>"/>
<input type="hidden" name="TABLENAME" value=""/>
<input type="hidden" name="picid" value=""/>
<input type="hidden" name="check" value="1"/><!-- 是否删除多媒体临时表数据标志1,删除,2不删除 -->
<input type="hidden" name="uptype" value=""/>
<input type="hidden" name="FILEDNAME" value="ACTICO"/>
<input type="hidden" name="upFileValues" value=""/>
<input type="hidden" name="PicServerUrl" value=""/>
<input type="hidden" name="toviewpic" value="1"/>
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap class="title">行动标题</td>
		<td align="left" bgcolor="#FFFFFF" >
		<input type="text" name="MAINTITLE" value=""/></td>
		<td nowrap class="title">照片标题</td> 
		<td bgcolor="#FFFFFF"><input type="text" name="TITLE" value="" size="30"/></td>
		<td bgcolor="#FFFFFF" rowspan="4" align="center"><div id="newPreview" onclick="divHref()" style="cursor:pointer;"></div></td>
	</tr>
	<tr height="25" bgcolor="#FFFFFF" >
		<td nowrap class="title" >选择照片</td>
		<td bgcolor="#FFFFFF" >
		<div id="thfiles"  style="display:none"></div>
		<div id="showupfile" style="display:inline"><input type="file" id="UpFile" name="UpFile" size="20" onchange="javascript:PreviewImg(this);"> </div>
		</td>
		<td nowrap class="title">拍摄时间</td> 
		<td >
		<input type="text" name="DTCDT" onClick="WdatePicker({skin:'blue'})" readonly value="" size="30"/>
		</td>
		
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td nowrap class="title">照片描述</td> 
		<td  bgcolor="#FFFFFF" colspan="3">
		<textarea rows="2" cols="3" name="NRMS" style="width:100%"></textarea>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF"  colspan="4">
			<input type="button" name="addbutton" value="添加" onclick="javascript:uplaodReportPhotos('TB_FPACTI_M')"/>
			<input type="button" name="editbutton" value="修改" disabled onclick="javascript:updateMediaMsg('TB_FPACTI_M')"/>
			<input type="button" name="cancelbutton" value="取消" disabled onclick="javascript:cancelPhotos()"/>
		</td>
	</tr>
	<tr height="25" >
		<td nowrap bgcolor="#FFFFFF" colspan="5" align="center">
		<iframe id="ZPFRAME" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0"  src="/common/pic.jsp?tablename=TB_FPACTI_M&pkvalue=<%=uuid%>&pkname=RPJINCD" height="110" width="100%">
		</iframe>	
		</td> 
	</tr>
	<tr height="25" >
	<td class="title" colspan="5">
	<%
		FCKeditor fckEditor = new FCKeditor(request, "CONTENT");
	fckEditor.setToolbarSet("NowUse");
     	fckEditor.setValue("");
		out.println(fckEditor);
	%>
	</td>
	</tr>
	
</table>
</form>

<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:submitingReport('TB_FPACTI')">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
