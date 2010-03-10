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
</head>
<style type="text/css">
<!--


-->
</style>
<% 
	String path = request.getSession().getServletContext().getRealPath("/");
	String iswhere = (String)request.getAttribute("isWhere");
	String gcmc_s = (String)request.getAttribute("gcmc_s");
	String gclb_s = (String)request.getAttribute("gclb_s");
	String ly_s = (String)request.getAttribute("ly_s");
	String dq_s = (String)request.getAttribute("dq_s");
	gcmc_s=gcmc_s==null?"":gcmc_s;
	gclb_s=gclb_s==null?"":gclb_s;
	ly_s=ly_s==null?"":ly_s;
	dq_s=dq_s==null?"":dq_s;
	iswhere=iswhere==null?"":iswhere;
	List<PrjBean> records = BuinessDao.getAllList(path,iswhere); 
	String pageStr = request.getParameter("page"); 
	pageStr=pageStr==null?"1":pageStr;
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
function loadGclb(lb,dq,ly){
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/BaseServlet?type=loadSearch&lb="+lb+"&dq="+dq+"&ly="+ly, false);
	  xmlHttpReq.send(null);
	 var result = xmlHttpReq.responseText;
	 var val = result.split(";");
	 GCLB.innerHTML=val[0];
	 XZQH.innerHTML=val[1];
	 LYXX.innerHTML=val[2];
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
			document.frm.IDs.value=result;
			document.frm.action="/buiness.do";
			document.frm.actionType.value="peredit";
			document.frm.submit();
		}
	}
}
function SearchSubmit(){
	document.frm.action="/buiness.do";
	document.frm.actionType.value="search";
	document.frm.submit();
}
function doQuery(page){
	alert(page);
	document.frm.page.value=page;
	document.frm.action="/buiness.do";
	document.frm.actionType.value="topage";
	document.frm.submit();
}
</script>
<body onload="loadGclb('<%=gclb_s %>','<%=dq_s %>','<%=ly_s %>')">
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">���̹���</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" value="" name="actionType"/>
<input type="hidden" value="prj" name="searchType"/>
<input type="hidden" value="" name="IDs"/>
<input type="hidden" value="prg" name="towhere"/>
<input type="hidden" value="<%=pageStr %>" name="page"/>
<input type="hidden" value="<%=iswhere %>" name="iswhere"/>
<input type="hidden" value="TB_PJ" name="TBID"/>
<input type="hidden" value="PJNO" name="PKFILED"/>
<input type="hidden" value="" name="gclsh"/>

<input type="hidden" value="<%=currentPage %>" name="currentPage"/>
<table border="0" align="center" height="30" width="95%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap class="title">��������:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="gcmc_s" value="<%=gcmc_s %>"/> </td>
		<td nowrap class="title">�������:</td>
		<td bgcolor="#FFFFFF"> <DIV id="GCLB"></DIV></td>
		<td bgcolor="#FFFFFF" rowspan="2" align="center"><input type="button" value="��  ѯ" onclick="javascript:SearchSubmit()"></input></td>
	</tr>
	<tr>
		<td nowrap class="title">��������:</td>
		<td bgcolor="#FFFFFF" > <DIV id="XZQH"></DIV> </td>
		<td nowrap class="title">����:</td>
		<td bgcolor="#FFFFFF" ><DIV id="LYXX"></DIV>  </td>
	</tr>
</table>
<table border="0" align="center" width="95%" >
	<tr>
		<td width=100% bgcolor="#FFFFFF" align="right"> 
		��<%=pUtil.getRecordCount()%>����¼  ÿҳ��ʾ<%=pUtil.getPageSize()%>�� 
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
		<td><input name=all class="input3" onclick="rcheckall()" type="checkbox" value="9999" ></td>
		<td nowrap align="center" class="title_center">��������</td>
		<td nowrap align="center" class="title_center">�������</td>
		<td nowrap align="center" class="title_center">��������</td>
		<td nowrap align="center" class="title_center">��������</td>
	</tr>
	<%
		if(records!=null && records.size()>0){
		for (int i = pUtil.getFromIndex(); i < pUtil.getToIndex(); i++) { 
			PrjBean model = (PrjBean) records.get(i); 
	%> 
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type="checkbox" class="input3" value="<%=model.getPJNO() %>"></td>
		<td><a href="#" onclick="javascript:viewThePrg('<%=model.getPJNO() %>')" title="����鿴��ϸ��Ϣ"><%=model.getPJNM() %></a></td>
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