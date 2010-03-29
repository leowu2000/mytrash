<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.page.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/common/session.jsp"%>
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
	document.forms[0].action="/project/yx/gqyxAdd.jsp";
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
			document.forms[0].action="/project/yx/gqyxEdit.jsp?RPJINCD="+result;
			document.forms[0].submit();
		}
	}
}
function SearchSubmit(){
	document.frm.action="/buiness.do";
	document.frm.actionType.value="search";
	document.frm.submit();
}
</script>
<% 
	String path = request.getSession().getServletContext().getRealPath("/");
	String iswhere = (String)request.getAttribute("isWhere");
	String gcmc_s =  (String)request.getAttribute("gcmc_s");
	String jcsj_s =  (String)request.getAttribute("jcsj_s");
	String jcsj_e =  (String)request.getAttribute("jcsj_e");
	iswhere=iswhere==null?"":iswhere;
	jcsj_e=jcsj_e==null?"":jcsj_e;
	jcsj_s=jcsj_s==null?"":jcsj_s;
	gcmc_s=gcmc_s==null?"":gcmc_s;
	List<PrjBean> beanList = BuinessDao.getAllList(path,"1=1");
	List<PJRCNBean> records = BuinessDao.getAllPjrcnList(path,iswhere); 
	String pageStr = (String)request.getAttribute("page"); 
	pageStr=pageStr==null?request.getParameter("page"):pageStr;
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
<table border="0" align="center" height="30" width="95%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap class="title">工程名称:</td>
		<td bgcolor="#FFFFFF">
		<select name="gcmc_s">
				<option value="">--</option>
					<%if(beanList!=null && beanList.size()>0){
						for(int i=0;i<beanList.size();i++){
							PrjBean bean = beanList.get(i);
				%>
					<option value="<%=bean.getPJNO() %>" <%if(gcmc_s.trim().equals(bean.getPJNO())) {%>selected<%} %>><%=bean.getPJNM() %></option>
				<%
						}
					} %>
				</select>
		</td>
		<td nowrap class="title">检测时间:</td>
		<td bgcolor="#FFFFFF">
		<input type="text" value="" size="15" onClick="WdatePicker({skin:'blue'})"  name="jcsj_s" value="<%=jcsj_s %>" readonly>至
		<input type="text" value="" size="15" onClick="WdatePicker({skin:'blue'})"  name="jcsj_e" value="<%=jcsj_e %>" readonly></td>
		<td bgcolor="#FFFFFF" align="center"><input type="button" value="查  询" onclick="javascript:SearchSubmit()"></input></td>
	</tr>
</table>
<input type="hidden" value="" name="actionType"/>
<input type="hidden" value="yxzt" name="searchType"/>
<input type="hidden" value="" name="IDs"/>
<input type="hidden" value="gqyx" name="towhere"/>
<input type="hidden" value="<%=iswhere %>" name="iswhere"/>
<input type="hidden" value="TB_PJRCN,TB_PJR_M,TB_RSR,TB_COWAPJ,TB_DKR,TB_STOFLER,TB_WLR" name="TBID"/>
<input type="hidden" value="PJRNO,PJRNO,PJRNO,PJRNO,PJRNO,PJRNO,PJRNO" name="PKFILED"/>
<input type="hidden" value="<%=currentPage %>" name="currentPage"/>
<table border="0" align="center" width="95%" >
	<tr>
		<td width=100% bgcolor="#FFFFFF" align="right"> 
		共<font color="red">&nbsp;<%=pUtil.getRecordCount()%>&nbsp;</font>条记录,
		 每页显示<font color="red">&nbsp;<%=pUtil.getPageSize()%>&nbsp;</font>条 
		,当前第<font color="red">&nbsp;<%=currentPage %>&nbsp;</font>页
		<%if(currentPage>1) {%>
		<a href="/project/yx/gqyxManage.jsp?page=1" ><img src="/images/shouye.GIF" border="0"></a> 
		<a href="/project/yx/gqyxManage.jsp?page=<%=(currentPage - 1)%>"><img src="/images/shangyiye.GIF" border="0"></a> 
		<%} %>
		<%if(pUtil.getPageCount()>currentPage) {%>
		<a href="/project/yx/gqyxManage.jsp?page=<%=(currentPage + 1)%>"><img src="/images/xiayiye.GIF" border="0"></a> 
		<a href="/project/yx/gqyxManage.jsp?page=<%=pUtil.getPageCount()%>"><img src="/images/moye.GIF" border="0"></a> 
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
		<td><a href="/project/yx/gqyxView.jsp?RPJINCD=<%=bean.getPJRNO() %>" title="点击查看详细信息"><%=bean.getPJNM() %></a></td>
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
	<td>
	<input type="button" name="" value="新  增" onclick="javascript:toAdd()">
	&nbsp;
	<input type="button" name="" value="修  改" onclick="javascript:toEdit()">
	&nbsp;
	<input type="button" name="" value="删  除" onclick="javascript:toDel()"></td>
	</tr>
</table>
</body>
</html>
