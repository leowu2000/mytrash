<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	Map mapHq = (Map)request.getAttribute("mapHq");
	List listHq_m = (List)request.getAttribute("listHq_m");
	String tbdw = request.getAttribute("tbdw").toString();
	String pageNum = request.getAttribute("page").toString();
	String id = request.getAttribute("id").toString();
	
	int mediawidth = 1000/(listHq_m.size() + 1);
	int mediaheight = 600/(listHq_m.size() + 1);
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
    <title>旱情详细信息</title>
    
	<script language="javascript" src="../../script/openurl.js"></script>
	<script language="javascript" src="../../script/onmouseover.js"></script>
	<script language="JavaScript" src="../script/layer10.js"></script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
	<script type="text/javascript">
		function delete(){
			window.location.href = "/delete.do?action=hq&id=<%=id %>";
		}
	</script>
</head>
<body background="../../images/back.gif">
<p>&nbsp;</p>
<form name="form1" method="post" action="../interface/result_hq.asp" target="result"> 
  <table  width="68%"  border="0" cellspacing="1" align="center"cellpadding="0">
    <tr align="center"> 
      <td height="25" colspan="2" class="title">
      	<font size="5"><%=mapHq.get("WTTT") %></font>
      </td>
    </tr>
    <tr align="center"> 
      <td width="50%" height="25" ><div align="left"></div>
        <div align="left">
          <%=tbdw %>
        </div>
      </td>
      <td width="50%" height="25" ><div align="right"></div>
        <div align="right">
          <%=StringUtil.DateToString((Date)mapHq.get("WTDT"),"yyyy-MM-dd") %>
        </div>
      </td>
    </tr>
  </table>
  <table width="68%" border="0" cellspacing="0" align="center"cellpadding="0"  class="bordercolor">
<%
	for(int i=0;i<listHq_m.size();i++){
		Map mapHq_m = (Map)listHq_m.get(i);
		
		String fileName = "hq" + mapHq_m.get("ZLBM") + "." + mapHq_m.get("WJGS");
        int size = 8000/1024;
	    String altStr1 = "编 号:" + mapHq_m.get("ZLBM");
	    String altStr2 = "标  题:" + mapHq_m.get("TITLE");
	    String altStr3 = "采集单位:" + tbdw;
	    String altStr4 = "采集时间:" + mapHq_m.get("DTCDT");
	    String altStr5 = "文件名:" + fileName;
	    String altStr6 = "长 度:" + size + "kb";
	    String altStr7 = "介绍:"; 
%>
	<tr width="100%">
	  <td>
		<table width="100%">
		  <tr align="middle" height="80"> 
		    <td height="80">		
			<%if("JPG".equals(mapHq_m.get("WJGS").toString().trim().toUpperCase())||"JPG".equals(mapHq_m.get("WJGS").toString().trim().toLowerCase())){ %>
        	  <img src="media.do?action=image&tablename=TB_QT_M&media_id=<%=mapHq_m.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" onClick="window.location='../modules/view/view_hq.jsp?media_id=<%=mapHq_m.get("ZLBM")%>&title=<%=mapHq_m.get("TITLE") %>&dtcdt=<%=mapHq_m.get("DTCDT")%>&tbdw=<%=tbdw %>&fileName=<%=fileName %>&WJGS=<%=mapHq_m.get("WJGS") %>&DETAIL=<%=mapHq_m.get("NRMS") %>'" style="cursor:hand;border=0; height=<%=mediaheight%>;width=<%=mediawidth%>; z-index:8;"> 
        	<%}else{%>
        	  <img src="../../images/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='media.do?action=vedio&pid=<%=mapHq_m.get("ZLBM")%>&title=<%=mapHq_m.get("TITLE")%>&dtcdt=<%=mapHq_m.get("DTCDT")%>&tbdw=<%=tbdw%>&fileName=<%=fileName%>&WJGS=<%=mapHq_m.get("WJGS")%>'" WIDTH="80" HEIGHT="53"> 
        	<%}%>
			</td>
		  </tr>
		  <tr align="middle"> 
		    <td><%=mapHq_m.get("TITLE")%></td>
		  </tr>			
		</table>
	  </td>		
	</tr>
<%
	}
%>
  </table>

  <table width="68%" border="0" cellspacing="0" cellpadding="0" align="center" class="bordercolor">
    <tr> 
      <td height="20" bgcolor="#336699"> 
 		<div align="center"><font color="#FFFFFF"><b>详 细 内 容 </b></font></div></td>
    </tr>
    <tr>
      <td height="80">
    	<div align="center">
    	  <div name="text_detail" style="border=0 solid #002200" readonly wrap="VIRTUAL" class="button_query" > 
				<%=mapHq.get("ACTICO") %> 
          </div>
        </div>
        <br>
      </td>
    </tr> 
  </table>
  <table width="68%" border="0" cellspacing="0" cellpadding="0"  align="center" >
    <tr height="25"><td height="25" align="center"></td></tr>
    <tr>
      <td align="center">       
  	    <input type="button" name="button" value="返　　回" onclick="parent.focus();window.close()" class="input1">
<%
	if("true".equals(isAdmin)){
%>    	
		<input type="button" name="button" value="删　　除" onclick="if(confirm('确定删除？')){delete();window.close()}" class="input1">
<%
	}
%>
    	<INPUT type="hidden" id=curent_pagecount name=curent_pagecount value="<%=pageNum%>">
    	<input type="hidden" name="row_count" value="1">
    	<input type="hidden" name="command" value="-1">
    	<input type="hidden" name="check1" value="<%=mapHq.get("RPJINCD")%>">
      </td>
	</tr>
  </table>
  <p>&nbsp;</p>
</form>
</body>
</html>
