<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.fredck.FCKeditor.FCKeditor"%>
<%@ page import="com.core.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ include file="/common/session.jsp"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    String RPJINCD = request.getParameter("RPJINCD");
    FPACTIBean bean = BuinessDao.findFpactiByID(relPath,RPJINCD);
    String content = bean.getACTICO();
    RandomAccessFileExample.delAllFile(relPath+"\\\\common\\\\pic");
    BuinessDao.deleteDB("delete from TB_SUB_TEMP",relPath);
    List<SubTempBean> sublist = BuinessDao.getMediaBeanList(relPath,bean.getRPJINCD(),"TB_FPACTI_M","RPJINCD");
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="/common/js/reportCommon.js"></script>
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
	location.href="/report/TB_FPACTIManage.jsp";
}
</script>
<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">�޸ķ�Ѵ�ж�</span></td></tr>
</table>
<form name="frm" action="/buiness.do"  method="post">
<input type="hidden" name="DNCNO" value="<%=bean.getRPJINCD() %>"/>
<input type="hidden" name="actionType" value="add_report"/>
<input type="hidden" name="WTDPCD" value="<%=configBean.getTBDW() %>"/>
<input type="hidden" name="picid" value=""/>
<input type="hidden" name="check" value="1"/><!-- �Ƿ�ɾ����ý����ʱ�����ݱ�־1,ɾ��,2��ɾ�� -->
<input type="hidden" name="uptype" value=""/>
<input type="hidden" name="TABLENAME" value=""/>
<input type="hidden" name="subAction" value="edit"/>
<input type="hidden" name="FILEDNAME" value="ACTICO"/>
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap class="title">�ж�����:</td>
		<td align="left" bgcolor="#FFFFFF" colspan="2">
		<input type="text" name="MAINTITLE" value="<%=bean.getWTTT() %>" size="30"/></td>
		<td bgcolor="#FFFFFF" rowspan="4" align="center"><div id="newPreview" ></div></td>
	</tr>
	<tr height="25" bgcolor="#FFFFFF" >
		<td nowrap class="title" >ѡ����Ƭ:</td>
		<td bgcolor="#FFFFFF" width="35%">
		<div id="thfiles"  style="display:none"></div>
		<div id="showupfile" style="display:inline"><input type="file" id="UpFile" name="UpFile" size="20"  onchange="javascript:PreviewImg(this);"> </div>
		</td>
		<td nowrap class="title" width="40%">��Ƭ����:</td> 
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td nowrap class="title">��Ƭ����:</td> 
		<td bgcolor="#FFFFFF"><input type="text" name="TITLE" value="" size="30"/></td>
		<td rowspan=2 bgcolor="#FFFFFF">
		<textarea rows="3" cols="3" name="NRMS" style="width:100%"></textarea>
		</td>
	</tr>
	<tr>
		<td nowrap class="title">����ʱ��:</td> 
		<td bgcolor="#FFFFFF" >
			<input type="text" name="DTCDT" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:false})" readonly value="" size="30"/>
				<input type="button" name="addbutton" value="���" onclick="javascript:uplaodReportPhotos('TB_FPACTI_M')"/>
				<input type="button" name="editbutton" value="�޸�" disabled onclick="javascript:updateMediaMsg('TB_FPACTI_M')"/>
				<input type="button" name="cancelbutton" value="ȡ��" disabled onclick="javascript:cancelPhotos()"/>
		</td>
	</tr>
	<tr height="25" >
		<td nowrap bgcolor="#FFFFFF" colspan="4" align="center">
		<iframe id="ZPFRAME" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0"  src="/common/pic.jsp?temp= <%=Math.random()%>&tablename=TB_FPACTI_M&pkvalue=<%=RPJINCD %>&pkname=RPJINCD" height="110" width="100%">
		</iframe>	
		</td> 
	</tr>
	
	<tr height="25" >
	<td bgcolor="#FFFFFF" colspan="4">
	<%	           
	    FCKeditor oFCKeditor ;
	    oFCKeditor = new FCKeditor( request, "CONTENT") ;
	    oFCKeditor.setBasePath( "/FCKeditor/" ) ;
		oFCKeditor.setToolbarSet( "NowUse" ) ;
	    oFCKeditor.setHeight("200");
	    oFCKeditor.setValue( content==null?"":content );
	    out.println(oFCKeditor.create());
     %>
	</td>
	</tr>
	
</table>
</form>

<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="��  ��" onclick="javascript:submitingReport('TB_FPACTI')">
	&nbsp;
	<input type="button" name="" value="ȡ  ��" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
