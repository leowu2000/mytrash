<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
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
.lt1{

	font-family: "����";
	font-size: 9pt;
	font-weight: normal;
	color: #484833;
	text-decoration: none;
	text-align:center;
	background-color: #FFFFFF;
}
.lt2 {

	font-family: "����";
	font-size: 9pt;
	font-weight: normal;
	color: #484833;
	text-decoration: none;
	text-align:center;
	background-color: #F2F5EB;
}
.title {
	font-size: 10pt;
	padding-top: 2px;
	font-weight: bolder;
	color: #000000;
	background-color: #E8EFFF;
	text-align:center;
}
.title2 {
	font-size: 10pt;
	padding-top: 2px;
	font-weight: bolder;
	color: #000000;
	background-color: #E8EFFF;
	text-align:left;
}
#newPreview
{
filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
width :120px; 
height:80px; 
borde:6px double #ccc;
}

-->
</style>
<%
	String path = request.getRealPath("/");
	List<PrjBean> beanList = BuinessDao.getAllList(path);
%>
<script language="JAVASCRIPT">
function toAdd(){
	location.href="/project/prgAdd.jsp";
}
function loadSelect(){
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/BaseServlet?type=load", false);
	  xmlHttpReq.send(null);
	 var result = xmlHttpReq.responseText;
	 var val = result.split(";");
	 SHENG.innerHTML=val[0];
	 SHI.innerHTML=val[1];
	 XIAN.innerHTML=val[2];
	 GCLB.innerHTML=val[3];
	 LY.innerHTML=val[4];
	 SX.innerHTML=val[5];
	 ZL1.innerHTML=val[6];
	 ZL2.innerHTML=val[7];
}
function changeValue(style,type,obj){
	if(window.XMLHttpRequest){ //Mozilla
    	var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	 // alert("/BaseServlet?type=change&changeObjName="+style+"&changeType="+type+"&changeVal="+obj.value);
	  xmlHttpReq.open("GET", "/BaseServlet?type=change&changeObjName="+style+"&changeType="+type+"&changeVal="+obj.value, false);
	  xmlHttpReq.send(null);
	  var result = xmlHttpReq.responseText;
	  if(style=='sx'){
		  if(type=='1'){
			  var val = result.split(";");
			  SHI.innerHTML=val[0];
			  XIAN.innerHTML=val[1];
			}else{
				XIAN.innerHTML=result;
			}
	  }
	  if(style=="ly"){
			if(type=="1"){
				 var val = result.split(";");
				 SX.innerHTML=val[0];
				 ZL1.innerHTML=val[1];
				 ZL2.innerHTML=val[2];
			}
			if(type=="2"){
				 var val = result.split(";");
				 ZL1.innerHTML=val[0];
				 ZL2.innerHTML=val[1];
			}
			if(type=="3"){
				ZL2.innerHTML=result;
			}
		}
	}
function PreviewImg(imgFile) 
{ 
 
	//�µ�Ԥ�����룬֧�� IE6��IE7�� 
	var newPreview = document.getElementById("newPreview"); 
	//newPreview.style.filter="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value; 
	newPreview.style.width = "120px"; 
	newPreview.style.height = "80px"; 
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
	}else{
		YXZT.style.display="none";
		GCXQ.style.display="inline";
	}

		
}
</script> 
<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">��������ɼ���Ϣ</span></td></tr>
</table>
<form name="form1" method="POST" enctype="multipart/form-data"> 
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title2" colspan="6">
			<input type="radio" id="myradio" name="myradio" value="1" checked>��������״̬[R]
			<input type="radio" id="myradio" name="myradio" value="2" >��������[G]
		</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">��������[B]:</td>
		<td bgcolor="#FFFFFF">
		<select>
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
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">���ղ�λ[P]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">�������[N]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">���λ[U]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">����ʱ��[T]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">�������[N]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">���λ[U]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">����ʱ��[T]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
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
	<tr height="80" >
		<td bgcolor="#FFFFFF" colspan="2" rowspan="2">&nbsp;</td>
		<td nowrap class="title">��Ƭ����</td> 
		<td bgcolor="#FFFFFF"><textarea rows="5"></textarea></td>
		<td class="title" colspan="2"><div id="newPreview" ></div></td>
		
	</tr>
	<tr>
		<td class="title" colspan="4">
			<input type="button" name="" value="������Ƭ"/>&nbsp;&nbsp;&nbsp;
			<input type="button" name="" value="��ϸ��Ϣ" onclick="javascript:showDetail()"/>
		</td>
	</tr>
</table>
<BR></BR>
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
	<tr height="25" >
		<td nowrap class="title" colspan="2">��������</td>
		<td nowrap class="title" colspan="2">���շ���</td>
		<td nowrap class="title" colspan="2">������Դ�䱸</td>
		<td nowrap class="title" colspan="4">��չ�����</td>
	</tr>
	
	<tr height="25" >
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="�����Ӳ�������" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="���������շ���" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="������������Դ�䱸" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="4">
			<a title="�����ӽ�չ�����" href=""><img src="/images/add.gif" border="0"></a>
		</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2">����ԭ�����</td>
		<td nowrap class="title" colspan="2">���鷢չ����</td>
		<td nowrap class="title" colspan="2">����Ӱ�췶Χ</td>
		<td nowrap class="title" colspan="2">����ʱ�������</td>
		<td nowrap class="title" >δ��ˮ���������</td>
	</tr>
	<tr height="25" >
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="����������ԭ�����" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="���������鷢չ����" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="�����ӿ���Ӱ�췶Χ" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="����������ʱ�������" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" >
			<a title="������δ��ˮ���������" href=""><img src="/images/add.gif" border="0"></a>
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
		<td bgcolor="#FFFFFF" colspan=3><input type="text" name="" value=""/>ƽ����</td>
	</tr>
</table>
</div>
<div id="YXZT" style="display:none">
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">

	<tr height="25" >
		<td rowspan="3" class="title">��������״̬</td>
		<td nowrap class="title">����Ԥ��:</td>
		<td bgcolor="#FFFFFF" colspan=9><textarea cols="80" rows="5"></textarea></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">�̷�����״��:</td>
		<td bgcolor="#FFFFFF" colspan=9><textarea cols="80" rows="5"></textarea></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">����:</td>
		<td bgcolor="#FFFFFF" colspan=9><textarea cols="80" rows="5"></textarea></td>
	</tr>
	<tr height="25" >
		<td rowspan="6" class="title">ˮ��</td>
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
		<td nowrap class="title" colspan="2">�ӻ����״��</td>
		<td nowrap class="title" colspan="2">�����ȶ�״��</td>
		<td nowrap class="title" colspan="2">���»����ȶ����</td>
		<td nowrap class="title" colspan="2">ͨѶ�ֶμ�״��</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2">йˮ������״��</td>
		<td nowrap class="title" colspan="2">й�ܹ����״��</td>
		<td nowrap class="title" colspan="4">բ�š���ջ�״��</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
		<td nowrap class="title" colspan="4"><textarea cols="40" rows="3"></textarea></td>
	</tr>
	
</table>
</div>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="��  ��" onclick="">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="">
	</tr>
</table>
</body>
</html>
