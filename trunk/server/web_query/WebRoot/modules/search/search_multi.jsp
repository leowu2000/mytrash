<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	List listLy = (List)request.getAttribute("listLy");
%>
<html>
<head>
<title>综合查询面板</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../script/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script language="javascript" src="../../script/optionclick.js"></script>
<script language="javascript" src="../../script/common.js"></script>
<script language="javascript" src="../../script/lysxtop.js"></script>
<script type="text/javascript">
function init(){
  var keywords = parent.parent.leftFrame.document.getElementById('text_fill').value;
  if(!keywords==''){
    document.getElementById('text_fill').value = keywords;
    document.getElementById('check_projectname').checked = 'true';
    document.getElementById('check_unit').checked = 'true';
    document.getElementById('check_title').checked = 'true';
  }
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
<link rel="stylesheet" href="../../css/main.css" type="text/css">
</head>

<body topmargin="3" onload="init();">
<form name="fxxq" method="post" action="/search.do?action=main" target="result">
  <div id="query" > 
    <table width="98%" border="0" align="left" cellpadding="2" cellspacing="1" bgcolor="#336699">
      <!--DWLayoutTable-->
      <tr align="center"> 
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>信息类型</strong></font></td>
        <td align="left" bgcolor="#FFFFFF"> <select name="select_sortinfo" id=select_sortinfo size="1" >
            <option value="qbxx" selected>全部信息</option>
            <OPTION value="xqxx">险情</OPTION>
            <OPTION value="zqbg">灾情</OPTION>
            <OPTION value="hqbg">旱情</OPTION>
            <OPTION value="yxzt">运行状态</OPTION>
            <OPTION value="fxxd">防汛行动</OPTION>
            <OPTION value="fxjb">防汛简报</OPTION>
          </select> 
          <!--input type="checkbox" name="checkbox_media" value="true"-->
        </td>
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>工程类别</strong></font></td>
        <td align="left" bgcolor="#FFFFFF"> <select name="select_sort" size="1" >
            <option value="0" selected>全部信息</option>
            <option value="b" >水库</option>
            <option value="d" >堤防</option>
            <option value="e" >海堤</option>
            <option value="f" >蓄滞洪区</option>
            <option value="h" >圩垸</option>
            <option value="k" >水闸</option>
            <option value="n" >治河工程</option>
            <option value="p" >穿堤建筑物</option>
          </select>
        </td>
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>关键字</strong></font></td>
        <td align="left" bgcolor="#FFFFFF"> <input name="text_fill"  class="input2" style="width:178;"> 
        <div style="display:none;">
          <input type="checkbox" name="check_projectname" value="true" checked="checked">
          工程名称 
          <input type="checkbox" name="check_unit" value="true" checked="checked">
          填报单位 
          <input type="checkbox" name="check_title" value="true" checked="checked">
          信息标题
        </div>
        </td>
        <td rowspan="3" bgcolor="#FFFFFF"> <input id=submit_query name=submit_query type=submit value=查询 class="input1"> 
        </td>
      </tr>
      <tr align="center"> 
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>河流水系</strong></font></td>
        <td bgcolor="#FFFFFF" align="left" colspan="3">
        	流域<select name="ly" id="ly" onchange="changeLy(this.value);">
				<%=StringUtil.createOptions(listLy, "CTCD", "CTNM") %>      		
        	</select>
        	水系<span name="selsx" id="selsx"></span>
        	一级支流<span name="selzl1" id="selzl1"></span>
        	二级支流<span name="selzl2" id="selzl2"></span>
        </td>
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>上报时间</strong></font></td>
        <td align="left" bgcolor="#FFFFFF">
			<input type="text" id="date_start" name="date_start" style="width:80;" onClick="WdatePicker({readOnly:true})">到
			<input type="text" id="date_end" name="date_end" style="width:80;" onClick="WdatePicker({readOnly:true})">
		</td>
      </tr>
    </table>
  </div>
</form>


</body>
</html>
