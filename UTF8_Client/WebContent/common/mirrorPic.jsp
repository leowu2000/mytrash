<%@ page contentType="text/html;charset=UTF-8"%>
<%
	String filepath=request.getParameter("filepath");
	filepath = java.net.URLDecoder.decode(filepath , "UTF-8");
	String newpath = filepath.replaceAll("\\\\","\\\\\\\\");
%>
<html>
<head>
<title></title>
<script type="text/javascript" src="/common/js/jquery1.3.2.js"></script>
</head>
<BODY> 
<div contentEditable=true>
<img src="<%=newpath %>"  name="image" 
 title="先点击一下图片，然后可以拖动改变图片大小"></img></div>
 
</BODY> 
</html>	

