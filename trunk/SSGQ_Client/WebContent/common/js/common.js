
var oldbgcolor = "#ffffff";
function turngray(num,bgcolor)
{
  yy="Y"+num;
  oldbgcolor = bgcolor;
  document.all(yy).style.backgroundColor="#FFF1E3";
}


function turnwhite(num)
{
  yy="Y"+num;
  document.all(yy).style.backgroundColor=oldbgcolor;
}


function setfocus(thisElement){
	thisElement.focus();
}


function isNumberKeyed(){
	if ((window.event.keyCode>57 || window.event.keyCode<48) && window.event.keyCode!=13)
		window.event.keyCode=0;
	return 1;
}


function charForbid(i){
	if (window.event.keyCode==i || window.event.keyCode==13)
		window.event.keyCode=0;
	return 1;
}


function rcheckall() {
  str=document.forms[0].RECORDID;
  if(str == null){len=0;}else{len=str.length;}
  if(document.forms[0].all.checked==1) val=1;
     else val=0;
  if(len>0)    
     for(i=0;i<len;i++) { str[i].checked=val;}
  else{
    if(str != null)
    str.checked=val;
  }
 }

function runChkAll() {
 str=document.forms[0].RECORDID;
 len=str.length;
 if(!(len>=0)) {
   if(str.checked)
     document.forms[0].all.checked=1;
   else
     document.forms[0].all.checked=0;
 }else{
   val=1;
   for(i=0;i<len;i++) {
     if(str[i].checked==0) {
       val=0;
       break;
     }
   }
   document.forms[0].all.checked=val;
 }
}

function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;
	retval = window.showModalDialog("/calendar/CalendarDlg.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
	
}
function compareDate(DateOne,DateTwo)
{ 

	var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ("-"));
	var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ("-")+1);
	var OneYear = DateOne.substring(0,DateOne.indexOf ("-"));
	
	var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ("-"));
	var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ("-")+1);
	var TwoYear = DateTwo.substring(0,DateTwo.indexOf ("-"));
	
	if (Date.parse(OneMonth+"/"+OneDay+"/"+OneYear) >
	Date.parse(TwoMonth+"/"+TwoDay+"/"+TwoYear))
	{
	return true;
	}
	else
	{
	return false;
	}

}
function checkNan(obj,name){
	if(obj.value!=""){
		if(isNaN(obj.value)){
			alert(name+"只接受数字，请重新填写");
			obj.value="";
			return false;
		}
	}
}
function exportResult(url,name){
	 var file=name+document.all.userid.value;
	 document.all.filename.value=file+".xls";
	 document.all.txt.value="<style>"
		 					+".title {"
		 					+"font-size: 10pt;"
		 					+"padding-top: 2px;"
		 					+"font-weight: bolder;"
		 					+"background-color: #DDFF86;"
		 					+"text-align:center;"
		 					+"}"
		 					+".p14 {"
		 					+"	font-size: 14pt;"
		 					+"	padding-top: 2px;"
		 					+"	font-weight: bold;"
		 					+"	color: #000000;"
		 					+"	font-style: normal;"
		 					+"}"
		 					+".edit4 {"
		 					+"font-size: 9pt;"
		 					+"font-weight: normal;"
		 					+"color: #000000;"
		 					+"text-decoration: none;"
		 					+"background-color:#f4F4F0;"
		 					+"text-align:center;"
		 					+"}"
		 					+".pt16 {"
		 					+"	font-size: 10pt;"
		 					+"font-weight: bold;"
		 					+"color: #666666;"
		 					+"}"
		 					+"</style>"+document.all.excelTab.innerHTML;

	 warnForm.action=url;
	 document.all.actionType.value="exportExcel";
	 warnForm.target="saveFrm";
	 warnForm.submit();
	 document.all.filename.value=file;
}
function printpage(m_printpage1){

    var printStr = document.all.item(m_printpage1).innerHTML;
    var findstr = "border=0";
    var findstr2 = "cellSpacing=1";
    var newstr=printStr.replace(findstr,"border=1");
    var newstr2=newstr.replace(findstr2,"cellSpacing=0");

    var oldstr = document.body.innerHTML;
    document.body.innerHTML = newstr2;
    window.print(); 
    document.body.innerHTML = oldstr;
    return true;
}
function toDel(){
	var result="";
	var str = document.forms[0].RECORDID;
	if(str.length==undefined){
		if(document.forms[0].RECORDID.checked){
			result=document.forms[0].RECORDID.value;
		}
	}else{
		for(var i=0;i<str.length;i++){
			if(str[i].checked==true){
				if(result=="")
					result = str[i].value;
				else
					result +=","+ str[i].value;
			}
		}
	}
	if(result==""){
		alert("您没有选择任何记录!");
	}else{
		if(confirm("删除记录会删除所有相关信息,并且删除后不能恢复,是否继续?")){
			document.frm.IDs.value=result;
			document.frm.action="/buiness.do";
			document.frm.actionType.value="del";
			document.frm.submit();
		}
	}
}
//图片预览区域代码
function viewDataImg(value) 
{ 

	//新的预览代码，支持 IE6、IE7。 
	var newPreview = document.getElementById("newPreview"); 
	//newPreview.style.filter="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = value; 
	newPreview.style.width = "150px"; 
	newPreview.style.height = "100px"; 
	newPreview.style.border= "6px double #ccc";
}
function PreviewImg(imgFile) 
{ 

	var filepath = imgFile.value;
	var poi = filepath.lastIndexOf(".");
	detail = filepath.substring(poi+1,filepath.length).toUpperCase();
	if(detail!="JPG" && detail!="JPEG" && detail!="MPG"){
		alert("不支持的文件格式，请重新选择！");
		return false;
	}
	//新的预览代码，支持 IE6、IE7。 
	var newPreview = document.getElementById("newPreview"); 
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value; 
	newPreview.style.width = "150px"; 
	newPreview.style.height = "100px"; 
	newPreview.style.border= "6px double #ccc";
}
function pre_updateThePic(picid,type,tablename,filePath){
	document.frm.uptype.value=type;
	if(window.XMLHttpRequest){ //Mozilla
		var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	if(type==1)
		xmlHttpReq.open("GET", "/FileUploadServlet?type=pre_updatepic&tablename="+tablename+"&picid="+picid, false);
	if(type==2)
		xmlHttpReq.open("GET", "/FileUploadServlet?type=pre_updatepic&tablename=TB_SUB_TEMP&picid="+picid, false);
	xmlHttpReq.send(null);
	var results = xmlHttpReq.responseText;
	if(val=="")
		alert("数据查询失败,请重试!");
	else{
		viewDataImg(filePath);
		var val = results.split(";");
		document.frm.picid.value=picid;
		document.frm.TITLE.value=val[0];
		document.frm.DTCDT.value=val[1];
		document.frm.NRMS.value=val[2];
		showupfile.style.display="none";
		thfiles.style.display="inline";
		document.frm.addbutton.disabled=true;
		document.frm.editbutton.disabled=false;
		document.frm.cancelbutton.disabled=false;
		thfiles.innerHTML=val[0]+"&nbsp;&nbsp;&nbsp;&nbsp;<a href=javascript:delMeditSubmit('"+picid+"','"+tablename+"') title='点击删除多媒体信息'><img src='/images/small_delete.gif' border='0'></img></a>";
	}
}
function cancelPhotos(){
	document.frm.TITLE.value="";
	document.frm.DTCDT.value="";
	document.frm.NRMS.value="";
	showupfile.style.display="inline";
	thfiles.style.display="none";
	//清空file值
	var obj = document.getElementById("UpFile");
	obj.outerHTML = obj.outerHTML;
	//清空图片预览区域
	var objIMG = document.getElementById("newPreview");
	objIMG.outerHTML =objIMG.outerHTML;
	document.frm.addbutton.disabled=false;
	document.frm.editbutton.disabled=true;
	document.frm.cancelbutton.disabled=true;
}
function delMeditSubmit(id,tablename){
	if(confirm("删除后不能恢复,是否继续?")){
		if(window.XMLHttpRequest){ //Mozilla
			var xmlHttpReq=new XMLHttpRequest();
		}else if(window.ActiveXObject){
			var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
		}
		var type = document.frm.uptype.value;
		if(type==1)
			xmlHttpReq.open("GET", "/FileUploadServlet?type=delpic&tablename="+tablename+"&picid="+id, false);
		if(type==2)
			xmlHttpReq.open("GET", "/FileUploadServlet?type=delpic&tablename=TB_SUB_TEMP&picid="+id, false);
		xmlHttpReq.send(null);
		var results = xmlHttpReq.responseText;
		if("sucess"==results){
			showupfile.style.display="inline";
			thfiles.style.display="none";
			document.frm.TITLE.value="";
			document.frm.NRMS.value="";
			showupfile.style.display="inline";
			thfiles.style.display="none";
			document.frm.addbutton.disabled=false;
			document.frm.editbutton.disabled=true;
			document.frm.cancelbutton.disabled=true;
			//清空file值
			var obj = document.getElementById("UpFile");
			obj.outerHTML = obj.outerHTML;
			//清空图片预览区域
			var objIMG = document.getElementById("newPreview");
			objIMG.outerHTML =objIMG.outerHTML;
			document.frames('ZPFRAME').location.reload();
		}
	}
}
function updateMediaMsg(tablename){
	var name = document.frm.TITLE.value;
	var cjsj = document.frm.DTCDT.value;
	var desc = document.frm.NRMS.value;
	var type = document.frm.uptype.value;
	var url ;
	if(name==""){
		alert("标题不能为空.");
		return false;
	}
	if(cjsj==""){
		alert("拍摄时间不能为空.");
		return false;
	}
	if(desc==""){
		alert("照片描述不能为空.");
		return false;
	}
	if(window.XMLHttpRequest){ //Mozilla
		var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	if(type==1){
		url = "/FileUploadServlet?type=updateMediaMsg&tablename="+tablename+"&picid="
				+document.frm.picid.value+"&title="+name+"&dtcdt="+cjsj+"&nrms="+desc;
		url = encodeURI(url);
		url = encodeURI(url);
		xmlHttpReq.open("get", url, false);
	}
	if(type==2){
		url = "/FileUploadServlet?type=updateMediaMsg&tablename=TB_SUB_TEMP&picid="
			+document.frm.picid.value+"&title="+name+"&dtcdt="+cjsj+"&nrms="+desc;
		url = encodeURI(url);
		url = encodeURI(url);
		xmlHttpReq.open("get", url, false);
	}
	xmlHttpReq.send(null);
	var results = xmlHttpReq.responseText;
	if("sucess"==results){
		document.frm.TITLE.value="";
		document.frm.DTCDT.value="";
		document.frm.NRMS.value="";
		showupfile.style.display="inline";
		thfiles.style.display="none";
		//清空file值
		var obj = document.getElementById("UpFile");
		obj.outerHTML = obj.outerHTML;
		//清空图片预览区域
		var objIMG = document.getElementById("newPreview");
		objIMG.outerHTML =objIMG.outerHTML;
		document.frm.addbutton.disabled=false;
		document.frm.editbutton.disabled=true;
		document.frm.cancelbutton.disabled=true;
		document.frames('ZPFRAME').location.reload();
	}
}
function playTheMedia(picid,tablename,tempPath,filePath,pkname){
	if(window.XMLHttpRequest){ //Mozilla
		var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}

	xmlHttpReq.open("GET", "/FileUploadServlet?type=pre_updatepic&tablename="+tablename+"&picid="+picid, false);
	xmlHttpReq.send(null);
	var results = xmlHttpReq.responseText;
	if(val=="")
		alert("数据查询失败,请重试!");
	else{
		var src="/common/player.jsp?zlbm="+picid+"&tbname="+tablename+"&pkname="+pkname;
		window.open (src, '', 'height=430, width=520, top=100, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
		var val = results.split(";");
		document.frm.picid.value=picid;
		TITLE.innerHTML=val[0];
		DTCDT.innerHTML=val[1];
		NRMS.innerHTML=val[2];
	}
}