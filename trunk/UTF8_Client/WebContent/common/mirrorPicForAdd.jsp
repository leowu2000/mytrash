<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.util.UtilDateTime" %>
<%
	String filepath=request.getParameter("filepath");
	filepath = java.net.URLDecoder.decode(filepath , "UTF-8");
	String newpath = filepath.replaceAll("\\\\","\\\\\\\\");
	String teail = newpath.substring(newpath.lastIndexOf("."),newpath.length());
	String filename = System.currentTimeMillis()+teail;
	String realpath = request.getRealPath("/")+"/common/pic/"+filename;
	try{
		FileInputStream fis = new FileInputStream(filepath);
		FileOutputStream fos = new FileOutputStream(realpath);
		byte[] buff = new byte[1024];
		int readed = -1;
		while((readed = fis.read(buff)) > 0)
		    fos.write(buff, 0, readed);
		fis.close();
		fos.close();

	}catch(Exception ex){ex.printStackTrace();}
%>
<html>
<head>
<title></title>
<script type="text/javascript" src="/common/js/jquery1.3.2.js"></script>
</head>
<BODY> 
<div contentEditable=true><img src="/common/pic/<%=filename %>"  name="image" 
 title="先点击一下图片，然后可以拖动改变图片大小"></img></div>
</BODY> 
</html>	

