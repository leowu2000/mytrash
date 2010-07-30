<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.util.*" %>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    PrjBean bean = (PrjBean)request.getAttribute("bean");

    String pjno = bean.getPJNO();
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
	 xmlHttpReq.open("GET", "/BaseServlet?type=viewload&val=<%=val%>&cntcd=<%=cntcd%>&pjno=<%=pjno%>", false);
	 xmlHttpReq.send(null);
	 var result = xmlHttpReq.responseText;
	 var val = result.split(";");
	 SHENG.innerHTML=val[0];
	 SHI.innerHTML=val[1];
	 XIAN.innerHTML=val[2];
	 GCLB.innerHTML=val[3]+val[8];
	 LY.innerHTML=val[4];
	 SX.innerHTML=val[5];
	 ZL1.innerHTML=val[6];
	 ZL2.innerHTML=val[7];
}



function toInternetUrl(){
	window.open("/project/show.jsp?pjno=<%=pjno%>","","height=550,width=800,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top=100,left=100,resizable=yes");
}

</script>
<body onload="loadSelect()">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">�鿴������Ϣ</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" name="actionType" value=""/>
<input type="hidden" name="gclsh" value="<%=bean.getPJNO() %>"/>
<input type="hidden" name="gclb" value="">
<input type="hidden" name="cntcd" value="">
<input type="hidden" name="hldm" value="">
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<tr  height="30">
		<td nowrap align="center" class="title">��������</td>
		<td bgcolor="#FFFFFF"><%=bean.getPJNM() %></td>
		<td nowrap align="center" class="title">�������</td>
		<td  bgcolor="#FFFFFF">
			<DIV id="GCLB"></DIV>
		</td>
	</tr>
	<tr align="left" class="title" height="30">
		<td colspan="2">��������</td>
		<td colspan="2">��������ˮϵ</td>
	</tr>
	<tr height="30">
		<td nowrap align="center" class="title">ʡ/ֱϽ��</td>
		<td bgcolor="#FFFFFF"><DIV id="SHENG"></DIV></td>
		<td nowrap align="center" class="title">����</td>
		<td bgcolor="#FFFFFF" ><DIV id="LY"></DIV></td>
	</tr>
	<tr height="30">
		<td nowrap align="center" class="title">��/����</td>
		<td  bgcolor="#FFFFFF"><DIV id="SHI"></DIV></td>
		<td nowrap align="center" class="title">ˮϵ</td>
		<td  bgcolor="#FFFFFF"><DIV id="SX"></DIV></td>
	</tr>
	<tr align="left" height="30">
		<td nowrap align="center" class="title">��/��</td>
		<td  bgcolor="#FFFFFF"><DIV id="XIAN"></DIV></td>
		<td nowrap align="center" class="title">һ��֧��</td>
		<td  bgcolor="#FFFFFF"><DIV id="ZL1"></DIV></td>
	</tr>
	<tr height="30">
		<td nowrap align="center" class="title">����֧��</td>
		<td  bgcolor="#FFFFFF"><DIV id="ZL2"></DIV></td>
		<td  bgcolor="#FFFFFF" colspan="2" align="center">
		<%
			if(bean.getPJNMCD().substring(0,1).trim().toUpperCase().equals("B")){
		%>
		<a href="#" onclick="javascript:toInternetUrl();return false;"><b>�����鿴ˮ����ϸ��Ϣ</b></a>
		<%}else{ %>
		
		<%} %>
		</td>
		
	</tr>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
