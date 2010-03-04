<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    String path = request.getSession().getServletContext().getRealPath("/");
    List<String> valList = OutputLog.readData(path+"\\sys\\syslog.txt");
    
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
</head>
<style type="text/css">
<!--

-->
</style>

<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">系 统 日 志 </span></td></tr>
</table>
<table width="98%" align="center">
	<%for(String val:valList){%>
	<tr><td align="left" ><%=val %></td></tr>
	<%} %>
</table>
</body>
</html>
