<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.fredck.FCKeditor.FCKeditor"%>
<% 
	String relPath = request.getRealPath("/"); 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    String RPJINCD = request.getParameter("RPJINCD");
    HQBean bean = BuinessDao.findHQByID(relPath,RPJINCD);
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
	location.href="/report/TB_QTManage.jsp";
}
function PreviewImg(imgFile) 
{ 
 
	//�µ�Ԥ�����룬֧�� IE6��IE7�� 
	var newPreview = document.getElementById("newPreview"); 
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value; 
	newPreview.style.width = "150px"; 
	newPreview.style.height = "100px"; 
	newPreview.style.border= "6px double #ccc";
}
</script>
<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">�޸ĺ�����Ϣ</span></td></tr>
</table>
<form name="frm" action="/buiness.do"  method="POST">
<input type="hidden" name="DNCNO" value="<%=UUIdFactory.getMaxId(relPath, "TB_QT","RPJINCD") %>"/>
<input type="hidden" name="actionType" value="add_report"/>
<input type="hidden" name="WTDPCD" value="WTDPCD"/>
<input type="hidden" name="FILEDNAME" value="ACTICO"/>
<input type="hidden" name="TABLENAME" value=""/>
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td align="center" class="title" >�������:</td>
		<td align="center" class="title" colspan="5">
		<input type="text" name="MAINTITLE" value="<%=bean.getWTTT() %>" size="50"/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">��Ƭ����</td> 
		<td bgcolor="#FFFFFF"><input type="text" name="TITLE" value=""/></td>
		<td nowrap class="title">����ʱ��</td> 
		<td bgcolor="#FFFFFF"><input type="text" name="DTCDT" class="lines" value="<%=UtilDateTime.nowDateString() %>" size="18"/></td>
		<td nowrap class="title" colspan="2">ѡ����Ƭ<input type="file" name="UpFile" size="20" onchange="javascript:PreviewImg(this);"> </td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2">��Ƭ����</td> 
		<td nowrap class="title" colspan="2">��Ƭ�б�</td> 
		<td nowrap class="title" colspan="2">��ƬԤ��
			<input type="button" name="" value="�����Ƭ" onclick="javascript:uplaodReportPhotos('TB_FPACTI_M')"/>
		</td>
	</tr>
	<tr height="25" >
		<td bgcolor="#FFFFFF" colspan="2">
			<textarea rows="6" cols="33" name="NRMS"></textarea>
		</td> 
		<td bgcolor="#FFFFFF" colspan="2">
			<div id="PICLIST" class="divStyle"></div>
		</td> 
		<td bgcolor="#FFFFFF" colspan="2" align="center">
			<div id="newPreview" ></div>
		</td>
	</tr>
	<tr height="25" >
	<td class="title" colspan="6">
	<%	           
	    FCKeditor oFCKeditor ;
	    oFCKeditor = new FCKeditor( request, "CONTENT") ;
	    oFCKeditor.setBasePath( "/FCKeditor/" ) ;
		oFCKeditor.setToolbarSet( "NowUse" ) ;
	    oFCKeditor.setHeight("200");
	    oFCKeditor.setValue( content==null?"":content );
	    out.println(oFCKeditor.create());
     %>
	</td>
	</tr>
</table>
</form>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="��  ��" onclick="javascript:submitingReport('TB_QT')">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
