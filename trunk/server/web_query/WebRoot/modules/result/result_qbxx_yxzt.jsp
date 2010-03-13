<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.StringUtil"%>
<%
List listYxzt = (List)session.getAttribute("listYxzt");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>全部信息-运行状态</title>
    
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
    <table width="100%" border="0"  class="font_define">
   	  <tr  class="banner"> 
    	<td width="30%">标题</td>                                                                                                        
		<td width="25%">填报单位名称</td>                                                                                                    
		<td width="20%">填报时间</td>
		<td width="15%">信息类型</td>
      </tr>
<%
	for(int i=0;i<listYxzt.size();i++){
		Map mapYxzt = (Map)listYxzt.get(i);
		String date = mapYxzt.get("WTDPDT")==null?"":StringUtil.DateToString((Date)mapYxzt.get("WTDPDT"),"yyyy-MM-dd");
%>
      <tr> 
	    <td><a href="javascript:openUrl('/detail.do?action=yxzt&id=<%=mapYxzt.get("PJRNO") %>&tbdw=<%=mapYxzt.get("WTDPCD") %>',800,550,0)"><%=mapYxzt.get("PJNM") %></a></td>                                                                                             
		<td><a href="javascript:openUrl('/detail.do?action=yxzt&id=<%=mapYxzt.get("PJRNO") %>&tbdw=<%=mapYxzt.get("WTDPCD") %>',800,550,0)"><%=mapYxzt.get("WTDPCD") %></a></td>
		<td><%=date %></td>     
		<td>运行状态</td>                                                                                         
	  </tr>
<%
	}
%>
    </table>
  </body>
</html>
