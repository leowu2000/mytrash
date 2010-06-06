<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.basesoft.util.StringUtil"%>
<%
	List listGctp = (List)request.getAttribute("listGctp");
	
	int mediawidth = 1000/(listGctp.size() + 1);
	int mediaheight = 600/(listGctp.size() + 1);
	if(mediawidth<100){
		mediawidth = 100;
	}
	if(mediaheight<60){
		mediaheight	= 60;
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>工程图片信息</title>
    
	<script language="javascript" src="../../script/openurl.js"></script>
	<script language="javascript" src="../../script/onmouseover.js"></script>
	<script language="JavaScript" src="../script/layer10.js"></script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
</head>
<body background="../../images/back.gif">
<p>&nbsp;</p>
<form name="form1" method="post" action="../interface/result_hq.asp" target="result"> 
  <table width="68%" border="0" cellspacing="0" align="center"cellpadding="0"  >
<%
	for(int i=0;i<listGctp.size();i++){
		Map mapGctp = (Map)listGctp.get(i);
		
        int size = 8000/1024;
	    String altStr1 = "名称：" + mapGctp.get("NAME");
	    String altStr2 = "描述:" + mapGctp.get("NOTE");
%>
	<tr width="100%">
	  <td>
		<table width="100%">
		  <tr align="middle" height="80"> 
		    <td height="80">		
        	  <img src="media.do?action=gctp&id=<%=mapGctp.get("ID")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','','','','','',event.x,event.y)" onMouseOut="hide()" style="cursor:hand;border=0; height=<%=mediaheight%>;z-index:8;"> 
			</td>
		  </tr>
		  <tr align="middle"> 
		    <td><%=mapGctp.get("NAME")%></td>
		  </tr>			
		</table>
	  </td>		
	</tr>
<%
	}
%>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>

