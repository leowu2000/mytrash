<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	Map mapXq = (Map)request.getAttribute("mapXq");
	Map mapXq_s = (Map)request.getAttribute("mapXq_s");
	List listXq_m = (List)request.getAttribute("listXq_m");
	String tbdw = request.getAttribute("tbdw").toString();
	String pageNum = request.getAttribute("page").toString();
	String id = request.getAttribute("id").toString();
	
	int mediawidth = 1000/(listXq_m.size() + 1);
	int mediaheight = 600/(listXq_m.size() + 1);
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
      xmlHttpReq.open("GET", "consult.do?action=add&type=xq&id=<%=id %>", false);
      xmlHttpReq.send();
      if(xmlHttpReq.responseText!=''){
        alert(xmlHttpReq.responseText);
      }
	  parent.focus();
	  window.close();
	}
	
	function del(){
			window.location.href = "/delete.do?action=xq&id=<%=id %>";
	}
	</script>
</head>
<body background="../../images/back.gif">
<p>&nbsp;</p>
<form name="form1" method="post" action="../interface/result_xq.asp" target="result"> 
 
  <table  width="68%"  border="0" cellspacing="1" align="center"  cellpadding="0">
    <tr> 
      <td  height="30"  colspan="2" align="center" class="title"><%=mapXq.get("dncnm")%></td>
    </tr>
    <tr align="center"> 
      <td height="25" ><div align="left"></div>
        <div align="left">
          <font color=#000000><%=mapXq.get("wtdpcd") %></font>
        </div>
      </td>
      <td height="25" ><div align="right"></div>
        <div align="right">
          <font color=#000000><%=StringUtil.DateToString((Date)mapXq.get("dagtm"),"yyyy-MM-dd") %></font>
        </div>
      </td>
    </tr>
  </table>
  <table width="68%" border="0" cellspacing="0" align="center"  cellpadding="0" class="bordercolor">
<%
	for(int i=0;i<listXq_m.size();i++){
		Map mapXq_m = (Map)listXq_m.get(i);
        
    	String fileName = "xq" + mapXq_m.get("ZLBM") + "." + mapXq_m.get("WJGS");
        int size = 8000/1024;
	    String altStr1 = "编 号:" + mapXq_m.get("ZLBM");
	    String altStr2 = "标  题:" + mapXq_m.get("TITLE");
	    String altStr3 = "采集单位:" + tbdw;
	    String altStr4 = "采集时间:" + mapXq_m.get("DTCDT");
	    String altStr5 = "文件名:" + fileName;
	    String altStr6 = "长 度:" + size + "kb";
	    String altStr7 = "介绍:"; 
	    
	    String ext = mapXq_m.get("WJGS")==null?"":mapXq_m.get("WJGS").toString().trim().toUpperCase();
%>
	<tr width="100%">
	  <td>
	    <table width="100%">
		  <tr align="middle" height="80"> 
		    <td height="80">		
			  <%if("JPG".equals(ext)||"JPEG".equals(ext)){ %>
        	  <img src="media.do?action=image&tablename=TB_STDNC_M&media_id=<%=mapXq_m.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()"  onClick="window.location='../modules/view/view_xq.jsp?media_id=<%=mapXq_m.get("ZLBM")%>&title=<%=mapXq_m.get("TITLE") %>&dtcdt=<%=mapXq_m.get("DTCDT")%>&tbdw=<%=tbdw %>&fileName=<%=fileName %>&WJGS=<%=mapXq_m.get("WJGS") %>&DETAIL=<%=mapXq_m.get("NRMS") %>'" style="cursor:hand;border=0; height=<%=mediaheight%>;z-index:8;"> 
        	  <%}else{%>
        	  <img src="../../images/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='media.do?action=video&tablename=TB_STDNC_M&media_id=<%=mapXq_m.get("ZLBM")%>'" WIDTH="80" HEIGHT="53"> 
        	  <%}%>
			</td>
		  </tr>
		  <tr align="middle"> 
		    <td><%=mapXq_m.get("TITLE")%></td>
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
          <font color=#000000><%=mapXq.get("pjnm") %></font>
        </td>
        <td height="25" width="20%" bgcolor="#E4E1D6"><font color=#000000>建筑物名称</font></td>
        <td height="25" width="30%" bgcolor="#FFFFFF">
          <font color=#000000><%=mapXq_s==null?"":mapXq_s.get("stnm")%></font>
        </td>
      </tr>
      <tr align="center"> 
        <td height="25" width="20%" bgcolor="#E4E1D6"><font color=#000000>险情类别</font></td>
        <td height="25" width="30%" bgcolor="#FFFFFF">
          <font color=#000000><%=mapXq.get("xqflmc")%></font>
        </td>
        <td height="25" width="20%" bgcolor="#E4E1D6">险情级别</td>
        <td height="25" width="30%" bgcolor="#FFFFFF">
          <font color=#000000><%=mapXq.get("dncgr")%></font>
        </td>
      </tr>
      <tr align="center"> 
        <td height="25" width="20%" bgcolor="#E4E1D6">出险地点桩号</td>
        <td height="25" width="30%" bgcolor="#FFFFFF">
          <font color=#000000><%=mapXq.get("dagplcch")%></font>
        </td>
        <td height="25" width="20%" bgcolor="#E4E1D6"><font color=#000000>&nbsp;</font></td>
        <td height="25" width="30%" bgcolor="#FFFFFF"><font color=#000000>&nbsp;</font></td>
      </tr>
    </table>
    <table width="68%" border="0" cellspacing="0" cellpadding="0"  align="center" >
  	  <tr height="25"><td height="25" align="center"></td></tr>
      <tr>
        <td align="center">
          <input type="button" name="button" value="返　　回" onclick="parent.focus();window.close()" class="input1">
          <input type="button" id="button_detail" name="button_detail" value="详细信息" onclick="if(this.value=='详细信息'){aa=window.open('detail.do?action=xq1&id=<%=id %>','详细信息','height=300,width=400,top=150,left=300,resizable=no,scrollbars=yes,status=no,toolbar=no,menubar=no,location=no,dependent=yes,alwaysLowered=yes');this.value='关闭信息'}else{this.value='详细信息';aa.close();}" class="input1">
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
  </div>
  <p>&nbsp;</p>
  </form>
</body>
</html>
