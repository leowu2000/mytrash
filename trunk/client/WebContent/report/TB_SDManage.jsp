<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.page.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title>ʵʱ������Ϣ�ɼ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
</head>
<style type="text/css">
<!--
-->
</style>
<script language="JAVASCRIPT">
function toAdd(){
	document.forms[0].action="/report/zqbgAdd.jsp";
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
		alert("��û��ѡ���κμ�¼!");
	}else{
		if(result.lastIndexOf(",")>0){
			alert("��һ��ֻ���޸�һ����¼!");
		}else{			
			document.forms[0].action="/report/zqbgEdit.jsp?RPJINCD="+result;
			document.forms[0].submit();
		}
	}
	
}
</script>
<% 
	String path = request.getRealPath("/");

	List<SDBean> records = BuinessDao.getAllSdList(path); 
	String pageStr = request.getParameter("page"); 
	int currentPage = 1; 
	if (pageStr != null) 
	currentPage = Integer.parseInt(pageStr); 
	PageUtil pUtil = new PageUtil(10, records.size(), currentPage); 
	currentPage = pUtil.getCurrentPage(); 
%>
<body>
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">���鱨�����</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" value="" name="IDs"/>
<input type="hidden" value="TB_SD" name="towhere"/>
<input type="hidden" value="" name="actionType"/>
<input type="hidden" value="RPJINCD,ZLBM" name="PKFILED"/>
<input type="hidden" value="TB_SD,TB_SD_M" name="TBID"/>
<input type="hidden" value="<%=currentPage %>" name="currentPage"/>
<table border="0" align="center" width="95%" >
	<tr>
		<td width=100% bgcolor="#FFFFFF" align="right"> 
		��<%=pUtil.getRecordCount()%>����¼  ÿҳ��ʾ<%=pUtil.getPageSize()%>�� 
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
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#E8EFFF" height="30" >
		<td><input name=all class="input3" onclick=rcheckall() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title">�������</td>
		<td nowrap align="center" class="title">���λ</td>
		<td nowrap align="center" class="title">�ʱ��</td>
	</tr>
	<%if(records!=null && records.size()>0){
		for(int i=pUtil.getFromIndex();i<pUtil.getToIndex();i++){
			SDBean bean = (SDBean)records.get(i);
	%>
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type=checkbox class="input3" value="<%=bean.getRPJINCD() %>"></td>
		<td><a href="zqbgView.jsp?RPJINCD=<%=bean.getRPJINCD() %>" title="����鿴��ϸ��Ϣ"><%=bean.getWTTT()%></a></td>
		<td><%=bean.getWTDPCD()%></td>
		<td><%=bean.getWTDT()%></td>
	</tr>
	<%
		}
	} %>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td><input type="button" name="" value="��  ѯ">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:toAdd()">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:toEdit()">
	&nbsp;
	<input type="button" name="" value="ɾ  ��" onclick="javascript:toDel()"></td>
	</tr>
</table>
</body>
</html>
