<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.util.*" %>
<%@ page import="java.util.*" %>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 

	String path = request.getRealPath("/");
	String picpath = request.getRealPath("/").replaceAll("\\\\","\\\\\\\\\\\\\\\\")+"demo.jpg";
	List<PrjBean> beanList = BuinessDao.getAllList(path);
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
	document.getElementById('DAGTM').value=val[1];
	
	warnForm.action="viewPic.jsp?from=asdf&type=jpeg&zlbm="+picid+"&tbid=TB_STDNC_M";
	warnForm.target="saveFrm";
	warnForm.submit();
	setTimeout("viewDataImg('<%=picpath%>')","1000");
}
//ͼƬԤ���������
function viewDataImg(value) 
{ 
	
	//�µ�Ԥ�����룬֧�� IE6��IE7�� 
	var newPreview = document.getElementById("newPreview"); 
	//newPreview.style.filter="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = value; 
	newPreview.style.width = "150px"; 
	newPreview.style.height = "100px"; 
	newPreview.style.border= "6px double #ccc";
}
function getGcmessage2(id){
	var sttcd='<%=stdncbean.getWTDPCD() %>';
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
  	PICLIST.innerHTML=val[1];
	Ext.onReady(function(){
		show.innerHTML="";
	        Ext.QuickTips.init();
	 
	        // ��ʽ�����ݣ�����Ҳ�ɲ���json����
	        var ds = new Ext.data.Store({
	                //proxy: new Ext.data.MemoryProxy(data), // ����Դ
	                proxy: new Ext.data.HttpProxy({   
	                    url: 'loadInputSelect.jsp?prjid='+id  
	                }),
	                reader: new Ext.data.ArrayReader({}, [ // ��ν���
	                    {name: 'id'},
	                    {name: 'name'}                           
	                ])
	        });
	        ds.load();  
	    
	        var storeList = new Ext.form.ComboBox({ 
	        		id:'STTPCD',       
	                store: ds,
	                valueField:'id',     //option��ֵ
	                typeAhead: true,
	                editable:true,//Ĭ��Ϊtrue��falseΪ��ֹ��д�����빦��
	                displayField: 'name',//option����ʾ�ı�
	                triggerAction: 'all',
	                emptyText:'��ѡ��',
	                mode: 'local',
	                selectOnFocus:true,
	                
	                renderTo:'show',
	                width:135
	        });
	        storeList.on('load', function() {   
	        	STTPCD.setValue(sttcd);   
	        });  
	        //ȡ��optionֵ����
	       // function getVal(){
	        //    var val = storeList.getValue();//ȡ��optionֵ
	        //    alert(val);
	        //}
	
	       // storeList.on('select', getVal);//��ѡ��ʱ�����ú���
	});
}
function updateXQFLFRAME(obj){
	window.frames["XQFLFRAME"].location.href=obj.value+".jsp";
}
</script>
<body scroll="auto" onload="javascript:getGcmessage2('<%=PJNO %>')">
<table width="90%" align="center">
	<tr><td align="center" ><span  class="style4">������������</span></td></tr>
</table>
<iframe name="saveFrm" src="" frameborder="0" scrolling="no" width="0" height="0">
<!--��ʾͼƬר��  -->
</iframe>
<form name="warnForm" action="" method="post">
 </form>
<form name="form1" method="POST"> 
<jsp:include page="hiddenParameters.jsp"></jsp:include>
<input type="hidden" name="myradio" value="2"></input>

<input type="hidden" name="STTNM" value=""></input>
<input type="hidden" name="tabname" value="TB_STDNC_M"></input>

<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title" colspan="6">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr>
		<td height="25" nowrap class="title">��������[B]:</td>
		<td height="25"  bgcolor="#FFFFFF"><%=BuinessDao.idToNameChange(path,"TB_PJ", "PJNM", "PJNO="+PJNO) %>
		<input type="hidden" name="GCNAME" value="<%=PJNO %>"></td>
		<td height="25" nowrap class="title">�������[C]:</td>
		<td height="25"  bgcolor="#FFFFFF"><%=BuinessDao.idToNameChange(path,"TB_XQFL", "XQFLMC", "XQFLDM='"+XQFLDM+"'")%>
		<input type="hidden" name="XQFLDM" value="<%= XQFLDM%>"></td>
		<td height="25" nowrap class="title">���λ[U]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="WTDPCD" value="<%=stdncbean.getWTDPCD() %>"/></td>
		
	</tr>
	<tr>
		<td height="25" nowrap class="title">�������[N]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="DNCNM" value="<%=stdncbean.getDNCNM() %>"/></td>
		<td height="25" nowrap class="title">������[P]:</td>
		<td height="25"  bgcolor="#FFFFFF">
		<div id="show"></div>
		</td>
		<td height="25" nowrap class="title">�ɼ�ʱ��[T]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="DAGTM" value="<%=stdncbean.getDAGTM() %>"/></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">���鼶��:</td>
		<td bgcolor="#FFFFFF">
			<select name="DNCGR">
				<option value="һ������" <%if(stdncbean.getDNCGR().trim().equals("һ������")){ %>selected<%} %>>һ������</option>
				<option value="�ϴ�����" <%if(stdncbean.getDNCGR().trim().equals("�ϴ�����")){ %>selected<%} %>>�ϴ�����</option>
				<option value="�ش�����" <%if(stdncbean.getDNCGR().trim().equals("�ش�����")){ %>selected<%} %>>�ش�����</option>
			</select>
		</td>
		<td nowrap class="title">���յص�:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DAGPLCCH" value="<%=stdncbean.getDAGPLCCH() %>"/></td>
		<td nowrap class="title">��ž�Ͷ��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="PLAPN" value="<%=stdncbean.getPLAPN() %>" />��<font color="red">*</font></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">�侯Ͷ��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="PLIPN" value="<%=stdncbean.getPLIPN() %>" />��<font color="red">*</font></td>
		<td nowrap class="title">Ⱥ��Ͷ��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="TPN" value="<%=stdncbean.getTPN() %>"/>��<font color="red">*</font></td>
		<td nowrap class="title" >��ǰˮλ:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="RZ" value="<%=stdncbean.getRZ() %>" />��<font color="red">*</font></td>
	</tr>
	<tr height="25" >
	<td nowrap class="title">���ղ�λ:</td>
		<td bgcolor="#FFFFFF" colspan="5"><input type="text" name="DAGLO" value="<%=stdncbean.getDAGLO() %>" style="width:100%"/></td>
	</tr>
	<tr height="25">
		<td bgcolor="#FFFFFF" colspan="10">
		<iframe id="main1" scrolling="no" frameborder="0" marginwidth="1" marginheight="1" src="gcxqLoader.jsp" height="150" width="100%" >
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="11">
		<iframe id="XQFLFRAME" frameborder="0" marginheight="1" marginwidth="1"  align="middle" onload="this.height=XQFLFRAME.document.body.scrollHeight" src="<%=XQFLDM %>.jsp?PJNO=<%=PJNO %>&DNCNO=<%=DNCNO %>" height="100%" width="100%"></iframe>
		</td>
	</tr>
	<tr height="30">
		<td height="25" nowrap class="title">��Ƭ����[H]:</td>
		<td height="25"  bgcolor="#FFFFFF"><input type="text" name="ZPBT" value=""/></td>
		<td height="25" nowrap class="title">ѡ����Ƭ:</td>
		<td bgcolor="#FFFFFF" colspan="4" >
		<input type="file" name="UpFile" onchange="javascript:PreviewImg(this);">&nbsp;&nbsp;<input type="button" name="" value="�����Ƭ" onclick="javascript:uploadPhotos()"/></td>
		
	</tr>
	<tr>
		<td height="25" nowrap class="title">��Ƭ����</td>
		<td bgcolor="#FFFFFF"><textarea rows="6" cols="22" name="ZPMS"  style="width:100%"></textarea></td>
		<td height="25" nowrap class="title">��Ƭ�б�</td>
		<td bgcolor="#FFFFFF" ><div id="PICLIST" class="divStyle"></div></td>
		<td colspan="2" bgcolor="#FFFFFF" align="center"><div id="newPreview" ></div></td>
	</tr>
</table>
<!--
<div id="YXZT" style="display:none">
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">

	<tr height="25" >
		<td class="title">��������״̬</td>
		<td  bgcolor="#FFFFFF" colspan=7>
		<iframe id="main2" frameborder="0" marginwidth="0" marginheight="0" src="yxztLoader.jsp" height="150" width="800">
		</iframe>
		</td>
	</tr>
	<tr height="25" >
		<td rowspan="3" class="title">ˮ��</td>
		<td nowrap class="title">ˮ�����:</td>
		<td bgcolor="#FFFFFF">
		<select name="RSCLS">
				<option value="1">����</option>
				<option value="2">�к�</option>
				<option value="2">���տ�</option>
			</select>
		</td>
		<td nowrap class="title">��ǰ����ˮλ:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RZ" value="0" size="8"/>��<font color="red">*</font></td>
	</tr>
	<tr height="25" >
		<td nowrap class="title">��ǰ����:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RV" value="0" size="8"/>��������<font color="red">*</font></td>
		<td nowrap class="title">��ǰк��:</td>
		<td bgcolor="#FFFFFF" ><input type="text" name="RQ" value="0" size="8"/>������/��<font color="red">*</font></td>
	</tr>
	<tr height="25" >
		<td  bgcolor="#FFFFFF" colspan="7">
		<iframe id="main3" frameborder="0" marginwidth="0" marginheight="0" src="skLoader.jsp" height="155" width="800">
		</iframe>
		</td>
	</tr>
</table>
</div>-->
</form>
<br/>
<table border="0"  width="95%" align="center">
	<tr align="center">
	<td>
	<input type="button" name="" value="��  ��" onclick="javascript:per_Submit()">
	&nbsp;
	<input type="button" name="" value="��  ��" onclick="javascript:viewThePic('1')">
	</tr>
</table>
</body>
</html>
