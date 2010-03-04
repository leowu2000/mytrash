<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.page.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/common/session.jsp"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="/common/My97DatePicker/WdatePicker.js"></script>
</head>

<script language="JAVASCRIPT">
function showDetail(id,tbname){
	var src;
	if("TB_PJRCN"==tbname){//运行
		//window.frames["detailFrame"].location.href="/project/gqyxView.jsp?RPJINCD="+id+"&fromwhere=upload";
		src="/project/gqyxView.jsp?RPJINCD="+id+"&fromwhere=upload";
	}
	if("TB_STDNC"==tbname){//险情
		if(window.XMLHttpRequest){ //Mozilla
			var xmlHttpReq=new XMLHttpRequest();
		}else if(window.ActiveXObject){
			var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
		}
		xmlHttpReq.open("GET", "/BaseServlet?type=uploadView&RPJINCD="+id, false);
		xmlHttpReq.send(null);
		var results = xmlHttpReq.responseText;
		//window.frames["detailFrame"].location.href="/project/gqxqView.jsp?RPJINCD="+results+"&fromwhere=upload";
		src="/project/gqxqView.jsp?RPJINCD="+results+"&fromwhere=upload";
	}
	
	if("TB_FPACTI"==tbname){//行动
		//window.frames["detailFrame"].location.href="/report/fxxdView.jsp?RPJINCD="+id+"&fromwhere=upload";
		src="/report/fxxdView.jsp?RPJINCD="+id+"&fromwhere=upload";
	}
	if("TB_SD"==tbname){//旱情
		//window.frames["detailFrame"].location.href="/report/hqxxView.jsp?RPJINCD="+id+"&fromwhere=upload";
		src="/report/hqxxView.jsp?RPJINCD="+id+"&fromwhere=upload";
	}
	if("TB_QT"==tbname){//灾情
		//window.frames["detailFrame"].location.href="/report/zqbgView.jsp?RPJINCD="+id+"&fromwhere=upload";
		src="/report/zqbgView.jsp?RPJINCD="+id+"&fromwhere=upload";
	}
	if("TB_FXJB"==tbname){//简报
		//window.frames["detailFrame"].location.href="/report/fxjbView.jsp?RPJINCD="+id+"&fromwhere=upload";
		src="/report/fxjbView.jsp?RPJINCD="+id+"&fromwhere=upload";
	}
	 window.parent.open (src, '', 'height=500, width=800, top=100, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
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
function update_submit(){
	document.frm.action="/buiness.do";
	document.frm.actionType.value="updatetemp";
	document.frm.submit();
}
function view_submit(){
	var src="/sys/uploadList.jsp";
	window.open (src, '', 'height=600, width=800, top=100, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
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
	
	List<UploadBean> records = UploadDB.getAllRecords(path,iswhere);
	
	String pageStr = (String)request.getAttribute("page");  
	int currentPage = 1; 
	if (pageStr != null) 
	currentPage = Integer.parseInt(pageStr); 
	PageUtil pUtil = new PageUtil(10, records.size(), currentPage); 
	currentPage = pUtil.getCurrentPage(); 
%> 
<body>
<table width="95%" align="center">
	<tr><td align="center" ><span  class="style4">数 据 上 传</span></td></tr>
</table>
<form name="frm" action="" method="post">
<input type="hidden" value="" name="IDs"/>
<input type="hidden" value="" name="actionType"/>
<input type="hidden" value="upload" name="towhere"/>
<input type="hidden" value="<%=pageStr %>" name="page"/>
<input type="hidden" value="<%=iswhere %>" name="iswhere"/>
<input type="hidden" value="upload" name="searchType"/>
<input type="hidden" value="<%=currentPage %>" name="currentPage"/>
<table border="0" align="center" height="30" width="95%" cellspacing="1" bgcolor="#CCCCCC">
		<tr height="25" >
			<td nowrap class="title">标题:</td>
			<td bgcolor=#FFFFFF><input type=text size="15" name="bt_s" value="<%=bt_s %>"></td>
			<td nowrap class="title">填报时间:</td>
			<td bgcolor="#FFFFFF">
			<input type="text" value="" size="15" name="tbsj_s" onClick="WdatePicker({skin:'blue'})"  value="<%=tbsj_s %>" readonly>至
			<input type="text" value="" size="15" name="tbsj_e" onClick="WdatePicker({skin:'blue'})"  value="<%=tbsj_e %>" readonly></td>
			<td bgcolor="#FFFFFF" align="center"><input type="button" value="查  询" onclick="javascript:SearchSubmit()"></input></td>
		</tr>
		</table>
<table border="0" align="center" width="98%" >
	<tr>
		<td width=100% bgcolor="#FFFFFF" align="right"> 
		共有可选择上传数据<font color="red"> <%=pUtil.getRecordCount()%> </font>条  每页显示<%=pUtil.getPageSize()%>条 
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
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#E8EFFF" height="30" >
		<td><input name=all class="input3" onclick=rcheckall() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title_center">标题</td>
		<td nowrap align="center" class="title_center">填报时间</td>
		<td nowrap align="center" class="title_center">类别</td>
		<td nowrap align="center" class="title_center">填报单位</td>
	</tr>
	<%if(records!=null && records.size()>0){
		for(int i=pUtil.getFromIndex();i<pUtil.getToIndex();i++){
			UploadBean bean = (UploadBean)records.get(i);
	%>
	<tr  bgcolor="#FFFFFF">
		<td><input name="RECORDID" onclick=runChkAll() type=checkbox class="input3" value="<%=bean.getID() %>"></td>
		<td>
		<a href="javascript:showDetail(<%=bean.getNum() %>,'<%=bean.getTbName()%>','<%=bean.getGCFLDM()%>')"  title="点击查看详细信息">
		<%=bean.getTitle()%></a>
		</td>
		<td><%=bean.getWTDPDT()%></td>
		<td><%=bean.getTbcname()%></td>
		<td><%=bean.getWTDPCD()%></td>
	</tr>
	<%
		}
	} %>
</table>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="加入上传列表" onclick="javascript:update_submit()">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="" value="查看上传列表" onclick="javascript:view_submit()">
	</td>
	</tr>
</table>
</form>
</body>
</html>
