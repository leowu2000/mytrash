<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String xq_count = request.getAttribute("xq_count").toString();
    String yx_count = request.getAttribute("yx_count").toString();
    String fx_count = request.getAttribute("fx_count").toString();
    String zq_count = request.getAttribute("zq_count").toString();
    String total_count = request.getAttribute("total_count").toString();
%>
<html>
<head>
<title>会商查询面板</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/main.css" type="text/css">
<script language="javascript" src="../../script/common.js"></script>
<script language="javascript" src="../../script/xq.js"></script>
<script src="../../script/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>

<BODY topmargin="3"  class="font_define">
<form name="fxxq" method="post" onsubmit="return checkall() " action="/search.do?action=fxjb" target="result">
  <div id="query" > 
    <table width="100%" border="0" cellspacing="1" bgcolor="#336699" class="font_define">
      <tr align="center" bgcolor="#FFFFFF"> 
        <td width="10%" height="25"><font color="#003366">险情〈<a href="search.do?action=consult&type=2" target="result"><%=xq_count%>条</a>〉</font></td>
        <td width="10%" height="25"><font color="#003366">灾情〈<a href="search.do?action=consult&type=4"  target="result"><%=zq_count%>条</a>〉</font></td>
        <td width="13%" height="25"><font color="#003366">运行状态〈<a href="search.do?action=consult&type=1"  target="result"><%=yx_count%>条</a>〉</font></td>
        <td width="13%" height="25"><font color="#003366">防汛行动〈<a href="search.do?action=consult&type=3"  target="result"><%=fx_count%>条</a>〉</font></td>
        <td width="10%" height="25"><font color="#003366">全部查看〈<a style="cursor:hand" onclick="javascript:window.open('search.do?action=consult&type=a','all', 'fullscreen=yes');parent.result.location='search.do?action=consult&type=a&parentfile=defalutfile'" target="result"><%=total_count%>条</a>〉</font></td>
        <td width="10%" height="25"><font color="#003366"><a href="result_consult_manager.asp"  target="result">会商管理</a></font></td>
      </tr>
    </table>
  </div>  
</form>


</body>
</html>