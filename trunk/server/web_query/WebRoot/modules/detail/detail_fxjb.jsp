<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	Map mapFxjb = (Map)request.getAttribute("mapFxjb");
	List listFxjb_m = (List)request.getAttribute("list_Fxjb_m");
	String tbdw = request.getAttribute("tbdw").toString();
	String pageNum = request.getAttribute("page").toString();
	String id = request.getAttribute("id").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>防汛简报详细信息</title>
    
	<script language="javascript" src="../../script/openurl.js"></script>
<script language="javascript" src="../../script/onmouseover.js">
</script>
<link rel="stylesheet" href="../../css/main.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body background="../main/images/back.gif">
<script language="JavaScript" src="../script/layer10.js"></script>
<p>&nbsp;</p>
<form name="form1" method="post" action="../interface/result_fxjb.asp" target="parent.result"> 
  <table  width="68%"  border="0" cellspacing="0"  align="center" cellpadding="0" class="bordercolor">
    <tr>
      <td class="banner"  height="30" ><b>防汛简报多媒体信息</b></td>
    </tr>
  </table>
  <table width="68%" border="0" cellspacing="0"  align="center" cellpadding="0"  class="bordercolor">
<%
	for(int i=0;i<listFxjb_m.size();i++){
		Map mapFxjb_m = (Map)listFxjb_m.get(i);
    	String fileName = "fxjb" + mapFxjb_m.get("ZLBM") + "." + mapFxjb_m.get("WJGS");
        int size=8000/1024;
	    String altStr1 = "编 号:" + mapFxjb_m.get("ZLBM");
	    String altStr2 = "标  题:" + mapFxjb_m.get("TITLE");
	    String altStr3 = "采集单位:" + tbdw ;
	    String altStr4 = "采集时间:" + mapFxjb_m.get("DTCDT");
	    String altStr5 = "文件名:" + fileName;
	    String altStr6 = "长 度:" + size + "kb";
	    String altStr7 = ""; 

%>
    <tr width="100%">
	  <td>
	    <table width="100%">
	      <tr align="middle"> 
	        <td class="bordercolor"><%=mapFxjb_m.get("TITLE")%></td>
	      </tr>
		  <tr align="middle" height="80"> 
	        <td class="bordercolor"  height="80">		
		    <%if("JPG".equals(mapFxjb_m.get("WJGS").toString().toUpperCase())||"JPG".equals(mapFxjb_m.get("WJGS").toString().toLowerCase())){ %>
	       	  <img src="imgout.asp?tablename=TB_FXJB_M&media_id=<%=mapFxjb_m.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='info_fxjb.asp?fxxd_pId=<%=mapFxjb_m.get("ZLBM")%>&title=<%=mapFxjb_m.get("TITLE")%>&dtcdt=<%=mapFxjb_m.get("DTCDT")%>&tbdw=<%=tbdw %>&fileName=<%=fileName%>&WJGS=<%=mapFxjb_m.get("WJGS")%>'" WIDTH="80" HEIGHT="53"> 
	        <%}else{%>
	       	  <img src="../image/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='info_fxjb.asp?fxxd_pId=<%=mapFxjb_m.get("ZLBM")%>&title=<%=mapFxjb_m.get("TITLE")%>&dtcdt=<%=mapFxjb_m.get("DTCDT")%>&tbdw=<%=tbdw%>&fileName=<%=fileName%>&WJGS=<%=mapFxjb_m.get("WJGS")%>'" WIDTH="80" HEIGHT="53"> 
	    	<%}%>
		    <td>
		  </tr>
	    </table>
	  </td>		
    </tr>
<%
	}
%>
    <tr height="28"><td height="28"></td></tr>
  </table>
  <table  width="68%"  border="0" cellspacing="0"  align="center" cellpadding="0" class="bordercolor">
	<tr>
	  <td>
        <table width="68%" border="0" align="center" cellpadding="0" cellspacing="1"  valign="top">
          <tr align="center"> 
            <td height="10" colspan="2">&nbsp; </td>
          </tr>
          <tr align="center"> 
            <td height="6" colspan="2"><font color="#FFFFFF"><b><font color="#FF0000" size="+3">防 汛 抗 旱 简 报</font></b> </font></td>
          </tr>
          <tr align="center"> 
            <td height="5" colspan="2"><font color="#FF0000">第<%=mapFxjb.get("ISSUE") %>期</font> </td>
          </tr>
          <tr align="center"> 
            <td height="6"><%=tbdw %></td>
            <td height="6" ><%=mapFxjb.get("WTDT") %></td>
          </tr>
          <tr align="center"> 
            <td height="12" colspan="2">&nbsp; </td>
          </tr>  
        </table>
  		<table width="68%" border="0" align="center" cellpadding="0" cellspacing="0" >
    	  <tr> 
      		<td>
      		  <hr width='100%' size='1'> 
        	  <div align="center"><b><font color="#FF0000"  size="+1"><%=mapFxjb.get("WTTT") %><font color="#FF0000"></b></div>
      		</td>
    	  </tr>
    	  <tr> 
      		<td> 
        	  <div align="center">
          		<textarea name="text_detail" cols="60%" style="border=0;solid #002200" rows="10"  readonly ><%=mapFxjb.get("ACTICO") %></textarea>
        	  </div>
        	  <br>
      		</td>
    	  </tr>
  		</table>
  		<table width="90%">
		  <tr>
	  		<td width="10%"></td>
      		<td>签发：<%=mapFxjb.get("QF")%></td>
      		<td>审核：<%=mapFxjb.get("SH")%></td>
      		<td>拟稿：<%=mapFxjb.get("NG")%></td>
    	  </tr>
  		</table>
  	  </td>
  	</tr>
  </table>
  <table  width="68%" border="0" cellspacing="0" align="center" cellpadding="0">
    <tr height="25">
      <td height="25" align="center"></td>
    </tr>
    <tr>
      <td align="center">  
  		<input type="button" name="button" value="返　　回" onclick="parent.focus();window.close()" class="input1">
    	<INPUT type="hidden" id="page" name="page" value="<%=pageNum %>">
  		<input type="button" name="button" value="打印预览" onclick="if(screen.width==800){window.location='fxjb_print.asp?id=<%=id%>&tbdw=<%=tbdw%>'}else{window.location='fxjb_print_1024.asp?id=<%=id%>&tbdw=<%=tbdw%>'}" class="input1" >
    	<input type="hidden" name="row_count" value="1">
    	<input type="hidden" name="command" value="-1">
    	<input type="hidden" name="check1" value="<%=id %>">
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>
