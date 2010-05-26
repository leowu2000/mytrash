<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	Map mapZq = (Map)request.getAttribute("mapZq");
	List listZq_m = (List)request.getAttribute("listZq_m");
	String tbdw = request.getAttribute("tbdw").toString();
	String pageNum = request.getAttribute("page").toString();
	String id = request.getAttribute("id").toString();
	
	int mediawidth = 1000/(listZq_m.size() + 1);
	int mediaheight = 600/(listZq_m.size() + 1);
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
    <title>险情详细信息</title>
    
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
      		xmlHttpReq.open("GET", "consult.do?action=add&type=zq&id=<%=id %>", false);
      		xmlHttpReq.send();
      		if(xmlHttpReq.responseText!=''){
        		alert(xmlHttpReq.responseText);
      		}
	  		parent.focus();
	  		window.close();
		}
		
		function del(){
			window.location.href = "/delete.do?action=zq&id=<%=id %>";
		}
	</script>
</head>
<body background="../../images/back.gif">
<p>&nbsp;</p>
<form name="form1" method="post" action="../interface/result_zq.asp" target="result"> 
  <table  width="68%"  border="0" cellspacing="1"align="center" cellpadding="0"  >
    <tr align="center"> 
      <td height="25" colspan="2" class="title">
        <font size="5"><%=mapZq.get("WTTT") %></font>
      </td>
    </tr>
    <tr align="center"> 
      <td height="25" bgcolor="#FFFFFF">
        <div align="left"></div>
        <div align="left"><%=mapZq.get("WTDT") %></div>
      </td>
      <td height="25" bgcolor="#FFFFFF">
        <div align="right"></div>
        <div align="right"><%=mapZq.get("WTDPCD") %></div>
      </td>
    </tr>
  </table>
  <table width="68%" border="0" cellspacing="0"align="center" cellpadding="0" class="bordercolor">
<%
	for(int i=0;i<listZq_m.size();i++){
		Map mapZq_m = (Map)listZq_m.get(i);
		
    	String fileName = "zq" + mapZq_m.get("ZLBM") + "." + mapZq_m.get("WJGS");
        int size = 8000/1024;
	    String altStr1 = "编 号:" + mapZq_m.get("ZLBM");
	    String altStr2 = "标  题:" + mapZq_m.get("TITLE");
	    String altStr3 = "采集单位:" + tbdw;
	    String altStr4 = "采集时间:" + mapZq_m.get("DTCDT");
	    String altStr5 = "文件名:" + fileName;
	    String altStr6 = "长 度:" + size + "kb";
	    String altStr7 = ""; 
	    
	    String ext = mapZq_m.get("WJGS")==null?"":mapZq_m.get("WJGS").toString().trim().toUpperCase();
%>
	<tr width="100%" align="middle">
	  <td>
		<table width="100%">
		  <tr align="middle" height="80"> 
		    <td height="80">		
			  <%if("JPG".equals(ext)||"JPEG".equals(ext)){%>
        	  <img src="media.do?action=image&tablename=TB_SD_M&media_id=<%=mapZq_m.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" onClick="window.location='../modules/view/view_zq.jsp?media_id=<%=mapZq_m.get("ZLBM")%>&title=<%=mapZq_m.get("TITLE") %>&dtcdt=<%=mapZq_m.get("DTCDT")%>&tbdw=<%=tbdw %>&fileName=<%=fileName %>&WJGS=<%=mapZq_m.get("WJGS") %>&DETAIL=<%=mapZq_m.get("NRMS") %>'" style="cursor:hand;border=0; height=<%=mediaheight%>;z-index:8;"> 
        	  <%}else{%>
          	  <img src="../../images/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='media.do?action=video&tablename=TB_SD_M&media_id=<%=mapZq_m.get("ZLBM")%>'" WIDTH="80" HEIGHT="53"> 
        	  <%}%>
			</td>
		  </tr>
		  <tr align="middle"> 
		    <td><%=mapZq_m.get("TITLE")%></td>
		  </tr>			
		</table>
	  </td>		
	</tr>
<%
	}
%>
  </table>
  <table width="68%" border="0" cellspacing="0"  align="center" cellpadding="0" class="bordercolor">
    <tr>
      <td height="30" bgcolor="#336699" align="center">
        <font color="#FFFFFF"><b>灾 情 描 述</b></font>
      </td>
    </tr>
	<tr align="center">
	  <td height="80">
    	<div name="text_detail" style="border=0 solid #002200 " readonly wrap="VIRTUAL" class="button_query">
          <%=mapZq.get("SDDSC") %>  
        </div>
      </td>
    </tr>
  </table>
  <table  width="68%" border="0"  align="center">
    <tr height="25"><td height="25" align="center"></td></tr>
    <tr align="center">
      <td>
        <input type="button" name="button" value="返　　回" onclick="parent.focus();window.close()" class="input1">
        <input type="button" name="button" value="加入会商" onclick="addConsult();" class="input1">
<%
	if("true".equals(isAdmin)){
%>    	
		<input type="button" name="button" value="删　　除" onclick="if(confirm('确定删除？')){del();window.close()}" class="input1">
<%
	}
%>
        <INPUT type="hidden" id=curent_pagecount name=curent_pagecount value="<%=pageNum%>">
        <input type="hidden" name="row_count" value="1">
        <input type="hidden" name="command" value="-1">
        <input type="hidden" name="check1" value="<%=mapZq.get("RPJINCD")%>">
        <p>&nbsp;</p>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
