/**
 * ��Ϣ�ɼ�js
 * @param type
 * @return
 */
function per_Submit(type){
	var radioValue = getRadioValue("myradio");
	if(document.getElementById('GCNAME').value==""){
		alert("��ѡ�񹤳����ƣ�");
		return false;
	}
	if(radioValue==2){//��������
		if(document.getElementById('DAGTM').value==""){
			alert("����д����ʱ�䣡");
			return false;
		}
		document.frm.BCMS.value=window("main1").document.getElementById("BCMS").value;//��������
		document.frm.QXFA.value=window("main1").document.getElementById("QXFA").value;//���շ���
		document.frm.QXZYPB.value=window("main1").document.getElementById("JXZYPB").value;//������Դ�䱸
		document.frm.JZJJG.value=window("main1").document.getElementById("JZJJG").value;//��չ�����
		document.frm.XQYYFX.value=window("main1").document.getElementById("XQYYFX").value;//����ԭ�����
		document.frm.XQFZQS.value=window("main1").document.getElementById("XQFZQS").value;//���鷢չ����
		document.frm.KNYXFW.value=window("main1").document.getElementById("KNYXFW").value;//����Ӱ�췶Χ
		document.frm.QXSQX.value=window("main1").document.getElementById("QXSQX").value;//����ʱ����
		document.frm.WLSWQX.value=window("main1").document.getElementById("WLSWQS").value;//δ��ˮ������
		var val = document.frm.XQFLDM.value;
		if(val=="D004"||val=="D003"){
			document.frm.LKGTU.value=window("XQFLFRAME").document.getElementById("LKGTU").value;//©ˮ����==D004==D003
		}
		if(val=="D006"||val=="D012"){
			document.frm.SLUPAG.value=window("XQFLFRAME").document.getElementById("SLUPAG").value;//������Ƕ�(��)==D006==D012
		}
		if(val=="D007"||val=="D009"||val=="D003"||val=="D004"){
			document.frm.TODFTDI.value=window("XQFLFRAME").document.getElementById("TODFTDI").value;//��̽ž���(��)==D007==D009==D003==D004
		}
		if(val=="D011"||val=="D009"){
			document.frm.WDQ.value=window("XQFLFRAME").document.getElementById("WDQ").value;//�ӵ�����(������/��)==D011==D009
		}
		if(val=="D001"||val=="D015"){
			document.frm.DSSPN.value=window("XQFLFRAME").document.getElementById("DSSPN").value;//�����˿�(��)==D001==D015
			document.frm.INPN.value=window("XQFLFRAME").document.getElementById("INPN").value;//�����˿�(��)==D001==D015
			document.frm.DTHPN.value=window("XQFLFRAME").document.getElementById("DTHPN").value;//�����˿�(��)==D001==D015
			document.frm.WRHS.value=window("XQFLFRAME").document.getElementById("WRHS").value;//��������(��)==D001==D015
			document.frm.CRPDSSAR.value=window("XQFLFRAME").document.getElementById("CRPDSSAR").value;//ũ�����������(����)==D001==D015
			document.frm.SCDMFMAR.value=window("XQFLFRAME").document.getElementById("SCDMFMAR").value;//�ٻ��������(����)==D001==D015
			document.frm.DRCECLS.value=window("XQFLFRAME").document.getElementById("DRCECLS").value;//ֱ�Ӿ�����ʧ(��Ԫ)==D001==D015
		}
		if(val=="D023"||val=="D024"){
			document.frm.WRAR.value=window("XQFLFRAME").document.getElementById("WRAR").value;//�ƻ����(ƽ����)==D023==D024
		}
		if(val=="D001"){
			//D001//D001����TB_BURDSC
			//alert(window("XQFLFRAME").document.getElementById("BURLDGL").value);
			document.frm.BUW.value=window("XQFLFRAME").document.getElementById("BUW").value;//���ڿ��(��)
			document.frm.BUVL.value=window("XQFLFRAME").document.getElementById("BUVL").value;//��������(��/��)
			document.frm.BUZDF.value=window("XQFLFRAME").document.getElementById("BUZDF").value;//����ˮͷ��(��)
			document.frm.BUQ.value=window("XQFLFRAME").document.getElementById("BUQ").value;//��������(������/��)
			document.frm.BURLDGL.value=window("XQFLFRAME").document.getElementById("BURLDGL").value;//���ڴ����ε�������
		}
		if(val=="D002"){
			//D002//D002����TB_OVFLDSC
			document.frm.OVFLL.value=window("XQFLFRAME").document.getElementById("OVFLL").value;//���糤��(��)
			document.frm.OVFLZ.value=window("XQFLFRAME").document.getElementById("OVFLZ").value;//����ˮλ(��)
			document.frm.DSQ.value=window("XQFLFRAME").document.getElementById("DSQ").value;//��������(������/��)
		}
		if(val=="D003"){
			//D003//D003©��TB_LKDSC
			document.frm.LKDMT.value=window("XQFLFRAME").document.getElementById("LKDMT").value;//©��ֱ��(��)
			document.frm.LKQ.value=window("XQFLFRAME").document.getElementById("LKQ").value;//©������(��/��)
			document.frm.LKWTLH.value=window("XQFLFRAME").document.getElementById("LKWTLH").value;//©��ˮ����(��)
			document.frm.LKSAR.value=window("XQFLFRAME").document.getElementById("LKSAR").value;//���γ�©��Ⱥ���(ƽ����)
		}
		if(val=="D004"){
			//D004//D004��ӿTB_PPDSC
			document.frm.PPQ.value=window("XQFLFRAME").document.getElementById("PPQ").value;//��ӿ����(��/��)
			document.frm.WTLH.value=window("XQFLFRAME").document.getElementById("WTLH").value;//ˮ����(��)
			document.frm.PPSAR.value=window("XQFLFRAME").document.getElementById("PPSAR").value;//���γɹ�ӿȺ���(ƽ����)
		}
		if(val=="D005"){
			//D005//D005�ݿ�TB_PITDSC
			document.frm.SBDSP.value=window("XQFLFRAME").document.getElementById("SBDSP").value;//�ݿ����(��)
			document.frm.SBAR.value=window("XQFLFRAME").document.getElementById("SBAR").value;//�ݿ����(ƽ����)
		}
		if(val=="D006"){
			//D006//D006���� TB_SLDSC
			document.frm.SLBU.value=window("XQFLFRAME").document.getElementById("SLBU").value;//�������(������)
		}
		if(val=="D007"){
			//D007//D007��ˢTB_UNDSC
			document.frm.UNDAR.value=window("XQFLFRAME").document.getElementById("UNDAR").value;//��ˢ���(ƽ����)
			document.frm.UNDD.value=window("XQFLFRAME").document.getElementById("UNDD").value;//��ˢ���(��)
			document.frm.UNDL.value=window("XQFLFRAME").document.getElementById("UNDL").value;//��ˢ����(��)
		}
		if(val=="D008"){
			//D008//D008�ѷ�TB_CRDSC
			document.frm.CRDR.value=window("XQFLFRAME").document.getElementById("CRDR").value;//�ѷ췽��
			document.frm.CRD.value=window("XQFLFRAME").document.getElementById("CRD").value;//�ѷ����(��)
			document.frm.CRL.value=window("XQFLFRAME").document.getElementById("CRL").value;//�ѷ쳤��(��)
			document.frm.CRW.value=window("XQFLFRAME").document.getElementById("CRW").value;//�ѷ���(����)
		}
		if(val=="D009"){
			//D009//D009����TB_CVDSC
	
			document.frm.CVL.value=window("XQFLFRAME").document.getElementById("CVL").value;//��������(��)
			document.frm.CVBU.value=window("XQFLFRAME").document.getElementById("CVBU").value;//�������(������)
			document.frm.RVH.value=window("XQFLFRAME").document.getElementById("RVH").value;//�Ӱ��߶�(��)
			document.frm.FLCNDSC.value=window("XQFLFRAME").document.getElementById("FLCNDSC").value;//ˮ���������
		}
		if(val=="D010"){
			//D010//D010��ˮTB_SPDSC
			document.frm.SPAR.value=window("XQFLFRAME").document.getElementById("SPAR").value;//��ˮ���(ƽ����)
			document.frm.SPQ.value=window("XQFLFRAME").document.getElementById("SPQ").value;//SPQ
		}
		if(val=="D011"){
			//D011//D011 �˿� TB_BLBAD
			document.frm.BLH.value=window("XQFLFRAME").document.getElementById("BLH").value;//�˸�(��)
			document.frm.WNS.value=window("XQFLFRAME").document.getElementById("WNS").value;//����(��)
		}
		if(val=="D012"){
			//D012//D012����TB_SLUDSC
			document.frm.SLUDSP.value=window("XQFLFRAME").document.getElementById("SLUDSP").value;//����λ��(��)
			document.frm.SLUTP.value=window("XQFLFRAME").document.getElementById("SLUTP").value;//��������
			document.frm.SLUGLCN.value=window("XQFLFRAME").document.getElementById("SLUGLCN").value;//������������
		}
		if(val=="D013"){
			//D013//D013����ʧ��TB_HOMLFDSC
			document.frm.POWCUT.value=window("XQFLFRAME").document.getElementById("POWCUT").value;//ͣ��
			document.frm.HOMLF.value=window("XQFLFRAME").document.getElementById("HOMLF").value;//���ջ�ʧ��
			document.frm.GSDST.value=window("XQFLFRAME").document.getElementById("GSDST").value;//բ�ž�����
			document.frm.MLFCN.value=window("XQFLFRAME").document.getElementById("MLFCN").value;//ʧ��ʱ����״��
		}
		if(val=="D014"){
			//D014//D014բ���ƻ�TB_GTWRDSC
			document.frm.WRDSC.value=window("XQFLFRAME").document.getElementById("WRDSC").value;//�ƻ���ʽ
			document.frm.WRQ.value=window("XQFLFRAME").document.getElementById("WRQ").value;//ʧ��ʱ����(������/��)
		}
		if(val=="D015"){
			//D015//D015����TB_BRDMDSC
			document.frm.BRDMW.value=window("XQFLFRAME").document.getElementById("BRDMW").value;//���ӿ��(��)
			document.frm.PJPS.value=window("XQFLFRAME").document.getElementById("PJPS").value;//������״
			document.frm.BRZDMCDI.value=window("XQFLFRAME").document.getElementById("BRZDMCDI").value;//��ˮλ��̶�����(��)
			document.frm.BRV.value=window("XQFLFRAME").document.getElementById("BRV").value;//����ʱ����(��������)
			document.frm.BRDMQ.value=window("XQFLFRAME").document.getElementById("BRDMQ").value;//��������(������/��)
			document.frm.BRDMLDGL.value=window("XQFLFRAME").document.getElementById("BRDMLDGL").value;//���Ӵ����Ρ���������
		}
		if(val=="D016"){
			//D016//D016�㸲TB_OVTUDSC
			document.frm.OVTUDR.value=window("XQFLFRAME").document.getElementById("OVTUDR").value;//�㸲����
			document.frm.OVTUAG.value=window("XQFLFRAME").document.getElementById("OVTUAG").value;//�㸲�Ƕ�(��)
		}
		if(val=="D017"){
			//D017//D017Ӧ������TB_STREXDSC
			document.frm.MXTNST.value=window("XQFLFRAME").document.getElementById("MXTNST").value;//�����Ӧ��(ţ/ƽ������)
			document.frm.MXCMST.value=window("XQFLFRAME").document.getElementById("MXCMST").value;//���ѹӦ��(ţ/ƽ������)
			document.frm.CONGR.value=window("XQFLFRAME").document.getElementById("CONGR").value;//���������
			document.frm.ASTR.value=window("XQFLFRAME").document.getElementById("ASTR").value;//����Ӧ��ֵ(ţ/ƽ������)
		}
		if(val=="D018"){
			//D018//D018̮��TB_SLIDSC
			document.frm.SLIAR.value=window("XQFLFRAME").document.getElementById("SLIAR").value;//̮�����(ƽ����)
			document.frm.SLIMS.value=window("XQFLFRAME").document.getElementById("SLIMS").value;//̮������(������)
		}
		if(val=="D019"){
			//D019//D019����TB_PLUDSC
			document.frm.PLTNM.value=window("XQFLFRAME").document.getElementById("PLTNM").value;//����������
			document.frm.PLTBU.value=window("XQFLFRAME").document.getElementById("PLTBU").value;//���������(������)
		}
		if(val=="D020"){
			//D020�����ƻ�TB_BSWRDSC
			document.frm.GRNSPDSC.value=window("XQFLFRAME").document.getElementById("GRNSPDSC").value;//������©����
			document.frm.GRNUSB.value=window("XQFLFRAME").document.getElementById("GRNUSB").value;//�ݴ������ȳ���(��)
			document.frm.GROVCHWR.value=window("XQFLFRAME").document.getElementById("GROVCHWR").value;//���������ƻ�
		}
		if(val=="D021"){
			//D021���ܹ��ƻ�TB_EDDWRDSC
			document.frm.APWR.value=window("XQFLFRAME").document.getElementById("APWR").value;//�װ�����
			document.frm.WSTWR.value=window("XQFLFRAME").document.getElementById("WSTWR").value;//ֹˮ�ƻ�
		}
		if(val=="D022"){
			//D022//D022������ˮʧЧTB_BSWPLPDS
			document.frm.WPPLU.value=window("XQFLFRAME").document.getElementById("WPPLU").value;//��ˮ�׶���
			document.frm.WPEQML.value=window("XQFLFRAME").document.getElementById("WPEQML").value;//��ˮ�豸ʧ��
		}
		if(val=="D023"){
			//D023//D023�����ƻ� TB_HBWRDSC
			document.frm.WRMS.value=window("XQFLFRAME").document.getElementById("WRMS").value;//�ƻ�����(������)
			document.frm.LNINF.value=window("XQFLFRAME").document.getElementById("LNINF").value;//�Գ�����ɵ�Ӱ��
			document.frm.HBGLCN.value=window("XQFLFRAME").document.getElementById("HBGLCN").value;//����������
		}
		if(val=="D024"){
			//D024//D024�ص����ֲ̾��ƻ�TB_CLPJPRWR
			document.frm.WRD.value=window("XQFLFRAME").document.getElementById("WRD").value;//�ƻ����(��)
			document.frm.WRL.value=window("XQFLFRAME").document.getElementById("WRL").value;//�ƻ�����(��)
			document.frm.WRGLCN.value=window("XQFLFRAME").document.getElementById("WRGLCN").value;//�ƻ����������
		}
		if(val=="D025"){
			//D025//D025�ص����̳��TB_CLPJSCDN
			document.frm.SCDMBU.value=window("XQFLFRAME").document.getElementById("SCDMBU").value;//������(������)
			document.frm.SCDML.value=window("XQFLFRAME").document.getElementById("SCDML").value;//��ٳ���(��)
			document.frm.SCDMD.value=window("XQFLFRAME").document.getElementById("SCDMD").value;//������(��)
			document.frm.SCDMGLCN.value=window("XQFLFRAME").document.getElementById("SCDMGLCN").value;//��ٴ��������
		}
		if(val=="D026"){
			//D026//D026ɽ���ֺ�TB_CLPJSCDN
			document.frm.DSSTP.value=window("XQFLFRAME").document.getElementById("DSSTP").value;//�ֺ�����
			document.frm.DSSAREA.value=window("XQFLFRAME").document.getElementById("DSSAREA").value;//�������
			document.frm.DSSPN.value=window("XQFLFRAME").document.getElementById("DSSPN").value;//�����˿�
			document.frm.DTHPN.value=window("XQFLFRAME").document.getElementById("DTHPN").value;//��������
			document.frm.WRHS.value=window("XQFLFRAME").document.getElementById("WRHS").value;//��������
			document.frm.DRCECLS.value=window("XQFLFRAME").document.getElementById("DRCECLS").value;//������ʧ
			document.frm.DAYDP.value=window("XQFLFRAME").document.getElementById("DAYDP").value;//���������
			document.frm.TDP.value=window("XQFLFRAME").document.getElementById("TDP").value;//ʱ�ν�����<
		}
		
	}else{//����״̬
		var val = document.frm.GCLB.value;
		var GCFLDM = document.frm.GCFLDM.value;
		document.frm.XQYC.value=window("main2").document.getElementById("XQYC").value;//����Ԥ��
		document.frm.DFJZZK.value=window("main2").document.getElementById("DFJZZK").value;//�̷�����״��
		document.frm.QT.value=window("main2").document.getElementById("QT").value;//����
		if(val=="N"||val=="F"||val=="A"){
			document.frm.BKOT.value=window("main4").document.getElementById("BKOT").value;//���ڰ���(��/��)
		}
		if(val=="A"||val=="B"){
			document.frm.RZ.value=window("main4").document.getElementById("RZ").value;		//<!-- ��ǰ����ˮλ(��)========TB_RSR===TB_DKR -->
			document.frm.RQ.value=window("main4").document.getElementById("RQ").value;		//<!-- ��ǰк��(������/��)========TB_RSR===TB_DKR -->
			document.frm.BRBPPFCN.value=window("main3").document.getElementById("BRBPPFCN").value;	//<!-- ���»����ȶ����========TB_RSR===TB_DKR -->
		}
		if(val=="B"||val=="K"){
			document.frm.EDDPFCN.value=window("main3").document.getElementById("EDDPFCN").value;	//<!-- ���ܹ����״��==========TB_RSR===TB_WLR -->	
			document.frm.GTHOPFCN.value=window("main3").document.getElementById("GTHOPFCN").value;	//<!-- բ�š����ջ����״��====TB_RSR===TB_WLR -->	
			document.frm.COMMCN.value=window("main3").document.getElementById("COMMCN").value;	//<!-- ͨѶ�ֶμ�״��==========TB_RSR===TB_WLR -->
		}
		if(val=="F"){//����(��)����//BKOT
			document.frm.DSFLWZ.value=window("main4").document.getElementById("DSFLWZ").value;//	<!-- �����(��)��ˮλ(��) -->	
			document.frm.DSFLW.value=window("main4").document.getElementById("DSFLW").value;//	<!-- �����(��)����(��������) -->	
			document.frm.TRFCN.value=window("main3").document.getElementById("TRFCN").value;//	<!-- ��ͨ״�� -->	
			document.frm.DKCN.value=window("main3").document.getElementById("DKCN").value;//		<!-- �׵�״�� -->	
			document.frm.CWFCCN.value=window("main3").document.getElementById("CWFCCN").value;//	<!-- ͨѶԤ����ʩ״�� -->	
			document.frm.SFSRCN.value=window("main3").document.getElementById("SFSRCN").value;//	<!-- ��ˮ������ʩ״�� -->	
			document.frm.FLFADSC.value=window("main3").document.getElementById("FLFADSC").value;//	<!-- �ֺ���ʩ״�� -->	
			document.frm.IDSTCN.value=window("main3").document.getElementById("IDSTCN").value;//	<!-- ��ˮվ״�� -->
		}
		if(val=="B"){//ˮ�� 
			document.frm.RSCLS.value=window("main4").document.getElementById("RSCLS").value;	//<!-- ˮ�����(����/�к�/���տ�) -->
			document.frm.RV.value=window("main4").document.getElementById("RV").value;		//<!-- ��ǰ����(��������) -->
			document.frm.DFPFCN.value=window("main3").document.getElementById("DFPFCN").value;	//<!-- �ӻ����״�� -->	
			document.frm.DBSTBCN.value=window("main3").document.getElementById("DBSTBCN").value;	//<!-- �����ȶ���� -->	
			document.frm.ESPFCN.value=window("main3").document.getElementById("ESPFCN").value;	//<!-- йˮ���������״�� -->	
		}
		if(val=="N"){
			document.frm.FLCNDSC.value=window("main3").document.getElementById("FLCNDSC").value;	//<!-- ˮ��������� -->	
			document.frm.WDCNDSC.value=window("main3").document.getElementById("WDCNDSC").value;	//<!-- �ӵ�������� -->	
			document.frm.PRCCLR.value=window("main3").document.getElementById("PRCCLR").value;	//<!-- ���ϵ���ʵ -->	
			document.frm.SPURDSC.value=window("main3").document.getElementById("SPURDSC").value;	//<!-- �ص��������� -->	
			document.frm.BPPJCN.value=window("main3").document.getElementById("BPPJCN").value;	//<!-- ����������� -->
		}
		if(val=="A"){
			document.frm.WSTODC.value=window("main4").document.getElementById("WSTODC").value;
			document.frm.DKGR.value=window("main4").document.getElementById("DKGR").value;//<!-- �̷�����(1/2/3/4/5) -->
			document.frm.STECH.value=window("main4").document.getElementById("STECH").value;//<!-- ��ֹ׮�� -->	
			document.frm.DKPFCN.value=window("main3").document.getElementById("DKPFCN").value;//<!-- �̷����״�� -->	
			document.frm.TSCN.value=window("main3").document.getElementById("TSCN").value;//<!-- ���̽�����״�� -->
		}
		if(val=="K"){
			document.frm.WLGR.value = window("main4").document.getElementById("WLGR").value;//		<!-- ˮբ�ȱ�(һ/��/��/��/��) --> 
			document.frm.RUPGZ.value = window("main4").document.getElementById("RUPGZ").value;//	<!-- ��ǰբ��ˮλ(��) -->	
			document.frm.RDWGZ.value = window("main4").document.getElementById("RDWGZ").value;//	<!-- ��ǰբ��ˮλ(��) -->	
			document.frm.RQO.value = window("main4").document.getElementById("RQO").value;//		<!-- ��ǰ��բ����(������/��) -->
			document.frm.RWSTOWLT.value = window("main4").document.getElementById("RWSTOWLT").value;//	<!-- ��ǰˮ���բ������(��) -->	
			document.frm.GFPFCN.value = window("main3").document.getElementById("GFPFCN").value;//	<!-- �ӻ����״��  -->	
			document.frm.STPFCN.value = window("main3").document.getElementById("STPFCN").value;//	<!-- ���������״��  -->
		}
		
	}
	if(document.frm.UpFile.value==""){
		document.frm.action="/buiness.do";
		document.getElementById('actionType').value=type;
		document.getElementById('SAVETYPES').value=radioValue;
		document.frm.submit();
	}else{
		if(confirm("����δ�ϴ��Ķ�ý����Ϣ���Ƿ�������棿")){
			document.frm.action="/buiness.do";
			document.getElementById('actionType').value=type;
			document.getElementById('SAVETYPES').value=radioValue;
			document.frm.submit();
		}
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

function getRadioValue(name){
	return document.getElementById('myradio').value;
}
function uplaodReportPhotos(tbname){
	var gcmc = document.getElementById('GCNAME').value;
	if(gcmc==""){
		alert("��ѡ�񹤳����ƣ�");
		return false;
	}
	var type = document.getElementById('myradio').value;
	var check = document.frm.check.value;
	var zpbt = document.getElementById('TITLE').value;
	var filepath = document.getElementById('UpFile').value;
	var zpms = document.getElementById('NRMS').value;
	var dncid = document.getElementById('DNCNO').value;
	var cjsj = document.getElementById('DTCDT').value;
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
	if(zpbt==""){
		alert("����д��Ƭ����.");
		return false;
	}
	if(window.XMLHttpRequest){ //Mozilla
		var xmlHttpReq=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		var xmlHttpReq=new ActiveXObject("MSXML2.XMLHTTP.3.0");
	}
	if(type==2){
		if(document.getElementById('DNCNM').value==""){
			alert("����д������⣡");
			return false;
		} 
		xmlHttpReq.open("GET", "/FileUploadServlet?type=report&saveType="+type+"&filepath="+filepath+"&cjsjvalue="+cjsj
				+"&zpbtvalue="+zpbt+"&zpmsvalue="+zpms+"&detailvalue="+detail+"&gclsh="+gcmc+"" +
						"&xqfldm="+document.getElementById('XQFLDM').value+"" +
						"&STTPCD="+document.getElementById('STTPCD').value+"" +
						"&xqbt="+document.getElementById('DNCNM').value+"" +
						"&WTDPCD="+document.getElementById('WTDPCD').value+
						"&DNCNO="+document.getElementById("DNCNO").value+
						"&delFlg="+check+"&tabname="+tbname, false);
		xmlHttpReq.send(null);
		var result = xmlHttpReq.responseText;
	}
	else{
		xmlHttpReq.open("GET", "/FileUploadServlet?type=report&saveType="+type+"&tabname="+tbname
				+"&zpbtvalue="+zpbt+"&cjsjvalue="+cjsj+"&zpmsvalue="+zpms+"&filepath="+filepath
				+"&zpmsvalue="+zpms+"&detailvalue="+detail+"&DNCNO="+document.getElementById("DNCNO").value
				+"&delFlg="+check, false);
		xmlHttpReq.send(null);
		var result = xmlHttpReq.responseText;
	}
	document.frm.check.value="2";
	document.getElementById('NRMS').value="";
	document.getElementById('TITLE').value="";
	//���file�ֶ�
	var obj = document.getElementById("UpFile");
	obj.outerHTML = obj.outerHTML;
	//���ͼƬԤ������
	var objIMG = document.getElementById("newPreview");
	objIMG.outerHTML =objIMG.outerHTML;
	document.frames('ZPFRAME').location.reload();
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
//		DTCDT.innerHTML=val[1];
		NRMS.innerHTML=val[2];
	}
}
