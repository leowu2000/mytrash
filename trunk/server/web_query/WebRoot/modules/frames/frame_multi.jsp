<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>综合查询Frame</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" src="../../script/common.js"></script>

<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
</head>
<%
	//command  = trim(Request("command"))
	//check_projectname  = trim(Request("check_projectname"))
	//check_unit  = trim(Request("check_unit"))
	//check_title  = trim(Request("check_title"))
	//text_fill  = trim(Request("text_fill"))
	
	//'session("select_sortinfo") = "default"

%>
<body bgcolor="#FFFFFF" text="#000000" onresize="IFrameResize(170);" onLoad="IFrameResize(170)" >
<iframe name="queryFrame" height='170' width='100%' style="display:none" scrolling="NO" frameborder='0' src="../search/search_multi.jsp" ></iframe>
<iframe name="result" width="100%" frameborder='0' height=""></iframe>
</body>
</html>