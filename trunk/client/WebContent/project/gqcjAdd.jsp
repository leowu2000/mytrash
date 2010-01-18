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
	List<PrjBean> beanList = BuinessDao.getAllList(path);
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");
%>
<script language="JAVASCRIPT">
function per_Submit(){
	var radioValue;
	for(var i=0; i<form1.myradio.length; i++){
	    if(form1.myradio[i].checked) 
	    	radioValue=form1.myradio[i].value;
	}
	if(radioValue==2){//工程险情
		alert(window("main1").document.getElementById("WLSWQS").value);
	}else{//运行状态
		
	}
}
function toAdd(){
	location.href="/project/prgAdd.jsp";
}

//图片预览区域代码
function PreviewImg(imgFile) 
{ 
 
	//新的预览代码，支持 IE6、IE7。 
	var newPreview = document.getElementById("newPreview"); 
	//newPreview.style.filter="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value; 
	newPreview.style.width = "150px"; 
	newPreview.style.height = "100px"; 
	newPreview.style.border= "6px double #ccc";
}
function showDetail(){
	var radioValue;
	for(var i=0; i<form1.myradio.length; i++){
	    if(form1.myradio[i].checked) 
	    	radioValue=form1.myradio[i].value;
	}
	if(radioValue==1){
		GCXQ.style.display="none";
		YXZT.style.display="inline";
		window.frames["main2"].location.href="yxztLoader.jsp";	
		window.frames["main3"].location.href="skLoader.jsp";
				
	}else{
		YXZT.style.display="none";
		GCXQ.style.display="inline";
		window.frames["main1"].location.href="gcxqLoader.jsp";	
	}

		
}
//上传图片信息
function uplaodPhotos(){

	
}
function getGcmessage(id){
	//if(window.XMLHttpRequest){ //Mozilla
    //	var xmlHttpReq=new XMLHttpRequest();
	//  }else if(window.ActiveXObject){
	//    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	//  }
	// alert("/BaseServlet?type=change&changeObjName="+style+"&changeType="+type+"&changeVal="+obj.value);
	//  xmlHttpReq.open("GET", "/BaseServlet?type=gqcj&cntcd="+id, false);
	//  xmlHttpReq.send(null);
	//  var result = xmlHttpReq.responseText;
}
</script> 
<body scroll="auto">

<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">新增工情采集信息</span></td></tr>
</table>

<form name="form1" method="POST" enctype="multipart/form-data"> 
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title2" colspan="2">
			<input type="radio" id="myradio" name="myradio" value="1" checked>工程运行状态[R]
			<input type="radio" id="myradio" name="myradio" value="2" >工程险情[G]
		</td>
		<td nowrap align="center" class="title2" colspan="4">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">工程名称[B]:</td>
		<td bgcolor="#FFFFFF">
		<select name="GCNAME" onchange="javascript:getGcmessage(this.value)">
			<%if(beanList!=null && beanList.size()>0){
				for(int i=0;i<beanList.size();i++){
					PrjBean bean = beanList.get(i);
		%>
			<option value="<%=bean.getCNTCD() %>"><%=bean.getPJNM() %></option>
		<%
				}
			} %>
		</select>
		</td>
		<td nowrap class="title">险情分类[C]:</td>
		<td bgcolor="#FFFFFF">
			<select name="XQFL" disabled>
			<%if(resultList!=null && resultList.size()>0){
			for(int i=0;i<resultList.size();i++){
				Map<Object,Object> map = (Map<Object,Object>)resultList.get(i);
				%>
					<option value="<%=map.get("id")%>" %><%=map.get("value")%></option>
				<%
			}} %>
			</select>
		</td>
		<td nowrap class="title">出险部位[P]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="CXBW" value=""/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">险情标题[N]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" /></td>
		<td nowrap class="title">填报单位[U]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">采集时间[T]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="<%=UtilDateTime.nowDateString() %>"/></td>
	</tr>

	<!-- 
	<input type="file" name="UpFile" size="30" onchange="javascript:PreviewImg(this);"> 
		<div id="newPreview" >照片预览区域</div> -->
	<tr height="25" >
		<td nowrap class="title" colspan="2">照片列表</td> 
		<td nowrap class="title">照片标题</td> 
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title2">选择照片</td> 
		<td class="title2"><input type="file" name="UpFile" size="20" onchange="javascript:PreviewImg(this);"> </td>
	</tr>
	<tr height="100" >
		<td bgcolor="#FFFFFF" colspan="2" rowspan="2">&nbsp;</td>
		<td nowrap class="title" rowspan="2">照片描述</td> 
		<td bgcolor="#FFFFFF" rowspan="2"><textarea rows="8" cols="20"></textarea></td>
		<td class="title" colspan="2"><div id="newPreview" ></div></td>
		
	</tr>
	<tr>
		<td class="title" colspan="2">
			<input type="button" name="" value="保存照片" onclick="javascript:uplaodPhotos()"/>&nbsp;&nbsp;&nbsp;
			<input type="button" name="" value="详细信息" onclick="javascript:showDetail()"/>
		</td>
	</tr>
</table>
<div id="GCXQ" style="display:none">
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">

	<tr height="25" >
		<td rowspan="6" class="title">险情</td>
		<td nowrap class="title">险情级别:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="10"/></td>
		<td nowrap class="title">出险地点:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="10"/></td>
		<td nowrap class="title">出险部位:</td>
		<td bgcolor="#FFFFFF" colspan="5"><input type="text" name="" value=""/></td>
	</tr>
	
	<tr height="25" >
		<td nowrap class="title">解放军投入:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>人</td>
		<td nowrap class="title">武警投入:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>人</td>
		<td nowrap class="title">群众投入:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>人</td>
		<td nowrap class="title" >当前水位:</td>
		<td bgcolor="#FFFFFF" colspan=3><input type="text" name="" value="" size="8"/>米</td>
	</tr>
	<tr height="25">
		<td bgcolor="#FFFFFF" colspan="10">
		<iframe id="main1" frameborder="0" marginwidth="0" marginheight="0" src="gcxqLoader.jsp" height="198" width="800">
		</iframe>
		</td>
	</tr>
	<tr height="25" >
		<td rowspan="2" class="title">漏洞</td>
		<td nowrap class="title">距堤顶高程:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>米</td>
		<td nowrap class="title">最大漏洞直径:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>米</td>
		<td nowrap class="title">漏洞流量:</td>
		<td bgcolor="#FFFFFF" colspan="4"><input type="text" name="" value=""/>升/秒</td>
		
	<tr height="25" >
		<td nowrap class="title" colspan=2>当前水位距离堤顶高差:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>米</td>
		<td nowrap class="title">漏洞浑清:</td>
		<td bgcolor="#FFFFFF">
			<select>
				<option value="1">清</option>
				<option value="2">浑</option>
			</select>
		</td>
		<td nowrap class="title">漏洞群面积:</td>
		<td bgcolor="#FFFFFF" colspan=3><input type="text" size="8" name="" value=""/>平方米</td>
	</tr>
</table>
</div>
<div id="YXZT" style="display:none">
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">

	<tr height="25" >
		<td class="title">工程运行状态</td>
		<td  bgcolor="#FFFFFF" colspan=9>
		<iframe id="main2" frameborder="0" marginwidth="0" marginheight="0" src="yxztLoader.jsp" height="150" width="800">
		</iframe>
		</td>
	</tr>

	<tr height="25" >
		<td rowspan="2" class="title">水库</td>
		<td nowrap class="title">水库类别:</td>
		<td bgcolor="#FFFFFF">
		<select>
				<option value="1">一类</option>
				<option value="2">二类</option>
				<option value="2">三类</option>
			</select>
		</td>
		<td nowrap class="title">当前运行水位:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>米</td>
		<td nowrap class="title">当前库容:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>万立方米</td>
		<td nowrap class="title">当前泻量:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value="" size="8"/>立方米/秒</td>
		
	</tr>
	<tr height="25" >
		<td  bgcolor="#FFFFFF" colspan="9">
		<iframe id="main3" frameborder="0" marginwidth="0" marginheight="0" src="skLoader.jsp" height="155" width="800">
		</iframe>
		</td>
	</tr>
</table>
</div>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:per_Submit()">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="">
	</tr>
</table>
</body>
</html>
