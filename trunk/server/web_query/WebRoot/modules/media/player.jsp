<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String filepath = request.getAttribute("filepath").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>视频播放</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
	<object id="player" height="500" width="500" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"> 
   		<param NAME="url" value="<%=filepath %>"> 
   	</object>
  </center> 
  </body>
</html>
