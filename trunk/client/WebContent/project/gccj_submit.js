function per_Submit(type){
	var radioValue = getRadioValue("myradio");
	if(document.getElementById('GCNAME').value==""){
		alert("请选择工程名称！");
		return false;
	}
	if(radioValue==2){//工程险情
		document.form1.BCMS.value=window("main1").document.getElementById("BCMS").value;//补充描述
		document.form1.QXFA.value=window("main1").document.getElementById("QXFA").value;//抢险方案
		document.form1.QXZYPB.value=window("main1").document.getElementById("JXZYPB").value;//抢险资源配备
		document.form1.JZJJG.value=window("main1").document.getElementById("JZJJG").value;//进展及结果
		document.form1.XQYYFX.value=window("main1").document.getElementById("XQYYFX").value;//险情原因分析
		document.form1.XQFZQS.value=window("main1").document.getElementById("XQFZQS").value;//险情发展趋势
		document.form1.KNYXFW.value=window("main1").document.getElementById("KNYXFW").value;//可能影响范围
		document.form1.QXSQX.value=window("main1").document.getElementById("QXSQX").value;//抢险时气象
		document.form1.WLSWQX.value=window("main1").document.getElementById("WLSWQS").value;//未来水文气象
		var val = document.form1.XQFLDM.value;
		if(val=="D004"||val=="D003"){
			document.form1.LKGTU.value=window("XQFLFRAME").document.getElementById("LKGTU").value;//漏水混清==D004==D003
		}
		if(val=="D006"||val=="D012"){
			document.form1.SLUPAG.value=window("XQFLFRAME").document.getElementById("SLUPAG").value;//滑坡面角度(度)==D006==D012
		}
		if(val=="D007"||val=="D009"||val=="D003"||val=="D004"){
			document.form1.TODFTDI.value=window("XQFLFRAME").document.getElementById("TODFTDI").value;//距堤脚距离(米)==D007==D009==D003==D004
		}
		if(val=="D011"||val=="D009"){
			document.form1.WDQ.value=window("XQFLFRAME").document.getElementById("WDQ").value;//河道流量(立方米/秒)==D011==D009
		}
		if(val=="D001"||val=="D015"){
			document.form1.DSSPN.value=window("XQFLFRAME").document.getElementById("DSSPN").value;//受灾人口(人)==D001==D015
			document.form1.INPN.value=window("XQFLFRAME").document.getElementById("INPN").value;//受伤人口(人)==D001==D015
			document.form1.DTHPN.value=window("XQFLFRAME").document.getElementById("DTHPN").value;//死亡人口(人)==D001==D015
			document.form1.WRHS.value=window("XQFLFRAME").document.getElementById("WRHS").value;//倒塌房屋(间)==D001==D015
			document.form1.CRPDSSAR.value=window("XQFLFRAME").document.getElementById("CRPDSSAR").value;//农作物受灾面积(公顷)==D001==D015
			document.form1.SCDMFMAR.value=window("XQFLFRAME").document.getElementById("SCDMFMAR").value;//毁坏耕地面积(公顷)==D001==D015
			document.form1.DRCECLS.value=window("XQFLFRAME").document.getElementById("DRCECLS").value;//直接经济损失(万元)==D001==D015
		}
		if(val=="D023"||val=="D024"){
			document.form1.WRAR.value=window("XQFLFRAME").document.getElementById("WRAR").value;//破坏面积(平方米)==D023==D024
		}
		if(val=="D001"){
			//D001//D001决口TB_BURDSC
			//alert(window("XQFLFRAME").document.getElementById("BURLDGL").value);
			document.form1.BUW.value=window("XQFLFRAME").document.getElementById("BUW").value;//决口宽度(米)
			document.form1.BUVL.value=window("XQFLFRAME").document.getElementById("BUVL").value;//决口流速(米/秒)
			document.form1.BUZDF.value=window("XQFLFRAME").document.getElementById("BUZDF").value;//决口水头差(米)
			document.form1.BUQ.value=window("XQFLFRAME").document.getElementById("BUQ").value;//决口流量(立方米/秒)
			document.form1.BURLDGL.value=window("XQFLFRAME").document.getElementById("BURLDGL").value;//决口处地形地质条件
		}
		if(val=="D002"){
			//D002//D002漫溢TB_OVFLDSC
			document.form1.OVFLL.value=window("XQFLFRAME").document.getElementById("OVFLL").value;//漫溢长度(米)
			document.form1.OVFLZ.value=window("XQFLFRAME").document.getElementById("OVFLZ").value;//漫溢水位(米)
			document.form1.DSQ.value=window("XQFLFRAME").document.getElementById("DSQ").value;//漫溢流量(立方米/秒)
		}
		if(val=="D003"){
			//D003//D003漏洞TB_LKDSC
			document.form1.LKDMT.value=window("XQFLFRAME").document.getElementById("LKDMT").value;//漏洞直径(米)
			document.form1.LKQ.value=window("XQFLFRAME").document.getElementById("LKQ").value;//漏洞流量(升/秒)
			document.form1.LKWTLH.value=window("XQFLFRAME").document.getElementById("LKWTLH").value;//漏洞水柱高(米)
			document.form1.LKSAR.value=window("XQFLFRAME").document.getElementById("LKSAR").value;//已形成漏洞群面积(平方米)
		}
		if(val=="D004"){
			//D004//D004管涌TB_PPDSC
			document.form1.PPQ.value=window("XQFLFRAME").document.getElementById("PPQ").value;//管涌流量(升/秒)
			document.form1.WTLH.value=window("XQFLFRAME").document.getElementById("WTLH").value;//水柱高(米)
			document.form1.PPSAR.value=window("XQFLFRAME").document.getElementById("PPSAR").value;//已形成管涌群面积(平方米)
		}
		if(val=="D005"){
			//D005//D005陷坑TB_PITDSC
			document.form1.SBDSP.value=window("XQFLFRAME").document.getElementById("SBDSP").value;//陷坑深度(米)
			document.form1.SBAR.value=window("XQFLFRAME").document.getElementById("SBAR").value;//陷坑面积(平方米)
		}
		if(val=="D006"){
			//D006//D006滑坡 TB_SLDSC
			document.form1.SLBU.value=window("XQFLFRAME").document.getElementById("SLBU").value;//滑坡体积(立方米)
		}
		if(val=="D007"){
			//D007//D007淘刷TB_UNDSC
			document.form1.UNDAR.value=window("XQFLFRAME").document.getElementById("UNDAR").value;//淘刷面积(平方米)
			document.form1.UNDD.value=window("XQFLFRAME").document.getElementById("UNDD").value;//淘刷深度(米)
			document.form1.UNDL.value=window("XQFLFRAME").document.getElementById("UNDL").value;//淘刷长度(米)
		}
		if(val=="D008"){
			//D008//D008裂缝TB_CRDSC
			document.form1.CRDR.value=window("XQFLFRAME").document.getElementById("CRDR").value;//裂缝方向
			document.form1.CRD.value=window("XQFLFRAME").document.getElementById("CRD").value;//裂缝深度(米)
			document.form1.CRL.value=window("XQFLFRAME").document.getElementById("CRL").value;//裂缝长度(米)
			document.form1.CRW.value=window("XQFLFRAME").document.getElementById("CRW").value;//裂缝宽度(厘米)
		}
		if(val=="D009"){
			//D009//D009崩岸TB_CVDSC
	
			document.form1.CVL.value=window("XQFLFRAME").document.getElementById("CVL").value;//崩塌长度(米)
			document.form1.CVBU.value=window("XQFLFRAME").document.getElementById("CVBU").value;//崩塌体积(立方米)
			document.form1.RVH.value=window("XQFLFRAME").document.getElementById("RVH").value;//河岸高度(米)
			document.form1.FLCNDSC.value=window("XQFLFRAME").document.getElementById("FLCNDSC").value;//水流情况描述
		}
		if(val=="D010"){
			//D010//D010渗水TB_SPDSC
			document.form1.SPAR.value=window("XQFLFRAME").document.getElementById("SPAR").value;//渗水面积(平方米)
			document.form1.SPQ.value=window("XQFLFRAME").document.getElementById("SPQ").value;//SPQ
		}
		if(val=="D011"){
			//D011//D011 浪坎 TB_BLBAD
			document.form1.BLH.value=window("XQFLFRAME").document.getElementById("BLH").value;//浪高(米)
			document.form1.WNS.value=window("XQFLFRAME").document.getElementById("WNS").value;//风速(级)
		}
		if(val=="D012"){
			//D012//D012滑动TB_SLUDSC
			document.form1.SLUDSP.value=window("XQFLFRAME").document.getElementById("SLUDSP").value;//滑动位移(米)
			document.form1.SLUTP.value=window("XQFLFRAME").document.getElementById("SLUTP").value;//滑动类型
			document.form1.SLUGLCN.value=window("XQFLFRAME").document.getElementById("SLUGLCN").value;//滑动面地质情况
		}
		if(val=="D013"){
			//D013//D013启闭失灵TB_HOMLFDSC
			document.form1.POWCUT.value=window("XQFLFRAME").document.getElementById("POWCUT").value;//停电
			document.form1.HOMLF.value=window("XQFLFRAME").document.getElementById("HOMLF").value;//启闭机失灵
			document.form1.GSDST.value=window("XQFLFRAME").document.getElementById("GSDST").value;//闸门井变形
			document.form1.MLFCN.value=window("XQFLFRAME").document.getElementById("MLFCN").value;//失灵时开启状况
		}
		if(val=="D014"){
			//D014//D014闸门破坏TB_GTWRDSC
			document.form1.WRDSC.value=window("XQFLFRAME").document.getElementById("WRDSC").value;//破坏形式
			document.form1.WRQ.value=window("XQFLFRAME").document.getElementById("WRQ").value;//失事时流量(立方米/秒)
		}
		if(val=="D015"){
			//D015//D015溃坝TB_BRDMDSC
			document.form1.BRDMW.value=window("XQFLFRAME").document.getElementById("BRDMW").value;//溃坝宽度(米)
			document.form1.PJPS.value=window("XQFLFRAME").document.getElementById("PJPS").value;//工程现状
			document.form1.BRZDMCDI.value=window("XQFLFRAME").document.getElementById("BRZDMCDI").value;//库水位距堤顶距离(米)
			document.form1.BRV.value=window("XQFLFRAME").document.getElementById("BRV").value;//溃坝时库容(万立方米)
			document.form1.BRDMQ.value=window("XQFLFRAME").document.getElementById("BRDMQ").value;//溃坝流量(立方米/秒)
			document.form1.BRDMLDGL.value=window("XQFLFRAME").document.getElementById("BRDMLDGL").value;//溃坝处地形、地质条件
		}
		if(val=="D016"){
			//D016//D016倾覆TB_OVTUDSC
			document.form1.OVTUDR.value=window("XQFLFRAME").document.getElementById("OVTUDR").value;//倾覆方向
			document.form1.OVTUAG.value=window("XQFLFRAME").document.getElementById("OVTUAG").value;//倾覆角度(度)
		}
		if(val=="D017"){
			//D017//D017应力过大TB_STREXDSC
			document.form1.MXTNST.value=window("XQFLFRAME").document.getElementById("MXTNST").value;//最大拉应力(牛/平方毫米)
			document.form1.MXCMST.value=window("XQFLFRAME").document.getElementById("MXCMST").value;//最大压应力(牛/平方毫米)
			document.form1.CONGR.value=window("XQFLFRAME").document.getElementById("CONGR").value;//混凝土标号
			document.form1.ASTR.value=window("XQFLFRAME").document.getElementById("ASTR").value;//允许应力值(牛/平方毫米)
		}
		if(val=="D018"){
			//D018//D018坍塌TB_SLIDSC
			document.form1.SLIAR.value=window("XQFLFRAME").document.getElementById("SLIAR").value;//坍塌面积(平方米)
			document.form1.SLIMS.value=window("XQFLFRAME").document.getElementById("SLIMS").value;//坍塌方量(立方米)
		}
		if(val=="D019"){
			//D019//D019堵塞TB_PLUDSC
			document.form1.PLTNM.value=window("XQFLFRAME").document.getElementById("PLTNM").value;//堵塞物名称
			document.form1.PLTBU.value=window("XQFLFRAME").document.getElementById("PLTBU").value;//堵塞物体积(立方米)
		}
		if(val=="D020"){
			//D020基础破坏TB_BSWRDSC
			document.form1.GRNSPDSC.value=window("XQFLFRAME").document.getElementById("GRNSPDSC").value;//基础渗漏描述
			document.form1.GRNUSB.value=window("XQFLFRAME").document.getElementById("GRNUSB").value;//据传不均匀沉降(米)
			document.form1.GROVCHWR.value=window("XQFLFRAME").document.getElementById("GROVCHWR").value;//基础超载破坏
		}
		if(val=="D021"){
			//D021消能工破坏TB_EDDWRDSC
			document.form1.APWR.value=window("XQFLFRAME").document.getElementById("APWR").value;//底板掀起
			document.form1.WSTWR.value=window("XQFLFRAME").document.getElementById("WSTWR").value;//止水破坏
		}
		if(val=="D022"){
			//D022//D022基础排水失效TB_BSWPLPDS
			document.form1.WPPLU.value=window("XQFLFRAME").document.getElementById("WPPLU").value;//排水孔堵塞
			document.form1.WPEQML.value=window("XQFLFRAME").document.getElementById("WPEQML").value;//排水设备失灵
		}
		if(val=="D023"){
			//D023//D023洞身破坏 TB_HBWRDSC
			document.form1.WRMS.value=window("XQFLFRAME").document.getElementById("WRMS").value;//破坏方量(立方米)
			document.form1.LNINF.value=window("XQFLFRAME").document.getElementById("LNINF").value;//对衬砌造成的影响
			document.form1.HBGLCN.value=window("XQFLFRAME").document.getElementById("HBGLCN").value;//洞身地质情况
		}
		if(val=="D024"){
			//D024//D024控导工程局部破坏TB_CLPJPRWR
			document.form1.WRD.value=window("XQFLFRAME").document.getElementById("WRD").value;//破坏深度(米)
			document.form1.WRL.value=window("XQFLFRAME").document.getElementById("WRL").value;//破坏长度(米)
			document.form1.WRGLCN.value=window("XQFLFRAME").document.getElementById("WRGLCN").value;//破坏处地质情况
		}
		if(val=="D025"){
			//D025//D025控导工程冲毁TB_CLPJSCDN
			document.form1.SCDMBU.value=window("XQFLFRAME").document.getElementById("SCDMBU").value;//冲毁体积(立方米)
			document.form1.SCDML.value=window("XQFLFRAME").document.getElementById("SCDML").value;//冲毁长度(米)
			document.form1.SCDMD.value=window("XQFLFRAME").document.getElementById("SCDMD").value;//冲毁深度(米)
			document.form1.SCDMGLCN.value=window("XQFLFRAME").document.getElementById("SCDMGLCN").value;//冲毁处地质情况
		}
		
	}else{//运行状态XQFLFRAME
		if(document.form1.RZ.value==""){
			alert("请填写当前运行水位");
			return false;
		}
		if(document.form1.RV.value==""){
			alert("请填写当前库容");
			return false;
		}
		if(document.form1.RQ.value==""){
			alert("请填写当前泻量");
			return false;
		}
		document.form1.XQYC.value=window("main2").document.getElementById("XQYC").value;//险情预测
		document.form1.DFJZZK.value=window("main2").document.getElementById("DFJZZK").value;//堤防建筑状况
		document.form1.QT.value=window("main2").document.getElementById("QT").value;//其他
		document.form1.BJWHZK.value=window("main3").document.getElementById("BJWHZK").value;//坝基完好状况
		document.form1.BTWDZK.value=window("main3").document.getElementById("BTWDZK").value;//坝体稳定状况
		document.form1.HPHAWDQK.value=window("main3").document.getElementById("HPHAWDQK").value;//护坡护岸稳定情况
		document.form1.TXSDJZK.value=window("main3").document.getElementById("TXSDJZK").value;//通讯手段及状况
		document.form1.XSJZWZK.value=window("main3").document.getElementById("XSJZWZK").value;//泄水建筑物状况
		document.form1.XNGWHZK.value=window("main3").document.getElementById("XNGWHZK").value;//泄能工完好状况
		document.form1.ZMQBJZK.value=window("main3").document.getElementById("ZMQBJZK").value;//闸门、起闭机状况
	}
	document.form1.action="/buiness.do";
	document.getElementById('actionType').value=type;
	document.getElementById('SAVETYPES').value=radioValue;
	document.form1.submit();
}

//图片预览区域代码
function PreviewImg(imgFile) 
{ 
	var filedir = document.getElementById('UpFile').value;
	if(filedir!=""){
		var poi = filedir.lastIndexOf(".");
		var detail = filedir.substring(poi+1,filedir.length).toUpperCase();
		if(detail!="JPG" && detail!="MPG"){
			alert("不支持的文件格式，请选择jpg图片文件，或者mpg多媒体文件！");
			return false;
		}
	}
	//新的预览代码，支持 IE6、IE7。 
	var newPreview = document.getElementById("newPreview"); 
	//newPreview.style.filter="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgFile.value; 
	newPreview.style.width = "150px"; 
	newPreview.style.height = "100px"; 
	newPreview.style.border= "6px double #ccc";
}
function showDetail(){
	var gcmc = document.getElementById('GCNAME').value;
	if(gcmc==""){
		alert("请选择工程名称！");
		return false;
	}
	var radioValue = getRadioValue("myradio");
	if(radioValue==2){
		var xqbt = document.getElementById('DNCNM').value;
		if(xqbt==""){
			alert("请填写险情标题！");
			return false;
		}
	}
	if(radioValue==1){
		GCXQ.style.display="none";
		YXZT.style.display="inline";
		window.frames["main2"].location.href="yxztLoader.jsp";	
		window.frames["main3"].location.href="skLoader.jsp";
				
	}else{
		var jspname = document.getElementById('XQFLDM').value;
		YXZT.style.display="none";
		GCXQ.style.display="inline";
		window.frames["XQFLFRAME"].location.href=jspname+".jsp";
		window.frames["main1"].location.href="gcxqLoader.jsp";	
	}
}
function getGcmessage(id){
	var type = getRadioValue("myradio");
	if(window.XMLHttpRequest){ //Mozilla
    	var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	xmlHttpReq.open("GET", "/FileUploadServlet?type=gqcj&saveType="+type+"&changeVal="+id, false);
	xmlHttpReq.send(null);
  	GCMESSAGE.innerHTML = xmlHttpReq.responseText;
  	
}
function chkCheckBoxChs(obj){
	if (obj.value=="2")
	{
		document.getElementById('XQFL').disabled=false;
		document.getElementById('XQBT').disabled=false;
		document.getElementById('CXBW').disabled=false;
		DATEDESC.innerHTML="出险时间[T]";
		return false;
	}
	else
	{
		document.getElementById('XQFL').disabled=true; 
		document.getElementById('XQBT').value="";
		document.getElementById('XQBT').disabled=true;
		document.getElementById('CXBW').value="";
		document.getElementById('CXBW').disabled=true;
		DATEDESC.innerHTML="采集时间[T]";
		return false;
	}
}
function getRadioValue(name){
	return document.getElementById('myradio').value;
}
function uploadPhotos(){
	var gcmc = document.getElementById('GCNAME').value;
	if(gcmc==""){
		alert("请选择工程名称！");
		return false;
	}
	//if(confirm("增加图片信息后，险情基本信息,将不能更改，请确认工程名称\n险情类别等,点击确定直接保存，点击取消修改工程名称")){
		var gcbh = document.getElementById('GCNAME').value;

		var type = document.getElementById('myradio').value;
		
		var zpbt = document.getElementById('ZPBT').value;
		var zpms = document.getElementById('ZPMS').value;
		var cjsj = document.getElementById('DAGTM').value;
		var filedir = document.getElementById('UpFile').value;
		var tname = document.getElementById('tabname').value;
		var filedetail;
		if(filedir==""){alert("请选择上传照片！");return false;}
		if(filedir!=""){
			var poi = filedir.lastIndexOf(".");
			detail = filedir.substring(poi+1,filedir.length).toUpperCase();
			if(detail!="JPG" && detail!="MPG" ){
				alert("不支持的文件格式，请重新选择！");
				return false;
			}
		}
		if(zpbt==""){alert("请填写照片标题！");return false;}
		if(cjsj==""){alert("请填写采集时间！");return false;}
		if(zpms==""){alert("请填写照片描述！");return false;}
		var check = document.getElementById('PICLIST').innerHTML;
		if(check=="")delFlg=1;else delFlg=2;//保存照片的时候是否首先执行删除操作的标志位
		if(type==2){
			if(document.getElementById('DNCNM').value==""){
				alert("请填写险情标题！");
				return false;
			} 
			if(window.XMLHttpRequest){ //Mozilla
				var xmlHttpReq=new XMLHttpRequest();
			}else if(window.ActiveXObject){
				var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
			}
			xmlHttpReq.open("GET", "/FileUploadServlet?type=report&saveType="+type+"&filepath="+filedir+"&cjsjvalue="+cjsj
					+"&zpbtvalue="+zpbt+"&zpmsvalue="+zpms+"&detailvalue="+detail+"&gclsh="+gcbh+"" +
							"&xqfldm="+document.getElementById('XQFLDM').value+"" +
							"&STTPCD="+document.getElementById('STTPCD').value+"" +
							"&xqbt="+document.getElementById('DNCNM').value+"" +
							"&WTDPCD="+document.getElementById('WTDPCD').value+
							"&DNCNO="+document.getElementById("DNCNO").value+
							"&delFlg="+delFlg+"&tabname="+tname, false);
			xmlHttpReq.send(null);
			var result = xmlHttpReq.responseText;
			PICLIST.innerHTML=result;
			document.getElementById('UpFile').value="";
			document.getElementById('ZPMS').value="";
			document.getElementById('ZPBT').value="";
		}
		else{
			if(window.XMLHttpRequest){ //Mozilla
				var xmlHttpReq=new XMLHttpRequest();
			}else if(window.ActiveXObject){
				var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
			}
			xmlHttpReq.open("GET", "/FileUploadServlet?type=report&saveType="+type+"&filepath="+filedir+"&cjsjvalue="+cjsj
					+"&zpbtvalue="+zpbt+"&zpmsvalue="+zpms+"&detailvalue="+detail+"&DNCNO="+document.getElementById("DNCNO").value
					+"&delFlg="+delFlg+"&tabname="+tname, false);
			xmlHttpReq.send(null);
			var result = xmlHttpReq.responseText;
			PICLIST.innerHTML=result;
			document.getElementById('ZPMS').value="";
			document.getElementById('ZPBT').value="";
			document.getElementById('UpFile').value="";
		}
}

function deletePIC(picid){
	var gcbh = document.getElementById('GCNAME').value;
	var DNCNO = document.getElementById('DNCNO').value;
	var tablename = document.getElementById('tabname').value;
	var type = getRadioValue("myradio");
	if(confirm("删除后不能恢复，是否继续？")){
		if(window.XMLHttpRequest){ //Mozilla
			var xmlHttpReq=new XMLHttpRequest();
		}else if(window.ActiveXObject){
			var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
		}
		xmlHttpReq.open("GET", "/FileUploadServlet?type=del&saveType="+type
				+"&picid="+picid+"&DNCNO="+DNCNO+"&tabname="+tablename, false);
		xmlHttpReq.send(null);
		var result = xmlHttpReq.responseText;
		PICLIST.innerHTML=result;
	}
}
