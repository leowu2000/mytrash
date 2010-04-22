<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    String path = request.getSession().getServletContext().getRealPath("/");
    ConfigBean bean = BuinessDao.findConfigBean(path);
    String val = bean.getXZQH_S()+"-"+bean.getXZQH_SI()+"-"+bean.getXZQH_X();
    String cntcd = bean.getLYSX_LY()+"-"+bean.getLYSX_SX()+"-"+bean.getLYSX_YJZL()+"-"+bean.getLYSX_EJZL();
	String msg = (String)request.getAttribute("msg");
	msg=msg==null?"":msg;
    
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
function loadSelect(){
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/BaseServlet?type=load&val=<%=val%>&cntcd=<%=cntcd%>&from=config", false);
	  xmlHttpReq.send(null);
	 var result = xmlHttpReq.responseText;
	 var val = result.split(";");
	 XZQH_S.innerHTML=val[0];
	 XZQH_SI.innerHTML=val[1];
	 XZQH_X.innerHTML=val[2];
	 //GCLB.innerHTML=val[3];
	 LYSX_LY.innerHTML=val[4];
	 LYSX_SX.innerHTML=val[5];
	 LYSX_YJZL.innerHTML=val[6];
	 LYSX_EJZL.innerHTML=val[7];
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
			  XZQH_SI.innerHTML=val[0];
			  XZQH_X.innerHTML=val[1];
			}else{
				XZQH_X.innerHTML=result;
			}
	  }
	  if(style=="ly"){
			if(type=="1"){
				 var val = result.split(";");
				 LYSX_SX.innerHTML=val[0];
				 LYSX_YJZL.innerHTML=val[1];
				 LYSX_EJZL.innerHTML=val[2];
			}
			if(type=="2"){
				 var val = result.split(";");
				 LYSX_YJZL.innerHTML=val[0];
				 LYSX_EJZL.innerHTML=val[1];
			}
			if(type=="3"){
				LYSX_EJZL.innerHTML=result;
			}
		}
	}
function pre_submit(){
	//if(getRadioValue()==""){
	//	alert("��ѡ��װλ��!");
	//	return false;
	//}
	if(document.forms[0].TBDW.value==""){
		alert("����д���λ��");
		return false;
	}
	if(document.forms[0].BSDW.value==""){
		alert("����д���͵�λ��");
		return false;
	}
	if(document.forms[0].SERVER_NAME.value==""){
		alert("����д���������ƣ�");
		return false;
	}
	if(document.forms[0].SERVER_IP.value==""){
		alert("����д��������ַ��");
		return false;
	}
	if(document.forms[0].SERVER_PORT.value==""){
		alert("����д�������˿ڣ�");
		return false;
	}
	if(isNaN(document.forms[0].SERVER_PORT.value)){
		alert("�˿ں�ֻ����д���֣�");
		return false;
	}
	if(document.forms[0].SERVER_IP.value!=""){
		var exp=/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
	    var reg = document.forms[0].SERVER_IP.value.match(exp);
	    if(reg==null)
	    {
	        alert("���������һ���Ƿ���IP��ַ�Σ�\nIP��Ϊ��:xxx.xxx.xxx.xxx��xxxΪ0-255)��");
	        return false;
	    }
	}
	if(confirm("����������ã���ȷ�ϣ�")){
		document.forms[0].submit();
	}
}
//function getRadioValue(){
//	var objs = document.getElementsByName('CLIENT_TYPE');
//	for(var i=0;i<objs.length;i++){
//		if(objs[i].checked)
//			return objs[i].value;
//	}
//	return "";

//}
</script>
<body  onload="loadSelect()">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">��  ��  ��  �� </span></td></tr>
</table>
<form name="frm" action="/buiness.do" method="post">
<input type="hidden" name="actionType" value="parames"/>
<input type="hidden" name="CLIENT_TYPE" value="�ɼ���"/>
<table width="90%" align="center">
	<tr><td align="center" style='FONT-SIZE: 12px;color:red'><%=msg %></td></tr>
</table>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<!--  
		<td nowrap class="title">��װλ��</td>
		<td bgcolor="#FFFFFF">
		<input type="radio" name="CLIENT_TYPE" id="CLIENT_TYPE"  value="������" <%if(bean.getCLIENT_TYPE().trim().equals("������")){ %>checked<%} %>/>������
		<input type="radio" name="CLIENT_TYPE" id="CLIENT_TYPE"  value="�ɼ���" <%if(bean.getCLIENT_TYPE().trim().equals("�ɼ���")){ %>checked<%} %>/>�ɼ���<font color="red">*</font>
		</td>-->
		<td nowrap class="title">���λ</td>
		<td bgcolor="#FFFFFF"><input type="text" name="TBDW" value="<%=bean.getTBDW()==null?"":bean.getTBDW() %>"/><font color="red">*</font></td>
		<td nowrap class="title">���͵�λ</td>
		<td bgcolor="#FFFFFF" colspan="4"><input type="text" name="BSDW" value="<%=bean.getBSDW()==null?"":bean.getBSDW() %>"/><font color="red">*</font></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">��������</td>
		<td bgcolor="#FFFFFF"><DIV id="XZQH_S"></DIV></td>
		<td nowrap class="title">��/����</td>
		<td bgcolor="#FFFFFF"><DIV id="XZQH_SI"></DIV></td>
		<td nowrap class="title">��/��</td>
		<td bgcolor="#FFFFFF"><DIV id="XZQH_X"></DIV></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">����</td>
		<td bgcolor="#FFFFFF"><DIV id="LYSX_LY"></DIV></td>
		<td nowrap class="title">ˮϵ</td>
		<td bgcolor="#FFFFFF"><DIV id="LYSX_SX"></DIV></td>
		<td nowrap class="title">һ��֧��</td>
		<td bgcolor="#FFFFFF"><DIV id="LYSX_YJZL"></DIV></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">����֧��</td>
		<td bgcolor="#FFFFFF"><DIV id="LYSX_EJZL"></DIV></td>
		<td nowrap class="title">��Ѵ������</td>
		<td bgcolor="#FFFFFF"><input type="text" name="FXZRR" value="<%=bean.getFXZRR()==null?"":bean.getFXZRR() %>"/></td>
		<td nowrap class="title">��ϵ�绰</td>
		<td bgcolor="#FFFFFF"><input type="text" name="LXDH" value="<%=bean.getLXDH()==null?"":bean.getLXDH() %>"/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">ǩ��</td>
		<td bgcolor="#FFFFFF"><input type="text" name="QF" value="<%=bean.getQF()==null?"":bean.getQF() %>"/></td>
		<td nowrap class="title">���</td>
		<td bgcolor="#FFFFFF"><input type="text" name="NG" value="<%=bean.getNG()==null?"":bean.getNG() %>"/></td>
		<td nowrap class="title">���</td>
		<td bgcolor="#FFFFFF"><input type="text" name="SH" value="<%=bean.getSH()==null?"":bean.getSH() %>"/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">����������</td>
		<td bgcolor="#FFFFFF"><input type="text" name="SERVER_NAME" value="<%=bean.getSERVER_NAME()==null?"":bean.getSERVER_NAME() %>"/><font color="red">*</font></td>
		<td nowrap class="title">��������ַ</td>
		<td bgcolor="#FFFFFF"><input type="text" name="SERVER_IP" value="<%=bean.getSERVER_IP()==null?"":bean.getSERVER_IP() %>"/><font color="red">*</font></td>
		<td nowrap class="title">�������˿�</td>
		<td bgcolor="#FFFFFF"><input type="text" name="SERVER_PORT" value="<%=bean.getSERVER_PORT()==""?"9292":bean.getSERVER_PORT() %>"/><font color="red">*</font></td>
	</tr>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="��  ��" onclick="javascript:pre_submit()">
	</tr>
</table>
</body>
</html>
