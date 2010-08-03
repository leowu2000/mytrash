<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.basesoft.util.StringUtil"%>
<%
	List listGctp = (List)request.getAttribute("listGctp");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>工程图片信息</title>
    
	<script language="javascript" src="../../script/openurl.js"></script>
	<script language="javascript" src="../../script/onmouseover.js"></script>
	<script language="JavaScript" src="../../script/layer10.js"></script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
</head>
<body background="../../images/back.gif">
<form name="form1" method="post" action="../interface/result_hq.asp" target="result"> 
<div width="1000" style="overflow: auto;">
<%
	if(listGctp.size() == 0){
%>
<center><h2>暂无图片</h2></center>
<%
	} else {
		for(int i=0;i<listGctp.size();i++){
			Map mapGctp = (Map)listGctp.get(i);
			
	        int size = 8000/1024;
		    String altStr1 = "名称：" + mapGctp.get("NAME");
		    String altStr2 = "描述:" + mapGctp.get("NOTE");
%>
    <div style="width:180;float:left;margin-left:15;margin-bottom:15;"><img src="media.do?action=gctp&id=<%=mapGctp.get("ID")%>" onclick="window.location='../modules/view/view_gctp.jsp?id=<%=mapGctp.get("ID") %>&name=<%=mapGctp.get("NAME") %>&note=<%=mapGctp.get("NOTE") %>'" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','','','','','',event.x,event.y)" onMouseOut="hide()" style="cursor:hand;border=0; width='180';z-index:8;"> 
	<center><%=mapGctp.get("NAME") %></center>
	</div>
<%
		}
	}
%>
  <p>&nbsp;</p>
</form>
</body>
</html>

