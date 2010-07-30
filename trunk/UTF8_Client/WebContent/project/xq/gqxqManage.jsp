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
	document.forms[0].action="/project/xq/gqxqAdd.jsp";
	document.forms[0].submit();
}
function showdetailGclb(obj){
	
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
			document.forms[0].action="/project/xq/gqxqEdit.jsp?RPJINCD="+result;
			document.forms[0].submit();
		}
	}
}
function toDelete(){
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
		document.forms[0].action="/buiness.do";
		document.frm.actionType.value="delgcxq";
		document.forms[0].submit();
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
	String gcmc_s = (String)request.getAttribute("gcmc_s");
	String xqfl_s = (String)request.getAttribute("xqfl_s");
	String xqmc_s = (String)request.getAttribute("xqmc_s");
	String gclb_s = (String)request.getAttribute("gclb_s");
	String ly_s = (String)request.getAttribute("ly_s");
	String sx_s = (String)request.getAttribute("sx_s");
	String yjzl_s = (String)request.getAttribute("yjzl_s");
	String ejzl_s = (String)request.getAttribute("ejzl_s");
	String xzqh = configBean.getXZQH_X();
	gcmc_s=gcmc_s==null?"":gcmc_s;
	xqmc_s=xqmc_s==null?"":xqmc_s;
	iswhere=iswhere==null?"":iswhere;
	ly_s=ly_s==null?"":ly_s;sx_s=sx_s==null?"":sx_s;
	yjzl_s=yjzl_s==null?"":yjzl_s;ejzl_s=ejzl_s==null?"":ejzl_s;
	String pjWhere = "1=1";
	if(configBean!=null)
		pjWhere = "CNTCD='"+configBean.getXZQH_X()+"'";
	List<PrjBean> beanList = BuinessDao.getAllList(path,pjWhere,xzqh);
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");
	List<STDNCBean> records = BuinessDao.getAllStdncList(path,iswhere," order by DAGTM desc"); 
	String pageStr = (String)request.getAttribute("page"); 
	pageStr=pageStr==null?request.getParameter("page"):pageStr;
	int currentPage = 1; 
	if (pageStr != null) 
	currentPage = Integer.parseInt(pageStr); 
	PageUtil pUtil = new PageUtil(10, records.size(), currentPage); 
	currentPage = pUtil.getCurrentPage(); 
%> 
<body onload="loadSearchSelect('<%=gcmc_s %>','<%=gclb_s %>','<%=xqfl_s %>','<%=ly_s %>','<%=sx_s %>','<%=yjzl_s %>','<%=ejzl_s %>','xq')">
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">工程险情</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" value="" name="actionType"/>
<input type="hidden" value="gcxq" name="searchType"/>
<input type="hidden" value="" name="IDs"/>
<input type="hidden" value="gqxq" name="towhere"/>
<input type="hidden" value="<%=iswhere %>" name="iswhere"/>
<input type="hidden" value="DNCNO,DNCNO" name="PKFILED"/>
<input type="hidden" value="TB_STDNC,TB_STDNC_M" name="TBID"/>
<input type="hidden" value="<%=currentPage %>" name="currentPage"/>
<table border="0" align="center" height="30" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap class="title">险情名称:</td>
		<td bgcolor="#FFFFF"><input type="text" name="xqmc_s" value="<%= xqmc_s%>"></input></td>
		<td nowrap class="title">工程名称:</td>
		<td bgcolor="#FFFFFF"><div id="GCMC_S"></div></td>
		<td nowrap class="title">工程类别</td>
		<td bgcolor="#FFFFFF"><DIV id="GCLB_S"></DIV></td>
		<td nowrap class="title">险情分类:</td>
		<td bgcolor="#FFFFFF"><DIV id="XQFL_S"></DIV></td>
		<td bgcolor="#FFFFFF" rowspan="2" align="center"><input type="button" value="查  询" onclick="javascript:SearchSubmit()"></input></td>
	</tr>
	<tr>
		<td nowrap class="title">流域</td>
		<td bgcolor="#FFFFFF"><DIV id="LY_S"></DIV></td>
		<td nowrap class="title">水系</td>
		<td bgcolor="#FFFFFF"><DIV id="SX_S"></DIV></td>
		<td nowrap class="title">一级支流</td>
		<td bgcolor="#FFFFFF"><DIV id="YJZL_S"></DIV></td>
		<td nowrap class="title">二级支流</td>
		<td bgcolor="#FFFFFF"><DIV id="EJZL_S"></DIV></td>
	</tr>
</table>
<table border="0" align="center" width="98%" >
	<tr>
		<td width=100% bgcolor="#FFFFFF" align="right"> 
		共<font color="red">&nbsp;<%=pUtil.getRecordCount()%>&nbsp;</font>条记录,
		 每页显示<font color="red">&nbsp;<%=pUtil.getPageSize()%>&nbsp;</font>条 
		,当前第<font color="red">&nbsp;<%=currentPage %>&nbsp;</font>页
		<%if(currentPage>1) {%>
		<a href="/project/xq/gqxqManage.jsp?page=1" ><img src="/images/shouye.GIF" border="0"></a> 
		<a href="/project/xq/gqxqManage.jsp?page=<%=(currentPage - 1)%>"><img src="/images/shangyiye.GIF" border="0"></a> 
		<%} %>
		
		<%if(pUtil.getPageCount()>currentPage) {%>
		<a href="/project/xq/gqxqManage.jsp?page=<%=(currentPage + 1)%>"><img src="/images/xiayiye.GIF" border="0"></a> 
		<a href="/project/xq/gqxqManage.jsp?page=<%=pUtil.getPageCount()%>"><img src="/images/moye.GIF" border="0"></a> 
		<%} %>
	</td>
	</tr>
</table>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#E8EFFF" height="30" >
		<td class="title"><input name=all class="inputAll" onclick=rcheckall() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title">工程名称</td>
		<td nowrap align="center" class="title">险情名称</td>
		<td nowrap align="center" class="title">险情分类</td>
		<td nowrap align="center" class="title">出险时间</td>
		<td nowrap align="center" class="title">填报单位</td>
		<td nowrap align="center" class="title">填报时间</td>
	</tr>
	<%if(records!=null && records.size()>0){
		for(int i=pUtil.getFromIndex();i<pUtil.getToIndex();i++){
			STDNCBean bean = (STDNCBean)records.get(i);
	%>
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type=checkbox class="input3" value="<%=bean.getPJNO() %>;<%=bean.getDNCNO()%>;<%=bean.getXQFLDM() %>"></td>
		<td><a href="/project/xq/gqxqView.jsp?RPJINCD=<%=bean.getPJNO() %>;<%=bean.getDNCNO()%>;<%=bean.getXQFLDM() %>" title="点击查看详细信息"><%=BuinessDao.idToNameChange(path,"TB_PJ", "PJNM", "PJNO="+bean.getPJNO())%></a></td>
		<td><%=bean.getDNCNM()%></td>
		<td><%=BuinessDao.idToNameChange(path,"TB_XQFL", "XQFLMC", "XQFLDM='"+bean.getXQFLDM()+"'")%></td>
		<td><%=bean.getDAGTM()%></td>
		<td><%=bean.getWTDPCD()%></td>
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
	&nbsp;
	<input type="button" name="" value="新  增" onclick="javascript:toAdd()">
	&nbsp;
	<input type="button" name="" value="修  改" onclick="javascript:toEdit()">
	&nbsp;
	<input type="button" name="" value="删  除" onclick="javascript:toDelete()"></td>
	</tr>
</table>
</body>
</html>
