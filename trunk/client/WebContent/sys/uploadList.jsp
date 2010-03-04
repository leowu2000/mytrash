<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.page.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="/common/My97DatePicker/WdatePicker.js"></script>
</head>

<script language="JAVASCRIPT">
function showDetail_s(id,tbname){
	window.opener.showDetail(id,tbname);
}
function SearchSubmit(){
	document.frm.gclsh.value=id;
	document.frm.action="/buiness.do";
	document.frm.actionType.value="search";
	document.frm.submit();
}
function doQuery(page){
	document.frm.page.value=page;
	document.frm.action="/buiness.do";
	document.frm.actionType.value="topage";
	document.frm.submit();
}
function upload_submit(){
	document.frm.action="/upload.do";
	document.frm.actionType.value="upload";
	document.frm.submit();
}
</script>

<% 
	String path = request.getSession().getServletContext().getRealPath("/");
	
	List<UploadBean> records = UploadDB.getUploadRecords(path);
%> 
<body>
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">数 据 上 传</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" value="" name="IDs"/>
<input type="hidden" value="" name="actionType"/>
<input type="hidden" value="fxjb" name="towhere"/>

<input type="hidden" value="" name="iswhere"/>
<input type="hidden" value="fxjb" name="searchType"/>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#E8EFFF" height="30" >
		<td><input name=all class="input3" onclick=rcheckall() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title_center">标题</td>
		<td nowrap align="center" class="title_center">填报时间</td>
		<td nowrap align="center" class="title_center">类别</td>
		<td nowrap align="center" class="title_center">填报单位</td>
	</tr>
	<%if(records!=null && records.size()>0){
		for(int i=0;i<records.size();i++){
			UploadBean bean = (UploadBean)records.get(i);
	%>
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type=checkbox class="input3" value="<%=bean.getNum() %>"></td>
		<td>
		
		<%=bean.getTitle()%>
		</td>
		<td><%=bean.getWTDPDT()%></td>
		<td><%=bean.getTbcname()%></td>
		<td><%=bean.getWTDPCD()%></td>
	</tr>
	<%
		}
	} %>
</table>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="上传数据" onclick="javascript:upload_submit()">
	</td>
	</tr>
</table>
</form>
</body>
</html>
