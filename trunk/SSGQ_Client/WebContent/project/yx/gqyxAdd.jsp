<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/common/session.jsp"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
%> 
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/projectCommon.js"></script>
<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="/common/My97DatePicker/WdatePicker.js"></script>
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
<%
	String path = request.getSession().getServletContext().getRealPath("/");
	String pjWhere = "1=1";
	if(configBean!=null)
		pjWhere = "CNTCD='"+configBean.getXZQH_X()+"'";
	List<PrjBean> beanList = BuinessDao.getAllList(path,pjWhere);

	String uuid = String.valueOf(UUIdFactory.getMaxId(path, "TB_PJRCN","PJRNO"));
	BuinessDao.deleteDB("delete from TB_SUB_TEMP",path);
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");
%>
<script language="JAVASCRIPT">
function toBack(){
	window.location.href="/project/yx/gqyxManage.jsp";
}
function getGcmessageForyx(id){
	var type = getRadioValue("myradio");
	if(window.XMLHttpRequest){ //Mozilla
    	var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	xmlHttpReq.open("GET", "/FileUploadServlet?type=gqcj&subtype=yx&saveType="+type+"&changeVal="+id, false);
	xmlHttpReq.send(null);
	var result = xmlHttpReq.responseText;
	var val = result.split(";");
  	GCMESSAGE.innerHTML = val[0];
  	GCLBS.innerHTML = val[2];
  	document.forms[0].GCLB.value=val[1];
  	document.forms[0].GCFLDM.value=val[3];
  	window.frames["main4"].location.href=val[1]+"_yx.jsp?GCFLDM="+val[3];
  	window.frames["main3"].location.href=val[1]+"_Loader.jsp?name="+val[2]+"&GCFLDM="+val[3];
}
</script>
<body>
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">新增运行状态信息</span></td></tr>
</table>
<form name="frm" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="myradio" value="1"></input>
<input type="hidden" name="GCLB" value="1"></input>
<input type="hidden" name="GCFLDM" value="1"></input>
<input type="hidden" name="WTDPCD" value="<%=configBean.getTBDW() %>"/>
<input type="hidden" name="DNCNO" value="<%=uuid %>"/>
<input type="hidden" name="DTCDT" value="<%=UtilDateTime.nowDateString()%>"/>
<input type="hidden" name="tabname" value="TB_PJR_M"></input>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap class="title_center" colspan="6">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">工程名称</td>
		<td height="25"  bgcolor="#FFFFFF">
			<select name="GCNAME" onchange="javascript:getGcmessageForyx(this.value)">
			<option value="">--工程名称--</option>
				<%if(beanList!=null && beanList.size()>0){
					for(int i=0;i<beanList.size();i++){
						PrjBean bean = beanList.get(i);
			%>
				<option value="<%=bean.getPJNO() %>"><%=bean.getPJNM() %></option>
			<%
					}
				} %>
			</select>
		</td>
		<td nowrap class="title">工程类别</td>
		<td bgcolor="#FFFFFF" colspan="2"><div id="GCLBS"></div></td>
	</tr>
	<tr height="25" bgcolor="#FFFFFF" >
		<td nowrap class="title" >选择照片</td>
		<td bgcolor="#FFFFFF">
		<div id="thfiles"  style="display:none"></div>
		<div id="showupfile" style="display:inline"><input type="file" id="UpFile" name="UpFile" size="20" onchange="javascript:PreviewImg(this);"> </div>
		</td>
		<td nowrap class="title">照片标题</td> 
		<td bgcolor="#FFFFFF" ><input type="text" name="TITLE" value=""/></td>
		<td bgcolor="#FFFFFF" rowspan="3" align="center"><div id="newPreview" ></div></td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td nowrap class="title">照片描述</td> 
		<td bgcolor="#FFFFFF" colspan="3">
		<textarea rows="3" cols="10" name="NRMS" style="width:100%"></textarea>
		</td>		
	</tr>
	
	<tr height="25">
		<td bgcolor="#FFFFFF" align="right" colspan="4">
			<input type="button" name="addbutton" value="添  加" onclick="javascript:uplaodReportPhotos('TB_PJR_M')"/>&nbsp;&nbsp;
			<input type="button" name="editbutton" value="修  改" disabled onclick="javascript:updateMediaMsg('TB_PJR_M')"/>&nbsp;&nbsp;
			<input type="button" name="cancelbutton" value="取  消" disabled onclick="javascript:cancelPhotos()"/>&nbsp;&nbsp;
		</td>
	</tr>
	<tr height="25" >
		<td nowrap bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="ZPFRAME" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0"  src="/common/pic.jsp?tablename=TB_PJR_M&pkvalue=<%=uuid%>&pkname=PJRNO" height="110" width="100%">
		</iframe>	
		</td> 
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="main2" scrolling="no" frameborder="0" marginwidth="0" marginheight="0" src="yxztLoader.jsp" height="145" width="100%">
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="main4" scrolling="no" frameborder="0" marginwidth="1" marginheight="1"  onload="this.height=main4.document.body.scrollHeight" src="B_yx.jsp" height="100%" width="100%">
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="main3" scrolling="no" frameborder="0" marginwidth="0" marginheight="0" src="B_Loader.jsp" height="145" width="100%">
		</iframe>
		</td>
	</tr>
</table>
</form>

<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:per_Submit('add_gqcj')">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
