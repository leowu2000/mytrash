<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	Map mapFxjb = (Map)request.getAttribute("mapFxjb");
	List listFxjb_m = (List)request.getAttribute("listFxjb_m");
	String tbdw = request.getAttribute("tbdw").toString();
	String pageNum = request.getAttribute("page").toString();
	String id = request.getAttribute("id").toString();
	
	String wtdt = mapFxjb.get("WTDT").toString();
	String date = wtdt.substring(0,4) + "年" + wtdt.substring(5,7) + "月" + wtdt.substring(8,10) + "日";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>防汛简报打印预览</title>
    
	<script language="javascript" src="../../script/common.js"></script>
<link rel="stylesheet" href="../../css/main.css" type="text/css">
</head>
<body class="textarea2">
<p>
  <script language="JavaScript" src="../script/layer10.js"></script>
</p>
<form name="form1" method="post" action="../interface/result_fxjb.asp" target="result">
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0"  valign="top">
          <tr align="center"> 
            <td height="128" colspan="2">&nbsp;
            </tr>
          <tr align="center"> 
            
      <td height="26" colspan="2"> 
        <h2><font color="#FFFFFF"><img src="../main/images/title.gif" width="484" height="90"></font> 
        </h2>
            
          <tr align="center"> 
            <td height="58" colspan="2">&nbsp;
          </tr>
          <tr align="center"> 
            
      <td height="2" colspan="2"><b><font size="+2"><b>第</b> 
        <%=mapFxjb.get("ISSUE") %>
        <b>期</b></font><font size="+1"><b></font> 
    <tr align="center"> 
            
      <td height="6" align="left"><b><font size="+2"><b> 
        <%=tbdw %><b>
        </font></b><font  size="+1">&nbsp; </font> </td>
      <td height="6" align="right" > <font size="+2"><b><b> 
        <%=date %><b>
        </b> </font> </td>
          <tr align="center"> 
            <td height="12" width="100%" colspan="2"><hr width='100%' size='1'> <td></tr>
            <tr align="center"> 
            <td height="42" width="100%" colspan="2"><td></tr>
        </table>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" >
          <tr> 
            <td height="20" align="top" valign="top">
        <div align="center"><b><font  size="+2"><%=mapFxjb.get("WTTT") %><font color="#FF0000"></b></div>
      </td>
    </tr>
    <tr  height="20"><td>&nbsp; </td></tr>
    <tr> 
      <td> 
          <div name="text_detail" style="border=0;solid #002200;" class="textarea1"  readonly ><%=mapFxjb.get("ACTICO") %>
		</div> 
        <br>
      </td>
    </tr>
  </table>
        
  <table width="90%" align="center">
    <tr>
            <td colspan="3" >
        <hr size="1" width="100%">
      </td>
          </tr>
<tr>
            <td colspan="3" ><font size="+1"><b>报送：<%=mapFxjb.get("NT1")%></b></font></td>
          </tr>
<tr>
            <td colspan="3" >
        <hr size="1" width="100%">
      </td>
          </tr>
<tr>
      <td><b><font size="+1">签发：<%=mapFxjb.get("QF")%></font></b></td>
      <td><b><font size="+1">审核：<%=mapFxjb.get("SH")%></font></b></td>
      <td><b><font size="+1">拟稿：<%=mapFxjb.get("NG")%></font></b></td>
</tr>
<tr>
            <td colspan="3" >
        <hr size="1" width="100%">
      </td>
          </tr>
</table>
  <table  width="90%" border="0" cellspacing="0" align="center" cellpadding="0">
    <tr><td align="center"><div id=div1 name=div1 align=center>  
  <table  width="90%" border="0" cellspacing="0" align="center" cellpadding="0">
    <tr><td align="center">
        <input type="button" name="button" value="返  回" onclick="window.close()" id=button1 name=button1 class="input1">
        <input type="button" name="button" value="打  印" onclick="javascript:print_window();" id=button1 name=button1 class="input1">
        <input type="hidden" name="row_count" value="1">
    <input type="hidden" name="command" value="-1">
    </td></tr></table> <br>附件：

        
<%
		for(int i=0;i<listFxjb_m.size();i++){
			Map mapFxjb_m = (Map)listFxjb_m.get(i);
			String fileName = mapFxjb_m.get("TITLE")==null?"":mapFxjb_m.get("TITLE").toString().trim() + "." + mapFxjb_m.get("WJGS")==null?"":mapFxjb_m.get("WJGS").toString().trim();
%>
          <a href="media.do?action=download&tablename=TB_FXJB_M&media_id=<%=mapFxjb_m.get("ZLBM")%>&filename=<%=fileName %>"><%=fileName %></a> 
<%
		}
%>
		<font color="#D37A67"  size="2">(注：保存附件时，请一定将在此显示的附件文件的名称和扩展名作为保存文件的名称和扩展名，否则可能出现文件类型错误，而无法打开！）</font> 
        </div>
    </td></tr></table>
  <p>&nbsp;</p>
  </form>

</body>
