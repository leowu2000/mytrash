<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.util.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	String rootPath = request.getSession().getServletContext().getRealPath("/"); //应用程序根目录
	String iniPath = rootPath + "/WEB-INF/system.ini"; //配置文件路径	

	String pjno = request.getParameter("pjno");
	PrjBean bean = BuinessDao.findBySql("SELECT * FROM TB_PJ WHERE PJNO="+pjno,rootPath);
	//System.out.println(bean.getPJNM()+bean.getCNTCD());
	String sxmc = BuinessDao.idToNameChange(rootPath, "TB_CNT",
			"PROVNM", " CNTCD='"+bean.getCNTCD()+"'");

	String ip = StringUtils.getProperty(iniPath, "IP_SH"); //地区系统IP地址

	String targetURL = "http://" + ip;
	//System.out.println(targetURL);

%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function toView(id){
	window.frames["SHOWCONTENT"].location.href="<%=targetURL%>/modules/gcdata/"+id;
}
function toViewPic(id){
	window.frames["SHOWCONTENT"].location.href="<%=targetURL%>/gctp.do?action=gctp&gclj="+id;
}
function ajaxRequest(){
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	 xmlHttpReq.open("GET", "<%=targetURL%>/search.do?action=client_gcxxajax&sxmc="+encodeURI(encodeURI('<%=sxmc%>'))+"&skmc="+encodeURI(encodeURI('<%=bean.getPJNM()%>')), false);
	 xmlHttpReq.send(null);
	 var result = xmlHttpReq.responseText;
	// alert(result);
	 var htmls = result.split(";");
	 window.frames["SHOWCONTENT"].location.href="<%=targetURL%>/modules/gcdata/"+htmls[0];
	 THEDIV.innerHTML="<table width='100%'><tr>"
		 				+"<td align='right'><a href='#' onclick='javascript:toView(\""+htmls[0]+"\")'>工程简介</a></td>"
		 				+"<td width='5%'>&nbsp;</td>"
		 				+"<td align='center'><a href='#' onclick='javascript:toView(\""+htmls[1]+"\")'>水库特性</a></td>"
		 				+"<td width='5%'>&nbsp;</td>"
		 				+"<td align='left'><a href='#' onclick='javascript:toViewPic(\""+htmls[0]+"\")'>相关图片</a></td>"
		 				+"</tr></table>";
}

</script>
<body onload="javascript:ajaxRequest()">
<DIV id="THEDIV" height="50"></DIV>
<iframe name="SHOWCONTENT" src=""  frameborder="0" marginheight="1" marginwidth="1" height="450" width="100%" ></iframe>
</body>
</html>