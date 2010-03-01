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
<script Language="JavaScript" src="/common/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" /> 
<script type="text/javascript" src="/common/ext/ext-base.js"></script>
<script type="text/javascript" src="/common/ext/ext-all.js"></script>
<script Language="JavaScript" src="gccj_submit.js"></script>
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
	<tr><td align="center" ><span  class="style4">�鿴��������</span></td></tr>
</table>
<%} %>
<iframe name="saveFrm" src="" frameborder="0" scrolling="no" width="0" height="0">

</iframe>
<form name="warnForm" action="" method="post">
 </form>
<form name="form1" method="POST"> 
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
		<td height="25" nowrap class="title">��������[B]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=BuinessDao.idToNameChange(path,"TB_PJ", "PJNM", "PJNO="+PJNO) %>
		<input type="hidden" name="GCNAME" value="<%=PJNO %>"></td>
		<td height="25" nowrap class="title">�������[C]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=BuinessDao.idToNameChange(path,"TB_XQFL", "XQFLMC", "XQFLDM='"+XQFLDM+"'")%>
		<input type="hidden" name="XQFLDM" value="<%= XQFLDM%>"></td>
		<td height="25" nowrap class="title">���λ[U]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=stdncbean.getWTDPCD() %></td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">�������[N]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=stdncbean.getDNCNM() %></td>
		<td height="25" nowrap class="title">������[P]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=BuinessDao.idToNameChange(path,"TB_ST","STNM","STTPCD="+stdncbean.getSTTPCD()) %></td>
		<td height="25" nowrap class="title">�ɼ�ʱ��[T]:</td>
		<td height="25" bgcolor="#FFFFFF"><%=stdncbean.getDAGTM() %></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">���鼶��:</td>
		<td bgcolor="#FFFFFF"><%=stdncbean.getDNCGR().trim()%></td>
		<td nowrap class="title">���յص�:</td>
		<td bgcolor="#FFFFFF"> <%=stdncbean.getDAGPLCCH() %> </td>
		<td nowrap class="title">��ž�Ͷ��:</td>
		<td bgcolor="#FFFFFF"> <%=stdncbean.getPLAPN() %> ��</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">�侯Ͷ��:</td>
		<td bgcolor="#FFFFFF"><%=stdncbean.getPLIPN() %> ��</td>
		<td nowrap class="title">Ⱥ��Ͷ��:</td>
		<td bgcolor="#FFFFFF"><%=stdncbean.getTPN() %> �� </td>
		<td nowrap class="title" >��ǰˮλ:</td>
		<td bgcolor="#FFFFFF"> <%=stdncbean.getRZ() %> �� </td>
	</tr>
	<tr height="25" >
	<td nowrap class="title">���ղ�λ:</td>
		<td bgcolor="#FFFFFF" colspan="5"> <%=stdncbean.getDAGLO() %> </td>
	</tr>
	<tr height="25">
		<td bgcolor="#FFFFFF" colspan="10">
		<iframe id="main1" scrolling="no" frameborder="0" marginwidth="1" marginheight="1" src="/project/gcxqViewLoader.jsp?PJNO=<%=PJNO %>&DNCNO=<%=DNCNO %>" height="150" width="100%" >
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="11">
		<iframe id="ZPFRAME" scrolling="no" frameborder="0" marginheight="1" marginwidth="1" src="/common/picViewer.jsp?tbid=TB_STDNC_M&DNCNO=<%=DNCNO %>&PKNAME=DNCNO" height="130" width="100%"></iframe>
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
	<input type="button" name="" value="��  ��" onclick="javascript:toBack()">
	</tr>
</table>
<%} %>
</body>
</html>