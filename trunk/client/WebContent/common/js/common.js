
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
			alert(name+"ֻ�������֣���������д");
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
function uplaodReportPhotos(tbname){
	var check = document.getElementById('PICLIST').innerHTML;
	var title = document.getElementById('TITLE').value;
	var time = document.getElementById('DTCDT').value;
	var filepath = document.getElementById('UpFile').value;
	var zpms = document.getElementById('NRMS').value;
	var dncid = document.getElementById('DNCNO').value;
	var filedetail;
	if(filepath==""){alert("��ѡ���ϴ���Ƭ��");return false;}
	if(filepath!=""){
		var poi = filepath.lastIndexOf(".");
		detail = filepath.substring(poi+1,filepath.length).toUpperCase();
		if(detail!="JPG" && detail!="JPEG" && detail!="GIF" && detail!="BMP"){
			alert("��֧�ֵ��ļ���ʽ��������ѡ��");
			return false;
		}
	}
	var delFlg;
	if(check=="")delFlg=1;else delFlg=2;//������Ƭ��ʱ���Ƿ�����ִ��ɾ�������ı�־λ
	if(filepath==""){
		alert("��ѡ���ļ�.");
		return false;
	}
	if(title==""){
		alert("����д��Ƭ����.");
		return false;
	}
	if(time==""){
		alert("����дʱ��");
		return false;
	}
	if(window.XMLHttpRequest){ //Mozilla
    	var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	xmlHttpReq.open("GET", "/FileUploadServlet?type=report&tabname="+tbname+"&zpbtvalue="+title+"&time="+time
			+"&zpmsvalue="+zpms+"&filepath="+filepath+"&detailvalue="+filedetail+"&DNCNO="+dncid+"&delFlg="+delFlg, false);
	xmlHttpReq.send(null);
	var result = xmlHttpReq.responseText;
	PICLIST.innerHTML=result;
	document.getElementById('NRMS').value="";
	document.getElementById('TITLE').value="";
}
function submitingReport(tbname){
	if(document.getElementById('MAINTITLE').value==""){
		alert("����д����.");
		return false;
	}
	document.getElementById('TABLENAME').value=tbname;
	document.frm.submit();
}

function toDel(){
	var result="";
	var str = document.forms[0].RECORDID;
	for(var i=0;i<str.length;i++){
		if(str[i].checked==true){
			if(result=="")
				result = str[i].value;
			else
				result +=","+ str[i].value;
		}
	}
	if(result==""){
		alert("��û��ѡ���κμ�¼!");
	}else{
		if(confirm("ɾ����¼��ɾ�����������Ϣ,����ɾ�����ָܻ�,�Ƿ����?")){
			document.frm.IDs.value=result;
			document.frm.action="/buiness.do";
			document.frm.actionType.value="del";
			document.frm.submit();
		}
	}
}
