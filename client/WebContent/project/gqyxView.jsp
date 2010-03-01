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
<%if(!"upload".trim().equals(fromwhere)) {%>
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">�鿴����״̬��Ϣ</span></td></tr>
</table>
<%} %>
<form name="form1" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="myradio" value="1"/>
<input type="hidden" name="WTDPCD" value=""/>
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
		</td>
		<td height="25" nowrap class="title">�ɼ�ʱ��[T]:</td>
		<td height="25" bgcolor="#FFFFFF">
		<%=pjrcbbean.getDTCDT() %></td>
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
		<td bgcolor="#FFFFFF" ><%=rsrbean.getRZ() %>��</td>
		<td nowrap class="title">��ǰ����:</td>
		<td bgcolor="#FFFFFF" ><%=rsrbean.getRV() %>��������</td>
		<td nowrap class="title">��ǰк��:</td>
		<td bgcolor="#FFFFFF"><%=rsrbean.getRQ() %>������/��</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="ZPFRAME" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="/common/picViewer.jsp?tbid=TB_PJR_M&DNCNO=<%=RPJINCD %>&PKNAME=PJRNO" height="130" width="100%">
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="main2" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="/project/yxztViewLoader.jsp?RPJINCD=<%=RPJINCD %>" height="140" width="100%">
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="main3" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" src="/project/skViewLoader.jsp?RPJINCD=<%=RPJINCD %>" height="140" width="100%">
		</iframe>
		</td>
	</tr>
	
</table>
</form>
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
