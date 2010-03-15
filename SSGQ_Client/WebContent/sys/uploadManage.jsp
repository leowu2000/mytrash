<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.page.*" %>
<%@ page import="com.util.*" %>
<%@ page import="com.upload.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/common/session.jsp"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/common/ext/examples.css" />
<link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" />
<script type="text/javascript" src="/common/ext/ext-base.js"></script>
<script type="text/javascript" src="/common/ext/ext-all.js"></script>
<script type="text/javascript" src="/common/ext/msg-box.js"></script>
<script type="text/javascript" src="/common/ext/examples.js"></script><!-- EXAMPLES -->

<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="/common/js/upload.js"></script>
<script Language="JavaScript" src="/common/My97DatePicker/WdatePicker.js"></script>
</head>
<style>
.divStyle{
	PADDING-RIGHT:10px;
	OVERFLOW-Y:auto;
	OVERFLOW-X:no;
	PADDING-LEFT:10px;
	SCROLLBAR-FACE-COLOR: #E2EFF4;
	SCROLLBAR-SHADOW-COLOR: #FFFFFF;
	SCROLLBAR-3DLIGHT-COLOR: #5C9ABC;
	SCROLLBAR-ARROW-COLOR: #5C9ABC;
	SCROLLBAR-DARKSHADOW-COLOR: #5C9ABC;
	SCROLLBAR-BASE-COLOR: #FFFFFF;
	SCROLLBAR-3DLIGHT-COLOR:#ffffff;
	PADDING-BOTTOM:0px;
	OVERFLOW:auto;
	WIDTH:100%;
	COLOR:blue;
	
	LINE-HEIGHT:100%;
	PADDING-TOP:0px;
	LETTER-SPACING:1pt;
	HEIGHT:400;
	TEXT-ALIGN:left
}
</style>
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
function update_submit(id){
	document.frm.action="/buiness.do";
	document.frm.updateType.value=id;
	document.frm.actionType.value="updatetemp";
	document.frm.submit();
}
function view_submit(){
	var src="/sys/uploadList.jsp";
	window.open (src, '', 'height=600, width=800, top=100, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
}
function upload_submit(){
	//document.frm.action="/upload.do";
	//document.frm.actionType.value="upload";
	//document.frm.submit();
	if(confirm("将上传上传列表中的全部数据，请确认!")){
		var src="/sys/message.jsp";
		window.open (src, '', 'height=150, width=300, top=100, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
	}
}
function rcheckall2() {
	  str=document.forms[0].UPLOADRECORDID;
	  if(str == null){len=0;}else{len=str.length;}
	  if(document.forms[0].allid.checked==1) val=1;
	     else val=0;
	  if(len>0)    
	     for(i=0;i<len;i++) { str[i].checked=val;}
	  else{
	    if(str != null)
	    str.checked=val;
	  }
	 }

	function runChkAll2() {
	 str=document.forms[0].UPLOADRECORDID;
	 len=str.length;
	 if(!(len>=0)) {
	   if(str.checked)
	     document.forms[0].allid.checked=1;
	   else
	     document.forms[0].allid.checked=0;
	 }else{
	   val=1;
	   for(i=0;i<len;i++) {
	     if(str[i].checked==0) {
	       val=0;
	       break;
	     }
	   }
	   document.forms[0].allid.checked=val;
	 }
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
	List<UploadBean> uploadRecords = UploadDB.getUploadRecords(path);
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
<input type="hidden" value="" name="updateType"/>
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
<table border="0"  width="98%" align="center">
	<tr align="left">
	<td>
	<input type="button" name="" value="加入上传列表" onclick="javascript:update_submit('1')">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" name="" value="查看上传列表" onclick="javascript:view_submit()">
	</td>
	</tr>
</table>
<div class="divStyle">
<table border="0" align="center" width="100%" cellspacing="1" bgcolor="#CCCCCC">
	<tr bgcolor="#E8EFFF" height="30" >
		<td><input name=allid class="input3" onclick=rcheckall2() type=checkbox value=9999 ></td>
		<td nowrap align="center" class="title_center">标题</td>
		<td nowrap align="center" class="title_center">填报时间</td>
		<td nowrap align="center" class="title_center">类别</td>
		<td nowrap align="center" class="title_center">填报单位</td>
	</tr>
	<%if(uploadRecords!=null && uploadRecords.size()>0){
		for(int i=0;i<uploadRecords.size();i++){
			UploadBean bean = (UploadBean)uploadRecords.get(i);
	%>
	<tr  bgcolor="#FFFFFF" height="25">
	<td><input name="UPLOADRECORDID" onclick=runChkAll2() type=checkbox class="input3" value="<%=bean.getID() %>"></td>
		<td>
		<a href="javascript:showDetail(<%=bean.getNum() %>,'<%=bean.getTbName()%>','<%=bean.getGCFLDM()%>')"  title="点击查看详细信息">
		<%=bean.getTitle()%>
		</a>
		<input name="REALRECORDID" type="hidden" value="<%=bean.getNum() %>">
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
<table border="0"  width="100%" align="center">
	<tr align="left">
	<td>
	<input type="button" name="" value="从上传列表去除" onclick="javascript:update_submit('0')">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" id="upbutn" name="upbutn" value="上传数据" onclick="javascript:MyShow();">
	</td>
	</tr>
</table>
</div>
</form>
</body>
</html>
