<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
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
<link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" /> 
<script type="text/javascript" src="/common/ext/ext-base.js"></script>
<script type="text/javascript" src="/common/ext/ext-all.js"></script>
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
	String path = request.getSession().getServletContext().getRealPath("/");
	//String picpath = request.getRealPath("/").replaceAll("\\\\","\\\\\\\\\\\\\\\\")+"demo.jpg";
	List<PrjBean> beanList = BuinessDao.getAllList(path,"");
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");
%>
<script language="JAVASCRIPT">
function toBack(){
	location.href="/project/gqxqManage.jsp";
}

function getGcmessage2(id){
	var type = getRadioValue("myradio");
	if(window.XMLHttpRequest){ //Mozilla
    	var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	xmlHttpReq.open("GET", "/FileUploadServlet?type=gqcj&saveType="+type+"&changeVal="+id, false);
	xmlHttpReq.send(null);
	GCMESSAGE.innerHTML = xmlHttpReq.responseText;
	
	//var val = result.split("|");
  	//GCMESSAGE.innerHTML = val[0];
  	//PICLIST.innerHTML=val[1];
	Ext.onReady(function(){
		show.innerHTML="";
	        Ext.QuickTips.init();
	 
	        // 格式化数据，数据也可采用json数据
	        var ds = new Ext.data.Store({
	                //proxy: new Ext.data.MemoryProxy(data), // 数据源
	                proxy: new Ext.data.HttpProxy({   
	                    url: 'loadInputSelect.jsp?prjid='+id  
	                }),
	                reader: new Ext.data.ArrayReader({}, [ // 如何解析
	                    {name: 'id'},
	                    {name: 'name'}                           
	                ])
	        });
	        ds.load();  
	    
	        var storeList = new Ext.form.ComboBox({ 
	        		id:'STTPCD',       
	                store: ds,
	                valueField:'id',     //option的值
	                typeAhead: true,
	                editable:true,//默认为true，false为禁止手写和联想功能
	                displayField: 'name',//option的显示文本
	                triggerAction: 'all',
	                emptyText:'请选择',
	                mode: 'local',
	                selectOnFocus:true,
	                renderTo:'show',
	                width:135
	        });
	        //取得option值函数
	       // function getVal(){
	        //    var val = storeList.getValue();//取得option值
	        //    alert(val);
	        //}
	
	       // storeList.on('select', getVal);//当选择时触发该函数
	});
}
function updateXQFLFRAME(obj){
	window.frames["XQFLFRAME"].location.href=obj.value+".jsp";
}
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
	//document.getElementById('ZPBT').value=val[0];
	//document.getElementById('ZPMS').value=val[2];
	//document.getElementById('CJSJ').value=val[1];
	var newPreview = document.getElementById("newPreview"); 
	//newPreview.style.filter="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = val[3]; 
	newPreview.style.width = "150px"; 
	newPreview.style.height = "100px"; 
	newPreview.style.border= "6px double #ccc";
}
</script>
<body scroll="auto">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">新增工情险情</span></td></tr>
</table>
<iframe name="saveFrm" src="" frameborder="0" scrolling="no" width="0" height="0">
<!--显示图片专用  -->
</iframe>
<form name="warnForm" action="" method="post">
 </form>
<form name="form1" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="DNCNO" value="<%=UUIdFactory.getMaxId(path, "TB_STDNC","DNCNO") %>"/>
<input type="hidden" name="myradio" value="2"></input>
<input type="hidden" name="STTNM" value=""></input>
<input type="hidden" name="tabname" value="TB_STDNC_M"></input>

<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title_center" colspan="6">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">工程名称[B]:</td>
		<td height="25"  bgcolor="#FFFFFF">
				<select name="GCNAME" onchange="javascript:getGcmessage2(this.value)">
				<option value="">--工程名称--</option>
					<%if(beanList!=null && beanList.size()>0){
						for(int i=0;i<beanList.size();i++){
							PrjBean bean = beanList.get(i);
				%>
					<option value="<%=bean.getPJNO() %>"><%=bean.getPJNM() %></option>
				<%
						}
					} %>
				</select></td>
		<td height="25" nowrap class="title">险情分类[C]:</td>
		<td height="25"  bgcolor="#FFFFFF">
					<select name="XQFLDM" onchange="javascript:updateXQFLFRAME(this)">
					<%if(resultList!=null && resultList.size()>0){
					for(int i=0;i<resultList.size();i++){
						Map<Object,Object> map = (Map<Object,Object>)resultList.get(i);
						%>
							<option value="<%=map.get("id")%>" %><%=map.get("value")%></option>
						<%
					}} %>
					</select></td>
		<td height="25" nowrap class="title">填报单位[U]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="WTDPCD" value=""/></td>
		
	</tr>
	<tr>
		<td height="25" nowrap class="title">险情标题[N]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="DNCNM" value=""/></td>
		<td height="25" nowrap class="title">建筑物[P]:</td>
		<td height="25"  bgcolor="#FFFFFF"><div id="show"></div></td>
		<!--<input type="text" name="STTPCD" value=""/>-->
		<td height="25" nowrap class="title">采集时间[T]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="DAGTM" value="<%=UtilDateTime.nowDateString() %>"/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">险情级别:</td>
		<td bgcolor="#FFFFFF">
			<select name="DNCGR">
				<option value="一般险情">一般险情</option>
				<option value="较大险情">较大险情</option>
				<option value="重大险情">重大险情</option>
			</select>
		</td>
		<td nowrap class="title">出险地点:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DAGPLCCH" value=""/></td>
		<td nowrap class="title">解放军投入:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="PLAPN" value="0" />人<font color="red">*</font></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">武警投入:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="PLIPN" value="0" />人<font color="red">*</font></td>
		<td nowrap class="title">群众投入:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="TPN" value="0"/>人<font color="red">*</font></td>
		<td nowrap class="title" >当前水位:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="RZ" value="0" />米<font color="red">*</font></td>
	</tr>
	<tr height="25" >
	<td nowrap class="title">出险部位:</td>
		<td bgcolor="#FFFFFF" colspan="5"><input type="text" name="DAGLO" value="" style="width:100%"/></td>
	</tr>
	<tr height="30">
		<td height="25" nowrap class="title">照片标题[H]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="ZPBT" value=""/></td>
		<td height="25" nowrap class="title">选择照片:</td>
		<td bgcolor="#FFFFFF" colspan="4" >
		<input type="file" name="UpFile" onchange="javascript:PreviewImg(this);">&nbsp;&nbsp;<input type="button" name="" value="添加照片" onclick="javascript:uploadPhotos()"/></td>
		
	</tr>
	<tr>
		<td height="25" nowrap class="title">照片描述</td>
		<td bgcolor="#FFFFFF"><textarea rows="6" cols="22" name="ZPMS"  style="width:100%"></textarea></td>
		<td height="25" nowrap class="title">照片列表</td>
		<td bgcolor="#FFFFFF" ><div id="PICLIST" class="divStyle"></div></td>
		<td colspan="2" bgcolor="#FFFFFF" align="center"><div id="newPreview" ></div></td>
	</tr>
	<tr height="25">
		<td bgcolor="#FFFFFF" colspan="10" width="100%"><!-- gcxqLoader.jsp -->
		<iframe id="main1" scrolling="no" frameborder="0" marginwidth="1" marginheight="1" src="gcxqLoader.jsp" height="150" width="100%" >
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="11">
		<iframe id="XQFLFRAME" frameborder="0" marginheight="1" marginwidth="1"  align="middle" onload="this.height=XQFLFRAME.document.body.scrollHeight" src="D001.jsp" height="100%" width="100%"></iframe>
		</td>
	</tr>
	
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:per_Submit('add_gqcj')">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
