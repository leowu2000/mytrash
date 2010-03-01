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
	location.href="/project/gqyxManage.jsp";
}

</script>
<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">�޸�����״̬��Ϣ</span></td></tr>
</table>
<form name="form1" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="myradio" value="1"></input>
<input type="hidden" name="WTDPCD" value=""/>
<input type="hidden" name="DNCNO" value="<%=RPJINCD %>"/>
<input type="hidden" name="tabname" value="TB_PJR_M"></input>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title" colspan="6">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">��������[B]:</td>
		<td height="25"  bgcolor="#FFFFFF"><%=pjrcbbean.getPJNM() %>
			<input type="hidden" name="GCNAME" value="<%=pjrcbbean.getPJNO() %>">
		</td>
		<td height="25" nowrap class="title">�ɼ�ʱ��[T]:</td>
		<td height="25" bgcolor="#FFFFFF">
		<input type="text" name="DAGTM" value="<%=pjrcbbean.getDTCDT() %>"/></td>
		<td nowrap class="title">ˮ�����:</td>
		<td bgcolor="#FFFFFF">
		<select name="RSCLS">
				<option value="1" >����</option>
				<option value="2" >�к�</option>
				<option value="2" >���տ�</option>
			</select>
		</td>
	</tr>
	<tr height="25" >
		
		<td nowrap class="title">��ǰ����ˮλ:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RZ" value="<%=rsrbean.getRZ()==null?"":rsrbean.getRZ() %>" size="8"/>��<font color="red">*</font></td>
		<td nowrap class="title">��ǰ����:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RV" value="<%=rsrbean.getRV()==null?"":rsrbean.getRV() %>" size="8"/>��������<font color="red">*</font></td>
		<td nowrap class="title">��ǰк��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="RQ" value="<%=rsrbean.getRQ()==null?"":rsrbean.getRQ()  %>" size="8"/>������/��<font color="red">*</font></td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="ZPFRAME" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="/common/picEdit.jsp?tbid=TB_PJR_M&DNCNO=<%=RPJINCD %>&PKNAME=PJRNO" height="160" width="100%">
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
	<input type="button" name="" value="��  ��" onclick="javascript:per_Submit('edit_gqcj')">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
