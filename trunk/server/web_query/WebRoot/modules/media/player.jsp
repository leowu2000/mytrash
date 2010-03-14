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
		<object classid="clsid:05589FA1-C356-11CE-BF01-00AA0055595A"
			id="ActiveMovie1" width="500" height="400">
			<param name="Appearance" value="0" />
			<param name="AutoStart" value="-1" />
			<param name="AllowChangeDisplayMode" value="-1" />
			<param name="AllowHideDisplay" value="0" />
			<param name="AllowHideControls" value="-1" />
			<param name="AutoRewind" value="-1" />
			<param name="Balance" value="0" />
			<param name="CurrentPosition" value="0" />
			<param name="DisplayBackColor" value="0" />
			<param name="DisplayForeColor" value="16777215" />
			<param name="DisplayMode" value="0" />
			<param name="Enabled" value="-1" />
			<param name="EnableContextMenu" value="-1" />
			<param name="EnablePositionControls" value="-1" />
			<param name="EnableSelectionControls" value="0" />
			<param name="EnableTracker" value="-1" />
			<param name="Filename" value="<%=filepath %>" valuetype="ref" />
			<param name="FullScreenMode" value="0" />
			<param name="MovieWindowSize" value="0" />
			<param name="PlayCount" value="1" />
			<param name="Rate" value="1" />
			<param name="SelectionStart" value="-1" />
			<param name="SelectionEnd" value="-1" />
			<param name="ShowControls" value="-1" />
			<param name="ShowDisplay" value="0" />
			<param name="ShowPositionControls" value="0" />
			<param name="ShowTracker" value="-1" />
			<param name="Volume" value="-480" />
		</object>

	</body>
</html>
