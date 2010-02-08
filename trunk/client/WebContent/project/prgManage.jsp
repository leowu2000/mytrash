<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.page.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title>实时工情信息采集传输管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
</head>
<style type="text/css">
<!--


-->
</style>
<% 
	String path = request.getRealPath("/");

	List<PrjBean> records = BuinessDao.getAllList(path); 
	String pageStr = request.getParameter("page"); 
	int currentPage = 1; 
	if (pageStr != null) 
	currentPage = Integer.parseInt(pageStr); 
	PageUtil pUtil = new PageUtil(10, records.size(), currentPage); 
	currentPage = pUtil.getCurrentPage(); 
%> 

<script language="JAVASCRIPT">
function toAdd(){
	document.frm.action="/project/prgAdd.jsp";
	document.frm.submit();
}
function viewThePrg(id){
	document.frm.gclsh.value=id;
	document.frm.action="/buiness.do";
	document.frm.actionType.value="view";
	document.frm.submit();
}
function toEdit(){
	var result="";
	var str = document.forms[0].RECORDID;
	for(var i=0;i<str.length;i++){
		if(str[i].checked==true){
			if(result=="")
				result = str[i].value;
			else
				result +=","+ str[i].value;
		}
	}
	if(result==""){
		alert("您没有选择任何记录!");
	}else{
		if(result.lastIndexOf(",")>0){
			alert("您一次只能修改一条记录!");
		}else{			
			document.frm.IDs.value=result;
			document.frm.action="/buiness.do";
			document.frm.actionType.value="peredit";
			document.frm.submit();
		}
	}
}
</script>
<body>
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">工程信息</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" value="" name="actionType"/>
<input type="hidden" value="" name="IDs"/>
<input type="hidden" value="TB_PJ" name="TBID"/>
<input type="hidden" value="PJNO" name="PKFILED"/>
<input type="hidden" value="" name="gclsh"/>

<input type="hidden" value="<%=currentPage %>" name="currentPage"/>
<table border="0" align="center" width="95%" >
	<tr>
		<td width=100% bgcolor="#FFFFFF" align="right"> 
		共<%=pUtil.getRecordCount()%>条记录  每页显示<%=pUtil.getPageSize()%>条 
		<%if(currentPage>1) {%>
		<a href="/project/prgManage.jsp?page=1" ><img src="/images/shouye.GIF" border="0"></a> 
		<a href="/project/prgManage.jsp?page=<%=(currentPage - 1)%>"><img src="/images/shangyiye.GIF" border="0"></a> 
		<%} %>
		<%if(pUtil.getPageCount()>currentPage) {%>
		<a href="/project/prgManage.jsp?page=<%=(currentPage + 1)%>"><img src="/images/xiayiye.GIF" border="0"></a> 
		<a href="/project/prgManage.jsp?page=<%=pUtil.getPageCount()%>"><img src="/images/moye.GIF" border="0"></a> 
		<%} %>
	</td>
	</tr>
</table>
<table border="0" align="center" width="95%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#E8EFFF" height="30" >
		<td><input name=all class="input3" onclick="rcheckall()" type="checkbox" value="9999" ></td>
		<td nowrap align="center" class="title_center">工程名称</td>
		<td nowrap align="center" class="title_center">工程类别</td>
		<td nowrap align="center" class="title_center">所属地区</td>
		<td nowrap align="center" class="title_center">所属流域</td>
	</tr>
	<%
		if(records!=null && records.size()>0){
		for (int i = pUtil.getFromIndex(); i < pUtil.getToIndex(); i++) { 
			PrjBean model = (PrjBean) records.get(i); 
	%> 
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type="checkbox" class="input3" value="<%=model.getPJNO() %>"></td>
		<td><a href="#" onclick="javascript:viewThePrg('<%=model.getPJNO() %>')" title="点击查看详细信息"><%=model.getPJNM() %></a></td>
		<td><%=BuinessDao.getPrjLb(model.getPJNMCD(),path)%></td>
		<td><%=BuinessDao.getPrjCntname(model.getCNTCD(),path)%></td>
		<td><%=BuinessDao.getPrjLyxx(model.getPJNMCD(),path) %></td>
	</tr>
	<%}}%>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td><input type="button" name="" value="查  询">
	&nbsp;
	<input type="button" name="" value="新  增" onclick="javascript:toAdd()">
	&nbsp;
	<input type="button" name="" value="修  改" onclick="javascript:toEdit()">
	&nbsp;
	<input type="button" name="" value="删  除" onclick="javascript:toDel()"></td>
	</tr>
</table>
</body>
</html>
