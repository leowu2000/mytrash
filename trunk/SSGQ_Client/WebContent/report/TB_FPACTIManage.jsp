<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.page.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/common/session.jsp"%>
<html>
<head>
<title>ʵʱ������Ϣ�ɼ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="/common/My97DatePicker/WdatePicker.js"></script>
</head>
<style type="text/css">
<!--

-->
</style>
<script language="JAVASCRIPT">
function toAdd(){
	document.forms[0].action="/report/fxxdAdd.jsp";
	document.forms[0].submit();
}
function SearchSubmit(){
	document.frm.gclsh.value=id;
	document.frm.action="/buiness.do";
	document.frm.actionType.value="search";
	document.frm.submit();
}
function toEdit(){
	var result="";
	var str = document.forms[0].RECORDID;
	if(str.length==undefined){
		if(document.forms[0].RECORDID.checked){
			result=document.forms[0].RECORDID.value;
		}
	}else{
		for(var i=0;i<str.length;i++){
			if(str[i].checked==true){
				if(result=="")
					result = str[i].value;
				else
					result +=","+ str[i].value;
			}
		}
	}
	if(result==""){
		alert("��û��ѡ���κμ�¼!");
	}else{
		if(result.lastIndexOf(",")>0){
			alert("��һ��ֻ���޸�һ����¼!");
		}else{			
			document.forms[0].action="/report/fxxdEdit.jsp?RPJINCD="+result;
			document.forms[0].submit();
		}
	}
	
}
function SearchSubmit(){
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
</script>
<% 
	String path = request.getSession().getServletContext().getRealPath("/");
	String bt_s = (String)request.getAttribute("bt_s");
	String tbsj_s = (String)request.getAttribute("tbsj_s");
	String tbsj_e = (String)request.getAttribute("tbsj_e");
	String iswhere = (String)request.getAttribute("isWhere");
	bt_s=bt_s==null?"":bt_s;
	tbsj_s=tbsj_s==null?"":tbsj_s;
	tbsj_e=tbsj_e==null?"":tbsj_e;
	iswhere=iswhere==null?"":iswhere;
	List<FPACTIBean> records = BuinessDao.getAllFpactiList(path,iswhere); 
	String pageStr = (String)request.getAttribute("page"); 
	int currentPage = 1; 
	if (pageStr != null) 
	currentPage = Integer.parseInt(pageStr); 
	PageUtil pUtil = new PageUtil(10, records.size(), currentPage); 
	currentPage = pUtil.getCurrentPage(); 
%>
<body>
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">��Ѵ�ж�����</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" value="" name="IDs"/>
<input type="hidden" value="TB_FPACTI" name="towhere"/>
<input type="hidden" value="TB_FPACTI" name="searchType"/>
<input type="hidden" value="" name="actionType"/>
<input type="hidden" value="<%=pageStr %>" name="page"/>
<input type="hidden" value="<%=iswhere %>" name="iswhere"/>
<input type="hidden" value="RPJINCD,RPJINCD" name="PKFILED"/>
<input type="hidden" value="TB_FPACTI,TB_FPACTI_M" name="TBID"/>
<input type="hidden" value="<%=currentPage %>" name="currentPage"/>
<table border="0" align="center" height="30" width="95%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap class="title">�ж�����:</td>
		<td bgcolor="#FFFFFF"><input type="text" size="15" name="bt_s" value="<%=bt_s %>"></td>
		<td nowrap class="title">�ʱ��:</td>
		<td bgcolor="#FFFFFF">
		<input type="text" size="15" name="tbsj_s" onClick="WdatePicker({skin:'blue'})"  value="<%=tbsj_s %>" readonly>��
		<input type="text" size="15" name="tbsj_e" onClick="WdatePicker({skin:'blue'})"  value="<%=tbsj_e %>" readonly></td>
		<td bgcolor="#FFFFFF" align="center"><input type="button" value="��  ѯ" onclick="javascript:SearchSubmit()"></input></td>
	</tr>
</table>
<table border="0" align="center" width="95%" >
	<tr>
		<td width=100% bgcolor="#FFFFFF" align="right"> 
		��<font color="red">&nbsp;<%=pUtil.getRecordCount()%>&nbsp;</font>����¼,
		 ÿҳ��ʾ<font color="red">&nbsp;<%=pUtil.getPageSize()%>&nbsp;</font>�� 
		,��ǰ��<font color="red">&nbsp;<%=currentPage %>&nbsp;</font>ҳ
		<%if(currentPage>1) {%>
		<a href="javascript:doQuery(1)" ><img src="/images/shouye.GIF" border="0"></a> 
		<a href="javascript:doQuery(<%=(currentPage - 1)%>)"><img src="/images/shangyiye.GIF" border="0"></a> 
		<%} %>
		<%if(pUtil.getPageCount()>currentPage) {%>
		<a href="javascript:doQuery(<%=(currentPage + 1)%>)"><img src="/images/xiayiye.GIF" border="0"></a> 
		<a href="javascript:doQuery(<%=pUtil.getPageCount()%>)"><img src="/images/moye.GIF" border="0"></a> 
		<%} %>
	</td>
	</tr>
</table>
<table border="0" align="center" width="95%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#E8EFFF" height="30" >
		<td class="title"><input name=all class="inputAll" onclick=rcheckall() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title_center">�ж�����</td>
		<td nowrap align="center" class="title_center">���λ</td>
		<td nowrap align="center" class="title_center">�ʱ��</td>
	</tr>
	<%if(records!=null && records.size()>0){
		for(int i=pUtil.getFromIndex();i<pUtil.getToIndex();i++){
			FPACTIBean bean = (FPACTIBean)records.get(i);
	%>
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type=checkbox class="input3" value="<%=bean.getRPJINCD() %>"></td>
		<td><a href="/report/fxxdView.jsp?RPJINCD=<%=bean.getRPJINCD() %>" title="����鿴��ϸ��Ϣ"><%=bean.getWTTT()%></a></td>
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
	<td>
	<input type="button" name="" value="��  ��" onclick="javascript:toAdd()">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:toEdit()">
	&nbsp;
	<input type="button" name="" value="ɾ  ��" onclick="javascript:toDel()"></td>
	</tr>
</table>
</body>
</html>
