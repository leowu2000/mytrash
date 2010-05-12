<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
List listIndex_m = (List)request.getAttribute("listIndex_m");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>首页列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="javascript" src="../../script/openurl.js"></script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
  </head>
  
  <body background="../../images/back.gif">
  <CENTER>
    <TABLE style="BORDER: #ccc 1px solid;" cellSpacing=0 cellPadding=0 width=100% align=center border=0>
  <TBODY>
  <TR>
    <TD>
      <DIV id=demo style="OVERFLOW: hidden; WIDTH: 100%; COLOR: #ffffff">
      <TABLE cellSpacing=0 cellPadding=0 align=left border=0 cellspace="0">
        <TBODY>
        <TR>
          <TD id=demo1 vAlign=top><table width="1710" height="116"  border="0" cellpadding="0" cellspacing="0">
            <tr>
<%
	for(int i=0;i<listIndex_m.size();i++){
		Map mapIndex_m = (Map)listIndex_m.get(i);
		String tablename = mapIndex_m.get("TABLENAME").toString();
		String action = "";
		if("TB_FPACTI_M".equals(tablename)){
			action = "fxxd";
		}else if("TB_FXJB_M".equals(tablename)){
			action = "fxjb";
		}else if("TB_PJR_M".equals(tablename)){
			action = "yxzt";
		}else if("TB_QT_M".equals(tablename)){
			action = "hq";
		}else if("TB_SD_M".equals(tablename)){
			action = "zq";
		}else if("TB_STDNC_M".equals(tablename)){
			action = "xq";
		}
		
		
%>    
    		<td width="171" height="30" align="center" vlign="middle">
    			<img src="media.do?action=image_middle&tablename=<%=mapIndex_m.get("TABLENAME") %>&media_id=<%=mapIndex_m.get("ZLBM")%>" style="cursor:hand;border=0; height=80;width=80; z-index:8;" onclick="openUrl('/detail.do?action=<%=action %>&id=<%=mapIndex_m.get("ID") %>',800,550,0)">
    			<br><a href="#" onclick="openUrl('/detail.do?action=<%=action %>&id=<%=mapIndex_m.get("ID") %>',800,550,0)"><%=mapIndex_m.get("TITLE") %></a>
    		</td>
<%
	}
%>    	
		</tr>
          </table></TD>
          <TD id=demo2 vAlign=top>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<script language=JavaScript >
var speed3=20//速度数值越大速度越慢
demo2.innerHTML=demo1.innerHTML
function Marquee(){
if(demo2.offsetWidth-demo.scrollLeft<=0)
demo.scrollLeft-=demo1.offsetWidth
else{
demo.scrollLeft++
}
}
var MyMar=setInterval(Marquee,speed3)
demo.onmouseover=function() {clearInterval(MyMar)}
demo.onmouseout=function() {MyMar=setInterval(Marquee,speed3)}
</script>
    </TD></TR></TBODY></TABLE></TD></TR></TABLE>
</CENTER>
  </body>
</html>
