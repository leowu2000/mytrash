<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/common/session.jsp"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
%> 
<html>
<head>
<title></title>
<link href="/common/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/common/ext/ext-all.css" /> 
<script type="text/javascript" src="/common/ext/ext-base.js"></script>
<script type="text/javascript" src="/common/ext/ext-all.js"></script>
<script Language="JavaScript" src="/common/js/projectCommon.js"></script>
<script Language="JavaScript" src="/common/js/common.js"></script>
<script Language="JavaScript" src="/common/My97DatePicker/WdatePicker.js"></script>
</head>
<style type="text/css">
<!--

#newPreview
{
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
	width :150px; 
	height:70px; 
	borde:6px double #ccc;
}

-->
</style>
<%
	String path = request.getSession().getServletContext().getRealPath("/");
	String pjWhere = "1=1";
	if(configBean!=null)
		pjWhere = "CNTCD='"+configBean.getXZQH_X()+"'";
	List<PrjBean> beanList = BuinessDao.getAllList(path,pjWhere);
	String uuid = String.valueOf(UUIdFactory.getMaxId(path, "TB_STDNC","DNCNO"));
	BuinessDao.deleteDB("delete from TB_SUB_TEMP",path);
	List<Map<Object,Object>> resultList = BuinessDao.getSelectList("TB_XQFL",new String[]{"XQFLDM","XQFLMC"},path,"");
%>
<script language="JAVASCRIPT">
function toBack(){
	location.href="/project/xq/gqxqManage.jsp";
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
	});
}
function updateXQFLFRAME(obj){
	window.frames["XQFLFRAME"].location.href=obj.value+".jsp";
}

</script>
<body>
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">新增工情险情</span></td></tr>
</table>
<iframe name="saveFrm" src="" frameborder="0" scrolling="no" width="0" height="0">
<!--显示图片专用  -->
</iframe>
<form name="warnForm" action="" method="post">
 </form>
<form name="frm" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="DNCNO" value="<%=UUIdFactory.getMaxId(path, "TB_STDNC","DNCNO") %>"/>
<input type="hidden" name="myradio" value="2"></input>
<input type="hidden" name="uptype" value=""/>
<input type="hidden" name="DTCDT" value="<%=UtilDateTime.nowDateString()%>"/>
<input type="hidden" name="tabname" value="TB_STDNC_M"></input>
<input type="hidden" name="upFileValues" value=""/>
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title_center" colspan="6">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">工程名称</td>
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
		<td height="25" nowrap class="title">险情分类</td>
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
		<td height="25" nowrap class="title">填报单位</td>
		<td height="25"  bgcolor="#FFFFFF"><%=configBean.getTBDW() %>
		<input type="hidden" name="WTDPCD" value="<%=configBean.getTBDW() %>"/>
		</td>
		
	</tr>
	<tr>
		<td height="25" nowrap class="title">险情标题</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="DNCNM" value=""/></td>
		<td height="25" nowrap class="title">建筑物</td>
		<td height="25"  bgcolor="#FFFFFF"><div id="show"></div></td>
		<td nowrap class="title">出险部位</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="DAGLO" value="" /></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">险情级别</td>
		<td bgcolor="#FFFFFF">
			<select name="DNCGR">
				<option value="一般险情">一般险情</option>
				<option value="较大险情">较大险情</option>
				<option value="重大险情">重大险情</option>
			</select>
		</td>
		<td nowrap class="title">出险地点</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DAGPLCCH" value=""/></td>
		<td nowrap class="title">出险时间</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DAGTM" value="<%=UtilDateTime.nowDateString() %>" onClick="WdatePicker({startDate:'%y-%M-01 00:00',dateFmt:'yyyy-MM-dd HH:mm',alwaysUseStartDate:false})" readonly /></td>
	</tr>
	<tr height="25" >
	<td nowrap class="title">解放军投入</td>
		<td bgcolor="#FFFFFF"><input type="text" size="10" name="PLAPN" value="0" />人<font color="red">*</font></td>
		<td nowrap class="title">武警投入</td>
		<td bgcolor="#FFFFFF"><input type="text" size="10" name="PLIPN" value="0" />人<font color="red">*</font></td>
		<td nowrap class="title">群众投入</td>
		<td bgcolor="#FFFFFF"><input type="text" size="10" name="TPN" value="0"/>人<font color="red">*</font></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title" >当前水位</td>
		<td bgcolor="#FFFFFF" colspan="4"><input type="text" name="RZ" value="0" />米<font color="red">*</font></td>
		<td bgcolor="#FFFFFF" rowspan="4" align="center"><div id="newPreview" ></div></td>
	</tr>
	<tr height="25" bgcolor="#FFFFFF" >
		<td nowrap class="title" >选择照片</td>
		<td bgcolor="#FFFFFF" colspan="2">
		<div id="thfiles"  style="display:none"></div>
		<div id="showupfile" style="display:inline"><input type="file" id="UpFile" name="UpFile" size="20" onchange="javascript:PreviewImg(this);"> </div>
		</td>
		<td nowrap class="title">照片标题</td> 
		<td bgcolor="#FFFFFF" >
			<input type="text" name="TITLE" value=""/>
		</td>
		
		
	</tr>
	<tr bgcolor="#FFFFFF" >
		<td nowrap class="title">照片描述</td> 
		<td bgcolor="#FFFFFF" colspan="4">
		<textarea rows="3" cols="10" name="NRMS" style="width:100%"></textarea>
		</td>		
	</tr>
	
	<tr height="25">
		<td bgcolor="#FFFFFF" align="right" colspan="5">
			<input type="button" name="addbutton" value="添  加" onclick="javascript:uplaodReportPhotos('TB_STDNC_M')"/>&nbsp;&nbsp;
			<input type="button" name="editbutton" value="修  改" disabled onclick="javascript:updateMediaMsg('TB_STDNC_M')"/>&nbsp;&nbsp;
			<input type="button" name="cancelbutton" value="取  消" disabled onclick="javascript:cancelPhotos()"/>&nbsp;&nbsp;
		</td>
	</tr>
	<tr height="25" >
		<td nowrap bgcolor="#FFFFFF" colspan="6" align="center">
		<iframe id="ZPFRAME" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0"  src="/common/pic.jsp?tablename=TB_STDNC_M&pkvalue=<%=uuid%>&pkname=DNCNO" height="110" width="100%">
		</iframe>	
		</td> 
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
