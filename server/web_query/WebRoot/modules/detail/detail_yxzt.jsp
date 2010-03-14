<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	Map mapYxzt = (Map)request.getAttribute("mapYxzt");
	List listYxzt_m = (List)request.getAttribute("listYxzt_m");
	String tbdw = request.getAttribute("tbdw").toString();
	String pageNum = request.getAttribute("page").toString();
	String id = request.getAttribute("id").toString();
	
	int mediawidth = 1000/(listYxzt_m.size() + 1);
	int mediaheight = 600/(listYxzt_m.size() + 1);
	if(mediawidth<100){
		mediawidth = 100;
	}
	if(mediaheight<60){
		mediaheight	= 60;
	}
	
	String isAdmin = session.getAttribute("isAdmin")==null?"false":session.getAttribute("isAdmin").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>运行状态详细信息</title>
    
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
      xmlHttpReq.open("GET", "consult.do?action=add&type=yxzt&id=<%=id %>", false);
      xmlHttpReq.send();
      if(xmlHttpReq.responseText!=''){
        alert(xmlHttpReq.responseText);
      }
	  parent.focus();
	  window.close();
	}
	
	function del(){
			window.location.href = "/delete.do?action=yxzt&id=<%=id %>";
		}
	</script>
</head>
<body background="../../images/back.gif">
<p>&nbsp;</p>
<form name="form1" method="post" action="../interface/result_yxzt.asp" target="result"> 
  <table  width="68%" border="0"  align="center" cellspacing="1" cellpadding="0" >
    <tr align="center"> 
      <td height="25" colspan="2" bgcolor="#FFFFFF" class="title"  >
        <div align="left"></div>
        <font size="5"><%=mapYxzt.get("pjnm")%></font>
      </td>
    </tr>
    <tr align="center"> 
      <td height="30" bgcolor="#FFFFFF"  ><div align="left"><%=mapYxzt.get("provnm")%></div></td>
      <td height="30" bgcolor="#FFFFFF" ><div align="right"><%=StringUtil.DateToString((Date)mapYxzt.get("wtdpdt"), "yyyy-MM-dd")%></div></td>
    </tr>
  </table>
  <table width="68%" border="0"  align="center" cellspacing="0" cellpadding="0" class="bordercolor">
<%
	for(int i=0;i<listYxzt_m.size();i++){
		Map mapYxzt_m = (Map)listYxzt_m.get(i);
        
 		String fileName = "yxzt" + mapYxzt_m.get("ZLBM") + "." + mapYxzt_m.get("WJGS");
        int size = 8000/1024;
	    String altStr1 = "编 号:" + mapYxzt_m.get("ZLBM");
	    String altStr2 = "标  题:" + mapYxzt_m.get("TITLE");
	    String altStr3 = "采集单位:" + tbdw;
	    String altStr4 = "采集时间:" + StringUtil.DateToString((Date)mapYxzt.get("DTCDT"), "yyyy-MM-dd");
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
        	  <img src="media.do?action=image&tablename=TB_PJR_M&media_id=<%=mapYxzt_m.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" onClick="window.location='../modules/view/view_yxzt.jsp?media_id=<%=mapYxzt_m.get("ZLBM")%>&title=<%=mapYxzt_m.get("TITLE") %>&dtcdt=<%=mapYxzt_m.get("DTCDT")%>&tbdw=<%=tbdw %>&fileName=<%=fileName %>&WJGS=<%=mapYxzt_m.get("WJGS") %>&DETAIL=<%=mapYxzt_m.get("NRMS") %>'" style="cursor:hand;border=0; height=<%=mediaheight%>;width=<%=mediawidth%>;; z-index:8;"> 
        	  <%}else{%>
        	  <img src="../../images/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='../media/player.jsp?tablename=TB_PJR_M&media_id=<%=mapYxzt_m.get("ZLBM")%>'" WIDTH="80" HEIGHT="53"> 
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
      <td width="30%" height="25" bgcolor="#FFFFFF" ><%=StringUtil.DateToString((Date)mapYxzt.get("dtcdt"), "yyyy-MM-dd")%></td>
      <td width="20%" height="25" bgcolor="#E4E1D6">工程类别</td>
      <td width="30%" height="25" bgcolor="#FFFFFF"><%=mapYxzt.get("gcflmc")%></td>
    </tr>
    <tr align="center"> 
      <td width="20%" height="25" bgcolor="#E4E1D6">防汛责任人</td>
      <td width="30%" height="25" bgcolor="#FFFFFF" ><%=mapYxzt.get("fpduty")%></td>
      <td width="20%" height="25" bgcolor="#E4E1D6" >防汛责任人电话</td>
      <td width="30%" height="25" bgcolor="#FFFFFF" ><%=mapYxzt.get("fpdutyph")%></td>
    </tr>
    <tr align="center"> 
      <td width="20%" height="25" bgcolor="#E4E1D6">险情预测</td>
      <td width="30%" height="25" bgcolor="#FFFFFF"><%=mapYxzt.get("dncfc")%></td>
      <td width="20%" height="25" bgcolor="#E4E1D6">抢险资源配备</td>
      <td width="30%" height="25" bgcolor="#FFFFFF"><%=mapYxzt.get("rderescn")%></td>
    </tr>
    <tr align="center"> 
      <td width="20%" height="25" bgcolor="#E4E1D6">补充描述</td>
      <td width="30%" height="25" bgcolor="#FFFFFF"><%=mapYxzt.get("nt")%></td>
      <td width="20%" height="25" bgcolor="#E4E1D6"></td>
      <td width="30%" height="25" bgcolor="#FFFFFF"></td>
    </tr>
  </table>
  <table  width="68%" border="0"  align="center">
    <tr height="25"><td height="25" align="center"></td></tr>
    <tr>
      <td align="center">
        <input type="button" name="button2" value="返　　回" onClick="parent.focus();window.close()" class="input1">
        <input type="button" id="button_detail" name="button_detail" value="详细信息" onclick="if(this.value=='详细信息'){bb=window.open('detail.do?action=yxzt1&id=<%=id %>','详细信息','height=300,width=400,top=150,left=300,resizable=no,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no,dependent=yes,alwaysLowered=yes');}else{this.value='详细信息';bb.close();}" class="input1">
        <input type="button" name="button" value="加入会商" onclick="addConsult();" class="input1"> 
<%
	if("true".equals(isAdmin)){
%>    	
		<input type="button" name="button" value="删　　除" onclick="if(confirm('确定删除？')){del();window.close()}" class="input1">
<%
	}
%>
      </td>
	</tr>
  </table>
  <p>&nbsp;</p>
  </form>
</body>
</html>
