<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
%> 
<html>
<head>
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
<%
	String path = request.getRealPath("/");
	List<PrjBean> beanList = BuinessDao.getAllList(path);
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");
%>
<script language="JAVASCRIPT">
function per_Submit(){
	var radioValue;
	for(var i=0; i<form1.myradio.length; i++){
	    if(form1.myradio[i].checked) 
	    	radioValue=form1.myradio[i].value;
	}
	if(radioValue==2){//��������
		alert(window("main1").document.getElementById("WLSWQS").value);
	}else{//����״̬
		
	}
}
function toAdd(){
	location.href="/project/prgAdd.jsp";
}

//ͼƬԤ���������
function PreviewImg(imgFile) 
{ 
 
	//�µ�Ԥ�����룬֧�� IE6��IE7�� 
	var newPreview = document.getElementById("newPreview"); 
	//newPreview.style.filter="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value; 
	newPreview.style.width = "150px"; 
	newPreview.style.height = "100px"; 
	newPreview.style.border= "6px double #ccc";
}
function showDetail(){
	var radioValue;
	for(var i=0; i<form1.myradio.length; i++){
	    if(form1.myradio[i].checked) 
	    	radioValue=form1.myradio[i].value;
	}
	if(radioValue==1){
		GCXQ.style.display="none";
		YXZT.style.display="inline";
		window.frames["main2"].location.href="yxztLoader.jsp";	
		window.frames["main3"].location.href="skLoader.jsp";
				
	}else{
		YXZT.style.display="none";
		GCXQ.style.display="inline";
		window.frames["main1"].location.href="gcxqLoader.jsp";	
	}

		
}
//�ϴ�ͼƬ��Ϣ
function uplaodPhotos(){

	
}
function getGcmessage(id){
	//if(window.XMLHttpRequest){ //Mozilla
    //	var xmlHttpReq=new XMLHttpRequest();
	//  }else if(window.ActiveXObject){
	//    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	//  }
	// alert("/BaseServlet?type=change&changeObjName="+style+"&changeType="+type+"&changeVal="+obj.value);
	//  xmlHttpReq.open("GET", "/BaseServlet?type=gqcj&cntcd="+id, false);
	//  xmlHttpReq.send(null);
	//  var result = xmlHttpReq.responseText;
}
</script> 
<body scroll="auto">

<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">��������ɼ���Ϣ</span></td></tr>
</table>

<form name="form1" method="POST" enctype="multipart/form-data"> 
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title2" colspan="2">
			<input type="radio" id="myradio" name="myradio" value="1" checked>��������״̬[R]
			<input type="radio" id="myradio" name="myradio" value="2" >��������[G]
		</td>
		<td nowrap align="center" class="title2" colspan="4">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">��������[B]:</td>
		<td bgcolor="#FFFFFF">
		<select name="GCNAME" onchange="javascript:getGcmessage(this.value)">
			<%if(beanList!=null && beanList.size()>0){
				for(int i=0;i<beanList.size();i++){
					PrjBean bean = beanList.get(i);
		%>
			<option value="<%=bean.getCNTCD() %>"><%=bean.getPJNM() %></option>
		<%
				}
			} %>
		</select>
		</td>
		<td nowrap class="title">�������[C]:</td>
		<td bgcolor="#FFFFFF">
			<select name="XQFL" disabled>
			<%if(resultList!=null && resultList.size()>0){
			for(int i=0;i<resultList.size();i++){
				Map<Object,Object> map = (Map<Object,Object>)resultList.get(i);
				%>
					<option value="<%=map.get("id")%>" %><%=map.get("value")%></option>
				<%
			}} %>
			</select>
		</td>
		<td nowrap class="title">���ղ�λ[P]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="CXBW" value=""/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">�������[N]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" /></td>
		<td nowrap class="title">���λ[U]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">�ɼ�ʱ��[T]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="<%=UtilDateTime.nowDateString() %>"/></td>
	</tr>

	<!-- 
	<input type="file" name="UpFile" size="30" onchange="javascript:PreviewImg(this);"> 
		<div id="newPreview" >��ƬԤ������</div> -->
	<tr height="25" >
		<td nowrap class="title" colspan="2">��Ƭ�б�</td> 
		<td nowrap class="title">��Ƭ����</td> 
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title2">ѡ����Ƭ</td> 
		<td class="title2"><input type="file" name="UpFile" size="20" onchange="javascript:PreviewImg(this);"> </td>
	</tr>
	<tr height="100" >
		<td bgcolor="#FFFFFF" colspan="2" rowspan="2">&nbsp;</td>
		<td nowrap class="title" rowspan="2">��Ƭ����</td> 
		<td bgcolor="#FFFFFF" rowspan="2"><textarea rows="8" cols="20"></textarea></td>
		<td class="title" colspan="2"><div id="newPreview" ></div></td>
		
	</tr>
	<tr>
		<td class="title" colspan="2">
			<input type="button" name="" value="������Ƭ" onclick="javascript:uplaodPhotos()"/>&nbsp;&nbsp;&nbsp;
			<input type="button" name="" value="��ϸ��Ϣ" onclick="javascript:showDetail()"/>
		</td>
	</tr>
</table>
<div id="GCXQ" style="display:none">
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">

	<tr height="25" >
		<td rowspan="6" class="title">����</td>
		<td nowrap class="title">���鼶��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="10"/></td>
		<td nowrap class="title">���յص�:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="10"/></td>
		<td nowrap class="title">���ղ�λ:</td>
		<td bgcolor="#FFFFFF" colspan="5"><input type="text" name="" value=""/></td>
	</tr>
	
	<tr height="25" >
		<td nowrap class="title">��ž�Ͷ��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>��</td>
		<td nowrap class="title">�侯Ͷ��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>��</td>
		<td nowrap class="title">Ⱥ��Ͷ��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>��</td>
		<td nowrap class="title" >��ǰˮλ:</td>
		<td bgcolor="#FFFFFF" colspan=3><input type="text" name="" value="" size="8"/>��</td>
	</tr>
	<tr height="25">
		<td bgcolor="#FFFFFF" colspan="10">
		<iframe id="main1" frameborder="0" marginwidth="0" marginheight="0" src="gcxqLoader.jsp" height="198" width="800">
		</iframe>
		</td>
	</tr>
	<tr height="25" >
		<td rowspan="2" class="title">©��</td>
		<td nowrap class="title">��̶��߳�:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>��</td>
		<td nowrap class="title">���©��ֱ��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>��</td>
		<td nowrap class="title">©������:</td>
		<td bgcolor="#FFFFFF" colspan="4"><input type="text" name="" value=""/>��/��</td>
		
	<tr height="25" >
		<td nowrap class="title" colspan=2>��ǰˮλ����̶��߲�:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>��</td>
		<td nowrap class="title">©������:</td>
		<td bgcolor="#FFFFFF">
			<select>
				<option value="1">��</option>
				<option value="2">��</option>
			</select>
		</td>
		<td nowrap class="title">©��Ⱥ���:</td>
		<td bgcolor="#FFFFFF" colspan=3><input type="text" size="8" name="" value=""/>ƽ����</td>
	</tr>
</table>
</div>
<div id="YXZT" style="display:none">
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">

	<tr height="25" >
		<td class="title">��������״̬</td>
		<td  bgcolor="#FFFFFF" colspan=9>
		<iframe id="main2" frameborder="0" marginwidth="0" marginheight="0" src="yxztLoader.jsp" height="150" width="800">
		</iframe>
		</td>
	</tr>

	<tr height="25" >
		<td rowspan="2" class="title">ˮ��</td>
		<td nowrap class="title">ˮ�����:</td>
		<td bgcolor="#FFFFFF">
		<select>
				<option value="1">һ��</option>
				<option value="2">����</option>
				<option value="2">����</option>
			</select>
		</td>
		<td nowrap class="title">��ǰ����ˮλ:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>��</td>
		<td nowrap class="title">��ǰ����:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>��������</td>
		<td nowrap class="title">��ǰк��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>������/��</td>
		
	</tr>
	<tr height="25" >
		<td  bgcolor="#FFFFFF" colspan="9">
		<iframe id="main3" frameborder="0" marginwidth="0" marginheight="0" src="skLoader.jsp" height="155" width="800">
		</iframe>
		</td>
	</tr>
</table>
</div>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="��  ��" onclick="javascript:per_Submit()">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="">
	</tr>
</table>
</body>
</html>
