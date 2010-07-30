<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String rootPath = request.getSession().getServletContext().getRealPath("/"); //应用程序根目录
	String iniPath = rootPath + "/WEB-INF/system.ini"; //配置文件路径	


	String ip = StringUtils.getProperty(iniPath, "IP_SH"); //地区系统IP地址

	String targetURL = "http://" + ip;
	System.out.println(targetURL);

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" language="javascript">
        document.domain = <%=targetURL%>;
        
        function sendRequest(method, url)
        {
            var request = new XMLHttpRequest();
            request.open(method, url);
            request.send(null);
        }
    </script>

</head>
<body>

</body>
</html>