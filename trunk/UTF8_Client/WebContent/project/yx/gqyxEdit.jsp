<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/common/session.jsp"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    
    String path = request.getSession().getServletContext().getRealPath("/");
    BuinessDao.deleteDB("delete from TB_SUB_TEMP",path);
	String pjWhere = "1=1";
	if(configBean!=null)
		pjWhere = "CNTCD='"+configBean.getXZQH_X()+"'";
	List<PrjBean> beanList = BuinessDao.getAllList(path,pjWhere);
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");
	RandomAccessFileTool.delAllFile(path+"\\\\common\\\\pic");
	String RPJINCD = request.getParameter("RPJINCD");
	PJRCNBean pjrcbbean = BuinessDao.findPjrcnById(path,RPJINCD);
	
	String gcfldm = pjrcbbean.getGCFLDM();
	String tabtitle = BuinessDao.idToNameChange(path,"TB_GCLB", "GCFLMC",  "GCFLDM='"+gcfldm+"'");
	String jspcode = "";
	if("D".trim().equals(gcfldm)
			||"E".trim().equals(gcfldm)
			||"H".trim().equals(gcfldm)
			||"P".trim().equals(gcfldm))
		jspcode="A";
	else
		jspcode=gcfldm;
%> 
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
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
<script language="JAVASCRIPT">
function toBack(){
	location.href="/project/yx/gqyxManage.jsp";
}
</script>
<body>
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">修改运行状态信息</span></td></tr>
</table>
<form name="frm" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="myradio" value="1"></input>
<input type="hidden" name="GCLB" value="<%=jspcode%>"></input>
<input type="hidden" name="GCFLDM" value="<%=gcfldm%>"></input>
<input type="hidden" name="WTDPCD" value=""/>
<input type="hidden" name="DNCNO" value="<%=RPJINCD %>"/>
<input type="hidden" name="tabname" value="TB_PJR_M"></input>
<input type="hidden" name="DTCDT" value="<%=UtilDateTime.nowDateString()%>"/>
<input type="hidden" name="upFileValues" value=""/>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title" colspan="6">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">工程名称</td>
		<td height="25"  bgcolor="#FFFFFF"><%=pjrcbbean.getPJNM() %>
			<input type="hidden" name="GCNAME" value="<%=pjrcbbean.getPJNO() %>">
		</td>
		<td height="25" nowrap class="title">工程类别</td>
		<td height="25" bgcolor="#FFFFFF" colspan="2">
		<%=BuinessDao.idToNameChange(path,"TB_GCLB", "GCFLMC",  "GCFLDM='"+gcfldm+"'")%></td>
	</tr>
	<tr height="25" bgcolor="#FFFFFF" >
		<td nowrap class="title" >选择照片</td>
		<td bgcolor="#FFFFFF" >
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
	
	<tr height="25" >
		<td bgcolor="#FFFFFF" align="right" colspan="4">
			<input type="button" name="addbutton" value="添  加" onclick="javascript:uplaodReportPhotos('TB_PJR_M')"/>&nbsp;&nbsp;
			<input type="button" name="editbutton" value="修  改" disabled onclick="javascript:updateMediaMsg('TB_PJR_M')"/>&nbsp;&nbsp;
			<input type="button" name="cancelbutton" value="取  消" disabled onclick="javascript:cancelPhotos()"/>&nbsp;&nbsp;
		</td>
	</tr>
	<tr height="25" >
		<td nowrap bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="ZPFRAME" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0"  src="/common/pic.jsp?temp= <%=Math.random()%>&tablename=TB_PJR_M&pkvalue=<%=RPJINCD%>&pkname=PJRNO" height="110" width="100%">
		</iframe>	
		</td> 
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="main2" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="yxztLoader.jsp?RPJINCD=<%=RPJINCD %>" height="145" width="100%">
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="main4" scrolling="no" frameborder="0" marginwidth="1" marginheight="1"  onload="this.height=main4.document.body.scrollHeight" src="<%=jspcode %>_yx.jsp?RPJINCD=<%=RPJINCD %>&GCFLDM=<%=gcfldm %>&name=<%=tabtitle %>" height="100%" width="100%">
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="main3" scrolling="no" frameborder="0" marginwidth="0" marginheight="0" src="<%=jspcode %>_Loader.jsp?RPJINCD=<%=RPJINCD %>&GCFLDM=<%=gcfldm %>&name=<%=tabtitle %>" height="145" width="100%">
		</iframe>
		</td>
	</tr>
	
</table>
</form>

<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:per_Submit('edit_gqcj')">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
