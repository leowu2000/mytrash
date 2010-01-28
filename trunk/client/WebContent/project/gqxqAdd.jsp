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
</script>
<body scroll="auto">
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
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">
	<tr height="25" >
		<td nowrap align="center" class="title2">
			<input type="radio" id="myradio" name="myradio" value="1" checked onclick="javascript:chkCheckBoxChs(this)">��������״̬[R]
			<input type="radio" id="myradio" name="myradio" value="2" onclick="javascript:chkCheckBoxChs(this)">��������[G]
		</td>
		<td nowrap align="center" class="title">
		<DIV id="GCMESSAGE"></DIV>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" width="30%" align="center">
		<table border="0" width="100%" height="100%" border="1" >
			<tr height="25" >
				<td nowrap class="title">��������[B]:</td>
				<td bgcolor="#FFFFFF">
				
				<select name="PJNM" onchange="javascript:getGcmessage(this.value)">
				<option value="">--��������--</option>
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
			</tr>
			<tr height="25" >
				<td nowrap class="title">�������[C]:</td>
				<td bgcolor="#FFFFFF">
					<select name="XQFL" disabled="true">
					<%if(resultList!=null && resultList.size()>0){
					for(int i=0;i<resultList.size();i++){
						Map<Object,Object> map = (Map<Object,Object>)resultList.get(i);
						%>
							<option value="<%=map.get("id")%>" %><%=map.get("value")%></option>
						<%
					}} %>
					</select>
				</td>
			</tr>
			<tr height="25" >
				<td nowrap class="title">���ղ�λ[P]:</td>
				<td bgcolor="#FFFFFF"><input type="text" name="CXBW" value="" disabled="true"/></td>
			</tr>
			<tr height="25" >
				<td nowrap class="title">�������[N]:</td>
				<td bgcolor="#FFFFFF"><input type="text" name="XQBT" value=""  disabled="true"/></td>
			</tr>
			<tr height="25" >
				<td nowrap class="title">���λ[U]:</td>
				<td bgcolor="#FFFFFF"><input type="text" name="TBDW" value=""/></td>
			</tr>
			<tr height="25" >
				<td nowrap class="title"><div id="DATEDESC">�ɼ�ʱ��[T]</div></td>
				<td class="title2"><input type="text" name="CJSJ" value="<%=UtilDateTime.nowDateString() %>"/></td>
			</tr>
		</table>
		</td>
		<td bgcolor="#FFFFFF" >
		<table border="0" width="100%" height="100%" bgcolor="#CCCCCC">
			<tr>
				<td nowrap class="title" width="30%">��Ƭ�б�</td>
				<td nowrap class="title">Ԥ������</td>
				<td nowrap class="title2">��Ƭ����[H]</td>
				<td nowrap class="title2"><input type="text" name="ZPBT" value=""/></td>
			</tr>
			<tr>
				<td bgcolor="#FFFFFF" rowspan="3"><div id="PICLIST" class="divStyle"></div></td>
				<td bgcolor="#FFFFFF" rowspan="3">
				<div id="newPreview" ></div>
				</td>
				<td height="20" nowrap class="title2" colspan="2">��Ƭ:
				<input type="file" name="UpFile" size="20" onchange="javascript:PreviewImg(this);">��</td>
			</tr>
			<tr>
				<td nowrap class="title">��Ƭ����</td>
				<td bgcolor="#FFFFFF" ><textarea rows="6" cols="26" name="ZPMS"></textarea></td>
			</tr>
			<tr>
				<td class="title" colspan="2">
					<input type="button" name="" value="������Ƭ" onclick="javascript:uploadPhotos()"/>&nbsp;&nbsp;&nbsp;
					<!-- 
					<input type="button" name="SAVEMAINMSG" value="��ϸ��Ϣ" onclick="javascript:showDetail()" disabled=true/>
					 -->
					 <input type="button" name="SAVEMAINMSG" value="��ϸ��Ϣ" onclick="javascript:showDetail()"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<div id="GCXQ" style="display:none">
<table border="0" align="center" width="98%" cellspacing="1" bgcolor="#CCCCCC">

	<tr height="25" >
		<td rowspan="3" class="title">����</td>
		<td nowrap class="title">���鼶��:</td>
		<td bgcolor="#FFFFFF">
			<select name="DNCGR">
				<option value="һ������">һ������</option>
				<option value="�ϴ�����">�ϴ�����</option>
				<option value="�ش�����">�ش�����</option>
			</select>
		</td>
		<td nowrap class="title">���յص�:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="DAGPLCCH" value="" size="10"/></td>
		<td nowrap class="title">���ղ�λ:</td>
		<td bgcolor="#FFFFFF" colspan="5"><input type="text" name="DAGLO" value=""/></td>
	</tr>
	
	<tr height="25" >
		<td nowrap class="title">��ž�Ͷ��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="PLAPN" value="0" size="8"/>��<font color="red">*</font></td>
		<td nowrap class="title">�侯Ͷ��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="PLIPN" value="0" size="8"/>��<font color="red">*</font></td>
		<td nowrap class="title">Ⱥ��Ͷ��:</td>
		<td bgcolor="#FFFFFF"><input type="text" name="TPN" value="0" size="8"/>��<font color="red">*</font></td>
		<td nowrap class="title" >��ǰˮλ:</td>
		<td bgcolor="#FFFFFF" colspan=3><input type="text" name="RZ" value="0" size="8"/>��<font color="red">*</font></td>
	</tr>
	<tr height="25">
		<td bgcolor="#FFFFFF" colspan="10">
		<iframe id="main1" frameborder="0" marginwidth="0" marginheight="0" src="gcxqLoader.jsp" height="198" width="800">
		</iframe>
		</td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" colspan="11">
		<iframe id="XQFLFRAME" frameborder="0" marginwidth="0" marginheight="0" src="" height="100%" width="100%"></iframe>
		</td>
	</tr>
</table>
</div>
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
</div>
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
