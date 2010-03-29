<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.util.*" %>
<%
	Map mapYxzt = (Map)request.getAttribute("mapYxzt");
	List listYxzt_m = (List)request.getAttribute("listYxzt_m");
	String id = request.getAttribute("id").toString();
	Map mapGcflxx = (Map)request.getAttribute("mapGcflxx");
	
	String gcfldm = mapYxzt.get("GCFLDM").toString();
	String gcflmc = request.getAttribute("gcflmc").toString();
	
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
  <table  width="38%" border="0"  align="center" cellspacing="1" cellpadding="0" >
    <tr align="center"> 
      <td height="25" colspan="3" bgcolor="#FFFFFF" class="title"  >
        <div align="left"></div>
        <font size="5"><%=mapYxzt.get("pjnm")%></font>
      </td>
    </tr>
    <tr align="left"> 
      <td height="30" bgcolor="#FFFFFF" ><div align="left"><%=mapYxzt.get("provnm")%></div></td>
      <td height="30" bgcolor="#FFFFFF" ><div align="middle"><%=StringUtil.DateToString((Date)mapYxzt.get("wtdpdt"), "yyyy-MM-dd")%></div></td>
      <td height="30" bgcolor="#FFFFFF"><div align="right"><%=gcflmc %></div></td>
    </tr>
  </table>
  <table width='40%' border='0'  align='center' cellpadding='0' cellspacing='1' bgcolor='#336699' >
<%
	if("B".equals(gcfldm)){//水库
%>
  	  <tr align='center'>
		<td width='15%' height='25' bgcolor="#E4E1D6">水库类别</td>
		<td width='35%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("RSCLS")==null?"":mapGcflxx.get("RSCLS")%></font></td>        
  	  </tr>
  	  <tr align="center">
  	  	<td width='15%' height='25' bgcolor="#E4E1D6">当前库容</td>
		<td width='35%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("RV")==null?"":mapGcflxx.get("RV")%>万立方米</font></td>
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">当前运行水位</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("RZ")==null?"":mapGcflxx.get("RZ")%>米</font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">当前泻量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("RQ")==null?"":mapGcflxx.get("RQ")%>立方米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">坝基完好状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("DFPFCN")==null?"":mapGcflxx.get("DFPFCN")%></font></td>  
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">坝体稳定情况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("DBSTBCN")==null?"":mapGcflxx.get("DBSTBCN")%></font></td>       
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">护坡护岸稳定情况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("BRBPPFCN")==null?"":mapGcflxx.get("BRBPPFCN")%></font></td> 
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">泄水建筑物完好状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("ESPFCN")==null?"":mapGcflxx.get("ESPFCN")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">消能工完好状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("EDDPFCN")==null?"":mapGcflxx.get("EDDPFCN")%></font></td> 
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">闸门、启闭机完好状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("GTHOPFCN")==null?"":mapGcflxx.get("GTHOPFCN")%></font></td>       
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">通讯手段及状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("COMMCN")==null?"":mapGcflxx.get("COMMCN")%></font></td>  
  	  </tr>
<%
	}else if("D".equals(gcfldm)||"E".equals(gcfldm)||"H".equals(gcfldm)||"P".equals(gcfldm)){//堤防、海堤、圩垸、穿堤
%> 
	  <tr align='center'>
		<td width='15%' height='25' bgcolor="#E4E1D6">堤防级别</td>
		<td width='35%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("DKGR")==null?"":mapGcflxx.get("DKGR")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	  <td width='15%' height='25' bgcolor="#E4E1D6">所在岸别</td>
		<td width='35%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("BKOT")==null?"":mapGcflxx.get("BKOT")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">起止桩号</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("STECH")==null?"":mapGcflxx.get("STECH")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	  <td height='25' bgcolor="#E4E1D6">当前水位</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("RZ")==null?"":mapGcflxx.get("RZ")%>米</font></td>         
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">当前流量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("RQ")==null?"":mapGcflxx.get("RQ")%>立方米/秒</font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">水面距堤顶距离</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("WSTODC")==null?"":mapGcflxx.get("WSTODC")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">堤防完好状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("DKPFCN")==null?"":mapGcflxx.get("DKPFCN")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">穿堤建筑物状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("TSCN")==null?"":mapGcflxx.get("TSCN")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">护坡护岸完好状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("BRBPPFCN")==null?"":mapGcflxx.get("BRBPPFCN")%></font></td>
  	  </tr>
<%
	}else if("K".equals(gcfldm)){//水闸
%>
	  <tr align='center'>
		<td width='15%' height='25' bgcolor="#E4E1D6">水闸级别</td>
		<td width='35%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("WLGR")==null?"":mapGcflxx.get("WLGR")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td width='15%' height='25' bgcolor="#E4E1D6">当前闸上水位</td>
		<td width='35%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("RUPGZ")==null?"":mapGcflxx.get("RUPGZ")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">当前闸下水位</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("RDWGZ")==null?"":mapGcflxx.get("RDWGZ")%>米</font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">当前过闸流量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("RQO")==null?"":mapGcflxx.get("RQO")%>立方米/秒</font></td>         
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">当前水面距闸顶距离</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("RWSTOWLT")==null?"":mapGcflxx.get("RWSTOWLT")%>米</font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">坝基完好状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("GFPFCN")==null?"":mapGcflxx.get("GFPFCN")%></font></td>         
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">建筑物完好状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("STPFCN")==null?"":mapGcflxx.get("STPFCN")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">消能工完好状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("EDDPFCN")==null?"":mapGcflxx.get("EDDPFCN")%></font></td>         
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">闸门、启闭机完好状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("GTHOPFCN")==null?"":mapGcflxx.get("GTHOPFCN")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">通讯手段及状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("COMMCN")==null?"":mapGcflxx.get("COMMCN")%></font></td>         
  	  </tr>
<%	
	}else if("N".equals(gcfldm)){//治河
%>
	  <tr align='center'>
		<td width='15%' height='25' bgcolor="#E4E1D6">所在岸别</td>
		<td width='35%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("BKOT")==null?"":mapGcflxx.get("BKOT")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td width='15%' height='25' bgcolor="#E4E1D6">水流情况描述</td>
		<td width='35%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("FLCNDSC")==null?"":mapGcflxx.get("FLCNDSC")%></font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">河道情况描述</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("WDCNDSC")==null?"":mapGcflxx.get("WDCNDSC")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">清障的落实</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("PRCCLR")==null?"":mapGcflxx.get("PRCCLR")%></font></td>         
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">河道情况描述</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("WDCNDSC")==null?"":mapGcflxx.get("WDCNDSC")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">清障的落实</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("PRCCLR")==null?"":mapGcflxx.get("PRCCLR")%></font></td>         
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">控导工程描述</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("SPURDSC")==null?"":mapGcflxx.get("SPURDSC")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">护岸工程情况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("BPPJCN")==null?"":mapGcflxx.get("BPPJCN")%></font></td>         
  	  </tr>
<%
	}else if("F".equals(gcfldm)){//蓄滞
%>
	  <tr align='center'>
		<td width='15%' height='25' bgcolor="#E4E1D6">所在岸别</td>
		<td width='35%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("BKOT")==null?"":mapGcflxx.get("BKOT")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td width='15%' height='25' bgcolor="#E4E1D6">设计行(蓄)洪水位</td>
		<td width='35%' height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("DSFLWZ")==null?"":mapGcflxx.get("DSFLWZ")%>米</font></td>        
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">设计行(蓄)洪量</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("DSFLW")==null?"":mapGcflxx.get("DSFLW")%>万立方米</font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">交通状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("TRFCN")==null?"":mapGcflxx.get("TRFCN")%></font></td>         
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">圩堤状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("DKCN")==null?"":mapGcflxx.get("DKCN")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">通讯预警设施状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("CWFCCN")==null?"":mapGcflxx.get("CWFCCN")%></font></td>         
  	  </tr>
  	  <tr align='center'>
  	  	<td height='25' bgcolor="#E4E1D6">避水救生设施状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("SFSRCN")==null?"":mapGcflxx.get("SFSRCN")%></font></td>
  	  </tr>
  	  <tr align='center'>
  	    <td height='25' bgcolor="#E4E1D6">分洪设施状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("FLFADSC")==null?"":mapGcflxx.get("FLFADSC")%></font></td>
  	  </tr>
  	  <tr align='center'>
		<td height='25' bgcolor="#E4E1D6">排水站状况</td>
		<td height='25' bgcolor='#FFFFFF' ><font color=#000000 id='lable21'><%=mapGcflxx.get("IDSTCN")==null?"":mapGcflxx.get("IDSTCN")%></font></td>
  	  </tr>
<%
	}
%>
  	</table>
  	<table  width="68%" border="0"  align="center">
      <tr height="25"><td height="25" align="center"></td></tr>
      <tr align="center">
        <td align='center' colspan="2"><br><br><input type='button' name='button' value='关  闭' onclick='self.close();' class='input1'></td>
      </tr>
    </table>    
  <p>&nbsp;</p>
  </form>
</body>
</html>
