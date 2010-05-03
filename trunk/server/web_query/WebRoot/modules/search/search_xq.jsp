<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%@ page import="com.basesoft.modules.search.*" %>
<%@ page import="org.springframework.web.context.support.*,org.springframework.context.*" %>
<%
	ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
	RiverDAO riverDAO = (RiverDAO)ctx.getBean("riverDAO");
	List listLy = riverDAO.getLy();
%>
<html>
<head>
<title>险情查询面板</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/main.css" type="text/css">
<script language="javascript" src="../../script/common.js"></script>
<script language="javascript" src="../../script/xq.js"></script>
<script src="../../script/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
function init(){
  changeLy(document.getElementById('ly').value);
  document.getElementById('fxxq').submit();
}

function changeLy(value){
	if(window.XMLHttpRequest){ //Mozilla 
      var xmlHttpReq=new XMLHttpRequest();
    }else if(window.ActiveXObject){
 	  var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
    }
    xmlHttpReq.open("GET", "/river.do?action=AJAX_LY&ly=" + value, false);
    xmlHttpReq.send();
    if(xmlHttpReq.responseText!=''){
        document.getElementById('selsx').innerHTML = xmlHttpReq.responseText;
    }
    changeSx(document.getElementById('sx').value);
}

function changeSx(value){
	if(window.XMLHttpRequest){ //Mozilla 
      var xmlHttpReq=new XMLHttpRequest();
    }else if(window.ActiveXObject){
 	  var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
    }
    xmlHttpReq.open("GET", "/river.do?action=AJAX_SX&sx=" + value, false);
    xmlHttpReq.send();
    if(xmlHttpReq.responseText!=''){
        document.getElementById('selzl1').innerHTML = xmlHttpReq.responseText;
    }
    changeZl(document.getElementById('zl1').value);
}

function changeZl(value){
	if(window.XMLHttpRequest){ //Mozilla 
      var xmlHttpReq=new XMLHttpRequest();
    }else if(window.ActiveXObject){
 	  var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
    }
    xmlHttpReq.open("GET", "/river.do?action=AJAX_ZL&zl1=" + value, false);
    xmlHttpReq.send();
    if(xmlHttpReq.responseText!=''){
        document.getElementById('selzl2').innerHTML = xmlHttpReq.responseText;
    }
}
</script>
</head>

<BODY topmargin="3"  class="font_define" onload="init();">
<form name="fxxq" method="post" onsubmit="return checkall() " action="/search.do?action=xq" target="result">
  <div id="query" > 
    <div id="Layer3" style="position:absolute; width:400px; height:20px; z-index:2; left: 280px; top: 93px; background-color: #00CC33; layer-background-color: #00CC33; border: 1px none #000000; visibility: hidden"></div>
    <table width="98%" border="0" cellspacing="1" bgcolor="#336699" class="font_define">
      <tr align="center"> 
        <td bgcolor="#336699"><strong><font color="#FFFFFF">险情名称</font></strong></td>
        <td bgcolor="#FFFFFF" align="left"> <input name="text_title" id="text_title" class="input2" > </td>
        <td bgcolor="#336699"><strong><font color="#FFFFFF">填报单位</font></strong></td>
        <td bgcolor="#FFFFFF" align="left"> <input name="text_fill" id="text_fill" class="input2" > </td>
        <td rowspan="2" bgcolor="#FFFFFF"><input id=submit_query name=submit_query type=submit value=查询 class="input1"></td>
      </tr>
      <tr align="center"> 
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>河流水系</strong></font></td>
        <td bgcolor="#FFFFFF" align="left" >
        	流域<select name="ly" id="ly" onchange="changeLy(this.value);">
				<%=StringUtil.createOptions(listLy, "CTCD", "CTNM") %>      		
        	</select>
        	水系<span name="selsx" id="selsx"></span>
        	一级支流<span name="selzl1" id="selzl1"></span>
        	二级支流<span name="selzl2" id="selzl2"></span>
        </td>
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>上报时间</strong></font></td>
        <td align="left" bgcolor="#FFFFFF">
			<input type="text" id="date_start" name="date_start" class="input2" onClick="WdatePicker({readOnly:true})">到
			<input type="text" id="date_end" name="date_end" class="input2" onClick="WdatePicker({readOnly:true})">
		</td>
      </tr>
    </table>
  </div>  
</form>


</body>
</html>