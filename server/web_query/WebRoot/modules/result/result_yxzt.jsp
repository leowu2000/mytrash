<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.core.PageList"%>
<%@ page import="com.basesoft.core.PageInfo"%>
<%@page import="com.basesoft.util.StringUtil"%>
<%
PageList pageList = (PageList)request.getAttribute("pageList");
PageInfo pageInfo = pageList.getPageInfo();
List list = pageList.getList();

String select_sortinfo = request.getAttribute("select_sortinfo").toString();
String select_sort = request.getAttribute("select_sort").toString();
String xzqh = request.getAttribute("xzqh").toString();
String lysx = request.getAttribute("lysx").toString();
String date_start = request.getAttribute("date_start").toString();
String date_end = request.getAttribute("date_end").toString();
String text_fill = request.getAttribute("text_fill").toString();
String check_projectname = request.getAttribute("check_projectname").toString();
String check_unit = request.getAttribute("check_unit").toString();
String check_title = request.getAttribute("check_title").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>运行状态</title>
    
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
        <table  width="100%" border="0" class="font_define">                                                                                                                  
	<tr  class="banner">
	<%
    if (list.size()==0){
    %>
    
    <td align='center'> 
		没有满足条件的记录！！！    
    </td>
    <%
	}else {
	%>                                                                                        
	<td width="30%">工程名称</td>
    <td width="30%">填报单位名称</td>
    <td width="20%">填报时间</td>                                                                                                         
	</tr>                                                                                                                    
                                                                                                                                 
<%  
	}                                                                                                                                                                                                                                            
	for(int i=0;i<list.size();i++){
		Map map = (Map)list.get(i);
%>                                                                                                                               
	<tr>
	<td align='center'> <a href="javascript:openUrl('detail.do?action=yxzt&id=<%=map.get("PJRNO")%>&tbdw=<%=map.get("WTDPCD")%>',800,550,0)"><%=map.get("PJNM")%></a></td>  
	<td align='center'> <a href="javascript:openUrl('detail.do?action=yxzt&id=<%=map.get("PJRNO")%>&tbdw=<%=map.get("WTDPCD")%>',800,550,0)"><%=map.get("WTDPCD")%></a></td>                                                                                              
	<td align='center'> <%=map.get("WTDPDT")==null?"":StringUtil.DateToString((Date)map.get("WTDPDT"),"yyyy-MM-dd")%></td>                                                                                                
	</tr>                                                                                                                    
<%            
	}                                                                                                       
%>                                                                                                                               
    <tr class="banner" width="100%"> 
        <td colspan="6" height="1"></td>
      </tr>                                                                                                                               
	<tr>                                                                                                                     
	<td colspan="6">
<table  class="font_define" width="100%">
	<tr>
	<td align='right'>     
	<%=pageInfo.getHtml("/search.do?action=main&select_sortinfo=" + select_sortinfo + "&select_sort=" + select_sort + "&xzqh=" + xzqh + "&lysx=" + lysx + "&date_start=" + date_start + "&date_end=" + date_end + "&text_fill=" + text_fill + "&check_projectname=" + check_projectname + "&check_unit=" + check_unit + "&check_title=" + check_title) %>                                                                                                                 
	</td>	
	</tr>
</table>
</td>
	</tr>
  </body>
</html>
