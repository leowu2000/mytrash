<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>多媒体信息查询Frame</title>
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
<body bgcolor="#FFFFFF" text="#000000" onresize="IFrameResize(105);" onLoad="IFrameResize(105)"  >
<iframe name="queryFrame" height='105' width='100%' style="" scrolling="NO" frameborder='0' src="../search/search_media.jsp" ></iframe>
<iframe name="result" width="100%" frameborder='0'></iframe>
</body>
</html>