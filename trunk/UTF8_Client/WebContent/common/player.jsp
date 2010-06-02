<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.core.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.core.*"%>
<%@ page import="java.io.BufferedOutputStream" %>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<%
	String filename = "/common/pic/"+(String)request.getAttribute("filename");
%>

<html>
<head>
<title></title>
<body >

<div style="margin-top:0; margin-left:0;width:500; height:400;backgorund-color:red;">
<object id="player" height="500" width="500" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"> 
	<param NAME="url" value="<%=filename %>"> 
</object>
<!-- 
<object classid="clsid:05589FA1-C356-11CE-BF01-00AA0055595A" id="ActiveMovie1" width="500" height="400">
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
<param name="Filename" value="/common/pic/" valuetype="ref" />
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
</object> -->
</div>
</body></html>
