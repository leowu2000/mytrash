<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 

	String path = request.getSession().getServletContext().getRealPath("/");
	String picpath = request.getSession().getServletContext().getRealPath("/").replaceAll("\\\\","\\\\\\\\\\\\\\\\")+"demo.jpg";
	List<PrjBean> beanList = BuinessDao.getAllList(path,"");
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");

    String RPJINCD = request.getParameter("RPJINCD");
    RPJINCD=RPJINCD==null?"":RPJINCD;
    String arr[] = null;
    String PJNO = "";
    String DNCNO = "0";
    String XQFLDM = "";
    if(!"".trim().equals(RPJINCD)){
    	arr = RPJINCD.split(";");
    	PJNO = arr[0];
    	DNCNO = arr[1];
    	XQFLDM =arr[2];
    }
    STDNCBean stdncbean = BuinessDao.findStdncById(path,DNCNO);
    String sttcdName = BuinessDao.idToNameChange(path,"TB_ST","STNM","STTPCD="+stdncbean.getSTTPCD());
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

<script language="JAVASCRIPT">
function toBack(){
	location.href="/project/gqxqManage.jsp";
}
var w=0;
var h=0;
window.onresize = function(){
	var ww = document.documentElement.clientWidth;
	var hh = document.documentElement.clientHeight;
	if(ww!=w || hh!=h){
		w=ww;
		h=hh;
		document.getElementById("main1").width=ww*0.98;
	}
}

function getGcmessage2(id){
	var sttcd='<%=sttcdName %>';
	var type = getRadioValue("myradio");
	if(window.XMLHttpRequest){ //Mozilla
    	var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	xmlHttpReq.open("GET", "/FileUploadServlet?type=gqcj&saveType="+type+"&changeVal="+id, false);
	xmlHttpReq.send(null);
	var result = xmlHttpReq.responseText;
	var val = result.split("|");
  	GCMESSAGE.innerHTML = val[0];
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
	                ]),
	                //设置选中
	                listeners: {    
	        	             load: function() { 
	             				storeList.setValue('<%=stdncbean.getSTTPCD()%>');    
	        	             }    
	        	         }  
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
	        //storeList.on('load', function() {
		    //    alert(sttcd);   
	        //	STTPCD.setValue(sttcd);   
	        //}); 
	        
	         
	});
}
function updateXQFLFRAME(obj){
	window.frames["XQFLFRAME"].location.href=obj.value+".jsp";
}
</script>
<body scroll="auto" onload="javascript:getGcmessage2('<%=PJNO %>')">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">修改工情险情</span></td></tr>
</table>
<iframe name="saveFrm" src="" frameborder="0" scrolling="no" width="0" height="0">
<!--显示图片专用  -->
</iframe>
<form name="warnForm" action="" method="post">
 </form>
<form name="form1" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="myradio" value="2"></input>
<input type="hidden" name="DNCNO" value="<%=stdncbean.getDNCNO() %>"/>
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
		<td height="25"  bgcolor="#FFFFFF"><%=BuinessDao.idToNameChange(path,"TB_PJ", "PJNM", "PJNO="+PJNO) %>
		<input type="hidden" name="GCNAME" value="<%=PJNO %>"></td>
		<td height="25" nowrap class="title">险情分类[C]:</td>
		<td height="25"  bgcolor="#FFFFFF"><%=BuinessDao.idToNameChange(path,"TB_XQFL", "XQFLMC", "XQFLDM='"+XQFLDM+"'")%>
		<input type="hidden" name="XQFLDM" value="<%= XQFLDM%>"></td>
		<td height="25" nowrap class="title">填报单位[U]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="WTDPCD" value="<%=stdncbean.getWTDPCD() %>"/></td>
		
	</tr>
	<tr>
		<td height="25" nowrap class="title">险情标题[N]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="DNCNM" value="<%=stdncbean.getDNCNM() %>"/></td>
		<td height="25" nowrap class="title">建筑物[P]:</td>
		<td height="25"  bgcolor="#FFFFFF">
		<div id="show"></div>
		</td>
		<td height="25" nowrap class="title">采集时间[T]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="DAGTM" value="<%=stdncbean.getDAGTM() %>"/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">险情级别:</td>
		<td bgcolor="#FFFFFF">
			<select name="DNCGR">
				<option value="一般险情" <%if(stdncbean.getDNCGR().trim().equals("一般险情")){ %>selected<%} %>>一般险情</option>
				<option value="较大险情" <%if(stdncbean.getDNCGR().trim().equals("较大险情")){ %>selected<%} %>>较大险情</option>
				<option value="重大险情" <%if(stdncbean.getDNCGR().trim().equals("重大险情")){ %>selected<%} %>>重大险情</option>
			</select>
		</td>
		<td nowrap class="title">出险地点:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DAGPLCCH" value="<%=stdncbean.getDAGPLCCH() %>"/></td>
		<td nowrap class="title">解放军投入:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="PLAPN" value="<%=stdncbean.getPLAPN() %>" />人<font color="red">*</font></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">武警投入:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="PLIPN" value="<%=stdncbean.getPLIPN() %>" />人<font color="red">*</font></td>
		<td nowrap class="title">群众投入:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="TPN" value="<%=stdncbean.getTPN() %>"/>人<font color="red">*</font></td>
		<td nowrap class="title" >当前水位:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="RZ" value="<%=stdncbean.getRZ() %>" />米<font color="red">*</font></td>
	</tr>
	<tr height="25" >
	<td nowrap class="title">出险部位:</td>
		<td bgcolor="#FFFFFF" colspan="5"><input type="text" name="DAGLO" value="<%=stdncbean.getDAGLO() %>" style="width:100%"/></td>
	</tr>
	<tr height="25">
		<td bgcolor="#FFFFFF" colspan="10">
		<iframe id="main1" scrolling="no" frameborder="0" marginwidth="1" marginheight="1" src="gcxqLoader.jsp?PJNO=<%=PJNO %>&DNCNO=<%=DNCNO %>" height="150" width="100%" >
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="11">
		<iframe id="ZPFRAME" scrolling="no" frameborder="0" marginheight="1" marginwidth="1" src="/common/picEdit.jsp?tbid=TB_STDNC_M&DNCNO=<%=DNCNO %>&PKNAME=DNCNO" height="170" width="100%"></iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="11">
		<iframe id="XQFLFRAME" scrolling="no" frameborder="0" marginheight="1" marginwidth="1"  align="middle" onload="this.height=XQFLFRAME.document.body.scrollHeight" src="<%=XQFLDM %>.jsp?PJNO=<%=PJNO %>&DNCNO=<%=DNCNO %>" height="100%" width="100%"></iframe>
		</td>
	</tr>
</table>
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="保  存" onclick="javascript:per_Submit('edit_gqcj')">
	&nbsp;
	<input type="button" name="" value="返  回" onclick="javascript:toBack()">
	</tr>
</table>
</body>
</html>
