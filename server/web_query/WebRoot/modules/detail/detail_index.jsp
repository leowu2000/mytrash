<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
Map mapIndex = (Map)request.getAttribute("mapIndex");
List listIndex_m = (List)request.getAttribute("listIndex_m");
String tablename = request.getAttribute("tablename").toString();

int mediawidth = 1000/(listIndex_m.size() + 1);
int mediaheight = 600/(listIndex_m.size() + 1);
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
    <title>详细信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
	<script language="javascript" src="../../script/onmouseover.js"></script>
	<script language="JavaScript" src="../script/layer10.js"></script>
  </head>
  
  <body background="../../images/back.gif">
  	<table width="100%" align="center" border="0" cellspacing="1" cellpadding="0">
<%
	if("TB_FPACTI".equals(tablename)||"TB_FXJB".equals(tablename)||"TB_QT".equals(tablename)||"TB_SD".equals(tablename)){//防汛行动,旱情,灾情
%>  	
	<tr> 
      <td  height="25" colspan="2" align="center" class="title" ><div align="left"></div>
        <div align="center">
          <font size="5"><%=mapIndex.get("WTTT") %></font>
        </div>
      </td>
    </tr>
    <tr> 
      <td width="49%" height="25" align="center" bgcolor="#FFFFFF">
        <div align="left"><%=mapIndex.get("WTDPCD") %></div>
      </td>
      <td width="51%" height="25" align="center" bgcolor="#FFFFFF"><div align="right"></div>
        <div align="right"><%=StringUtil.DateToString((Date)mapIndex.get("WTDT"),"yyyy-MM-dd") %></div>
      </td>
    </tr>
  </table>
  <table width="68%" border="0" align="center" cellspacing="0" cellpadding="0" class="bordercolor">
<%
	for(int i=0;i<listIndex_m.size();i++){
		Map mapIndex_m = (Map)listIndex_m.get(i);
    	String fileName = "fxdt" + mapIndex_m.get("ZLBM") + "." + mapIndex_m.get("WJGS");
        int size=8000/1024;
	    String altStr1 = "编 号:" + mapIndex_m.get("ZLBM");
	    String altStr2 = "标  题:" + mapIndex_m.get("TITLE");
	    String altStr3 = "采集单位:" + mapIndex.get("WTDPCD");
	    String altStr4 = "采集时间:" + mapIndex_m.get("DTCDT");
	    String altStr5 = "文件名:" + fileName;
	    String altStr6 = "长 度:" + size + "kb";
	    String altStr7 = ""; 
	    
	    String ext = mapIndex_m.get("WJGS")==null?"":mapIndex_m.get("WJGS").toString().trim().toUpperCase();
%>	    
	<tr width="100%">
	  <td>
		<table width="100%">
		  <tr align="middle" height="80"> 
		    <td height="80">		
		<%if("JPG".equals(ext)||"JPEG".equals(ext)){ %>
        	  <img src="media.do?action=image&tablename=<%=tablename + "_M" %>&media_id=<%=mapIndex_m.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" onClick="window.location='../modules/view/view_fxxd.jsp?media_id=<%=mapIndex_m.get("ZLBM")%>&title=<%=mapIndex_m.get("TITLE") %>&dtcdt=<%=mapIndex_m.get("DTCDT")%>&tbdw=<%=mapIndex.get("WTDPCD") %>&fileName=<%=fileName %>&WJGS=<%=mapIndex_m.get("WJGS") %>&DETAIL=<%=mapIndex_m.get("NRMS") %>'" style="cursor:hand;border=0; height=<%=mediaheight %>;width=<%=mediawidth %>;z-index:8;"> 
        <%}else{  %>
        	  <img src="../../images/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='media.do?action=video&tablename=<%=tablename + "_M" %>&media_id=<%=mapIndex_m.get("ZLBM")%>'" WIDTH="80" HEIGHT="53"> 
        <%}%>
			</td>
		  </tr>
		  <tr align="middle"> 
		    <td><%=mapIndex_m.get("TITLE")%></td>
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
          <div name="text_detail" style="border=0 solid #002200" wrap="VIRTUAL" readonly class="button_query">
		    <%=mapIndex.get("ACTICO")==null?mapIndex.get("SDDSC"):mapIndex.get("ACTICO") %>  
          </div>
        </div>
        <br>
      </td>
    </tr>
  </table>
<%
	}else if("TB_PJRCN".equals(tablename)){//运行状态
%>
  <tr align="center"> 
      <td height="25" colspan="2" bgcolor="#FFFFFF" class="title"  >
        <div align="left"></div>
        <font size="5"><%=mapIndex.get("pjnm")%></font>
      </td>
    </tr>
    <tr align="center"> 
      <td height="30" bgcolor="#FFFFFF"  ><div align="left"><%=mapIndex.get("provnm")%></div></td>
      <td height="30" bgcolor="#FFFFFF" ><div align="right"><%=StringUtil.DateToString((Date)mapIndex.get("wtdpdt"), "yyyy-MM-dd")%></div></td>
    </tr>
  </table>
  <table width="68%" border="0"  align="center" cellspacing="0" cellpadding="0" class="bordercolor">
<%
	for(int i=0;i<listIndex_m.size();i++){
		Map mapYxzt_m = (Map)listIndex_m.get(i);
        
 		String fileName = "yxzt" + mapYxzt_m.get("ZLBM") + "." + mapYxzt_m.get("WJGS");
        int size = 8000/1024;
	    String altStr1 = "编 号:" + mapYxzt_m.get("ZLBM");
	    String altStr2 = "标  题:" + mapYxzt_m.get("TITLE");
	    String altStr3 = "采集单位:" + mapIndex.get("WTDPCD");
	    String altStr4 = "采集时间:" + StringUtil.DateToString((Date)mapIndex.get("DTCDT"), "yyyy-MM-dd");
	    String altStr5 = "文件名:" + fileName;
	    String altStr6 = "长 度:" + size + "kb";
	    String altStr7 = "介绍:"; 
	    
	    String ext = mapYxzt_m.get("WJGS")==null?"":mapYxzt_m.get("WJGS").toString().trim().toUpperCase();
%>
	<tr width="100%" align="middle">
	  <td>
		<table width="100%">
		  <tr align="middle" height="80"> 
		    <td  height="80">		
			  <%if("JPG".equals(ext)||"JPEG".equals(ext)){%>
        	  <img src="media.do?action=image&tablename=TB_PJR_M&media_id=<%=mapYxzt_m.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" onClick="window.location='../modules/view/view_yxzt.jsp?media_id=<%=mapYxzt_m.get("ZLBM")%>&title=<%=mapYxzt_m.get("TITLE") %>&dtcdt=<%=mapYxzt_m.get("DTCDT")%>&tbdw=<%=mapIndex.get("WTDPCD") %>&fileName=<%=fileName %>&WJGS=<%=mapYxzt_m.get("WJGS") %>&DETAIL=<%=mapYxzt_m.get("NRMS") %>'" style="cursor:hand;border=0; height=<%=mediaheight%>;width=<%=mediawidth%>;; z-index:8;"> 
        	  <%}else{%>
        	  <img src="../../images/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='media.do?action=video&tablename=TB_PJR_M&media_id=<%=mapYxzt_m.get("ZLBM")%>'" WIDTH="80" HEIGHT="53"> 
        	  <%}%>
			</td>
		  </tr>
		  <tr align="middle"> 
		    <td><%=mapYxzt_m.get("TITLE")%></td>
		  </tr>			
		</table>
	  </td>		
    </tr>
<%
	}
%>
  </table>
  <table width="68%" border="0"  align="center" cellspacing="1" bgcolor="#336699" valign="top">
    <tr align="center"> 
      <td height="1" colspan="4" bgcolor="#336699"> <font color="#FFFFFF">&nbsp;</font></tr>
    <tr align="center"> 
      <td width="20%" height="25" bgcolor="#E4E1D6" >检测时间</td>
      <td width="30%" height="25" bgcolor="#FFFFFF" ><%=StringUtil.DateToString((Date)mapIndex.get("dtcdt"), "yyyy-MM-dd")%></td>
      <td width="20%" height="25" bgcolor="#E4E1D6">工程类别</td>
      <td width="30%" height="25" bgcolor="#FFFFFF"><%=mapIndex.get("gcflmc")%></td>
    </tr>
    <tr align="center"> 
      <td width="20%" height="25" bgcolor="#E4E1D6">防汛责任人</td>
      <td width="30%" height="25" bgcolor="#FFFFFF" ><%=mapIndex.get("fpduty")%></td>
      <td width="20%" height="25" bgcolor="#E4E1D6" >防汛责任人电话</td>
      <td width="30%" height="25" bgcolor="#FFFFFF" ><%=mapIndex.get("fpdutyph")%></td>
    </tr>
    <tr align="center"> 
      <td width="20%" height="25" bgcolor="#E4E1D6">险情预测</td>
      <td width="30%" height="25" bgcolor="#FFFFFF"><%=mapIndex.get("dncfc")%></td>
      <td width="20%" height="25" bgcolor="#E4E1D6">抢险资源配备</td>
      <td width="30%" height="25" bgcolor="#FFFFFF"><%=mapIndex.get("rderescn")%></td>
    </tr>
    <tr align="center"> 
      <td width="20%" height="25" bgcolor="#E4E1D6">补充描述</td>
      <td width="30%" height="25" bgcolor="#FFFFFF"><%=mapIndex.get("nt")%></td>
      <td width="20%" height="25" bgcolor="#E4E1D6"></td>
      <td width="30%" height="25" bgcolor="#FFFFFF"></td>
    </tr>
  </table>
  <center>
  	<input type="button" id="button_detail" name="button_detail" value="详细信息" onclick="window.open('detail.do?action=yxzt1&id=<%=mapIndex.get("PJRNO") %>','详细信息','height=300,width=400,top=150,left=300,resizable=no,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no,dependent=yes,alwaysLowered=yes')" class="input1">
  </center>
<%
	}else if("TB_STDNC".equals(tablename)){
%>
	<tr> 
      <td  height="30"  colspan="2" align="center" class="title"><%=mapIndex.get("dncnm")%></td>
    </tr>
    <tr align="center"> 
      <td height="25" ><div align="left"></div>
        <div align="left">
          <font color=#000000><%=mapIndex.get("wtdpcd") %></font>
        </div>
      </td>
      <td height="25" ><div align="right"></div>
        <div align="right">
          <font color=#000000><%=StringUtil.DateToString((Date)mapIndex.get("dagtm"),"yyyy-MM-dd") %></font>
        </div>
      </td>
    </tr>
  </table>
  <table width="68%" border="0" cellspacing="0" align="center"  cellpadding="0" class="bordercolor">
<%
	for(int i=0;i<listIndex_m.size();i++){
		Map mapIndex_m = (Map)listIndex_m.get(i);
        
    	String fileName = "xq" + mapIndex_m.get("ZLBM") + "." + mapIndex_m.get("WJGS");
        int size = 8000/1024;
	    String altStr1 = "编 号:" + mapIndex_m.get("ZLBM");
	    String altStr2 = "标  题:" + mapIndex_m.get("TITLE");
	    String altStr3 = "采集单位:" + mapIndex.get("WTDPCD");
	    String altStr4 = "采集时间:" + mapIndex_m.get("DTCDT");
	    String altStr5 = "文件名:" + fileName;
	    String altStr6 = "长 度:" + size + "kb";
	    String altStr7 = "介绍:"; 
	    
	    String ext = mapIndex_m.get("WJGS")==null?"":mapIndex_m.get("WJGS").toString().trim().toUpperCase();
%>
	<tr width="100%">
	  <td>
	    <table width="100%">
		  <tr align="middle" height="80"> 
		    <td height="80">		
			  <%if("JPG".equals(ext)||"JPEG".equals(ext)){ %>
        	  <img src="media.do?action=image&tablename=TB_STDNC_M&media_id=<%=mapIndex_m.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()"  onClick="window.location='../modules/view/view_xq.jsp?media_id=<%=mapIndex_m.get("ZLBM")%>&title=<%=mapIndex_m.get("TITLE") %>&dtcdt=<%=mapIndex_m.get("DTCDT")%>&tbdw=<%=mapIndex.get("WTDPCD") %>&fileName=<%=fileName %>&WJGS=<%=mapIndex_m.get("WJGS") %>&DETAIL=<%=mapIndex_m.get("NRMS") %>'" style="cursor:hand;border=0; height=<%=mediaheight%>;width=<%=mediawidth%>; z-index:8;"> 
        	  <%}else{%>
        	  <img src="../../images/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='media.do?action=video&tablename=TB_STDNC_M&media_id=<%=mapIndex_m.get("ZLBM")%>'" WIDTH="80" HEIGHT="53"> 
        	  <%}%>
			</td>
		  </tr>
		  <tr align="middle"> 
		    <td><%=mapIndex_m.get("TITLE")%></td>
		  </tr>			
		</table>		
	  </td>
	</tr>
<%
	}
%>
  </table>
  <div align="center">
    <table width="68%" border="0"  align="center" cellpadding="0" cellspacing="1" bgcolor="#336699" >
      <tr> 
        <td height="1" colspan="4" align="center"> 
          <font color="#FFFFFF">&nbsp;</font>
        </td>
      </tr>
      <tr align="center" > 
        <td height="25" width="20%" bgcolor="#E4E1D6"><font color=#000000>工程名称</font></td>
        <td height="25" width="30%" bgcolor="#FFFFFF">
          <font color=#000000><%=mapIndex.get("pjnm") %></font>
        </td>
        <td height="25" width="20%" bgcolor="#E4E1D6"><font color=#000000>险情类别</font></td>
        <td height="25" width="30%" bgcolor="#FFFFFF">
          <font color=#000000><%=mapIndex.get("xqflmc")%></font>
        </td>
      </tr>
      <tr align="center"> 
        <td height="25" width="20%" bgcolor="#E4E1D6">险情级别</td>
        <td height="25" width="30%" bgcolor="#FFFFFF">
          <font color=#000000><%=mapIndex.get("dncgr")%></font>
        </td>
        <td height="25" width="20%" bgcolor="#E4E1D6">出险地点桩号</td>
        <td height="25" width="30%" bgcolor="#FFFFFF">
          <font color=#000000><%=mapIndex.get("dagplcch")%></font>
        </td>
      </tr>
    </table>
    <center>
  		<input type="button" id="button_detail" name="button_detail" value="详细信息" onclick="window.open('detail.do?action=xq1&id=<%=mapIndex.get("DNCNO") %>','详细信息','height=300,width=400,top=150,left=300,resizable=no,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no,dependent=yes,alwaysLowered=yes')" class="input1">
  	</center>
  </div>
<%
	}
%>  
  	</table>
  </body>
</html>
