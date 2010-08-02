<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--#include file="config.asp"-->
<%
//	Application("Conn_cpj_ConnectionString") = "DSN="&DNS&";PASSWORD="&PASSWORD&";UID="&UID&"" '使用ODBC的连接。
//'	Application("Conn_cpj_ConnectionString")="Provider=OraOLEDB.Oracle.1;Persist Security Info=True;User ID="&UID&";Password="&PASSWORD&";Data Source="&DNS&"" '使用OLEDB的连接
//	Application("Conn_cpj_ConnectionTimeout") = 15
//	Application("Conn_cpj_CommandTimeout") = 30
//	Application("Conn_cpj_CursorLocation") = 3

//	'session.Timeout =6000
//	session("logined") = true
//	session("user_level") = 5
//	session("admin_passed") = false
//'	Response.Redirect ("main/framedocc.htm")
%>
<OBJECT id=closes type="application/x-oleobject" classid="clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11"> 
<param name="Command" value="Close"> 
</object> 
<script language="JavaScript">
<!--
closes.Click();
// -->
</script>
<script>
<!--
function login(){
	document.getElementById('loginForm').submit();
}
//winopen()
//-->
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>防汛抗旱信息采集传输管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

document.onkeydown = function(event){   
        var e=event || window.event;   
        var keyCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;   
        if(keyCode == 13){   
            login();  
        }   
    }
//-->
</script>
</head>

<body bgcolor="#31659C" leftmargin="0" topmargin="0" onLoad="MM_preloadImages('images/ssgqindex_r4_c1_.gif')">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/back.jpg">
        <tr> 
          <td><table width="135" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="images/ssgqindex_r1_c1.jpg" width="440" height="233"></td>
                <td><img src="images/ssgqindex_r1_c4.jpg" width="260" height="233"></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <img src="images/ssgqindex_r2_c1.gif" width="202" height="18"> <br>
      <form action="/login.do?action=login" name="loginForm" id="loginForm" method="POST">
      	<table>
      	  <tr>
      	  	<td>
      &nbsp;&nbsp;&nbsp;&nbsp;<font color="#FFFFFF" size="2">用户名：</font>
      		</td>
      		<td><input type="text" name="username" style="width:85"></td>
      	  </tr>
      	  <tr>
      	    <td>
      &nbsp;&nbsp;&nbsp;&nbsp;<font color="#FFFFFF" size="2">密码：</font>
      	    </td>
      	    <td>
      	      <input type="password" name="password" style="width:85">
      	    </td>
      	  </tr> 
      	</table> 
      </form>
      <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image8','','images/ssgqindex_r3_c1_.gif',1)"  onClick="login();"><img src="images/ssgqindex_r3_c1.gif" name="Image8" width="202" height="33" border="0"></a><br>
      <a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image9','','images/ssgqindex_r4_c1_.gif',1)"  onClick="self.close()"><img src="images/ssgqindex_r4_c1.gif" name="Image9" width="202" height="31" border="0"></a> 
      <br> 
      <img src="images/ssgqindex_r5_c1.gif" width="202" height="19"> <br> </td>
  </tr>
  <tr> 
    <td><img src="images/ssgqindex_r6_c1.gif" width="250" height="66"> </td>
  </tr>
</table>
</body>
</html>
