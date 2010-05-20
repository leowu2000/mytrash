<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>工程信息查询Frame</title>
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
parent.document.getElementById('lineFrame').src = 'line.htm';
// -->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" onresize="IFrameResize(50);" onLoad="IFrameResize(50)"  >
<iframe name="queryFrame" id="queryFrame" height='50' width='100%' style="" scrolling="NO" frameborder='0' src="/search.do?action=search_gcxx" ></iframe>
<iframe name="result" id="result" width="100%" frameborder='0'></iframe>
</body>
</html>