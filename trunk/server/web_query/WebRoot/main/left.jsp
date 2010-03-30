<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String isAdmin = session.getAttribute("isAdmin").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>实时工情信息系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" type="text/JavaScript">
<!--
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

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}
//-->
</script>
<script language="javascript" src="../script/common.js"></script>
<style type="text/css">
<!--
.unnamed1 {
	font-size: 9pt;
	background-color: #0099CC;
	border: 1px solid #FFFFFF;
	height: 20px;
	color: #FFFFFF;
}
-->
</style>
<style type="text/css">
<!--
td {
	font-size: 9pt;
}
-->
</style>
</head>

<body bgcolor="#31659C" background="images/back3.gif" leftmargin="0" topmargin="0" onLoad="MM_preloadImages('images/interb2_.gif','images/interb8_.gif','images/interb10_.gif','images/interb2__.gif','images/interb8__.gif','images/exitc.gif','images/exit.gif','images/interb6__.gif','images/interb6_.gif','images/interb4__.gif','images/interb4_.gif','images/interb3__.gif','images/interb3_.gif','images/interb9__.gif','images/interb9_.gif','images/interb7__.gif','images/interb7_.gif','images/interb5__.gif','images/interb5_.gif','images/search.jpg')">
<table width="134" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="134" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
      
        <tr> 
          <td> <table border="0" cellpadding="0" cellspacing="0">
		  <tr>
                <td><img src="images/lt.gif" width="134" height="20"></td>
              </tr>
			  <tr> 
                <td><a href="../modules/frames/frame_multi.jsp" target="mainFrame" onClick="MM_nbGroup('down','group1','interb1','images/interb1__.gif',1);" onMouseOver="MM_nbGroup('over','interb1','images/interb1_.gif','',1)" onMouseOut="MM_nbGroup('out')"><img name="interb1" src="images/interb1.gif" border="0" alt onLoad WIDTH="134" HEIGHT="30"></a></td>
              </tr>
              <tr> 
                <td><a href="../modules/frames/frame_xq.jsp" target="mainFrame" onClick="MM_nbGroup('down','group1','interb2','images/interb2__.gif',1)" onMouseOver="MM_nbGroup('over','interb2','images/interb2_.gif','',1)" onMouseOut="MM_nbGroup('out')"><img name="interb2" src="images/interb2.gif" border="0" alt onLoad WIDTH="134" HEIGHT="30"></a></td>
              </tr>
              <tr> 
                <td><a href="../modules/frames/frame_zq.jsp" target="mainFrame" onClick="MM_nbGroup('down','group1','interb6','images/interb6__.gif',1)" onMouseOver="MM_nbGroup('over','interb6','images/interb6_.gif','',1)" onMouseOut="MM_nbGroup('out')"><img name="interb6" src="images/interb6.gif" border="0" alt onLoad WIDTH="134" HEIGHT="30"></a></td>
              </tr>
              <tr> 
                <td><a href="../modules/frames/frame_hq.jsp" target="mainFrame" onClick="MM_nbGroup('down','group1','interb9','images/interb9__.gif',1)" onMouseOver="MM_nbGroup('over','interb9','images/interb9_.gif','',1)" onMouseOut="MM_nbGroup('out')"><img name="interb9" src="images/interb9.gif" border="0" alt onLoad WIDTH="134" HEIGHT="30"></a></td>
              </tr>
              <tr> 
                <td><a href="../modules/frames/frame_yxzt.jsp" target="mainFrame" onClick="MM_nbGroup('down','group1','interb3','images/interb3__.gif',1)" onMouseOver="MM_nbGroup('over','interb3','images/interb3_.gif','',1)" onMouseOut="MM_nbGroup('out')"><img name="interb3" src="images/interb3.gif" border="0" alt onLoad WIDTH="134" HEIGHT="30"></a></td>
              </tr>
              <tr> 
                <td><a href="../modules/frames/frame_fxxd.jsp" target="mainFrame" onClick="MM_nbGroup('down','group1','interb4','images/interb4__.gif',1)" onMouseOver="MM_nbGroup('over','interb4','images/interb4_.gif','',1)" onMouseOut="MM_nbGroup('out')"><img name="interb4" src="images/interb4.gif" border="0" alt onLoad WIDTH="134" HEIGHT="30"></a></td>
              </tr>
              <tr> 
                <td><a href="../modules/frames/frame_fxjb.jsp" target="mainFrame" onClick="MM_nbGroup('down','group1','interb5','images/interb5__.gif',1)" onMouseOver="MM_nbGroup('over','interb5','images/interb5_.gif','',1)" onMouseOut="MM_nbGroup('out')"><img name="interb5" src="images/interb5.gif" border="0" alt onLoad WIDTH="134" HEIGHT="30"></a></td>
              </tr>
              <tr> 
                <td><a href="../modules/frames/frame_media.jsp" target="mainFrame" onClick="MM_nbGroup('down','group1','interb7','images/interb7__.gif',1)" onMouseOver="MM_nbGroup('over','interb7','images/interb7_.gif','',1)" onMouseOut="MM_nbGroup('out')"><img name="interb7" src="images/interb7.gif" border="0" alt onLoad WIDTH="134" HEIGHT="30"></a></td>
              </tr>
              <tr> 
                <td><a href="../modules/frames/frame_consult.jsp" target="mainFrame" onClick="MM_nbGroup('down','group1','interb8','images/interb8__.gif',1)" onMouseOver="MM_nbGroup('over','interb8','images/interb8_.gif','',1)" onMouseOut="MM_nbGroup('out')"><img name="interb8" src="images/interb8.gif" border="0" alt onLoad WIDTH="134" HEIGHT="30"></a></td>
              </tr>
<%
	if("true".equals(isAdmin)){
%>              
              <tr> 
                <td><a href="/user.do?action=list" target="mainFrame" >用户管理</a></td>
              </tr>
<%
	}
%>              
              <tr> 
                <td height="1" bgcolor="#000000"></td>
              </tr>
			    <tr> 
                  <td height="30" align="center"><table border="0" cellspacing="0" cellpadding="2">
                      <tr> 
                        <td align="right"><font color="#FFFFFF">关键字</font>
                        <td> 
                        <td><input name="text_fill" type="text" class="unnamed1" onMouseOver="this.focus()" onFocus="this.value=''" size="8"></td>
                        <td><a  style="cursor:hand" href="../modules/frames/frame_multi.jsp" target="mainFrame" onClick="backimg();MM_nbGroup('down','group1','search','images/search.jpg',1)" onMouseOver="MM_nbGroup('over','search','images/search.jpg','',1)" onMouseOut="MM_nbGroup('out')"><img name="search" src="images/search.jpg" border="0" alt onLoad WIDTH="20" HEIGHT="20"></a></td>
                      	<td><input type="hidden" name="check_projectname" value="true"><input type="hidden" name="check_unit" value="true"><input type="hidden" name="check_title" value="true"></td>
                      </tr>
                    </table> </td>
        </tr>
              <tr> 
                <td height="1" bgcolor="#000000"></td>
              </tr>
            </table>
          <td> </tr>
      </table></td>
  </tr>
  <tr> 
    <td valign="bottom"><a href="javascript:window.close()" target="_parent" onClick="MM_nbGroup('down','group1','exita','images/exitc.gif',1)" onMouseOver="MM_nbGroup('over','exita','images/exit.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/exita.gif" alt name="exita" width="134" height="30" border="0" onload></a></td>
  </tr>
</table>
</body>
</html>

