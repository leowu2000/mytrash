<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>首页面Frame</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" src="../../script/common.js"></script>

<script language="JavaScript">
function IFrameResize1(qHeight){
	document.getElementById("infotitle").height = document.body.offsetHeight - 30;
	document.getElementById("detail").height = document.body.offsetHeight - 30;
}
</script>
</head>
<%
	//command  = trim(Request("command"))
	//check_projectname  = trim(Request("check_projectname"))
	//check_unit  = trim(Request("check_unit"))
	//check_title  = trim(Request("check_title"))
	//text_fill  = trim(Request("text_fill"))
	
	//'session("select_sortinfo") = "default"

%>
<body bgcolor="#FFFFFF" text="#000000" onresize="IFrameResize1();" onLoad="IFrameResize1();" >
	<table width="100%" border="0" cellpadding="0">
		<tr>
			<td width="30%">
				<iframe name="infotitle" width='100%' style="" scrolling="NO" frameborder='0' src="search.do?action=search_index" ></iframe>
			</td>
			<td width="70%">
				<iframe name="detail" width="100%" frameborder='0' height=""></iframe>
			</td>
		</tr>
	</table>
</body>
</html>