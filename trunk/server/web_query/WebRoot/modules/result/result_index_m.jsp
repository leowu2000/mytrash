<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
List listIndex_m = (List)request.getAttribute("listIndex_m");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>首页列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="javascript" src="../../script/openurl.js"></script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
  </head>
  
  <body background="../../images/back.gif">
  <marquee id="mar" name="mar">
    <table width="100%" height="100%" align="center" border="0" cellspacing="1" cellpadding="0">
    	<tr>
<%
	for(int i=0;i<listIndex_m.size();i++){
		Map mapIndex_m = (Map)listIndex_m.get(i);
		String tablename = mapIndex_m.get("TABLENAME").toString();
		String action = "";
		if("TB_FPACTI_M".equals(tablename)){
			action = "fxxd";
		}else if("TB_FXJB_M".equals(tablename)){
			action = "fxjb";
		}else if("TB_PJR_M".equals(tablename)){
			action = "yxzt";
		}else if("TB_QT_M".equals(tablename)){
			action = "hq";
		}else if("TB_SD_M".equals(tablename)){
			action = "zq";
		}else if("TB_STDNC_M".equals(tablename)){
			action = "xq";
		}
		
		
%>    
    		<td height="30" align="center" vlign="middle">
    			<img onmouseover="document.getElementById('mar').stop();" onmouseout="document.getElementById('mar').start();" src="media.do?action=image_middle&tablename=<%=mapIndex_m.get("TABLENAME") %>&media_id=<%=mapIndex_m.get("ZLBM")%>" style="cursor:hand;border=0; height=80;width=80; z-index:8;" onclick="openUrl('/detail.do?action=<%=action %>&id=<%=mapIndex_m.get("ID") %>',800,550,0)">
    			<br><a href="#" onclick="openUrl('/detail.do?action=<%=action %>&id=<%=mapIndex_m.get("ID") %>',800,550,0)"><%=mapIndex_m.get("TITLE") %></a>
    		</td>
<%
	}
%>    	
		</tr>
    </table>
  </marquee>
  </body>
</html>
