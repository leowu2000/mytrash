<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.core.PageList"%>
<%@ page import="com.basesoft.core.PageInfo"%>
<%@page import="com.basesoft.util.StringUtil"%>
<%
PageList pageList = (PageList)request.getAttribute("pageList");
PageInfo pageInfo = pageList.getPageInfo();
List list = pageList.getList();
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
		<td width="30%" class="banner">工程名称</td>
   		<td width="15%" class="banner">工程类别</td>
        <td width="30%" class="banner">填报单位名称</td>
        <td width="20%" class="banner">填报时间</td>                                                                                                        
	</tr>                                                                                                                    
                                                                                                                                 
<%  
	}                                                                                                                                                                                                                                            
	for(int i=0;i<list.size();i++){
		Map map = (Map)list.get(i);
%>                                                                                                                               
	<tr>
        <td><a href="javascript:openUrl('detail.do?action=yxzt&id=<%=map.get("PJRNO")%>&curent_pagecount=<%=pageList.getPageInfo().getCurPage()%>&tbdw=<%=map.get("WTDPCD")%>',800,550,0)"><%=map.get("PJNM")%></a></td>
        <td align="center"><a href="javascript:openUrl('detail.do?action=yxzt&id=<%=map.get("PJRNO")%>&curent_pagecount=<%=pageList.getPageInfo().getCurPage()%>&tbdw=<%=map.get("WTDPCD")%>',800,550,0)"><%=map.get("gcflmc")%></a></td>
        <td><%=map.get("WTDPCD")%></td>
        <td align="center"><%=StringUtil.DateToString((Date)map.get("WTDPDT"),"yyyy-MM-dd") %></td>                                                                                            
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
	<%=pageInfo.getHtml("/search.do?action=main") %>                                                                                                                 
	</td>	
	</tr>
</table>
</td>
	</tr>
  </body>
</html>
