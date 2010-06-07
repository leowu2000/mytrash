<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	List listSx = (List)request.getAttribute("listSx");
%>
<html>
<head>
<title>工程信息查询面板</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/main.css" type="text/css">
<script language="javascript" src="../../script/common.js"></script>
<script language="javascript" src="../../script/xq.js"></script>
<script src="../../script/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
function changeSx(){
	var sxbm = document.getElementById('sx').value;
	if(window.XMLHttpRequest){ //Mozilla 
      var xmlHttpReq=new XMLHttpRequest();
    }else if(window.ActiveXObject){
 	  var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
    }
    xmlHttpReq.open("GET", "/search.do?action=search_gcxx_sxajax&sxbm=" + sxbm, false);
    xmlHttpReq.send();
    if(xmlHttpReq.responseText!=''){
        document.getElementById('lxsel').innerHTML = xmlHttpReq.responseText;
    }
    changeLx();
}
function changeLx(){
	var sxbm = document.getElementById('sx').value;
	var lxbm = document.getElementById('lx').value;
	if(window.XMLHttpRequest){ //Mozilla 
      var xmlHttpReq=new XMLHttpRequest();
    }else if(window.ActiveXObject){
 	  var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
    }
    xmlHttpReq.open("GET", "/search.do?action=search_gcxx_lxajax&sxbm=" + sxbm + "&lxbm=" + lxbm, false);
    xmlHttpReq.send();
    if(xmlHttpReq.responseText!=''){
        document.getElementById('gcsel').innerHTML = xmlHttpReq.responseText;
    }
    changeGc();
}

function changeGc(){
	var gclj = document.getElementById('gc').value;

	if(window.XMLHttpRequest){ //Mozilla 
      var xmlHttpReq=new XMLHttpRequest();
    }else if(window.ActiveXObject){
 	  var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
    }
    xmlHttpReq.open("GET", "/search.do?action=search_gcxx_ljajax&gclj=" + gclj, false);
    xmlHttpReq.send();
    if(xmlHttpReq.responseText!=''){
        var gclj = xmlHttpReq.responseText.split(';');
        
        document.getElementById('a_gcjj').href='/modules/gcdata/' + gclj[0];
		document.getElementById('a_fxya').href='/modules/gcdata/' + gclj[1];
		document.getElementById('a_gctp').href='/gctp.do?action=gctp&gclj=' + gclj[0];
		<% if("true".equals(session.getAttribute("isAdmin").toString())){ %>
		document.getElementById('a_gctp1').href='/gctp.do?action=manager&gclj=' + gclj[0];
		<%}%>
		parent.document.getElementById('result').src = document.getElementById('a_gcjj').href;
    }

	//var gclj = document.getElementById('gc').value;
	//parent.document.getElementById('result').src = "/modules/gcdata/" + gclj;
	
	//document.getElementById('a_gcjj').href='/modules/gcdata/' + gclj;
	//document.getElementById('a_fxya').href='/modules/gcdata/' + gclj;
}
</script>
</head>

<BODY topmargin="3"  class="font_define" onload="changeSx();">
<form name="fxxq" id="fxxq" method="post" onsubmit="return checkall() " action="/search.do?action=fxxd" target="result">
  <div id="query" > 
    <div id="Layer3" style="position:absolute; width:400px; height:20px; z-index:2; left: 280px; top: 93px; background-color: #00CC33; layer-background-color: #00CC33; border: 1px none #000000; visibility: hidden"></div>
    <table width="98%" border="0" cellspacing="1" bgcolor="#336699" class="font_define">
      <tr align="center"> 
        <td><font color="#FFFFFF">选择市县</font></td>
        <td bgcolor="#FFFFFF" align="left">
			<select name="sx" id="sx" onchange="changeSx();">
<%
			for(int i=0;i<listSx.size();i++){
				Map mapSx = (Map)listSx.get(i);
%>			
				<option value="<%=mapSx.get("SXBM") %>"><%=mapSx.get("SXMC") %></option>
<%
			}
%>
			</select>
		</td>
        <td bgcolor="#336699"><font color="#FFFFFF">选择类型</font></td>
        <td bgcolor="#FFFFFF" align="left" name="lxsel" id="lxsel"></td>
        <td bgcolor="#336699"><font color="#FFFFFF">选择工程</font></td>
        <td bgcolor="#FFFFFF" align="left" name="gcsel" id="gcsel"></td>
      </tr>
      <tr align="center">
        <td bgcolor="#FFFFFF" align="center" colspan="6">
        	<a href="#" name="a_gcjj" id="a_gcjj" target="result"><font style="font-size:14px"><b>查看工程简介</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<a href="#" name="a_fxya" id="a_fxya" target="result"><font style="font-size:14px"><b>查看基本特性</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#" name="a_gctp" id="a_gctp" target="result"><font style="font-size:14px"><b>查看相关图片</b></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <% if("true".equals(session.getAttribute("isAdmin").toString())){ %>
        	<a href="#" name="a_gctp1" id="a_gctp1" target="result"><font style="font-size:14px"><b>图片维护</b></font></a>
        <%} %>
        </td>
      </tr>
    </table>
  </div>  
</form>


</body>
</html>