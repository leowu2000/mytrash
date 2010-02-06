<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
%> 
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="gccj_submit.js"></script>
</head>
<style type="text/css">
<!--

#newPreview
{
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
	width :150px; 
	height:100px; 
	borde:6px double #ccc;
}

-->
</style>
<%
	String path = request.getRealPath("/");
	String picpath = request.getRealPath("/").replaceAll("\\\\","\\\\\\\\\\\\\\\\")+"demo.jpg";
	List<PrjBean> beanList = BuinessDao.getAllList(path);
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");
%>
<script language="JAVASCRIPT">
function viewThePic(picid){

	var type = getRadioValue("myradio");
	if(window.XMLHttpRequest){ //Mozilla
		var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	xmlHttpReq.open("GET", "/FileUploadServlet?type=viewpic&saveType="+type+"&picid="+picid, false);
	xmlHttpReq.send(null);
	var results = xmlHttpReq.responseText;
	var val = results.split(",");
	document.getElementById('ZPBT').value=val[0];
	document.getElementById('ZPMS').value=val[2];
	document.getElementById('CJSJ').value=val[1];
	
	warnForm.action="viewPic.jsp?from=asdf&type=jpeg&zlbm="+picid;
	warnForm.target="saveFrm";
	warnForm.submit();
	setTimeout("viewDataImg('<%=picpath%>')","1000");
}
//图片预览区域代码
function viewDataImg(value) 
{ 

	//新的预览代码，支持 IE6、IE7。 
	var newPreview = document.getElementById("newPreview"); 
	//newPreview.style.filter="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = value; 
	newPreview.style.width = "170px"; 
	newPreview.style.height = "120px"; 
	newPreview.style.border= "6px double #ccc";
}
</script>
<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">新增运行状态信息</span></td></tr>
</table>
<iframe name="saveFrm" src="" frameborder="0" scrolling="no" width="0" height="0">
<!--显示图片专用  -->
</iframe>
<form name="warnForm" action="" method="post">
 </form>
<form name="form1" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="myradio" value="1"></input>
<input type="hidden" name="WTDPCD" value=""/>
<input type="hidden" name="tabname" value="TB_PJR_M"></input>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title" colspan="6">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">工程名称[B]:</td>
		<td height="25"  bgcolor="#FFFFFF">
			<select name="GCNAME" onchange="javascript:getGcmessage(this.value)">
			<option value="">--工程名称--</option>
				<%if(beanList!=null && beanList.size()>0){
					for(int i=0;i<beanList.size();i++){
						PrjBean bean = beanList.get(i);
			%>
				<option value="<%=bean.getPJNO() %>"><%=bean.getPJNM() %></option>
			<%
					}
				} %>
			</select>
		</td>
		<td height="25" nowrap class="title">采集时间[T]:</td>
		<td height="25" bgcolor="#FFFFFF"><input type="text" name="DAGTM" value="<%=UtilDateTime.nowDateString() %>"/></td>
		<td nowrap class="title">水库类别:</td>
		<td bgcolor="#FFFFFF">
		<select name="RSCLS">
				<option value="1">良好</option>
				<option value="2">尚好</option>
				<option value="2">病险库</option>
			</select>
		</td>
	</tr>
	<tr height="25" >
		
		<td nowrap class="title">当前运行水位:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RZ" value="0" size="8"/>米<font color="red">*</font></td>
		<td nowrap class="title">当前库容:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RV" value="0" size="8"/>万立方米<font color="red">*</font></td>
		<td nowrap class="title">当前泻量:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="RQ" value="0" size="8"/>立方米/秒<font color="red">*</font></td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="main2" frameborder="0" marginwidth="0" marginheight="0" src="yxztLoader.jsp" height="130" width="800">
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="main3" frameborder="0" marginwidth="0" marginheight="0" src="skLoader.jsp" height="135" width="800">
		</iframe>
		</td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">照片标题[H]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="ZPBT" value=""/></td>
		<td height="25" nowrap class="title">选择照片:</td>
		<td height="25"  bgcolor="#FFFFFF" colspan="3">
		<input type="file" name="UpFile" size="20" onchange="javascript:PreviewImg(this);">
		<input type="button" name="" value="添加照片" onclick="javascript:uploadPhotos()"/>
		</td>
		
	</tr>
	<tr>
		<td height="25" nowrap class="title">照片描述</td>
		<td bgcolor="#FFFFFF"><textarea rows="6" cols="22" name="ZPMS"></textarea></td>
		<td bgcolor="#FFFFFF"  colspan="2"><div id="PICLIST" class="divStyle"></div></td>
		<td colspan="2" bgcolor="#FFFFFF" align="center"><div id="newPreview" ></div></td>
	</tr>
</table>
</form>

<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:per_Submit()">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:viewThePic('1')">
	</tr>
</table>
</body>
</html>
