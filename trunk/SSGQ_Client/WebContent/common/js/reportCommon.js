/**
 * �������
 * @param type
 * @return
 */
function submitingReport(tbname){
	if(document.getElementById('MAINTITLE').value==""){
		alert("����д����.");
		return false;
	}
	document.getElementById('TABLENAME').value=tbname;
	if(document.frm.UpFile.value==""){
		document.frm.submit();
	}else{
		if(confirm("����δ�ϴ��Ķ�ý����Ϣ���Ƿ�������棿")){
			document.frm.submit();
		}
	}
	
}
function viewThePic(picid,tablename,filePath){
	if(window.XMLHttpRequest){ //Mozilla
		var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	xmlHttpReq.open("GET", "/FileUploadServlet?type=pre_updatepic&tablename="+tablename+"&picid="+picid, false);
	xmlHttpReq.send(null);
	var results = xmlHttpReq.responseText;
	if(val=="")
		alert("���ݲ�ѯʧ��,������!");
	else{
		viewDataImg(filePath);
		var val = results.split(";");
		document.frm.picid.value=picid;
		TITLE.innerHTML=val[0];
		DTCDT.innerHTML=val[1];
		NRMS.innerHTML=val[2];
	}
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

function uplaodReportPhotos(tbname){
	var url;
	var check = document.frm.check.value;
	var title = document.getElementById('TITLE').value;
	var time = document.getElementById('DTCDT').value;
	var filepath = document.getElementById('UpFile').value;
	var zpms = document.getElementById('NRMS').value;
	var dncid = document.getElementById('DNCNO').value;
	var detail;
	if(filepath==""){alert("��ѡ���ϴ���Ƭ��");return false;}
	if(filepath!=""){
		var poi = filepath.lastIndexOf(".");
		detail = filepath.substring(poi+1,filepath.length).toUpperCase();
		if(detail!="JPG" && detail!="JPEG" && detail!="MPG"){
			alert("��֧�ֵ��ļ���ʽ��������ѡ��");
			return false;
		}
	}
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
	url = "/FileUploadServlet?type=report&tabname="+tbname+"&zpbtvalue="+title+"&cjsjvalue="+time
			+"&zpmsvalue="+zpms+"&filepath="+filepath+"&detailvalue="+detail+"&DNCNO="
			+dncid+"&delFlg="+check;
	
	url = encodeURI(url);
	url = encodeURI(url);
	xmlHttpReq.open("get", url, false);
	xmlHttpReq.send(null);
	var result = xmlHttpReq.responseText;
	document.frm.check.value="2";
	document.getElementById('NRMS').value="";
	document.getElementById('TITLE').value="";
	document.getElementById('DTCDT').value="";
	//���file�ֶ�
	var obj = document.getElementById("UpFile");
	obj.outerHTML = obj.outerHTML;
	//���ͼƬԤ������
	var objIMG = document.getElementById("newPreview");
	objIMG.outerHTML =objIMG.outerHTML;
	document.frames('ZPFRAME').location.reload();
}

