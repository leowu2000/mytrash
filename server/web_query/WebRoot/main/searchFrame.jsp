<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="../script/common.js"></script>

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
<frameset  onload="javascript:setinit(170);" name="rowsset"  rows="0,*" frameborder="NO" border="0" framespacing="0" cols="*"> 
  <frame name="queryFrame" scrolling="NO" noresize src="/modules/search/search_main.jsp" >
  <frame name="result">
</frameset>
<noframes>
<body bgcolor="#FFFFFF" text="#000000"  >
</body>
</noframes> 
</html>