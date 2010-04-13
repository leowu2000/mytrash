/**
 * 报告管理
 * @param type
 * @return
 */
function submitingReport(tbname){
	if(document.getElementById('MAINTITLE').value==""){
		alert("请填写标题.");
		return false;
	}
	document.getElementById('TABLENAME').value=tbname;
	if(document.frm.UpFile.value==""){
		document.frm.submit();
	}else{
		if(confirm("您有未上传的多媒体信息，是否继续保存？")){
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
		alert("数据查询失败,请重试!");
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

function uplaodReportPhotos(tbname){
	var url;
	var check = document.frm.check.value;
	var title = document.getElementById('TITLE').value;
	var time = document.getElementById('DTCDT').value;
	var filepath = document.getElementById("upFileValues").value;
	var zpms = document.getElementById('NRMS').value;
	var dncid = document.getElementById('DNCNO').value;
	var detail;
	if(filepath==""){alert("请选择上传照片！");return false;}
	if(filepath!=""){
		var poi = filepath.lastIndexOf(".");
		detail = filepath.substring(poi+1,filepath.length).toUpperCase();
		if(detail!="JPG" && detail!="JPEG" && detail!="MPG"){
			alert("不支持的文件格式，请重新选择！");
			return false;
		}
	}
	if(filepath==""){
		alert("请选择文件.");
		return false;
	}
	if(title==""){
		alert("请填写照片标题.");
		return false;
	}
	if(time==""){
		alert("请填写时间");
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
	//清空file字段
	var obj = document.getElementById("UpFile");
	obj.outerHTML = obj.outerHTML;
	//清空图片预览区域
	//var objIMG = document.getElementById("newPreview");
	//objIMG.outerHTML =objIMG.outerHTML;
	document.frames('ZPFRAME').location.reload();
}

