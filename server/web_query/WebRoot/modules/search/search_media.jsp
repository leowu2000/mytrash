<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>多媒体信息查询面板</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/main.css" type="text/css">
<script language="javascript" src="../../script/common.js"></script>
<script language="javascript" src="../../script/xq.js"></script>
<script src="../../script/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>

<BODY topmargin="3"  class="font_define" onload="init();">
<form name="fxxq" id="fxxq" method="post" onsubmit="return checkall() " action="/search.do?action=media" target="result">
  <div id="query" > 
    <div id="Layer3" style="position:absolute; width:400px; height:20px; z-index:2; left: 280px; top: 93px; background-color: #00CC33; layer-background-color: #00CC33; border: 1px none #000000; visibility: hidden"></div>
    <table width="98%" border="0" cellspacing="1" bgcolor="#336699" class="font_define">
      <!--DWLayoutTable-->
      <tr> 
        <td align="center"><font color="#FFFFFF">查询类别</font></td>
        <td bgcolor="#FFFFFF" align="left"> 
          <input type="radio" name="radiob_gclb" id="radiob_gclb" value="xq" checked>
          险情 
          <input type="radio" name="radiob_gclb" id="radiob_gclb"  value="yxzt">
          工程运行 
          <input type="radio" name="radiob_gclb" id="radiob_gclb"  value="zq">
          灾情 
          <input type="radio" name="radiob_gclb" id="radiob_gclb"  value="fxxd">
          防汛行动</td>
        <td align="center"><font color="#FFFFFF">文件格式</font></td>
        <td bgcolor="#FFFFFF" align="left"> 
          <input type="radio" name="radiob_gs" id="radiob_gs"  value="all" checked>
          所有格式 
          <input type="radio" name="radiob_gs" id="radiob_gs" value="tp" >
          图片 
          <input type="radio" name="radiob_gs" id="radiob_gs"  value="lx">
          录像 
        </td>
        <td align="center"><font color="#FFFFFF">标题</font></td>
        <td bgcolor="#FFFFFF" align="left"> <input name="text_title" class="input2" > </td>
        <td rowspan="3" align="center" bgcolor="#FFFFFF"> <input id=submit_query name=submit_query type=submit value=查询 class="input1"> 
        </td>
      </tr>
      <tr> 
        <td align="center"><font color="#FFFFFF">内容描述</font></td>
        <td bgcolor="#FFFFFF" align="left"> <input name="text_fill" class="input2" > </td>
        <td align="center"><font color="#FFFFFF">采集时间</font></td>
        <td colspan="3" align="left" bgcolor="#FFFFFF">
			<input type="text" id="date_start" name="date_start" class="input2" onClick="WdatePicker({readOnly:true})">到
			<input type="text" id="date_end" name="date_end" class="input2" onClick="WdatePicker({readOnly:true})">
		</td>
      </tr>
    </table>
  </div>  
</form>


</body>
</html>