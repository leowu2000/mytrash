/**
 * 信息采集js
 * @param type
 * @return
 */
function per_Submit(type){
	var radioValue = getRadioValue("myradio");
	if(document.getElementById('GCNAME').value==""){
		alert("请选择工程名称！");
		return false;
	}
	if(radioValue==2){//工程险情
		if(document.getElementById('DAGTM').value==""){
			alert("请填写出险时间！");
			return false;
		}
		document.frm.BCMS.value=window("main1").document.getElementById("BCMS").value;//补充描述
		document.frm.QXFA.value=window("main1").document.getElementById("QXFA").value;//抢险方案
		document.frm.QXZYPB.value=window("main1").document.getElementById("JXZYPB").value;//抢险资源配备
		document.frm.JZJJG.value=window("main1").document.getElementById("JZJJG").value;//进展及结果
		document.frm.XQYYFX.value=window("main1").document.getElementById("XQYYFX").value;//险情原因分析
		document.frm.XQFZQS.value=window("main1").document.getElementById("XQFZQS").value;//险情发展趋势
		document.frm.KNYXFW.value=window("main1").document.getElementById("KNYXFW").value;//可能影响范围
		document.frm.QXSQX.value=window("main1").document.getElementById("QXSQX").value;//抢险时气象
		document.frm.WLSWQX.value=window("main1").document.getElementById("WLSWQS").value;//未来水文气象
		var val = document.frm.XQFLDM.value;
		if(val=="D004"||val=="D003"){
			document.frm.LKGTU.value=window("XQFLFRAME").document.getElementById("LKGTU").value;//漏水混清==D004==D003
		}
		if(val=="D006"||val=="D012"){
			document.frm.SLUPAG.value=window("XQFLFRAME").document.getElementById("SLUPAG").value;//滑坡面角度(度)==D006==D012
		}
		if(val=="D007"||val=="D009"||val=="D003"||val=="D004"){
			document.frm.TODFTDI.value=window("XQFLFRAME").document.getElementById("TODFTDI").value;//距堤脚距离(米)==D007==D009==D003==D004
		}
		if(val=="D011"||val=="D009"){
			document.frm.WDQ.value=window("XQFLFRAME").document.getElementById("WDQ").value;//河道流量(立方米/秒)==D011==D009
		}
		if(val=="D001"||val=="D015"){
			document.frm.DSSPN.value=window("XQFLFRAME").document.getElementById("DSSPN").value;//受灾人口(人)==D001==D015
			document.frm.INPN.value=window("XQFLFRAME").document.getElementById("INPN").value;//受伤人口(人)==D001==D015
			document.frm.DTHPN.value=window("XQFLFRAME").document.getElementById("DTHPN").value;//死亡人口(人)==D001==D015
			document.frm.WRHS.value=window("XQFLFRAME").document.getElementById("WRHS").value;//倒塌房屋(间)==D001==D015
			document.frm.CRPDSSAR.value=window("XQFLFRAME").document.getElementById("CRPDSSAR").value;//农作物受灾面积(公顷)==D001==D015
			document.frm.SCDMFMAR.value=window("XQFLFRAME").document.getElementById("SCDMFMAR").value;//毁坏耕地面积(公顷)==D001==D015
			document.frm.DRCECLS.value=window("XQFLFRAME").document.getElementById("DRCECLS").value;//直接经济损失(万元)==D001==D015
		}
		if(val=="D023"||val=="D024"){
			document.frm.WRAR.value=window("XQFLFRAME").document.getElementById("WRAR").value;//破坏面积(平方米)==D023==D024
		}
		if(val=="D001"){
			//D001//D001决口TB_BURDSC
			//alert(window("XQFLFRAME").document.getElementById("BURLDGL").value);
			document.frm.BUW.value=window("XQFLFRAME").document.getElementById("BUW").value;//决口宽度(米)
			document.frm.BUVL.value=window("XQFLFRAME").document.getElementById("BUVL").value;//决口流速(米/秒)
			document.frm.BUZDF.value=window("XQFLFRAME").document.getElementById("BUZDF").value;//决口水头差(米)
			document.frm.BUQ.value=window("XQFLFRAME").document.getElementById("BUQ").value;//决口流量(立方米/秒)
			document.frm.BURLDGL.value=window("XQFLFRAME").document.getElementById("BURLDGL").value;//决口处地形地质条件
		}
		if(val=="D002"){
			//D002//D002漫溢TB_OVFLDSC
			document.frm.OVFLL.value=window("XQFLFRAME").document.getElementById("OVFLL").value;//漫溢长度(米)
			document.frm.OVFLZ.value=window("XQFLFRAME").document.getElementById("OVFLZ").value;//漫溢水位(米)
			document.frm.DSQ.value=window("XQFLFRAME").document.getElementById("DSQ").value;//漫溢流量(立方米/秒)
		}
		if(val=="D003"){
			//D003//D003漏洞TB_LKDSC
			document.frm.LKDMT.value=window("XQFLFRAME").document.getElementById("LKDMT").value;//漏洞直径(米)
			document.frm.LKQ.value=window("XQFLFRAME").document.getElementById("LKQ").value;//漏洞流量(升/秒)
			document.frm.LKWTLH.value=window("XQFLFRAME").document.getElementById("LKWTLH").value;//漏洞水柱高(米)
			document.frm.LKSAR.value=window("XQFLFRAME").document.getElementById("LKSAR").value;//已形成漏洞群面积(平方米)
		}
		if(val=="D004"){
			//D004//D004管涌TB_PPDSC
			document.frm.PPQ.value=window("XQFLFRAME").document.getElementById("PPQ").value;//管涌流量(升/秒)
			document.frm.WTLH.value=window("XQFLFRAME").document.getElementById("WTLH").value;//水柱高(米)
			document.frm.PPSAR.value=window("XQFLFRAME").document.getElementById("PPSAR").value;//已形成管涌群面积(平方米)
		}
		if(val=="D005"){
			//D005//D005陷坑TB_PITDSC
			document.frm.SBDSP.value=window("XQFLFRAME").document.getElementById("SBDSP").value;//陷坑深度(米)
			document.frm.SBAR.value=window("XQFLFRAME").document.getElementById("SBAR").value;//陷坑面积(平方米)
		}
		if(val=="D006"){
			//D006//D006滑坡 TB_SLDSC
			document.frm.SLBU.value=window("XQFLFRAME").document.getElementById("SLBU").value;//滑坡体积(立方米)
		}
		if(val=="D007"){
			//D007//D007淘刷TB_UNDSC
			document.frm.UNDAR.value=window("XQFLFRAME").document.getElementById("UNDAR").value;//淘刷面积(平方米)
			document.frm.UNDD.value=window("XQFLFRAME").document.getElementById("UNDD").value;//淘刷深度(米)
			document.frm.UNDL.value=window("XQFLFRAME").document.getElementById("UNDL").value;//淘刷长度(米)
		}
		if(val=="D008"){
			//D008//D008裂缝TB_CRDSC
			document.frm.CRDR.value=window("XQFLFRAME").document.getElementById("CRDR").value;//裂缝方向
			document.frm.CRD.value=window("XQFLFRAME").document.getElementById("CRD").value;//裂缝深度(米)
			document.frm.CRL.value=window("XQFLFRAME").document.getElementById("CRL").value;//裂缝长度(米)
			document.frm.CRW.value=window("XQFLFRAME").document.getElementById("CRW").value;//裂缝宽度(厘米)
		}
		if(val=="D009"){
			//D009//D009崩岸TB_CVDSC
	
			document.frm.CVL.value=window("XQFLFRAME").document.getElementById("CVL").value;//崩塌长度(米)
			document.frm.CVBU.value=window("XQFLFRAME").document.getElementById("CVBU").value;//崩塌体积(立方米)
			document.frm.RVH.value=window("XQFLFRAME").document.getElementById("RVH").value;//河岸高度(米)
			document.frm.FLCNDSC.value=window("XQFLFRAME").document.getElementById("FLCNDSC").value;//水流情况描述
		}
		if(val=="D010"){
			//D010//D010渗水TB_SPDSC
			document.frm.SPAR.value=window("XQFLFRAME").document.getElementById("SPAR").value;//渗水面积(平方米)
			document.frm.SPQ.value=window("XQFLFRAME").document.getElementById("SPQ").value;//SPQ
		}
		if(val=="D011"){
			//D011//D011 浪坎 TB_BLBAD
			document.frm.BLH.value=window("XQFLFRAME").document.getElementById("BLH").value;//浪高(米)
			document.frm.WNS.value=window("XQFLFRAME").document.getElementById("WNS").value;//风速(级)
		}
		if(val=="D012"){
			//D012//D012滑动TB_SLUDSC
			document.frm.SLUDSP.value=window("XQFLFRAME").document.getElementById("SLUDSP").value;//滑动位移(米)
			document.frm.SLUTP.value=window("XQFLFRAME").document.getElementById("SLUTP").value;//滑动类型
			document.frm.SLUGLCN.value=window("XQFLFRAME").document.getElementById("SLUGLCN").value;//滑动面地质情况
		}
		if(val=="D013"){
			//D013//D013启闭失灵TB_HOMLFDSC
			document.frm.POWCUT.value=window("XQFLFRAME").document.getElementById("POWCUT").value;//停电
			document.frm.HOMLF.value=window("XQFLFRAME").document.getElementById("HOMLF").value;//启闭机失灵
			document.frm.GSDST.value=window("XQFLFRAME").document.getElementById("GSDST").value;//闸门井变形
			document.frm.MLFCN.value=window("XQFLFRAME").document.getElementById("MLFCN").value;//失灵时开启状况
		}
		if(val=="D014"){
			//D014//D014闸门破坏TB_GTWRDSC
			document.frm.WRDSC.value=window("XQFLFRAME").document.getElementById("WRDSC").value;//破坏形式
			document.frm.WRQ.value=window("XQFLFRAME").document.getElementById("WRQ").value;//失事时流量(立方米/秒)
		}
		if(val=="D015"){
			//D015//D015溃坝TB_BRDMDSC
			document.frm.BRDMW.value=window("XQFLFRAME").document.getElementById("BRDMW").value;//溃坝宽度(米)
			document.frm.PJPS.value=window("XQFLFRAME").document.getElementById("PJPS").value;//工程现状
			document.frm.BRZDMCDI.value=window("XQFLFRAME").document.getElementById("BRZDMCDI").value;//库水位距堤顶距离(米)
			document.frm.BRV.value=window("XQFLFRAME").document.getElementById("BRV").value;//溃坝时库容(万立方米)
			document.frm.BRDMQ.value=window("XQFLFRAME").document.getElementById("BRDMQ").value;//溃坝流量(立方米/秒)
			document.frm.BRDMLDGL.value=window("XQFLFRAME").document.getElementById("BRDMLDGL").value;//溃坝处地形、地质条件
		}
		if(val=="D016"){
			//D016//D016倾覆TB_OVTUDSC
			document.frm.OVTUDR.value=window("XQFLFRAME").document.getElementById("OVTUDR").value;//倾覆方向
			document.frm.OVTUAG.value=window("XQFLFRAME").document.getElementById("OVTUAG").value;//倾覆角度(度)
		}
		if(val=="D017"){
			//D017//D017应力过大TB_STREXDSC
			document.frm.MXTNST.value=window("XQFLFRAME").document.getElementById("MXTNST").value;//最大拉应力(牛/平方毫米)
			document.frm.MXCMST.value=window("XQFLFRAME").document.getElementById("MXCMST").value;//最大压应力(牛/平方毫米)
			document.frm.CONGR.value=window("XQFLFRAME").document.getElementById("CONGR").value;//混凝土标号
			document.frm.ASTR.value=window("XQFLFRAME").document.getElementById("ASTR").value;//允许应力值(牛/平方毫米)
		}
		if(val=="D018"){
			//D018//D018坍塌TB_SLIDSC
			document.frm.SLIAR.value=window("XQFLFRAME").document.getElementById("SLIAR").value;//坍塌面积(平方米)
			document.frm.SLIMS.value=window("XQFLFRAME").document.getElementById("SLIMS").value;//坍塌方量(立方米)
		}
		if(val=="D019"){
			//D019//D019堵塞TB_PLUDSC
			document.frm.PLTNM.value=window("XQFLFRAME").document.getElementById("PLTNM").value;//堵塞物名称
			document.frm.PLTBU.value=window("XQFLFRAME").document.getElementById("PLTBU").value;//堵塞物体积(立方米)
		}
		if(val=="D020"){
			//D020基础破坏TB_BSWRDSC
			document.frm.GRNSPDSC.value=window("XQFLFRAME").document.getElementById("GRNSPDSC").value;//基础渗漏描述
			document.frm.GRNUSB.value=window("XQFLFRAME").document.getElementById("GRNUSB").value;//据传不均匀沉降(米)
			document.frm.GROVCHWR.value=window("XQFLFRAME").document.getElementById("GROVCHWR").value;//基础超载破坏
		}
		if(val=="D021"){
			//D021消能工破坏TB_EDDWRDSC
			document.frm.APWR.value=window("XQFLFRAME").document.getElementById("APWR").value;//底板掀起
			document.frm.WSTWR.value=window("XQFLFRAME").document.getElementById("WSTWR").value;//止水破坏
		}
		if(val=="D022"){
			//D022//D022基础排水失效TB_BSWPLPDS
			document.frm.WPPLU.value=window("XQFLFRAME").document.getElementById("WPPLU").value;//排水孔堵塞
			document.frm.WPEQML.value=window("XQFLFRAME").document.getElementById("WPEQML").value;//排水设备失灵
		}
		if(val=="D023"){
			//D023//D023洞身破坏 TB_HBWRDSC
			document.frm.WRMS.value=window("XQFLFRAME").document.getElementById("WRMS").value;//破坏方量(立方米)
			document.frm.LNINF.value=window("XQFLFRAME").document.getElementById("LNINF").value;//对衬砌造成的影响
			document.frm.HBGLCN.value=window("XQFLFRAME").document.getElementById("HBGLCN").value;//洞身地质情况
		}
		if(val=="D024"){
			//D024//D024控导工程局部破坏TB_CLPJPRWR
			document.frm.WRD.value=window("XQFLFRAME").document.getElementById("WRD").value;//破坏深度(米)
			document.frm.WRL.value=window("XQFLFRAME").document.getElementById("WRL").value;//破坏长度(米)
			document.frm.WRGLCN.value=window("XQFLFRAME").document.getElementById("WRGLCN").value;//破坏处地质情况
		}
		if(val=="D025"){
			//D025//D025控导工程冲毁TB_CLPJSCDN
			document.frm.SCDMBU.value=window("XQFLFRAME").document.getElementById("SCDMBU").value;//冲毁体积(立方米)
			document.frm.SCDML.value=window("XQFLFRAME").document.getElementById("SCDML").value;//冲毁长度(米)
			document.frm.SCDMD.value=window("XQFLFRAME").document.getElementById("SCDMD").value;//冲毁深度(米)
			document.frm.SCDMGLCN.value=window("XQFLFRAME").document.getElementById("SCDMGLCN").value;//冲毁处地质情况
		}
		if(val=="D026"){
			//D026//D026山洪灾害TB_CLPJSCDN
			document.frm.DSSTP.value=window("XQFLFRAME").document.getElementById("DSSTP").value;//灾害类型
			document.frm.DSSAREA.value=window("XQFLFRAME").document.getElementById("DSSAREA").value;//受灾面积
			document.frm.DSSPN.value=window("XQFLFRAME").document.getElementById("DSSPN").value;//受灾人口
			document.frm.DTHPN.value=window("XQFLFRAME").document.getElementById("DTHPN").value;//死亡人数
			document.frm.WRHS.value=window("XQFLFRAME").document.getElementById("WRHS").value;//倒塌房屋
			document.frm.DRCECLS.value=window("XQFLFRAME").document.getElementById("DRCECLS").value;//经济损失
			document.frm.DAYDP.value=window("XQFLFRAME").document.getElementById("DAYDP").value;//日最大降雨量
			document.frm.TDP.value=window("XQFLFRAME").document.getElementById("TDP").value;//时段降雨量<
		}
		
	}else{//运行状态
		var val = document.frm.GCLB.value;
		var GCFLDM = document.frm.GCFLDM.value;
		document.frm.XQYC.value=window("main2").document.getElementById("XQYC").value;//险情预测
		document.frm.DFJZZK.value=window("main2").document.getElementById("DFJZZK").value;//堤防建筑状况
		document.frm.QT.value=window("main2").document.getElementById("QT").value;//其他
		if(val=="N"||val=="F"||val=="A"){
			document.frm.BKOT.value=window("main4").document.getElementById("BKOT").value;//所在岸别(左/右)
		}
		if(val=="A"||val=="B"){
			document.frm.RZ.value=window("main4").document.getElementById("RZ").value;		//<!-- 当前运行水位(米)========TB_RSR===TB_DKR -->
			document.frm.RQ.value=window("main4").document.getElementById("RQ").value;		//<!-- 当前泻量(立方米/秒)========TB_RSR===TB_DKR -->
			document.frm.BRBPPFCN.value=window("main3").document.getElementById("BRBPPFCN").value;	//<!-- 护坡护岸稳定情况========TB_RSR===TB_DKR -->
		}
		if(val=="B"||val=="K"){
			document.frm.EDDPFCN.value=window("main3").document.getElementById("EDDPFCN").value;	//<!-- 消能工完好状况==========TB_RSR===TB_WLR -->	
			document.frm.GTHOPFCN.value=window("main3").document.getElementById("GTHOPFCN").value;	//<!-- 闸门、启闭机完好状况====TB_RSR===TB_WLR -->	
			document.frm.COMMCN.value=window("main3").document.getElementById("COMMCN").value;	//<!-- 通讯手段及状况==========TB_RSR===TB_WLR -->
		}
		if(val=="F"){//蓄滞(行)洪区//BKOT
			document.frm.DSFLWZ.value=window("main4").document.getElementById("DSFLWZ").value;//	<!-- 设计行(蓄)洪水位(米) -->	
			document.frm.DSFLW.value=window("main4").document.getElementById("DSFLW").value;//	<!-- 设计行(蓄)洪量(万立方米) -->	
			document.frm.TRFCN.value=window("main3").document.getElementById("TRFCN").value;//	<!-- 交通状况 -->	
			document.frm.DKCN.value=window("main3").document.getElementById("DKCN").value;//		<!-- 圩堤状况 -->	
			document.frm.CWFCCN.value=window("main3").document.getElementById("CWFCCN").value;//	<!-- 通讯预警设施状况 -->	
			document.frm.SFSRCN.value=window("main3").document.getElementById("SFSRCN").value;//	<!-- 避水救生设施状况 -->	
			document.frm.FLFADSC.value=window("main3").document.getElementById("FLFADSC").value;//	<!-- 分洪设施状况 -->	
			document.frm.IDSTCN.value=window("main3").document.getElementById("IDSTCN").value;//	<!-- 排水站状况 -->
		}
		if(val=="B"){//水库 
			document.frm.RSCLS.value=window("main4").document.getElementById("RSCLS").value;	//<!-- 水库类别(良好/尚好/病险库) -->
			document.frm.RV.value=window("main4").document.getElementById("RV").value;		//<!-- 当前库容(万立方米) -->
			document.frm.DFPFCN.value=window("main3").document.getElementById("DFPFCN").value;	//<!-- 坝基完好状况 -->	
			document.frm.DBSTBCN.value=window("main3").document.getElementById("DBSTBCN").value;	//<!-- 坝体稳定情况 -->	
			document.frm.ESPFCN.value=window("main3").document.getElementById("ESPFCN").value;	//<!-- 泄水建筑物完好状况 -->	
		}
		if(val=="N"){
			document.frm.FLCNDSC.value=window("main3").document.getElementById("FLCNDSC").value;	//<!-- 水流情况描述 -->	
			document.frm.WDCNDSC.value=window("main3").document.getElementById("WDCNDSC").value;	//<!-- 河道情况描述 -->	
			document.frm.PRCCLR.value=window("main3").document.getElementById("PRCCLR").value;	//<!-- 清障的落实 -->	
			document.frm.SPURDSC.value=window("main3").document.getElementById("SPURDSC").value;	//<!-- 控导工程描述 -->	
			document.frm.BPPJCN.value=window("main3").document.getElementById("BPPJCN").value;	//<!-- 护岸工程情况 -->
		}
		if(val=="A"){
			document.frm.WSTODC.value=window("main4").document.getElementById("WSTODC").value;
			document.frm.DKGR.value=window("main4").document.getElementById("DKGR").value;//<!-- 堤防级别(1/2/3/4/5) -->
			document.frm.STECH.value=window("main4").document.getElementById("STECH").value;//<!-- 起止桩号 -->	
			document.frm.DKPFCN.value=window("main3").document.getElementById("DKPFCN").value;//<!-- 堤防完好状况 -->	
			document.frm.TSCN.value=window("main3").document.getElementById("TSCN").value;//<!-- 穿堤建筑物状况 -->
		}
		if(val=="K"){
			document.frm.WLGR.value = window("main4").document.getElementById("WLGR").value;//		<!-- 水闸等别(一/二/三/四/五) --> 
			document.frm.RUPGZ.value = window("main4").document.getElementById("RUPGZ").value;//	<!-- 当前闸上水位(米) -->	
			document.frm.RDWGZ.value = window("main4").document.getElementById("RDWGZ").value;//	<!-- 当前闸下水位(米) -->	
			document.frm.RQO.value = window("main4").document.getElementById("RQO").value;//		<!-- 当前过闸流量(立方米/秒) -->
			document.frm.RWSTOWLT.value = window("main4").document.getElementById("RWSTOWLT").value;//	<!-- 当前水面距闸顶距离(米) -->	
			document.frm.GFPFCN.value = window("main3").document.getElementById("GFPFCN").value;//	<!-- 坝基完好状况  -->	
			document.frm.STPFCN.value = window("main3").document.getElementById("STPFCN").value;//	<!-- 建筑物完好状况  -->
		}
		
	}
	if(document.frm.UpFile.value==""){
		document.frm.action="/buiness.do";
		document.getElementById('actionType').value=type;
		document.getElementById('SAVETYPES').value=radioValue;
		document.frm.submit();
	}else{
		if(confirm("您有未上传的多媒体信息，是否继续保存？")){
			document.frm.action="/buiness.do";
			document.getElementById('actionType').value=type;
			document.getElementById('SAVETYPES').value=radioValue;
			document.frm.submit();
		}
	}
}


function getGcmessage(id){
	var type = getRadioValue("myradio");
	xmlHttpReq.open("GET", "/FileUploadServlet?type=gqcj&saveType="+type+"&changeVal="+id, false);
	xmlHttpReq.send(null);
  	GCMESSAGE.innerHTML = xmlHttpReq.responseText;
  	
}

function getRadioValue(name){
	return document.getElementById('myradio').value;
}
function uplaodReportPhotos(tbname){
	var url;
	var gcmc = document.getElementById('GCNAME').value;
	if(gcmc==""){
		alert("请选择工程名称！");
		return false;
	}
	var type = document.getElementById('myradio').value;
	var check = document.frm.check.value;
	var zpbt = document.getElementById('TITLE').value;
	//var filepath = document.getElementById('UpFile').value;
	var filepath = document.getElementById("upFileValues").value;
	var zpms = document.getElementById('NRMS').value;
	var dncid = document.getElementById('DNCNO').value;
	var cjsj = document.getElementById('DTCDT').value;
	var detail;
	if(filepath==""){alert("请选择上传照片！");return false;}

	if(zpbt==""){
		alert("请填写照片标题.");
		return false;
	}
	if(type==2){
		if(document.getElementById('DNCNM').value==""){
			alert("请填写险情标题！");
			return false;
		} 
		alert("==come here==");
		url = "/FileUploadServlet?type=report&saveType="+type+"&filepath="+ filepath+"&cjsjvalue="+cjsj
				+"&zpbtvalue="+zpbt+"&zpmsvalue="+zpms+"&detailvalue="+detail+"&gclsh="+gcmc+"" +
				"&xqfldm="+document.getElementById('XQFLDM').value+"" +
				"&STTPCD="+document.getElementById('STTPCD').value+"" +
				"&xqbt="+document.getElementById('DNCNM').value+"" +
				"&WTDPCD="+document.getElementById('WTDPCD').value+
				"&DNCNO="+document.getElementById("DNCNO").value+
				"&delFlg="+check+"&tabname="+tbname;
		url = encodeURI(url);
		url = encodeURI(url);
		xmlHttpReq.open("get", url, false);
		xmlHttpReq.send(null);
		var result = xmlHttpReq.responseText;
	}
	else{
		url = "/FileUploadServlet?type=report&saveType="+type+"&tabname="+tbname
			+"&zpbtvalue="+zpbt+"&cjsjvalue="+cjsj+"&zpmsvalue="+zpms+"&filepath="+filepath
			+"&zpmsvalue="+zpms+"&detailvalue="+detail+"&DNCNO="+document.getElementById("DNCNO").value
			+"&delFlg="+check;
		url = encodeURI(url);
		url = encodeURI(url);
		xmlHttpReq.open("GET",url , false);
		xmlHttpReq.send(null);
		var result = xmlHttpReq.responseText;
	}
	document.frm.check.value="2";
	document.getElementById('NRMS').value="";
	document.getElementById('TITLE').value="";
	//清空file字段
	var obj = document.getElementById("UpFile");
	obj.outerHTML = obj.outerHTML;
	//清空图片预览区域
	//var objIMG = document.getElementById("newPreview");
	//objIMG.outerHTML =objIMG.outerHTML;
	document.frames('ZPFRAME').location.reload();
}
function viewThePic(picid,tablename,filePath){
	document.getElementById("PicServerUrl").value = filePath;

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
//		DTCDT.innerHTML=val[1];
		NRMS.innerHTML=val[2];
	}
}
