<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  //document.getElementById('fxxq').submit();
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
            <OPTION 
        value="yxzt">运行状态</OPTION>
            <OPTION value="xqxx">险情</OPTION>
            <OPTION 
        value="fxjb">防汛简报</OPTION>
            <OPTION value="fxxd">防汛行动</OPTION>
            <OPTION 
        value="zqbg">灾情报告</OPTION>
            <OPTION value="hqbg">旱情报告</OPTION>
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
          </select> </td>
        <td rowspan="5" bgcolor="#FFFFFF"> <input id=submit_query name=submit_query type=submit value=查询 class="input1"> 
        </td>
      </tr>
      <tr > 
        <td bgcolor="#336699" align="center"><font color="#FFFFFF"><strong>行政区域</strong></font></td>
        <td colspan="3" bgcolor="#FFFFFF" align="left"> <div  name='xzqu_table'> 
            <script language="JavaScript" src="../../script/xzqh.js"></script>
          </div></td>
      </tr>
      <tr align="center"> 
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>河流水系</strong></font></td>
        <td colspan="3" bgcolor="#FFFFFF" align="left"> <script language="JavaScript" src="../../script/lysx.js"></script> 
        </td>
      </tr>
      <tr align="center"> 
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>上报时间</strong></font></td>
        <td colspan="3" align="left" bgcolor="#FFFFFF">
			从<input type="text" id="date_start" name="date_start" style="width:80;" onClick="WdatePicker({position:{top:0},readOnly:true})">到
			<input type="text" id="date_end" name="date_end" style="width:80;" onClick="WdatePicker({position:{top:0},readOnly:true})">
		</td>
      </tr>
      <tr align="center"> 
        <td bgcolor="#336699"><font color="#FFFFFF"><strong>关键字</strong></font></td>
        <td colspan="3" align="left" bgcolor="#FFFFFF"> <input name="text_fill"  class="input2" > 
          <input type="checkbox" name="check_projectname" value="true">
          工程名称 
          <input type="checkbox" name="check_unit" value="true">
          填报单位 
          <input type="checkbox" name="check_title" value="true">
          信息标题</td>
      </tr>
    </table>
  </div>
</form>


</body>
</html>
