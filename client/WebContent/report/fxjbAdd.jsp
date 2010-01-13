<%@ page contentType="text/html;charset=UTF-8"%>
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

	font-family: "宋体";
	font-size: 9pt;
	font-weight: normal;
	color: #484833;
	text-decoration: none;
	text-align:center;
	background-color: #FFFFFF;
}
.lt2 {

	font-family: "宋体";
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
-->
</style>

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
</script>
<body>
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">新增工情信息</span></td></tr>
</table>
<form name="frm" action="" method="post">
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title">工程名称[A]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap align="center" class="title">工程类别[C]:</td>
		<td  bgcolor="#FFFFFF">
			<DIV id="GCLB"></DIV>
		</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td colspan="2" valign="top">
			<table width="100%" border="0">
			<tr align="left" class="title2" height="30">
				<td colspan="2">所属地区</td>
			</tr>
			<tr>
				<td nowrap align="center" class="title2">省/直辖市[P]:</td>
				<td bgcolor="#FFFFFF">
						<DIV id="SHENG"></DIV>
				</td>
			</tr>
			<tr>
				<td nowrap align="center" class="title2">市/地区[S]:</td>
				<td  bgcolor="#FFFFFF">
					<DIV id="SHI"></DIV>
				</td>
			</tr>
			<tr>
				<td nowrap align="center" class="title2">区/县[D]:</td>
				<td  bgcolor="#FFFFFF">
					<DIV id="XIAN"></DIV>
				</td>
				</tr>
			</table>
		</td>
		<td colspan="2">
			<table width="100%" border="0">
			<tr align="left" class="title2" height="30">
				<td colspan="2">所属流域水系</td>
			</tr>
			<tr>
				<td nowrap align="center" class="title2">流域[V]:</td>
				<td bgcolor="#FFFFFF" colspan="5">
					<DIV id="LY"></DIV>
				</td>
			</tr>
			<tr height="25" >
				<td nowrap align="center" class="title2">水系[W]:</td>
				<td  bgcolor="#FFFFFF">
					<DIV id="SX"></DIV>
				</td>
			</tr>
			<tr>
				<td nowrap align="center" class="title2">一级支流[B]:</td>
				<td  bgcolor="#FFFFFF">
					<DIV id="ZL1"></DIV>
				</td>
			</tr>
			<tr>
				<td nowrap align="center" class="title2">二级支流[T]:</td>
				<td  bgcolor="#FFFFFF">
					<DIV id="ZL2"></DIV>
				</td>
			</tr>
			</table>
		</td>	
	</tr>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="">
	</tr>
</table>
</body>
</html>
