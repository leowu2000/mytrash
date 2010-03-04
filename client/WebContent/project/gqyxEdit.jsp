<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    
    String path = request.getSession().getServletContext().getRealPath("/");
    BuinessDao.deleteDB("delete from TB_SUB_TEMP",path);
	List<PrjBean> beanList = BuinessDao.getAllList(path,"");
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");
	
	String RPJINCD = request.getParameter("RPJINCD");
	PJRCNBean pjrcbbean = BuinessDao.findPjrcnById(path,RPJINCD);
	RSRBean rsrbean = BuinessDao.findRsrById(path,RPJINCD);
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
	location.href="/project/gqyxManage.jsp";
}
</script>
<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">修改运行状态信息</span></td></tr>
</table>
<form name="frm" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="myradio" value="1"></input>
<input type="hidden" name="WTDPCD" value=""/>
<input type="hidden" name="DNCNO" value="<%=RPJINCD %>"/>
<input type="hidden" name="tabname" value="TB_PJR_M"></input>
<input type="hidden" name="DTCDT" value="<%=UtilDateTime.nowDateString()%>"/>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title" colspan="6">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">工程名称[B]:</td>
		<td height="25"  bgcolor="#FFFFFF"><%=pjrcbbean.getPJNM() %>
			<input type="hidden" name="GCNAME" value="<%=pjrcbbean.getPJNO() %>">
		</td>
		<td height="25" nowrap class="title">采集时间[T]:</td>
		<td height="25" bgcolor="#FFFFFF">
		<input type="text" name="DAGTM" value="<%=pjrcbbean.getDTCDT() %>"/></td>
		<td nowrap class="title">水库类别:</td>
		<td bgcolor="#FFFFFF">
		<select name="RSCLS">
				<option value="1" >良好</option>
				<option value="2" >尚好</option>
				<option value="2" >病险库</option>
			</select>
		</td>
	</tr>
	<tr height="25" >
		
		<td nowrap class="title">当前运行水位:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RZ" value="<%=rsrbean.getRZ()==null?"":rsrbean.getRZ() %>" size="8"/>米<font color="red">*</font></td>
		<td nowrap class="title">当前库容:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RV" value="<%=rsrbean.getRV()==null?"":rsrbean.getRV() %>" size="8"/>万立方米<font color="red">*</font></td>
		<td nowrap class="title">当前泻量:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="RQ" value="<%=rsrbean.getRQ()==null?"":rsrbean.getRQ()  %>" size="8"/>立方米/秒<font color="red">*</font></td>
	</tr>
	<tr height="25" bgcolor="#FFFFFF" >
		<td nowrap class="title" >选择照片:</td>
		<td bgcolor="#FFFFFF" colspan="2">
		<div id="thfiles"  style="display:none"></div>
		<div id="showupfile" style="display:inline"><input type="file" id="UpFile" name="UpFile" size="20" onchange="javascript:PreviewImg(this);"> </div>
		</td>
		<td nowrap class="title">照片标题:</td> 
		<td bgcolor="#FFFFFF" ><input type="text" name="TITLE" value=""/></td>
		<td bgcolor="#FFFFFF" rowspan="3" align="center"><div id="newPreview" ></div></td>
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td nowrap class="title">照片描述:</td> 
		<td bgcolor="#FFFFFF" colspan="4">
		<textarea rows="3" cols="10" name="NRMS" style="width:100%"></textarea>
		</td>		
	</tr>
	
	<tr height="25" >
		<td bgcolor="#FFFFFF" align="right" colspan="5">
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
		<iframe id="main3" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="skLoader.jsp?RPJINCD=<%=RPJINCD %>" height="145" width="100%">
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
