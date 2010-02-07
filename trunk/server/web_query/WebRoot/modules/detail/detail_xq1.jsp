<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	Map mapXq1 = (Map)request.getAttribute("mapXq1");
	String pageNum = request.getAttribute("page").toString();
	String id = request.getAttribute("id").toString();
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>险情详细信息</title>
	<script language="javascript" src="../../script/openurl.js"></script>
	<script language="javascript" src="../../script/onmouseover.js"></script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
  </head>
<body  leftmargin="10" topmargin="10" background="../../images/back.gif" onunload="window.opener.form1.button_detail.value='详细信息';" onload="display2('<%=mapXq1.get("daglo")%>','<%=mapXq1.get("rdepl")%>','<%=mapXq1.get("rderescn")%>','<%=mapXq1.get("tpn")%>','<%=mapXq1.get("plapn")%>','<%=mapXq1.get("plipn")%>','<%=mapXq1.get("rdecnrl")%>','<%=mapXq1.get("dncpbnfz")%>','<%=mapXq1.get("dnccuan")%>','<%=mapXq1.get("dncestdv")%>','<%=mapXq1.get("rz")%>','<%=mapXq1.get("wthcn")%>','<%=mapXq1.get("fhywthcn")%>','<%=mapXq1.get("dncaddsc")%>',event.x,event.y);">
  <table width="100%" cellspacing="10" align="center"  cellpadding="0" align='center'>
    <tr align='center'>
      <td>
	    <script language="JavaScript" src="../../script/layer10.js"></script>
      </td>
	</tr>
  </table>
</body>
</html>
