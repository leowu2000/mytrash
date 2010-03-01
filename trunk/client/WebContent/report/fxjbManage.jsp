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
<script Language="JavaScript" src="/common/My97DatePicker/WdatePicker.js"></script>
</head>
<style type="text/css">
<!--
-->
</style>
<script language="JAVASCRIPT">
function toAdd(){
	document.forms[0].action="/report/fxjbAdd.jsp";
	document.forms[0].submit();
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
		alert("您没有选择任何记录!");
	}else{
		if(result.lastIndexOf(",")>0){
			alert("您一次只能修改一条记录!");
		}else{			
			document.forms[0].action="/report/fxjbEdit.jsp?RPJINCD="+result;
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
	alert(page);
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
	List<FXJBBean> records = BuinessDao.getAllFxjbcList(path,iswhere); 
	String pageStr = (String)request.getAttribute("page");  
	int currentPage = 1; 
	if (pageStr != null) 
	currentPage = Integer.parseInt(pageStr); 
	PageUtil pUtil = new PageUtil(10, records.size(), currentPage); 
	currentPage = pUtil.getCurrentPage(); 
%> 
<body>
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">防汛抗旱简报管理</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" value="" name="IDs"/>
<input type="hidden" value="fxjb" name="towhere"/>
<input type="hidden" name="actionType" value=""/>
<input type="hidden" value="<%=pageStr %>" name="page"/>
<input type="hidden" value="<%=iswhere %>" name="iswhere"/>
<input type="hidden" value="fxjb" name="searchType"/>
<input type="hidden" value="<%=currentPage %>" name="currentPage"/>
<table border="0" align="center" height="30" width="95%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap class="title">简报标题:</td>
		<td bgcolor="#FFFFFF"><input type="text" size="15" name="bt_s" value="<%=bt_s %>"></td>
		<td nowrap class="title">填报时间:</td>
		<td bgcolor="#FFFFFF">
		<input type="text" value="" size="15" name="tbsj_s" onClick="WdatePicker({skin:'blue'})"  value="<%=tbsj_s %>" readonly>至
		<input type="text" value="" size="15" name="tbsj_e" onClick="WdatePicker({skin:'blue'})"  value="<%=tbsj_e %>" readonly></td>
		<td bgcolor="#FFFFFF" align="center"><input type="button" value="查  询" onclick="javascript:SearchSubmit()"></input></td>
	</tr>
</table>
<table border="0" align="center" width="95%" >
	<tr>
		<td width=100% bgcolor="#FFFFFF" align="right"> 
		共<%=pUtil.getRecordCount()%>条记录  每页显示<%=pUtil.getPageSize()%>条 
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
		<td><input name=all class="input3" onclick=rcheckall() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title_center">简报标题</td>
		<td nowrap align="center" class="title_center">简报期数</td>
		<td nowrap align="center" class="title_center">填报单位</td>
		<td nowrap align="center" class="title_center">填报时间</td>
	</tr>
	<%if(records!=null && records.size()>0){
		for(int i=pUtil.getFromIndex();i<pUtil.getToIndex();i++){
			FXJBBean bean = (FXJBBean)records.get(i);
	%>
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type=checkbox class="input3" value="<%=bean.getRPJINCD() %>"></td>
		<td><a href="fxjbView.jsp?RPJINCD=<%=bean.getRPJINCD() %>" title="点击查看详细信息"><%=bean.getWTTT()%></a></td>
		<td><%=bean.getISSUE()%></td>
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
	<input type="button" name="" value="新  增" onclick="javascript:toAdd()">
	&nbsp;
	<input type="button" name="" value="修  改" onclick="javascript:toEdit()">
	&nbsp;
	<input type="button" name="" value="删  除" onclick=""></td>
	</tr>
</table>
</body>
</html>
