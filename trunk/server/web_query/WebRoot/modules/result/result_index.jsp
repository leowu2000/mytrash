<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
List listIndex = (List)request.getAttribute("listIndex");
String id = ((Map)listIndex.get(0)).get("ID").toString();
String tablename = ((Map)listIndex.get(0)).get("TABLENAME").toString();
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
	<script type="text/javascript">
		function init(){
			parent.document.getElementById('detail').src = '/detail.do?action=index&id=<%=id %>&tablename=<%=tablename %>';
		}
		
		function changeInfo(id,tablename){
			parent.document.getElementById('detail').src = '/detail.do?action=index&id=' + id + '&tablename=' + tablename;
		}
	</script>
  </head>
  
  <body onload="init();" background="../../images/back.gif">
    <table width="100%" height="100%" align="center" border="0" cellspacing="1" cellpadding="0">
<%
	for(int i=0;i<listIndex.size();i++){
		Map mapIndex = (Map)listIndex.get(i);
		String tablename1 = mapIndex.get("TABLENAME").toString();
		String action = "";
		if("TB_FPACTI".equals(tablename1)){
			action = "fxxd";
		}else if("TB_FXJB".equals(tablename1)){
			action = "fxjb";
		}else if("TB_PJRCN".equals(tablename1)){
			action = "yxzt";
		}else if("TB_QT".equals(tablename1)){
			action = "hq";
		}else if("TB_SD".equals(tablename1)){
			action = "zq";
		}else if("TB_STDNC".equals(tablename1)){
			action = "xq";
		}
%>    
    	<tr>
    		<td height="30" align="center" vlign="middle"><a href="#" onclick="openUrl('/detail.do?action=<%=action %>&id=<%=mapIndex.get("ID") %>',800,550,0)" onmouseover="changeInfo('<%=mapIndex.get("ID") %>','<%=mapIndex.get("TABLENAME") %>');" style="cursor: hand;"><%=mapIndex.get("TITLE") %></a></td>
    	</tr>
<%
	}
%>    	
    </table>
  </body>
</html>
