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
 
	//�µ�Ԥ�����룬֧�� IE6��IE7�� 
	var newPreview = document.getElementById("newPreview"); 
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value; 
	newPreview.style.width = "200px"; 
	newPreview.style.height = "120px"; 
	newPreview.style.border= "6px double #ccc";
}
</script>
<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">������Ϣ</span></td></tr>
</table>
<form name="frm" action=""  method="POST" enctype="multipart/form-data">
<input type="hidden" name="actionType" value=""/>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title" width="30%" >��λ</td>
		<td nowrap align="center" class="title"  colspan="4">��<input type="text" class="lines" value="" size="8"/> ��</td>
		<td nowrap align="center" class="title" width="30%" ><%=UtilDateTime.nowDateStringCN() %></td>
	</tr>
	<tr height="25" >
		<td align="center" class="title" >�������:</td>
		<td align="center" class="title2" colspan="5">
		<input type="text" name="" value="" size="50"/></td>
	</tr>
	<tr height="25" >
	<td class="title" colspan="6">
	<%	           
	    FCKeditor oFCKeditor3 ;
	    oFCKeditor3 = new FCKeditor( request, "PRE_DYNAMIC") ;
	    oFCKeditor3.setBasePath( "/FCKeditor/" ) ;
		oFCKeditor3.setToolbarSet( "NowUse" ) ;
	    oFCKeditor3.setHeight("200");
	    //oFCKeditor.setValue( content==null?"":content );
	    out.println(oFCKeditor3.create());
     %>
	</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2">��Ƭ�б�</td> 
		<td nowrap class="title">��Ƭ����</td> 
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title2">ѡ����Ƭ</td> 
		<td class="title2"><input type="file" name="UpFile" size="20" onchange="javascript:PreviewImg(this);"> </td>
	</tr>
	<tr height="25" >
		<td bgcolor="#FFFFFF" colspan="2" rowspan="3">&nbsp;</td>
		<td nowrap class="title">����ʱ��:</td> 
		<td bgcolor="#FFFFFF"><input type="text" class="lines" value="<%=UtilDateTime.nowDateString() %>" size="18"/></td>
		<td class="title" rowspan="2" colspan="2"><div id="newPreview" ></div></td>
	</tr>
	<tr height="80" >
		<td nowrap class="title">��Ƭ����</td> 
		<td bgcolor="#FFFFFF"><textarea rows="6" cols="20"></textarea></td>
		
	</tr>
	<tr>
		<td class="title" colspan="4">
			<input type="button" name="" value="������Ƭ" onclick="javascript:uplaodPhotos()"/>
		</td>
	</tr>
	<tr height="25" >
		<td nowrap align="center" class="title">ǩ��(Q):</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" /></td>
		<td nowrap align="center" class="title">���(H):</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap align="center" class="title">���(N):</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" /></td>
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
