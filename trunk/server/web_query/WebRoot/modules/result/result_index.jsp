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
  
  <body onload="init();">
    <table width="100%" height="100%" align="center" border="0" cellspacing="1" cellpadding="0">
<%
	for(int i=0;i<listIndex.size();i++){
		Map mapIndex = (Map)listIndex.get(i);
%>    
    	<tr>
    		<td height="30" align="center" vlign="middle"><span onmouseover="changeInfo('<%=mapIndex.get("ID") %>','<%=mapIndex.get("TABLENAME") %>');" style="cursor: hand;"><%=mapIndex.get("TITLE") %></span></td>
    	</tr>
<%
	}
%>    	
    </table>
  </body>
</html>
