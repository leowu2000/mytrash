<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    String fromwhere = request.getParameter("fromwhere");
	String path = request.getSession().getServletContext().getRealPath("/");
	List<PrjBean> beanList = BuinessDao.getAllList(path,"");
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");

    String RPJINCD = request.getParameter("RPJINCD");
    RPJINCD=RPJINCD==null?"":RPJINCD;
    String arr[] = null;
    String PJNO = "";
    String DNCNO = "0";
    String XQFLDM = "";
    if(!"".trim().equals(RPJINCD)){
    	arr = RPJINCD.split(";");
    	PJNO = arr[0];
    	DNCNO = arr[1];
    	XQFLDM =arr[2];
    }
    STDNCBean stdncbean = BuinessDao.findStdncById(path,DNCNO);
    
%> 
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" /> 
<script type="text/javascript" src="/common/ext/ext-base.js"></script>
<script type="text/javascript" src="/common/ext/ext-all.js"></script>
<script Language="JavaScript" src="/common/js/projectCommon.js"></script>
<script Language="JavaScript" src="/common/js/common.js"></script>
</head>
<style type="text/css">
<!--

#newPreview
{
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
	width :150px; 
	height:100px; 
	borde:6px double #ccc;
}

-->
</style>

<script language="JAVASCRIPT">
function toBack(){
	location.href="/project/gqxqManage.jsp";
}
var w=0;
var h=0;
window.onresize = function(){
	var ww = document.documentElement.clientWidth;
	var hh = document.documentElement.clientHeight;
	if(ww!=w || hh!=h){
		w=ww;
		h=hh;
		document.getElementById("main1").width=ww*0.98;
	}
}

function getGcmessage2(id){
	var sttcd='<%=stdncbean.getWTDPCD() %>';
	var type = getRadioValue("myradio");
	if(window.XMLHttpRequest){ //Mozilla
    	var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	xmlHttpReq.open("GET", "/FileUploadServlet?type=gqcj&saveType="+type+"&changeVal="+id, false);
	xmlHttpReq.send(null);
	var result = xmlHttpReq.responseText;
	var val = result.split("|");
  	GCMESSAGE.innerHTML = val[0];
}
function updateXQFLFRAME(obj){
	window.frames["XQFLFRAME"].location.href=obj.value+".jsp";
}
</script>
<body scroll="auto" onload="javascript:getGcmessage2('<%=PJNO %>')">
<%if(!"upload".trim().equals(fromwhere)) {%>
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">查看工情险情</span></td></tr>
</table>
<%} %>

<form name="frm" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="myradio" value="2"></input>

<input type="hidden" name="STTNM" value=""></input>
<input type="hidden" name="tabname" value="TB_STDNC_M"></input>

<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title_center" colspan="6">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">工程名称[B]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=BuinessDao.idToNameChange(path,"TB_PJ", "PJNM", "PJNO="+PJNO) %>
		<input type="hidden" name="GCNAME" value="<%=PJNO %>"></td>
		<td height="25" nowrap class="title">险情分类[C]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=BuinessDao.idToNameChange(path,"TB_XQFL", "XQFLMC", "XQFLDM='"+XQFLDM+"'")%>
		<input type="hidden" name="XQFLDM" value="<%= XQFLDM%>"></td>
		<td height="25" nowrap class="title">填报单位[U]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=stdncbean.getWTDPCD() %></td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">险情标题[N]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=stdncbean.getDNCNM() %></td>
		<td height="25" nowrap class="title">建筑物[P]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=BuinessDao.idToNameChange(path,"TB_ST","STNM","STTPCD="+stdncbean.getSTTPCD()) %></td>
		<td height="25" nowrap class="title">采集时间[T]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=stdncbean.getDAGTM() %></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">险情级别:</td>
		<td bgcolor="#FFFFFF"><%=stdncbean.getDNCGR().trim()%></td>
		<td nowrap class="title">出险地点:</td>
		<td bgcolor="#FFFFFF"> <%=stdncbean.getDAGPLCCH() %> </td>
		<td nowrap class="title">出险部位:</td>
		<td bgcolor="#FFFFFF" > <%=stdncbean.getDAGLO() %> </td>
		
	</tr>
	<tr height="25" >
		<td nowrap class="title">解放军投入:</td>
		<td bgcolor="#FFFFFF"> <%=stdncbean.getPLAPN() %> 人</td>
		<td nowrap class="title">武警投入:</td>
		<td bgcolor="#FFFFFF"><%=stdncbean.getPLIPN() %> 人</td>
		<td nowrap class="title">群众投入:</td>
		<td bgcolor="#FFFFFF"><%=stdncbean.getTPN() %> 人 </td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" >当前水位:</td>
		<td bgcolor="#FFFFFF" colspan="4"><%=stdncbean.getRZ() %> 米</td>
		<td bgcolor="#FFFFFF" rowspan="3" align="center"><div id="newPreview" ></div></td>
	</tr>
	<tr height="25" bgcolor="#FFFFFF" >
		<td nowrap class="title">照片标题:</td> 
		<td bgcolor="#FFFFFF" colspan="4"><div id="TITLE">&nbsp;</div></td>
	</tr>
	<tr bgcolor="#FFFFFF" height="50" >
		<td nowrap class="title">照片描述:</td> 
		<td bgcolor="#FFFFFF" colspan="4"><div id="NRMS">&nbsp;</div></td>		
	</tr>
	<tr height="25" >
		<td nowrap bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="ZPFRAME" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0"  src="/common/picView.jsp?temp= <%=Math.random()%>&tablename=TB_STDNC_M&pkvalue=<%=stdncbean.getDNCNO() %>&pkname=DNCNO" height="110" width="100%">
		</iframe>	
		</td> 
	</tr>
	<tr height="25">
		<td bgcolor="#FFFFFF" colspan="10">
		<iframe id="main1" scrolling="no" frameborder="0" marginwidth="1" marginheight="1" src="/project/gcxqViewLoader.jsp?PJNO=<%=PJNO %>&DNCNO=<%=DNCNO %>" height="150" width="100%" >
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="11">
		<iframe id="XQFLFRAME" scrolling="no" frameborder="0" marginheight="1" marginwidth="1"  align="middle" onload="this.height=XQFLFRAME.document.body.scrollHeight" src="/project/<%=XQFLDM %>_view.jsp?PJNO=<%=PJNO %>&DNCNO=<%=DNCNO %>" height="100%" width="100%"></iframe>
		</td>
	</tr>
</table>
</form>
<br/>
<%if(!"upload".trim().equals(fromwhere)) {%>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
<%} %>
</body>
</html>
