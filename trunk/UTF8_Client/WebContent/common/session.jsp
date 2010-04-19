<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.fredck.FCKeditor.FCKeditor"%>
<%@ page import="com.core.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<% 
	String relPath = request.getSession().getServletContext().getRealPath("/");
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    ConfigBean configBean = BuinessDao.findConfigBean(relPath);
    if("".trim().equals(configBean.getTBDW())){
%>
	<script langue="javascript">
		alert("请先配置系统参数!");
		this.location="/sys/config.jsp";
	</script>
<%
    }else{ 
    	request.getSession().setAttribute("configBean",configBean);
    }
%> 
<html>
<head>
<title></title>
</head>


</html>	

