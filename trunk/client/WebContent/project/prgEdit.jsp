<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="java.util.*" %>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    PrjBean bean = (PrjBean)request.getAttribute("bean");
    String val=bean.getPJNMCD();
    String cntcd = bean.getCNTCD();
    
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
	location.href="/project/prgManage.jsp";
}
function loadSelect(){
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	 xmlHttpReq.open("GET", "/BaseServlet?type=load&val=<%=val%>&cntcd=<%=cntcd%>", false);
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
function submiting(){
	//�����ݿ��в�ѡ�鿴���Ƿ����ͬ��ͬ����Ĺ�����Ϣ������ڷ�����ʾ��Ϣ�������ӵ����ݿ�.
	var gclb = document.forms[0].selectgcgl.value;
	var cntcd = document.forms[0].selectx.value;
	var hldm = document.forms[0].selectzl2.value;
	document.forms[0].gclb.value=gclb;
	document.forms[0].cntcd.value=cntcd;
	document.forms[0].hldm.value=hldm;
	var gcnm = document.forms[0].PJNM.value;
	if(gcnm==""){
		alert("�������Ʋ���Ϊ��,����д!");
		return false;
	}
	if(window.XMLHttpRequest){ //Mozilla
    	var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	xmlHttpReq.open("GET", "/Check?type=prg&gcnm="+gcnm+"&gclb="+gclb+"&cntcd="+cntcd+"&hldm="+hldm, false);
	xmlHttpReq.send(null);
	var result = xmlHttpReq.responseText;
	if(result=="true"){
		alert("ϵͳ�д�����ͬ�Ĺ�������,��������д!");
		return false;
	}else{
		document.forms[0].action="/buiness.do";
		document.forms[0].actionType.value="edit";
		document.forms[0].submit();
	}
}
</script>
<body onload="loadSelect()">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">����������Ϣ</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" name="actionType" value=""/>
<input type="hidden" name="gclsh" value="<%=bean.getPJNO() %>"/>
<input type="hidden" name="gclb" value="">
<input type="hidden" name="cntcd" value="<%=bean.getPJNMCD() %>">
<input type="hidden" name="hldm" value="">
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title">��������[A]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="PJNM" value="<%=bean.getPJNM() %>"/></td>
		<td nowrap align="center" class="title">�������[C]:</td>
		<td  bgcolor="#FFFFFF">
			<DIV id="GCLB"></DIV>
		</td>
	</tr>
	<tr align="left" class="title2" height="30">
		<td colspan="2">��������</td>
		<td colspan="2">��������ˮϵ</td>
	</tr>
	<tr>
		<td nowrap align="center" class="title2">ʡ/ֱϽ��[P]:</td>
		<td bgcolor="#FFFFFF"><DIV id="SHENG"></DIV></td>
		<td nowrap align="center" class="title2">����[V]:</td>
		<td bgcolor="#FFFFFF" ><DIV id="LY"></DIV></td>
	</tr>
	<tr>
		<td nowrap align="center" class="title2">��/����[S]:</td>
		<td  bgcolor="#FFFFFF"><DIV id="SHI"></DIV></td>
		<td nowrap align="center" class="title2">ˮϵ[W]:</td>
		<td  bgcolor="#FFFFFF"><DIV id="SX"></DIV></td>
	</tr>
	<tr align="left" class="title2" height="30">
		<td nowrap align="center" class="title2">��/��[D]:</td>
		<td  bgcolor="#FFFFFF"><DIV id="XIAN"></DIV></td>
		<td nowrap align="center" class="title2">һ��֧��[B]:</td>
		<td  bgcolor="#FFFFFF"><DIV id="ZL1"></DIV></td>
	</tr>
	<tr>
		<td  bgcolor="#FFFFFF" colspan="2"></td>
		<td nowrap align="center" class="title2">����֧��[T]:</td>
		<td  bgcolor="#FFFFFF"><DIV id="ZL2"></DIV></td>
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
