<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
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
	color: #000000;
	background-color: #E8EFFF;
	text-align:center;
}
.title2 {
	font-size: 10pt;
	padding-top: 2px;
	font-weight: bolder;
	color: #000000;
	background-color: #E8EFFF;
	text-align:left;
}
#newPreview
{
filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
width :120px; 
height:80px; 
borde:6px double #ccc;
}

-->
</style>
<%
	String path = request.getRealPath("/");
	List<PrjBean> beanList = BuinessDao.getAllList(path);
%>
<script language="JAVASCRIPT">
function toAdd(){
	location.href="/project/prgAdd.jsp";
}
function loadSelect(){
	if(window.XMLHttpRequest){ //Mozilla
	    var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	  xmlHttpReq.open("GET", "/BaseServlet?type=load", false);
	  xmlHttpReq.send(null);
	 var result = xmlHttpReq.responseText;
	 var val = result.split(";");
	 SHENG.innerHTML=val[0];
	 SHI.innerHTML=val[1];
	 XIAN.innerHTML=val[2];
	 GCLB.innerHTML=val[3];
	 LY.innerHTML=val[4];
	 SX.innerHTML=val[5];
	 ZL1.innerHTML=val[6];
	 ZL2.innerHTML=val[7];
}
function changeValue(style,type,obj){
	if(window.XMLHttpRequest){ //Mozilla
    	var xmlHttpReq=new XMLHttpRequest();
	  }else if(window.ActiveXObject){
	    var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	  }
	 // alert("/BaseServlet?type=change&changeObjName="+style+"&changeType="+type+"&changeVal="+obj.value);
	  xmlHttpReq.open("GET", "/BaseServlet?type=change&changeObjName="+style+"&changeType="+type+"&changeVal="+obj.value, false);
	  xmlHttpReq.send(null);
	  var result = xmlHttpReq.responseText;
	  if(style=='sx'){
		  if(type=='1'){
			  var val = result.split(";");
			  SHI.innerHTML=val[0];
			  XIAN.innerHTML=val[1];
			}else{
				XIAN.innerHTML=result;
			}
	  }
	  if(style=="ly"){
			if(type=="1"){
				 var val = result.split(";");
				 SX.innerHTML=val[0];
				 ZL1.innerHTML=val[1];
				 ZL2.innerHTML=val[2];
			}
			if(type=="2"){
				 var val = result.split(";");
				 ZL1.innerHTML=val[0];
				 ZL2.innerHTML=val[1];
			}
			if(type=="3"){
				ZL2.innerHTML=result;
			}
		}
	}
function PreviewImg(imgFile) 
{ 
 
	//新的预览代码，支持 IE6、IE7。 
	var newPreview = document.getElementById("newPreview"); 
	//newPreview.style.filter="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value; 
	newPreview.style.width = "120px"; 
	newPreview.style.height = "80px"; 
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
	}else{
		YXZT.style.display="none";
		GCXQ.style.display="inline";
	}

		
}
</script> 
<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">新增工情采集信息</span></td></tr>
</table>
<form name="form1" method="POST" enctype="multipart/form-data"> 
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title2" colspan="6">
			<input type="radio" id="myradio" name="myradio" value="1" checked>工程运行状态[R]
			<input type="radio" id="myradio" name="myradio" value="2" >工程险情[G]
		</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">工程名称[B]:</td>
		<td bgcolor="#FFFFFF">
		<select>
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
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">出险部位[P]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">险情标题[N]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">填报单位[U]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">出险时间[T]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">险情标题[N]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">填报单位[U]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
		<td nowrap class="title">出险时间[T]:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="" value=""/></td>
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
	<tr height="80" >
		<td bgcolor="#FFFFFF" colspan="2" rowspan="2">&nbsp;</td>
		<td nowrap class="title">照片描述</td> 
		<td bgcolor="#FFFFFF"><textarea rows="5"></textarea></td>
		<td class="title" colspan="2"><div id="newPreview" ></div></td>
		
	</tr>
	<tr>
		<td class="title" colspan="4">
			<input type="button" name="" value="保存照片"/>&nbsp;&nbsp;&nbsp;
			<input type="button" name="" value="详细信息" onclick="javascript:showDetail()"/>
		</td>
	</tr>
</table>
<BR></BR>
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
	<tr height="25" >
		<td nowrap class="title" colspan="2">补充描述</td>
		<td nowrap class="title" colspan="2">抢险方案</td>
		<td nowrap class="title" colspan="2">抢险资源配备</td>
		<td nowrap class="title" colspan="4">进展及结果</td>
	</tr>
	
	<tr height="25" >
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="点击添加补充描述" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="点击添加抢险方案" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="点击添加抢险资源配备" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="4">
			<a title="点击添加进展及结果" href=""><img src="/images/add.gif" border="0"></a>
		</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2">险情原因分析</td>
		<td nowrap class="title" colspan="2">险情发展趋势</td>
		<td nowrap class="title" colspan="2">可能影响范围</td>
		<td nowrap class="title" colspan="2">抢险时气象情况</td>
		<td nowrap class="title" >未来水文气象情况</td>
	</tr>
	<tr height="25" >
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="点击添加险情原因分析" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="点击添加险情发展趋势" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="点击添加可能影响范围" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" colspan="2">
			<a title="点击添加抢险时气象情况" href=""><img src="/images/add.gif" border="0"></a>
		</td>
		<td bgcolor="#FFFFFF" >
			<a title="点击添加未来水文气象情况" href=""><img src="/images/add.gif" border="0"></a>
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
		<td bgcolor="#FFFFFF" colspan=3><input type="text" name="" value=""/>平方米</td>
	</tr>
</table>
</div>
<div id="YXZT" style="display:none">
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">

	<tr height="25" >
		<td rowspan="3" class="title">工程运行状态</td>
		<td nowrap class="title">险情预测:</td>
		<td bgcolor="#FFFFFF" colspan=9><textarea cols="80" rows="5"></textarea></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">堤防建筑状况:</td>
		<td bgcolor="#FFFFFF" colspan=9><textarea cols="80" rows="5"></textarea></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">其他:</td>
		<td bgcolor="#FFFFFF" colspan=9><textarea cols="80" rows="5"></textarea></td>
	</tr>
	<tr height="25" >
		<td rowspan="6" class="title">水库</td>
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
		<td nowrap class="title" colspan="2">坝基完好状况</td>
		<td nowrap class="title" colspan="2">坝体稳定状况</td>
		<td nowrap class="title" colspan="2">护坡护岸稳定情况</td>
		<td nowrap class="title" colspan="2">通讯手段及状况</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2">泄水建筑物状况</td>
		<td nowrap class="title" colspan="2">泄能工完好状况</td>
		<td nowrap class="title" colspan="4">闸门、起闭机状况</td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
		<td nowrap class="title" colspan="2"><textarea cols="20" rows="3"></textarea></td>
		<td nowrap class="title" colspan="4"><textarea cols="40" rows="3"></textarea></td>
	</tr>
	
</table>
</div>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="">
	</tr>
</table>
</body>
</html>
