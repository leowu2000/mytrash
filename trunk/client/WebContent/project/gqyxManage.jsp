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
.lt1{

	font-family: "宋体";
	font-size: 9pt;
	font-weight: normal;
	color: #484833;
	text-decoration: none;
	text-align:center;
	background-color: #FFFFFF;
}
.lt2 {

	font-family: "宋体";
	font-size: 9pt;
	font-weight: normal;
	color: #484833;
	text-decoration: none;
	text-align:center;
	background-color: #F2F5EB;
}
.title {
	font-size: 10pt;
	padding-top: 2px;
	font-weight: bolder;
	color: #15428B;
	background-color: #E8EFFF;
	text-align:center;
}
-->
</style>
<script language="JAVASCRIPT">
function toAdd(){
	document.forms[0].action="/project/gqyxAdd.jsp";
	document.forms[0].submit();
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
			document.forms[0].action="/project/gqyxEdit.jsp?RPJINCD="+result;
			document.forms[0].submit();
		}
	}
}
</script>
<% 
	String path = request.getRealPath("/");

	List<PJRCNBean> records = BuinessDao.getAllPjrcnList(path); 
	String pageStr = request.getParameter("page"); 
	int currentPage = 1; 
	if (pageStr != null) 
	currentPage = Integer.parseInt(pageStr); 
	PageUtil pUtil = new PageUtil(10, records.size(), currentPage); 
	currentPage = pUtil.getCurrentPage(); 
%> 
<body>
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">工程运行状态</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" value="" name="actionType"/>
<input type="hidden" value="" name="IDs"/>
<input type="hidden" value="TB_PJRCN" name="TBID"/>
<input type="hidden" value="PJRNO" name="PKFILED"/>
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
		<td><input name=all class="input3" onclick=rcheckall() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title">工程名称</td>
		<td nowrap align="center" class="title">检测时间</td>
		<td nowrap align="center" class="title">险情预测</td>
		<td nowrap align="center" class="title">填报单位</td>
		<td nowrap align="center" class="title">填报时间</td>
	</tr>
	<%if(records!=null && records.size()>0){
		for(int i=pUtil.getFromIndex();i<pUtil.getToIndex();i++){
			PJRCNBean bean = (PJRCNBean)records.get(i);
	%>
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type=checkbox class="input3" value="<%=bean.getPJRNO() %>"></td>
		<td><%=bean.getPJNM() %></td>
		<td><%=bean.getDTCDT() %></td>
		<td><%=bean.getDNCFC() %></td>
		<td><%=bean.getWTDPCD() %></td>
		<td><%=bean.getWTDPDT() %></td>
	</tr>
	<%
		}
	} %>
	
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
