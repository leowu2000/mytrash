<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="net.fckeditor.*"%>
<%@ include file="/common/session.jsp"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    String path = request.getSession().getServletContext().getRealPath("/");
    String RPJINCD = request.getParameter("RPJINCD");
    FXJBBean bean = BuinessDao.findFxjbcByID(path,RPJINCD);
    SubTempBean detailBean =null;
    RandomAccessFileTool.delAllFile(path+"\\\\common\\\\pic");
    List<SubTempBean> sublist = BuinessDao.getMediaBeanList(path,bean.getRPJINCD(),"TB_FXJB_M","RPJINCD");
    if(sublist!=null && sublist.size()>0)
    	detailBean = (SubTempBean)sublist.get(0);
    String content = bean.getACTICO();
  //防止刷新页面重复提交
    long _nowtime = System.currentTimeMillis();
    session.setAttribute("sessiontime",_nowtime);
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
</head>
<style type="text/css">
<!--

-->
</style>

<script language="JAVASCRIPT">

function toBack(){
	location.href="/report/fxjbManage.jsp";
}
function submiting(){
	if(document.frm.ISSUE.value==""){
		alert("请填写简报期数！");
		return false;
	}
	if(document.frm.WTTT.value==""){
		alert("请填写简报标题！");
		return false;
	}
	document.frm.submit();
}
function checkNumber(obj,name){
	if(obj.vlaue==""){
		alert("请填写简报期数");
		return false;
	}
	if(obj.value!=""){
		if(isNaN(obj.value)){
			alert(name+"只接受整数，请重新填写");
			obj.value="";
			return false;
		}else{
			if(obj.value.indexOf('.')>0){
				alert(name+"只接受整数，请重新填写");
				obj.value="";
				return false;
			}
		}
	}
	//校验是否存在相同期数的简报
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/BaseServlet?type=checkIssue&ISSUE="+obj.value, false);
	  xmlHttpReq.send(null);
	  var result = xmlHttpReq.responseText;
	  if(result=="0"){
			alert("已经存在期数为‘"+obj.value+"’的防汛简报，请重新填写！");
			obj.value="";
			return false;
		}
}
function delMeditSubmit(id){
	if(confirm("删除后不能恢复,是否继续?")){
		document.frm.mediaflag.value="1";
		if(window.XMLHttpRequest){ //Mozilla
			var xmlHttpReq=new XMLHttpRequest();
		}else if(window.ActiveXObject){
			var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
		}
		xmlHttpReq.open("GET", "/FileUploadServlet?type=delpic&tablename=TB_FXJB_M&picid="+id, false);
		xmlHttpReq.send(null);
		var results = xmlHttpReq.responseText;
		if("sucess"==results){
			showupfile.style.display="inline";
			thfiles.style.display="none";
		}
	}
}
function updateFileValue(fileobj){
	fileobj.select();//该对象选取 
	document.getElementById("upFileValues").value=document.selection.createRange().text;//返回选取项的文本内容
}
</script>
<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">修改防汛抗旱简报</span></td></tr>
</table>
<form name="frm" action="/buiness.do" method="post">
<input type="hidden" name="actionType" value="add_fxjb"/>
<input type="hidden" name="subActionType" value="update"/>
<INPUT type='hidden' name='sessiontime' value="<%=_nowtime%>">
<%if(detailBean!=null){%>
<input type="hidden" name="mediaflag" value="0"/>
<%}else{ %>
<input type="hidden" name="mediaflag" value="1"/>
<%} %>
<input type="hidden" name="WTDPCD" value="<%=configBean.getTBDW() %>"/>
<input type="hidden" name="RPJINCD" value="<%=RPJINCD %>">
<input type="hidden" name="WTDT" value="<%=UtilDateTime.nowDateString() %>"/>
<input type="hidden" name="upFileValues" value=""/>
<table border="0" align="center" width="90%" cellspacing="1" bgcolor="#CCCCCC">
	<!-- <tr height="25" >
		<td nowrap align="center" class="title" width="30%" >单位</td>
		<td nowrap align="center" class="title"  colspan="4">第<input type="text" class="lines" name="ISSUE" value="" size="8"/> 期</td>
		<td nowrap align="center" class="title" width="30%" ><%=UtilDateTime.nowDateStringCN() %></td>
	</tr>-->
	<tr height="25" >
	<td nowrap class="title"><%=configBean.getTBDW() %></td>
		<td nowrap align="center" class="title_center">第  <%=bean.getISSUE() %> 期</td>
		<input type="hidden" class="" name="ISSUE" value="<%=bean.getISSUE() %>" />
		<td align="center" class="title">标题</td>
		<td align="center" class="title">
		<input type="text" name="WTTT" value="<%=bean.getWTTT() %>" size="25"/></td>
		<td align="center" class="title">附件</td>
		<td bgcolor="#FFFFFF">
		<%if(detailBean!=null){ %>
		<div id="thfiles"  style="display:inline">
			<%=detailBean.getTITLE() %>.<%=detailBean.getWJGS() %>&nbsp;&nbsp;&nbsp;<a href="javascript:delMeditSubmit('<%=detailBean.getZLBM()%>')"><img src="/images/small_delete.gif" border="0"></img></a>
		</div>
		<%} %>
		<div id="showupfile" <%if(detailBean!=null){ %>style="display:none"<%} %>><input type="file" name="UpFile" size="20"  onchange="javascript:updateFileValue(this);"> </div>
		</td>
	</tr>
	<tr height="25" >
	<td class="title" colspan="6">
	<%	           
	    //FCKeditor oFCKeditor ;
	    //oFCKeditor = new FCKeditor( request, "ACTICO") ;
	    //oFCKeditor.setBasePath( "/FCKeditor/" ) ;
		//oFCKeditor.setToolbarSet( "NowUse" ) ;
	    //oFCKeditor.setHeight("260");
	    //oFCKeditor.setValue( content==null?"":content );
	    //out.println(oFCKeditor.create());
     %>
     <%
		FCKeditor fckEditor = new FCKeditor(request, "ACTICO");
     fckEditor.setToolbarSet("NowUse");
     	fckEditor.setValue(content);
		out.println(fckEditor);
	%>
	</td>
	</tr>
	<tr height="25" >
		<td nowrap align="center" class="title">签发</td>
		<td bgcolor="#FFFFFF"><input type="text" name="QF" value="<%=bean.getQF() %>" /></td>
		<td nowrap align="center" class="title">审核</td>
		<td bgcolor="#FFFFFF"><input type="text" name="SH" value="<%=bean.getSH() %>"/></td>
		<td nowrap align="center" class="title">拟稿</td>
		<td bgcolor="#FFFFFF"><input type="text" name="NG" value="<%=bean.getNG() %>" /></td>
	</tr>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:submiting()">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
