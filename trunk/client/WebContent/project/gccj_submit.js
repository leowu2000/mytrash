function per_Submit(type){
	var radioValue = getRadioValue("myradio");
	if(document.getElementById('GCNAME').value==""){
		alert("��ѡ�񹤳����ƣ�");
		return false;
	}
	if(radioValue==2){//��������
		document.form1.BCMS.value=window("main1").document.getElementById("BCMS").value;//��������
		document.form1.QXFA.value=window("main1").document.getElementById("QXFA").value;//���շ���
		document.form1.QXZYPB.value=window("main1").document.getElementById("JXZYPB").value;//������Դ�䱸
		document.form1.JZJJG.value=window("main1").document.getElementById("JZJJG").value;//��չ�����
		document.form1.XQYYFX.value=window("main1").document.getElementById("XQYYFX").value;//����ԭ�����
		document.form1.XQFZQS.value=window("main1").document.getElementById("XQFZQS").value;//���鷢չ����
		document.form1.KNYXFW.value=window("main1").document.getElementById("KNYXFW").value;//����Ӱ�췶Χ
		document.form1.QXSQX.value=window("main1").document.getElementById("QXSQX").value;//����ʱ����
		document.form1.WLSWQX.value=window("main1").document.getElementById("WLSWQS").value;//δ��ˮ������
		var val = document.form1.XQFLDM.value;
		if(val=="D004"||val=="D003"){
			document.form1.LKGTU.value=window("XQFLFRAME").document.getElementById("LKGTU").value;//©ˮ����==D004==D003
		}
		if(val=="D006"||val=="D012"){
			document.form1.SLUPAG.value=window("XQFLFRAME").document.getElementById("SLUPAG").value;//������Ƕ�(��)==D006==D012
		}
		if(val=="D007"||val=="D009"||val=="D003"||val=="D004"){
			document.form1.TODFTDI.value=window("XQFLFRAME").document.getElementById("TODFTDI").value;//��̽ž���(��)==D007==D009==D003==D004
		}
		if(val=="D011"||val=="D009"){
			document.form1.WDQ.value=window("XQFLFRAME").document.getElementById("WDQ").value;//�ӵ�����(������/��)==D011==D009
		}
		if(val=="D001"||val=="D015"){
			document.form1.DSSPN.value=window("XQFLFRAME").document.getElementById("DSSPN").value;//�����˿�(��)==D001==D015
			document.form1.INPN.value=window("XQFLFRAME").document.getElementById("INPN").value;//�����˿�(��)==D001==D015
			document.form1.DTHPN.value=window("XQFLFRAME").document.getElementById("DTHPN").value;//�����˿�(��)==D001==D015
			document.form1.WRHS.value=window("XQFLFRAME").document.getElementById("WRHS").value;//��������(��)==D001==D015
			document.form1.CRPDSSAR.value=window("XQFLFRAME").document.getElementById("CRPDSSAR").value;//ũ�����������(����)==D001==D015
			document.form1.SCDMFMAR.value=window("XQFLFRAME").document.getElementById("SCDMFMAR").value;//�ٻ��������(����)==D001==D015
			document.form1.DRCECLS.value=window("XQFLFRAME").document.getElementById("DRCECLS").value;//ֱ�Ӿ�����ʧ(��Ԫ)==D001==D015
		}
		if(val=="D023"||val=="D024"){
			document.form1.WRAR.value=window("XQFLFRAME").document.getElementById("WRAR").value;//�ƻ����(ƽ����)==D023==D024
		}
		if(val=="D001"){
			//D001//D001����TB_BURDSC
			//alert(window("XQFLFRAME").document.getElementById("BURLDGL").value);
			document.form1.BUW.value=window("XQFLFRAME").document.getElementById("BUW").value;//���ڿ��(��)
			document.form1.BUVL.value=window("XQFLFRAME").document.getElementById("BUVL").value;//��������(��/��)
			document.form1.BUZDF.value=window("XQFLFRAME").document.getElementById("BUZDF").value;//����ˮͷ��(��)
			document.form1.BUQ.value=window("XQFLFRAME").document.getElementById("BUQ").value;//��������(������/��)
			document.form1.BURLDGL.value=window("XQFLFRAME").document.getElementById("BURLDGL").value;//���ڴ����ε�������
		}
		if(val=="D002"){
			//D002//D002����TB_OVFLDSC
			document.form1.OVFLL.value=window("XQFLFRAME").document.getElementById("OVFLL").value;//���糤��(��)
			document.form1.OVFLZ.value=window("XQFLFRAME").document.getElementById("OVFLZ").value;//����ˮλ(��)
			document.form1.DSQ.value=window("XQFLFRAME").document.getElementById("DSQ").value;//��������(������/��)
		}
		if(val=="D003"){
			//D003//D003©��TB_LKDSC
			document.form1.LKDMT.value=window("XQFLFRAME").document.getElementById("LKDMT").value;//©��ֱ��(��)
			document.form1.LKQ.value=window("XQFLFRAME").document.getElementById("LKQ").value;//©������(��/��)
			document.form1.LKWTLH.value=window("XQFLFRAME").document.getElementById("LKWTLH").value;//©��ˮ����(��)
			document.form1.LKSAR.value=window("XQFLFRAME").document.getElementById("LKSAR").value;//���γ�©��Ⱥ���(ƽ����)
		}
		if(val=="D004"){
			//D004//D004��ӿTB_PPDSC
			document.form1.PPQ.value=window("XQFLFRAME").document.getElementById("PPQ").value;//��ӿ����(��/��)
			document.form1.WTLH.value=window("XQFLFRAME").document.getElementById("WTLH").value;//ˮ����(��)
			document.form1.PPSAR.value=window("XQFLFRAME").document.getElementById("PPSAR").value;//���γɹ�ӿȺ���(ƽ����)
		}
		if(val=="D005"){
			//D005//D005�ݿ�TB_PITDSC
			document.form1.SBDSP.value=window("XQFLFRAME").document.getElementById("SBDSP").value;//�ݿ����(��)
			document.form1.SBAR.value=window("XQFLFRAME").document.getElementById("SBAR").value;//�ݿ����(ƽ����)
		}
		if(val=="D006"){
			//D006//D006���� TB_SLDSC
			document.form1.SLBU.value=window("XQFLFRAME").document.getElementById("SLBU").value;//�������(������)
		}
		if(val=="D007"){
			//D007//D007��ˢTB_UNDSC
			document.form1.UNDAR.value=window("XQFLFRAME").document.getElementById("UNDAR").value;//��ˢ���(ƽ����)
			document.form1.UNDD.value=window("XQFLFRAME").document.getElementById("UNDD").value;//��ˢ���(��)
			document.form1.UNDL.value=window("XQFLFRAME").document.getElementById("UNDL").value;//��ˢ����(��)
		}
		if(val=="D008"){
			//D008//D008�ѷ�TB_CRDSC
			document.form1.CRDR.value=window("XQFLFRAME").document.getElementById("CRDR").value;//�ѷ췽��
			document.form1.CRD.value=window("XQFLFRAME").document.getElementById("CRD").value;//�ѷ����(��)
			document.form1.CRL.value=window("XQFLFRAME").document.getElementById("CRL").value;//�ѷ쳤��(��)
			document.form1.CRW.value=window("XQFLFRAME").document.getElementById("CRW").value;//�ѷ���(����)
		}
		if(val=="D009"){
			//D009//D009����TB_CVDSC
	
			document.form1.CVL.value=window("XQFLFRAME").document.getElementById("CVL").value;//��������(��)
			document.form1.CVBU.value=window("XQFLFRAME").document.getElementById("CVBU").value;//�������(������)
			document.form1.RVH.value=window("XQFLFRAME").document.getElementById("RVH").value;//�Ӱ��߶�(��)
			document.form1.FLCNDSC.value=window("XQFLFRAME").document.getElementById("FLCNDSC").value;//ˮ���������
		}
		if(val=="D010"){
			//D010//D010��ˮTB_SPDSC
			document.form1.SPAR.value=window("XQFLFRAME").document.getElementById("SPAR").value;//��ˮ���(ƽ����)
			document.form1.SPQ.value=window("XQFLFRAME").document.getElementById("SPQ").value;//SPQ
		}
		if(val=="D011"){
			//D011//D011 �˿� TB_BLBAD
			document.form1.BLH.value=window("XQFLFRAME").document.getElementById("BLH").value;//�˸�(��)
			document.form1.WNS.value=window("XQFLFRAME").document.getElementById("WNS").value;//����(��)
		}
		if(val=="D012"){
			//D012//D012����TB_SLUDSC
			document.form1.SLUDSP.value=window("XQFLFRAME").document.getElementById("SLUDSP").value;//����λ��(��)
			document.form1.SLUTP.value=window("XQFLFRAME").document.getElementById("SLUTP").value;//��������
			document.form1.SLUGLCN.value=window("XQFLFRAME").document.getElementById("SLUGLCN").value;//������������
		}
		if(val=="D013"){
			//D013//D013����ʧ��TB_HOMLFDSC
			document.form1.POWCUT.value=window("XQFLFRAME").document.getElementById("POWCUT").value;//ͣ��
			document.form1.HOMLF.value=window("XQFLFRAME").document.getElementById("HOMLF").value;//���ջ�ʧ��
			document.form1.GSDST.value=window("XQFLFRAME").document.getElementById("GSDST").value;//բ�ž�����
			document.form1.MLFCN.value=window("XQFLFRAME").document.getElementById("MLFCN").value;//ʧ��ʱ����״��
		}
		if(val=="D014"){
			//D014//D014բ���ƻ�TB_GTWRDSC
			document.form1.WRDSC.value=window("XQFLFRAME").document.getElementById("WRDSC").value;//�ƻ���ʽ
			document.form1.WRQ.value=window("XQFLFRAME").document.getElementById("WRQ").value;//ʧ��ʱ����(������/��)
		}
		if(val=="D015"){
			//D015//D015����TB_BRDMDSC
			document.form1.BRDMW.value=window("XQFLFRAME").document.getElementById("BRDMW").value;//���ӿ��(��)
			document.form1.PJPS.value=window("XQFLFRAME").document.getElementById("PJPS").value;//������״
			document.form1.BRZDMCDI.value=window("XQFLFRAME").document.getElementById("BRZDMCDI").value;//��ˮλ��̶�����(��)
			document.form1.BRV.value=window("XQFLFRAME").document.getElementById("BRV").value;//����ʱ����(��������)
			document.form1.BRDMQ.value=window("XQFLFRAME").document.getElementById("BRDMQ").value;//��������(������/��)
			document.form1.BRDMLDGL.value=window("XQFLFRAME").document.getElementById("BRDMLDGL").value;//���Ӵ����Ρ���������
		}
		if(val=="D016"){
			//D016//D016�㸲TB_OVTUDSC
			document.form1.OVTUDR.value=window("XQFLFRAME").document.getElementById("OVTUDR").value;//�㸲����
			document.form1.OVTUAG.value=window("XQFLFRAME").document.getElementById("OVTUAG").value;//�㸲�Ƕ�(��)
		}
		if(val=="D017"){
			//D017//D017Ӧ������TB_STREXDSC
			document.form1.MXTNST.value=window("XQFLFRAME").document.getElementById("MXTNST").value;//�����Ӧ��(ţ/ƽ������)
			document.form1.MXCMST.value=window("XQFLFRAME").document.getElementById("MXCMST").value;//���ѹӦ��(ţ/ƽ������)
			document.form1.CONGR.value=window("XQFLFRAME").document.getElementById("CONGR").value;//���������
			document.form1.ASTR.value=window("XQFLFRAME").document.getElementById("ASTR").value;//����Ӧ��ֵ(ţ/ƽ������)
		}
		if(val=="D018"){
			//D018//D018̮��TB_SLIDSC
			document.form1.SLIAR.value=window("XQFLFRAME").document.getElementById("SLIAR").value;//̮�����(ƽ����)
			document.form1.SLIMS.value=window("XQFLFRAME").document.getElementById("SLIMS").value;//̮������(������)
		}
		if(val=="D019"){
			//D019//D019����TB_PLUDSC
			document.form1.PLTNM.value=window("XQFLFRAME").document.getElementById("PLTNM").value;//����������
			document.form1.PLTBU.value=window("XQFLFRAME").document.getElementById("PLTBU").value;//���������(������)
		}
		if(val=="D020"){
			//D020�����ƻ�TB_BSWRDSC
			document.form1.GRNSPDSC.value=window("XQFLFRAME").document.getElementById("GRNSPDSC").value;//������©����
			document.form1.GRNUSB.value=window("XQFLFRAME").document.getElementById("GRNUSB").value;//�ݴ������ȳ���(��)
			document.form1.GROVCHWR.value=window("XQFLFRAME").document.getElementById("GROVCHWR").value;//���������ƻ�
		}
		if(val=="D021"){
			//D021���ܹ��ƻ�TB_EDDWRDSC
			document.form1.APWR.value=window("XQFLFRAME").document.getElementById("APWR").value;//�װ�����
			document.form1.WSTWR.value=window("XQFLFRAME").document.getElementById("WSTWR").value;//ֹˮ�ƻ�
		}
		if(val=="D022"){
			//D022//D022������ˮʧЧTB_BSWPLPDS
			document.form1.WPPLU.value=window("XQFLFRAME").document.getElementById("WPPLU").value;//��ˮ�׶���
			document.form1.WPEQML.value=window("XQFLFRAME").document.getElementById("WPEQML").value;//��ˮ�豸ʧ��
		}
		if(val=="D023"){
			//D023//D023�����ƻ� TB_HBWRDSC
			document.form1.WRMS.value=window("XQFLFRAME").document.getElementById("WRMS").value;//�ƻ�����(������)
			document.form1.LNINF.value=window("XQFLFRAME").document.getElementById("LNINF").value;//�Գ�����ɵ�Ӱ��
			document.form1.HBGLCN.value=window("XQFLFRAME").document.getElementById("HBGLCN").value;//����������
		}
		if(val=="D024"){
			//D024//D024�ص����ֲ̾��ƻ�TB_CLPJPRWR
			document.form1.WRD.value=window("XQFLFRAME").document.getElementById("WRD").value;//�ƻ����(��)
			document.form1.WRL.value=window("XQFLFRAME").document.getElementById("WRL").value;//�ƻ�����(��)
			document.form1.WRGLCN.value=window("XQFLFRAME").document.getElementById("WRGLCN").value;//�ƻ����������
		}
		if(val=="D025"){
			//D025//D025�ص����̳��TB_CLPJSCDN
			document.form1.SCDMBU.value=window("XQFLFRAME").document.getElementById("SCDMBU").value;//������(������)
			document.form1.SCDML.value=window("XQFLFRAME").document.getElementById("SCDML").value;//��ٳ���(��)
			document.form1.SCDMD.value=window("XQFLFRAME").document.getElementById("SCDMD").value;//������(��)
			document.form1.SCDMGLCN.value=window("XQFLFRAME").document.getElementById("SCDMGLCN").value;//��ٴ��������
		}
		
	}else{//����״̬XQFLFRAME
		if(document.form1.RZ.value==""){
			alert("����д��ǰ����ˮλ");
			return false;
		}
		if(document.form1.RV.value==""){
			alert("����д��ǰ����");
			return false;
		}
		if(document.form1.RQ.value==""){
			alert("����д��ǰк��");
			return false;
		}
		document.form1.XQYC.value=window("main2").document.getElementById("XQYC").value;//����Ԥ��
		document.form1.DFJZZK.value=window("main2").document.getElementById("DFJZZK").value;//�̷�����״��
		document.form1.QT.value=window("main2").document.getElementById("QT").value;//����
		document.form1.BJWHZK.value=window("main3").document.getElementById("BJWHZK").value;//�ӻ����״��
		document.form1.BTWDZK.value=window("main3").document.getElementById("BTWDZK").value;//�����ȶ�״��
		document.form1.HPHAWDQK.value=window("main3").document.getElementById("HPHAWDQK").value;//���»����ȶ����
		document.form1.TXSDJZK.value=window("main3").document.getElementById("TXSDJZK").value;//ͨѶ�ֶμ�״��
		document.form1.XSJZWZK.value=window("main3").document.getElementById("XSJZWZK").value;//йˮ������״��
		document.form1.XNGWHZK.value=window("main3").document.getElementById("XNGWHZK").value;//й�ܹ����״��
		document.form1.ZMQBJZK.value=window("main3").document.getElementById("ZMQBJZK").value;//բ�š���ջ�״��
	}
	document.form1.action="/buiness.do";
	document.getElementById('actionType').value=type;
	document.getElementById('SAVETYPES').value=radioValue;
	document.form1.submit();
}

//ͼƬԤ���������
function PreviewImg(imgFile) 
{ 
	var filedir = document.getElementById('UpFile').value;
	if(filedir!=""){
		var poi = filedir.lastIndexOf(".");
		var detail = filedir.substring(poi+1,filedir.length).toUpperCase();
		if(detail!="JPG" && detail!="MPG"){
			alert("��֧�ֵ��ļ���ʽ����ѡ��jpgͼƬ�ļ�������mpg��ý���ļ���");
			return false;
		}
	}
	//�µ�Ԥ�����룬֧�� IE6��IE7�� 
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
		alert("��ѡ�񹤳����ƣ�");
		return false;
	}
	var radioValue = getRadioValue("myradio");
	if(radioValue==2){
		var xqbt = document.getElementById('DNCNM').value;
		if(xqbt==""){
			alert("����д������⣡");
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
		DATEDESC.innerHTML="����ʱ��[T]";
		return false;
	}
	else
	{
		document.getElementById('XQFL').disabled=true; 
		document.getElementById('XQBT').value="";
		document.getElementById('XQBT').disabled=true;
		document.getElementById('CXBW').value="";
		document.getElementById('CXBW').disabled=true;
		DATEDESC.innerHTML="�ɼ�ʱ��[T]";
		return false;
	}
}
function getRadioValue(name){
	return document.getElementById('myradio').value;
}
function uploadPhotos(){
	var gcmc = document.getElementById('GCNAME').value;
	if(gcmc==""){
		alert("��ѡ�񹤳����ƣ�");
		return false;
	}
	//if(confirm("����ͼƬ��Ϣ�����������Ϣ,�����ܸ��ģ���ȷ�Ϲ�������\n��������,���ȷ��ֱ�ӱ��棬���ȡ���޸Ĺ�������")){
		var gcbh = document.getElementById('GCNAME').value;

		var type = document.getElementById('myradio').value;
		
		var zpbt = document.getElementById('ZPBT').value;
		var zpms = document.getElementById('ZPMS').value;
		var cjsj = document.getElementById('DAGTM').value;
		var filedir = document.getElementById('UpFile').value;
		var tname = document.getElementById('tabname').value;
		var filedetail;
		if(filedir==""){alert("��ѡ���ϴ���Ƭ��");return false;}
		if(filedir!=""){
			var poi = filedir.lastIndexOf(".");
			detail = filedir.substring(poi+1,filedir.length).toUpperCase();
			if(detail!="JPG" && detail!="MPG" ){
				alert("��֧�ֵ��ļ���ʽ��������ѡ��");
				return false;
			}
		}
		if(zpbt==""){alert("����д��Ƭ���⣡");return false;}
		if(cjsj==""){alert("����д�ɼ�ʱ�䣡");return false;}
		if(zpms==""){alert("����д��Ƭ������");return false;}
		var check = document.getElementById('PICLIST').innerHTML;
		if(check=="")delFlg=1;else delFlg=2;//������Ƭ��ʱ���Ƿ�����ִ��ɾ�������ı�־λ
		if(type==2){
			if(document.getElementById('DNCNM').value==""){
				alert("����д������⣡");
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
	if(confirm("ɾ�����ָܻ����Ƿ������")){
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
