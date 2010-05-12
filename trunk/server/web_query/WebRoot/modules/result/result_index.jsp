<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
List listIndex = (List)request.getAttribute("listIndex");
String id = "";
String tablename = "";
if(listIndex.size()>0){
	Map mapIndex0 = (Map)listIndex.get(0);
	id = mapIndex0.get("ID")==null?"":mapIndex0.get("ID").toString();
	tablename = mapIndex0.get("TABLENAME")==null?"":mapIndex0.get("TABLENAME").toString();
}
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
		String type = "";
		if("TB_FPACTI".equals(tablename1)){
			type = "防汛行动";
			action = "fxxd";
		}else if("TB_FXJB".equals(tablename1)){
			type = "防汛简报";
			action = "fxjb";
		}else if("TB_PJRCN".equals(tablename1)){
			type = "运行状态";
			action = "yxzt";
		}else if("TB_QT".equals(tablename1)){
			type = "旱情";
			action = "hq";
		}else if("TB_SD".equals(tablename1)){
			type = "灾情";
			action = "zq";
		}else if("TB_STDNC".equals(tablename1)){
			type = "险情";
			action = "xq";
		}
		
		String title = mapIndex.get("TITLE")==null?"":mapIndex.get("TITLE").toString().trim();
		if(title.length()>10){
			title = title.substring(0,9) + "...";
		}
		String dt = mapIndex.get("DT")==null?"":mapIndex.get("DT").toString().trim();
		if(!"".equals(dt)){
			dt = dt.substring(0,10);
		}
%>    
    	<tr>
    		<td height="30" align="left" vlign="middle" nowrap="nowrap">[<%=type %>]</td>
    		<td nowrap="nowrap"><a href="#" onclick="changeInfo('<%=mapIndex.get("ID") %>','<%=mapIndex.get("TABLENAME") %>');" style="cursor: hand;"><%=title %></a></td>
    		<td align="right" nowrap="nowrap">[<%=dt %>]</td>
    	</tr>
<%
	}
%>    	
    </table>
  </body>
</html>
