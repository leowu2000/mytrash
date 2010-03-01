<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	Map mapFxxd = (Map)request.getAttribute("mapFxxd");
	List listFxxd_m = (List)request.getAttribute("listFxxd_m");
	String tbdw = request.getAttribute("tbdw").toString();
	String pageNum = request.getAttribute("page").toString();
	String id = request.getAttribute("id").toString();
	
	int mediawidth = 1000/(listFxxd_m.size() + 1);
	int mediaheight = 600/(listFxxd_m.size() + 1);
	if(mediawidth<100){
		mediawidth = 100;
	}
	if(mediaheight<60){
		mediaheight	= 60;
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>防汛行动详细信息</title>
    
	<script language="javascript" src="../../script/openurl.js"></script>
	<script language="javascript" src="../../script/onmouseover.js"></script>
	<script language="JavaScript" src="../script/layer10.js"></script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
	<script type="text/javascript">
	function addConsult(){
	  if(window.XMLHttpRequest){ //Mozilla 
      	var xmlHttpReq=new XMLHttpRequest();
      }else if(window.ActiveXObject){
 	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
      }
      xmlHttpReq.open("GET", "consult.do?action=add&type=fxxd&id=<%=id %>", false);
      xmlHttpReq.send();
      if(xmlHttpReq.responseText!=''){
        alert(xmlHttpReq.responseText);
      }
	  parent.focus();
	  window.close();
	}
	</script>
</head>
<body background="../../images/back.gif">
<p>&nbsp;</p>
<form name="form1" method="post" action="consult.do?action=add&type=fxxd"> 
  <table width="68%" align="center" border="0" cellspacing="1" cellpadding="0">
    <tr> 
      <td  height="25" colspan="2" align="center" class="title" ><div align="left"></div>
        <div align="center">
          <font size="5"><%=mapFxxd.get("WTTT") %></font>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="49%" height="25" align="center" bgcolor="#FFFFFF">
        <div align="left"><%=tbdw %></div>
      </td>
      <td width="51%" height="25" align="center" bgcolor="#FFFFFF"><div align="right"></div>
        <div align="right"><%=StringUtil.DateToString((Date)mapFxxd.get("WTDT"),"yyyy-MM-dd") %></div>
      </td>
    </tr>
  </table>
  <table width="68%" border="0" align="center" cellspacing="0" cellpadding="0" class="bordercolor">
<%
	for(int i=0;i<listFxxd_m.size();i++){
		Map mapFxxd_m = (Map)listFxxd_m.get(i);
    	String fileName = "fxdt" + mapFxxd_m.get("ZLBM") + "." + mapFxxd_m.get("WJGS");
        int size=8000/1024;
	    String altStr1 = "编 号:" + mapFxxd_m.get("ZLBM");
	    String altStr2 = "标  题:" + mapFxxd_m.get("TITLE");
	    String altStr3 = "采集单位:" + tbdw;
	    String altStr4 = "采集时间:" + mapFxxd_m.get("DTCDT");
	    String altStr5 = "文件名:" + fileName;
	    String altStr6 = "长 度:" + size + "kb";
	    String altStr7 = ""; 
%>	    
	<tr width="100%">
	  <td>
		<table width="100%">
		  <tr align="middle" height="80"> 
		    <td height="80">		
		<%if("JPG".equals(mapFxxd_m.get("WJGS").toString().trim().toUpperCase())||"JPG".equals(mapFxxd_m.get("WJGS").toString().trim().toLowerCase())){ %>
        	  <img src="media.do?action=image&tablename=TB_FPACTI_M&media_id=<%=mapFxxd_m.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" onClick="window.location='../modules/view/view_image.jsp?media_id=<%=mapFxxd_m.get("ZLBM")%>&title=<%=mapFxxd_m.get("TITLE") %>&dtcdt=<%=mapFxxd_m.get("DTCDT")%>&tbdw=<%=tbdw %>&fileName=<%=fileName %>&WJGS=<%=mapFxxd_m.get("WJGS") %>&DETAIL=<%=mapFxxd.get("ACTICO") %>'" style="cursor:hand;border=0; height=<%=mediaheight %>;width=<%=mediawidth %>;z-index:8;"> 
        <%}else{  %>
        	  <img src="../../images/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='media.do?action=vedio&pid=<%=mapFxxd_m.get("ZLBM")%>&title=<%=mapFxxd_m.get("TITLE")%>&dtcdt=<%=mapFxxd_m.get("DTCDT")%>&tbdw=<%=tbdw%>&fileName=<%=fileName%>&WJGS=<%=mapFxxd_m.get("WJGS")%>'" WIDTH="80" HEIGHT="53"> 
        <%}%>
			</td>
		  </tr>
		  <tr align="middle"> 
		    <td><%=mapFxxd_m.get("TITLE")%></td>
		  </tr>			
		</table>
	  </td>		
	</tr>
<%	
	}
%>
	<tr height="28"><td height="28"></td></tr>
  </table>
  <table width="68%" border="0" cellspacing="0" align="center" cellpadding="0" class="bordercolor">
    <tr> 
      <td height="20" bgcolor="#336699"> 
        <div align="center"><b><font color="#FFFFFF">详 细 内 容</font> </b></div>
      </td>
    </tr>
    <tr> 
      <td height="80"> 
        <div align="center">
          <textarea name="text_detail" cols="68%" style="border=0 solid #002200" rows="10" wrap="VIRTUAL" readonly class="button_query">
		    <%=mapFxxd.get("ACTICO") %>  
          </textarea>
        </div>
        <br>
      </td>
    </tr>
  </table>
  <table width="68%" border="0" cellspacing="0" align="center" cellpadding="0">
    <tr height="25">
      <td height="25" align="center"></td>
    </tr>
    <tr>
      <td align="center">  
  		<input type="button" name="button" value="返　　回" onclick="parent.focus();window.close()" class="input1">
  		<input type="button" name="button" value="加入会商" onclick="addConsult();" class="input1">
    	<input type="hidden" name="id" value="<%=id %>">
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>
