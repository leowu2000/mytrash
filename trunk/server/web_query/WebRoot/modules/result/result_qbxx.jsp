<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.core.PageList"%>
<%@ page import="com.basesoft.core.PageInfo"%>
<%@page import="com.basesoft.util.StringUtil"%>
<%
	//Map mapQbxx = (Map)request.getAttribute("mapQbxx");

	List listXq = (List)session.getAttribute("listXq");
	List listYxzt = (List)session.getAttribute("listYxzt");
	List listFxjb = (List)session.getAttribute("listFxjb");
	List listFxxd = (List)session.getAttribute("listFxxd");
	List listZq = (List)session.getAttribute("listZq");
	List listHq = (List)session.getAttribute("listHq");
	
	int totalCount = listXq.size() + listYxzt.size() + listFxjb.size() + listFxxd.size() + listZq.size() + listHq.size();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>全部信息</title>
    
	<script language="javascript" src="../../script/openurl.js"></script>
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
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
  </head>
  
  <body>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#003366">
      <tr>
        <td bgcolor="#FFFFFF">
<%
		if(listXq.size()>0){
		
%>  
        	<iframe src="/modules/result/result_qbxx_xq.jsp" width="100%" frameborder="0"></iframe>
<%
		}
		if(listZq.size()>0){
%>       
 	
        	<iframe src="/modules/result/result_qbxx_zq.jsp" width="100%" frameborder="0"></iframe>
<%
		}
		if(listHq.size()>0){
%>        	
			<iframe src="/modules/result/result_qbxx_hq.jsp" width="100%" frameborder="0"></iframe>
<%
		}
		if(listYxzt.size()>0){
%>        	
			<iframe src="/modules/result/result_qbxx_yxzt.jsp" width="100%" frameborder="0"></iframe>
<%
		}
		if(listFxxd.size()>0){
%>        	
			<iframe src="/modules/result/result_qbxx_fxxd.jsp" width="100%" frameborder="0"></iframe>
<%
		}
		if(listFxjb.size()>0){
%>        	
			<iframe src="/modules/result/result_qbxx_fxjb.jsp" width="100%" frameborder="0"></iframe>
<%
		} 
		if(totalCount==0){
%>
            <table width="100%" border="0"  class="font_define">
            	<tr  class="banner"> 
            		<td>没有满足条件的记录！！！</td>
            	</tr>
<%
		}
%>        	
            	<tr class="banner" width="100%"> 
              		<td colspan="4" height="1"></td>
            	</tr>
    	  	</table>
    	</td>
      </tr>
    </table> 
  </body>
</html>
