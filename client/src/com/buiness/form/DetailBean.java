package com.buiness.form;

import java.sql.ResultSet;

public class DetailBean {
	
	private String DNCNO="";		//险情编号
	private String PJNO="";		//工程编号
	private String STTPCD="";		//建筑物编码
	private String DAGTM="";		//出险时间
	private String DNCNM="";		//险情名称
	
	private String LKGTU="";		//漏水混清				==D004==D003
	
	private String SLUPAG="";		//滑坡面角度(度)			==D006==D012
	
	private String TODFTDI="";		//距堤脚距离(米)			==D007==D009==D003==D004
	
	private String WDQ="";//河道流量(立方米/秒)				==D011==D009
	
	private String DSSPN="";		//受灾人口(人)			==D001==D015
	private String INPN="";		//受伤人口(人)			==D001==D015
	private String DTHPN="";		//死亡人口(人)			==D001==D015
	private String WRHS="";		//倒塌房屋(间)			==D001==D015
	private String CRPDSSAR="";	//农作物受灾面积(公顷)	==D001==D015
	private String SCDMFMAR="";	//毁坏耕地面积(公顷)		==D001==D015
	private String DRCECLS="";		//直接经济损失(万元)		==D001==D015
	
	private String WRAR="";		//破坏面积(平方米)		==D023==D024
	//D001	决口				TB_BURDSC
	private String BUW="";			//决口宽度(米)
	private String BUVL="";		//决口流速(米/秒)
	private String BUZDF="";		//决口水头差(米)
	private String BUQ="";			//决口流量(立方米/秒)
	private String BURLDGL="";		//决口处地形地质条件
	//D002	漫溢				TB_OVFLDSC
	private String OVFLL="";		//漫溢长度(米)
	private String OVFLZ="";		//漫溢水位(米)
	private String DSQ="";			//漫溢流量(立方米/秒)
	//D003	漏洞				TB_LKDSC
	private String LKDMT="";		//漏洞直径(米)
	private String LKQ="";			//漏洞流量(升/秒)
	private String LKWTLH="";		//漏洞水柱高(米)

	private String LKSAR="";		//已形成漏洞群面积(平方米)
	//D004	管涌				TB_PPDSC
	private String PPQ="";			//管涌流量(升/秒)
	private String WTLH="";		//水柱高(米)
	
	private String PPSAR="";		//已形成管涌群面积(平方米)
	//D005	陷坑				TB_PITDSC
	private String SBDSP="";		//陷坑深度(米)
	private String SBAR="";		//陷坑面积(平方米)
	
	//D006	滑坡 			TB_SLDSC
	private String SLBU="";		//滑坡体积(立方米)
	
	//D007	淘刷				TB_UNDSC
	private String UNDAR="";		//淘刷面积(平方米)
	private String UNDD="";		//淘刷深度(米)
	private String UNDL="";		//淘刷长度(米)
	
	//D008	裂缝				TB_CRDSC
	private String CRDR="";		//裂缝方向
	private String CRD="";			//裂缝深度(米)
	private String CRL="";			//裂缝长度(米)
	private String CRW="";			//裂缝宽度(厘米)
	
	//D009	崩岸				TB_CVDSC
	
	private String CVL="";			//崩塌长度(米)
	private String CVBU="";		//崩塌体积(立方米)
	private String RVH="";			//河岸高度(米)
	private String FLCNDSC="";		//水流情况描述
	//D010	渗水				TB_SPDSC
	private String SPAR="";		//渗水面积(平方米)
	private String SPQ="";			//SPQ
	//D011	 浪坎 			TB_BLBAD
	private String BLH="";			//浪高(米)
	private String WNS="";			//风速(级)
	//D012	滑动				TB_SLUDSC
	private String SLUDSP="";		//滑动位移(米)
	private String SLUTP="";		//滑动类型
	private String SLUGLCN="";		//滑动面地质情况
	//D013	启闭失灵			TB_HOMLFDSC
	private String POWCUT="";		//停电
	private String HOMLF="";		//启闭机失灵
	private String GSDST="";		//闸门井变形
	private String MLFCN="";		//失灵时开启状况
	//D014	闸门破坏			TB_GTWRDSC
	private String WRDSC="";		//破坏形式
	private String WRQ="";			//失事时流量(立方米/秒)
	//D015	溃坝				TB_BRDMDSC
	private String BRDMW="";		//溃坝宽度(米)
	private String PJPS="";		//工程现状
	private String BRZDMCDI="";	//库水位距堤顶距离(米)
	private String BRV="";			//溃坝时库容(万立方米)
	private String BRDMQ="";		//溃坝流量(立方米/秒)
	private String BRDMLDGL="";	//溃坝处地形、地质条件
	//D016	倾覆				TB_OVTUDSC
	private String OVTUDR="";		//倾覆方向
	private String OVTUAG="";		//倾覆角度(度)
	//D017	应力过大			TB_STREXDSC
	private String MXTNST="";		//最大拉应力(牛/平方毫米)
	private String MXCMST="";		//最大压应力(牛/平方毫米)
	private String CONGR="";		//混凝土标号
	private String ASTR="";		//允许应力值(牛/平方毫米)
	//D018	坍塌				TB_SLIDSC
	private String SLIAR="";		//坍塌面积(平方米)
	private String SLIMS="";		//坍塌方量(立方米)
	//D019	堵塞				TB_PLUDSC
	private String PLTNM="";		//堵塞物名称
	private String PLTBU="";		//堵塞物体积(立方米)
	//D020	基础破坏			TB_BSWRDSC
	private String GRNSPDSC="";	//基础渗漏描述
	private String GRNUSB="";		//据传不均匀沉降(米)
	private String GROVCHWR="";	//基础超载破坏
	
	//D021	消能工破坏		TB_EDDWRDSC
	private String APWR="";		//底板掀起
	private String WSTWR="";		//止水破坏
	//D022		基础排水失效		TB_BSWPLPDS
	private String WPPLU="";		//排水孔堵塞
	private String WPEQML="";		//排水设备失灵
	//D023	洞身破坏 			TB_HBWRDSC
	private String WRMS="";//破坏方量(立方米)
	private String LNINF="";//对衬砌造成的影响
	private String HBGLCN="";//洞身地质情况
	//D024	控导工程局部破坏	TB_CLPJPRWR
	
	private String WRD="";			//破坏深度(米)
	private String WRL="";			//破坏长度(米)
	private String WRGLCN="";		//破坏处地质情况
	//D025	控导工程冲毁		TB_CLPJSCDN
	private String SCDMBU="";		//冲毁体积(立方米)
	private String SCDML="";		//冲毁长度(米)
	private String SCDMD="";		//冲毁深度(米)
	private String SCDMGLCN="";	//冲毁处地质情况
	
	public String getDNCNO() {
		return DNCNO;
	}

	public void setDNCNO(String dNCNO) {
		DNCNO = dNCNO;
	}

	public String getPJNO() {
		return PJNO;
	}

	public void setPJNO(String pJNO) {
		PJNO = pJNO;
	}

	public String getSTTPCD() {
		return STTPCD;
	}

	public void setSTTPCD(String sTTPCD) {
		STTPCD = sTTPCD;
	}

	public String getDAGTM() {
		return DAGTM;
	}

	public void setDAGTM(String dAGTM) {
		DAGTM = dAGTM;
	}

	public String getDNCNM() {
		return DNCNM;
	}

	public void setDNCNM(String dNCNM) {
		DNCNM = dNCNM;
	}

	public String getLKGTU() {
		return LKGTU;
	}

	public void setLKGTU(String lKGTU) {
		LKGTU = lKGTU;
	}

	public String getSLUPAG() {
		return SLUPAG;
	}

	public void setSLUPAG(String sLUPAG) {
		SLUPAG = sLUPAG;
	}

	public String getTODFTDI() {
		return TODFTDI;
	}

	public void setTODFTDI(String tODFTDI) {
		TODFTDI = tODFTDI;
	}

	public String getWDQ() {
		return WDQ;
	}

	public void setWDQ(String wDQ) {
		WDQ = wDQ;
	}

	public String getDSSPN() {
		return DSSPN;
	}

	public void setDSSPN(String dSSPN) {
		DSSPN = dSSPN;
	}

	public String getINPN() {
		return INPN;
	}

	public void setINPN(String iNPN) {
		INPN = iNPN;
	}

	public String getDTHPN() {
		return DTHPN;
	}

	public void setDTHPN(String dTHPN) {
		DTHPN = dTHPN;
	}

	public String getWRHS() {
		return WRHS;
	}

	public void setWRHS(String wRHS) {
		WRHS = wRHS;
	}

	public String getCRPDSSAR() {
		return CRPDSSAR;
	}

	public void setCRPDSSAR(String cRPDSSAR) {
		CRPDSSAR = cRPDSSAR;
	}

	public String getSCDMFMAR() {
		return SCDMFMAR;
	}

	public void setSCDMFMAR(String sCDMFMAR) {
		SCDMFMAR = sCDMFMAR;
	}

	public String getDRCECLS() {
		return DRCECLS;
	}

	public void setDRCECLS(String dRCECLS) {
		DRCECLS = dRCECLS;
	}

	public String getWRAR() {
		return WRAR;
	}

	public void setWRAR(String wRAR) {
		WRAR = wRAR;
	}

	public String getBUW() {
		return BUW;
	}

	public void setBUW(String bUW) {
		BUW = bUW;
	}

	public String getBUVL() {
		return BUVL;
	}

	public void setBUVL(String bUVL) {
		BUVL = bUVL;
	}

	public String getBUZDF() {
		return BUZDF;
	}

	public void setBUZDF(String bUZDF) {
		BUZDF = bUZDF;
	}

	public String getBUQ() {
		return BUQ;
	}

	public void setBUQ(String bUQ) {
		BUQ = bUQ;
	}

	public String getBURLDGL() {
		return BURLDGL;
	}

	public void setBURLDGL(String bURLDGL) {
		BURLDGL = bURLDGL;
	}

	public String getOVFLL() {
		return OVFLL;
	}

	public void setOVFLL(String oVFLL) {
		OVFLL = oVFLL;
	}

	public String getOVFLZ() {
		return OVFLZ;
	}

	public void setOVFLZ(String oVFLZ) {
		OVFLZ = oVFLZ;
	}

	public String getDSQ() {
		return DSQ;
	}

	public void setDSQ(String dSQ) {
		DSQ = dSQ;
	}

	public String getLKDMT() {
		return LKDMT;
	}

	public void setLKDMT(String lKDMT) {
		LKDMT = lKDMT;
	}

	public String getLKQ() {
		return LKQ;
	}

	public void setLKQ(String lKQ) {
		LKQ = lKQ;
	}

	public String getLKWTLH() {
		return LKWTLH;
	}

	public void setLKWTLH(String lKWTLH) {
		LKWTLH = lKWTLH;
	}

	public String getLKSAR() {
		return LKSAR;
	}

	public void setLKSAR(String lKSAR) {
		LKSAR = lKSAR;
	}

	public String getPPQ() {
		return PPQ;
	}

	public void setPPQ(String pPQ) {
		PPQ = pPQ;
	}

	public String getWTLH() {
		return WTLH;
	}

	public void setWTLH(String wTLH) {
		WTLH = wTLH;
	}

	public String getPPSAR() {
		return PPSAR;
	}

	public void setPPSAR(String pPSAR) {
		PPSAR = pPSAR;
	}

	public String getSBDSP() {
		return SBDSP;
	}

	public void setSBDSP(String sBDSP) {
		SBDSP = sBDSP;
	}

	public String getSBAR() {
		return SBAR;
	}

	public void setSBAR(String sBAR) {
		SBAR = sBAR;
	}

	public String getSLBU() {
		return SLBU;
	}

	public void setSLBU(String sLBU) {
		SLBU = sLBU;
	}

	public String getUNDAR() {
		return UNDAR;
	}

	public void setUNDAR(String uNDAR) {
		UNDAR = uNDAR;
	}

	public String getUNDD() {
		return UNDD;
	}

	public void setUNDD(String uNDD) {
		UNDD = uNDD;
	}

	public String getUNDL() {
		return UNDL;
	}

	public void setUNDL(String uNDL) {
		UNDL = uNDL;
	}

	public String getCRDR() {
		return CRDR;
	}

	public void setCRDR(String cRDR) {
		CRDR = cRDR;
	}

	public String getCRD() {
		return CRD;
	}

	public void setCRD(String cRD) {
		CRD = cRD;
	}

	public String getCRL() {
		return CRL;
	}

	public void setCRL(String cRL) {
		CRL = cRL;
	}

	public String getCRW() {
		return CRW;
	}

	public void setCRW(String cRW) {
		CRW = cRW;
	}

	public String getCVL() {
		return CVL;
	}

	public void setCVL(String cVL) {
		CVL = cVL;
	}

	public String getCVBU() {
		return CVBU;
	}

	public void setCVBU(String cVBU) {
		CVBU = cVBU;
	}

	public String getRVH() {
		return RVH;
	}

	public void setRVH(String rVH) {
		RVH = rVH;
	}

	public String getFLCNDSC() {
		return FLCNDSC;
	}

	public void setFLCNDSC(String fLCNDSC) {
		FLCNDSC = fLCNDSC;
	}

	public String getSPAR() {
		return SPAR;
	}

	public void setSPAR(String sPAR) {
		SPAR = sPAR;
	}

	public String getSPQ() {
		return SPQ;
	}

	public void setSPQ(String sPQ) {
		SPQ = sPQ;
	}

	public String getBLH() {
		return BLH;
	}

	public void setBLH(String bLH) {
		BLH = bLH;
	}

	public String getWNS() {
		return WNS;
	}

	public void setWNS(String wNS) {
		WNS = wNS;
	}

	public String getSLUDSP() {
		return SLUDSP;
	}

	public void setSLUDSP(String sLUDSP) {
		SLUDSP = sLUDSP;
	}

	public String getSLUTP() {
		return SLUTP;
	}

	public void setSLUTP(String sLUTP) {
		SLUTP = sLUTP;
	}

	public String getSLUGLCN() {
		return SLUGLCN;
	}

	public void setSLUGLCN(String sLUGLCN) {
		SLUGLCN = sLUGLCN;
	}

	public String getPOWCUT() {
		return POWCUT;
	}

	public void setPOWCUT(String pOWCUT) {
		POWCUT = pOWCUT;
	}

	public String getHOMLF() {
		return HOMLF;
	}

	public void setHOMLF(String hOMLF) {
		HOMLF = hOMLF;
	}

	public String getGSDST() {
		return GSDST;
	}

	public void setGSDST(String gSDST) {
		GSDST = gSDST;
	}

	public String getMLFCN() {
		return MLFCN;
	}

	public void setMLFCN(String mLFCN) {
		MLFCN = mLFCN;
	}

	public String getWRDSC() {
		return WRDSC;
	}

	public void setWRDSC(String wRDSC) {
		WRDSC = wRDSC;
	}

	public String getWRQ() {
		return WRQ;
	}

	public void setWRQ(String wRQ) {
		WRQ = wRQ;
	}

	public String getBRDMW() {
		return BRDMW;
	}

	public void setBRDMW(String bRDMW) {
		BRDMW = bRDMW;
	}

	public String getPJPS() {
		return PJPS;
	}

	public void setPJPS(String pJPS) {
		PJPS = pJPS;
	}

	public String getBRZDMCDI() {
		return BRZDMCDI;
	}

	public void setBRZDMCDI(String bRZDMCDI) {
		BRZDMCDI = bRZDMCDI;
	}

	public String getBRV() {
		return BRV;
	}

	public void setBRV(String bRV) {
		BRV = bRV;
	}

	public String getBRDMQ() {
		return BRDMQ;
	}

	public void setBRDMQ(String bRDMQ) {
		BRDMQ = bRDMQ;
	}

	public String getBRDMLDGL() {
		return BRDMLDGL;
	}

	public void setBRDMLDGL(String bRDMLDGL) {
		BRDMLDGL = bRDMLDGL;
	}

	public String getOVTUDR() {
		return OVTUDR;
	}

	public void setOVTUDR(String oVTUDR) {
		OVTUDR = oVTUDR;
	}

	public String getOVTUAG() {
		return OVTUAG;
	}

	public void setOVTUAG(String oVTUAG) {
		OVTUAG = oVTUAG;
	}

	public String getMXTNST() {
		return MXTNST;
	}

	public void setMXTNST(String mXTNST) {
		MXTNST = mXTNST;
	}

	public String getMXCMST() {
		return MXCMST;
	}

	public void setMXCMST(String mXCMST) {
		MXCMST = mXCMST;
	}

	public String getCONGR() {
		return CONGR;
	}

	public void setCONGR(String cONGR) {
		CONGR = cONGR;
	}

	public String getASTR() {
		return ASTR;
	}

	public void setASTR(String aSTR) {
		ASTR = aSTR;
	}

	public String getSLIAR() {
		return SLIAR;
	}

	public void setSLIAR(String sLIAR) {
		SLIAR = sLIAR;
	}

	public String getSLIMS() {
		return SLIMS;
	}

	public void setSLIMS(String sLIMS) {
		SLIMS = sLIMS;
	}

	public String getPLTNM() {
		return PLTNM;
	}

	public void setPLTNM(String pLTNM) {
		PLTNM = pLTNM;
	}

	public String getPLTBU() {
		return PLTBU;
	}

	public void setPLTBU(String pLTBU) {
		PLTBU = pLTBU;
	}

	public String getGRNSPDSC() {
		return GRNSPDSC;
	}

	public void setGRNSPDSC(String gRNSPDSC) {
		GRNSPDSC = gRNSPDSC;
	}

	public String getGRNUSB() {
		return GRNUSB;
	}

	public void setGRNUSB(String gRNUSB) {
		GRNUSB = gRNUSB;
	}

	public String getGROVCHWR() {
		return GROVCHWR;
	}

	public void setGROVCHWR(String gROVCHWR) {
		GROVCHWR = gROVCHWR;
	}

	public String getAPWR() {
		return APWR;
	}

	public void setAPWR(String aPWR) {
		APWR = aPWR;
	}

	public String getWSTWR() {
		return WSTWR;
	}

	public void setWSTWR(String wSTWR) {
		WSTWR = wSTWR;
	}

	public String getWPPLU() {
		return WPPLU;
	}

	public void setWPPLU(String wPPLU) {
		WPPLU = wPPLU;
	}

	public String getWPEQML() {
		return WPEQML;
	}

	public void setWPEQML(String wPEQML) {
		WPEQML = wPEQML;
	}

	public String getWRMS() {
		return WRMS;
	}

	public void setWRMS(String wRMS) {
		WRMS = wRMS;
	}

	public String getLNINF() {
		return LNINF;
	}

	public void setLNINF(String lNINF) {
		LNINF = lNINF;
	}

	public String getHBGLCN() {
		return HBGLCN;
	}

	public void setHBGLCN(String hBGLCN) {
		HBGLCN = hBGLCN;
	}

	public String getWRD() {
		return WRD;
	}

	public void setWRD(String wRD) {
		WRD = wRD;
	}

	public String getWRL() {
		return WRL;
	}

	public void setWRL(String wRL) {
		WRL = wRL;
	}

	public String getWRGLCN() {
		return WRGLCN;
	}

	public void setWRGLCN(String wRGLCN) {
		WRGLCN = wRGLCN;
	}

	public String getSCDMBU() {
		return SCDMBU;
	}

	public void setSCDMBU(String sCDMBU) {
		SCDMBU = sCDMBU;
	}

	public String getSCDML() {
		return SCDML;
	}

	public void setSCDML(String sCDML) {
		SCDML = sCDML;
	}

	public String getSCDMD() {
		return SCDMD;
	}

	public void setSCDMD(String sCDMD) {
		SCDMD = sCDMD;
	}

	public String getSCDMGLCN() {
		return SCDMGLCN;
	}

	public void setSCDMGLCN(String sCDMGLCN) {
		SCDMGLCN = sCDMGLCN;
	}

	public static DetailBean getDetailBeanFromRs(ResultSet rs,String XQFL){
		DetailBean bean = new DetailBean();
		try{
		bean.setDNCNO(rs.getString("DNCNO"));		//险情编号
		bean.setPJNO(rs.getString("PJNO"));		//工程编号
		bean.setSTTPCD(rs.getString("STTPCD"));		//建筑物编码
		bean.setDAGTM(rs.getString("DAGTM"));		//出险时间
		bean.setDNCNM(rs.getString("DNCNM"));		//险情名称
		if("D004".trim().equals(XQFL)||"D003".trim().equals(XQFL)){
			bean.setLKGTU(rs.getString("LKGTU"));		//漏水混清	==D004==D003
		}
		if("D006".trim().equals(XQFL)||"D012".trim().equals(XQFL)){
			bean.setSLUPAG(String.valueOf(rs.getFloat("SLUPAG")));		//滑坡面角度(度)	==D006==D012
		}
		if("D007".trim().equals(XQFL)||"D009".trim().equals(XQFL)
				||"D004".trim().equals(XQFL)||"D005".trim().equals(XQFL)){
			bean.setTODFTDI(String.valueOf(rs.getFloat("TODFTDI")));		//距堤脚距离(米)	==D007==D009==D003==D004
		}
		if("D009".trim().equals(XQFL)||"D011".trim().equals(XQFL)){
			bean.setWDQ(String.valueOf(rs.getFloat("WDQ")));//河道流量(立方米/秒)	==D011==D009
		}
		if("D001".trim().equals(XQFL)||"D015".trim().equals(XQFL)){
			bean.setDSSPN(String.valueOf(rs.getFloat("DSSPN")));		//受灾人口(人)	==D001==D015
			bean.setINPN(String.valueOf(rs.getFloat("INPN")));		//受伤人口(人)	==D001==D015
			bean.setDTHPN(String.valueOf(rs.getFloat("DTHPN")));		//死亡人口(人)	==D001==D015
			bean.setWRHS(String.valueOf(rs.getFloat("WRHS")));		//倒塌房屋(间)	==D001==D015
			bean.setCRPDSSAR(String.valueOf(rs.getFloat("CRPDSSAR")));	//农作物受灾面积(公顷)	==D001==D015
			bean.setSCDMFMAR(String.valueOf(rs.getFloat("SCDMFMAR")));	//毁坏耕地面积(公顷)	==D001==D015
			bean.setDRCECLS(String.valueOf(rs.getFloat("DRCECLS")));		//直接经济损失(万元)		==D001==D015
		}
		if("D023".trim().equals(XQFL)||"D024".trim().equals(XQFL)){
			bean.setWRAR(String.valueOf(rs.getFloat("WRAR")));		//破坏面积(平方米)	==D023==D024
		}
		if("D001".trim().equals(XQFL)){
			//D001	决口				TB_BURDSC
			bean.setBUW(String.valueOf(rs.getFloat("BUW")));			//决口宽度(米)
			bean.setBUVL(String.valueOf(rs.getFloat("BUVL")));		//决口流速(米/秒)
			bean.setBUZDF(String.valueOf(rs.getFloat("BUZDF")));		//决口水头差(米)
			bean.setBUQ(String.valueOf(rs.getFloat("BUQ")));			//决口流量(立方米/秒)
			bean.setBURLDGL(rs.getString("BURLDGL"));		//决口处地形地质条件
		}
		if("D002".trim().equals(XQFL)){
			//D002	漫溢				TB_OVFLDSC
			bean.setOVFLL(String.valueOf(rs.getFloat("OVFLL")));		//漫溢长度(米)
			bean.setOVFLZ(String.valueOf(rs.getFloat("OVFLZ")));		//漫溢水位(米)
			bean.setDSQ(String.valueOf(rs.getFloat("DSQ")));			//漫溢流量(立方米/秒)
		}
		if("D003".trim().equals(XQFL)){
			//D003	漏洞				TB_LKDSC
			bean.setLKDMT(String.valueOf(rs.getFloat("LKDMT")));		//漏洞直径(米)
			bean.setLKQ(String.valueOf(rs.getFloat("LKQ")));			//漏洞流量(升/秒)
			bean.setLKWTLH(String.valueOf(rs.getFloat("LKWTLH")));		//漏洞水柱高(米)
			bean.setLKSAR(String.valueOf(rs.getFloat("LKSAR")));		//已形成漏洞群面积(平方米)
		}
		if("D004".trim().equals(XQFL)){
			//D004	管涌				TB_PPDSC
			bean.setPPQ(String.valueOf(rs.getFloat("PPQ")));			//管涌流量(升/秒)
			bean.setWTLH(String.valueOf(rs.getFloat("WTLH")));		//水柱高(米)
			bean.setPPSAR(String.valueOf(rs.getFloat("PPSAR")));		//已形成管涌群面积(平方米)
		}
		if("D005".trim().equals(XQFL)){
			//D005	陷坑				TB_PITDSC
			bean.setSBDSP(String.valueOf(rs.getFloat("SBDSP")));		//陷坑深度(米)
			bean.setSBAR(String.valueOf(rs.getFloat("SBAR")));		//陷坑面积(平方米)
		}
		if("D006".trim().equals(XQFL)){
			//D006	滑坡 			TB_SLDSC
			bean.setSLBU(String.valueOf(rs.getFloat("SLBU")));		//滑坡体积(立方米)
		}
		if("D007".trim().equals(XQFL)){
			//D007	淘刷				TB_UNDSC
			bean.setUNDAR(String.valueOf(rs.getFloat("UNDAR")));		//淘刷面积(平方米)
			bean.setUNDD(String.valueOf(rs.getFloat("UNDD")));		//淘刷深度(米)
			bean.setUNDL(String.valueOf(rs.getFloat("UNDL")));		//淘刷长度(米)
		}
		if("D008".trim().equals(XQFL)){
			//D008	裂缝				TB_CRDSC
			bean.setCRDR(rs.getString("CRDR"));		//裂缝方向
			bean.setCRD(String.valueOf(rs.getFloat("CRD")));			//裂缝深度(米)
			bean.setCRL(String.valueOf(rs.getFloat("CRL")));			//裂缝长度(米)
			bean.setCRW(String.valueOf(rs.getFloat("CRW")));			//裂缝宽度(厘米)
		}
		if("D009".trim().equals(XQFL)){
			//D009	崩岸				TB_CVDSC
			bean.setCVL(String.valueOf(rs.getFloat("CVL")));			//崩塌长度(米)
			bean.setCVBU(String.valueOf(rs.getFloat("CVBU")));		//崩塌体积(立方米)
			bean.setRVH(String.valueOf(rs.getFloat("RVH")));			//河岸高度(米)
			bean.setFLCNDSC(rs.getString("FLCNDSC"));		//水流情况描述
		}
		if("D010".trim().equals(XQFL)){
			//D010	渗水				TB_SPDSC
			bean.setSPAR(String.valueOf(rs.getFloat("SPAR")));		//渗水面积(平方米)
			bean.setSPQ(rs.getString("SPQ"));			//SPQ
		}
		if("D011".trim().equals(XQFL)){
			//D011	 浪坎 			TB_BLBAD
			bean.setBLH(String.valueOf(rs.getFloat("BLH")));			//浪高(米)
			bean.setWNS(String.valueOf(rs.getFloat("WNS")));			//风速(级)
		}
		if("D012".trim().equals(XQFL)){
			//D012	滑动				TB_SLUDSC
			bean.setSLUDSP(String.valueOf(rs.getFloat("SLUDSP")));		//滑动位移(米)
			bean.setSLUTP(rs.getString("SLUTP"));		//滑动类型
			bean.setSLUGLCN(rs.getString("SLUGLCN"));		//滑动面地质情况
		}
		if("D013".trim().equals(XQFL)){
			//D013	启闭失灵			TB_HOMLFDSC
			bean.setPOWCUT(rs.getString("POWCUT"));		//停电
			bean.setHOMLF(rs.getString("HOMLF"));		//启闭机失灵
			bean.setGSDST(rs.getString("GSDST"));		//闸门井变形
			bean.setMLFCN(rs.getString("MLFCN"));		//失灵时开启状况
		}
		if("D014".trim().equals(XQFL)){
			//D014	闸门破坏			TB_GTWRDSC
			bean.setWRDSC(rs.getString("WRDSC"));		//破坏形式
			bean.setWRQ(rs.getString("WRQ"));			//失事时流量(立方米/秒)
		}
		if("D015".trim().equals(XQFL)){
			//D015	溃坝				TB_BRDMDSC
			bean.setBRDMW(String.valueOf(rs.getFloat("BRDMW")));		//溃坝宽度(米)
			bean.setPJPS(rs.getString("PJPS"));		//工程现状
			bean.setBRZDMCDI(String.valueOf(rs.getFloat("BRZDMCDI")));	//库水位距堤顶距离(米)
			bean.setBRV(String.valueOf(rs.getFloat("BRV")));			//溃坝时库容(万立方米)
			bean.setBRDMQ(String.valueOf(rs.getFloat("BRDMQ")));		//溃坝流量(立方米/秒)
			bean.setBRDMLDGL(rs.getString("BRDMLDGL"));	//溃坝处地形、地质条件
		}
		if("D016".trim().equals(XQFL)){
			//D016	倾覆				TB_OVTUDSC
			bean.setOVTUDR(rs.getString("OVTUDR"));		//倾覆方向
			bean.setOVTUAG(String.valueOf(rs.getFloat("OVTUAG")));		//倾覆角度(度)
		}
		if("D017".trim().equals(XQFL)){
			//D017	应力过大			TB_STREXDSC
			bean.setMXTNST(String.valueOf(rs.getFloat("MXTNST")));		//最大拉应力(牛/平方毫米)
			bean.setMXCMST(String.valueOf(rs.getFloat("MXCMST")));		//最大压应力(牛/平方毫米)
			bean.setCONGR(rs.getString("CONGR"));		//混凝土标号
			bean.setASTR(String.valueOf(rs.getFloat("ASTR")));		//允许应力值(牛/平方毫米)
		}
		if("D018".trim().equals(XQFL)){
			//D018	坍塌				TB_SLIDSC
			bean.setSLIAR(String.valueOf(rs.getFloat("SLIAR")));		//坍塌面积(平方米)
			bean.setSLIMS(String.valueOf(rs.getFloat("SLIMS")));		//坍塌方量(立方米)
		}
		if("D019".trim().equals(XQFL)){
			//D019	堵塞				TB_PLUDSC
			bean.setPLTNM(rs.getString("PLTNM"));		//堵塞物名称
			bean.setPLTBU(String.valueOf(rs.getFloat("PLTBU")));		//堵塞物体积(立方米)
		}
		if("D020".trim().equals(XQFL)){
			//D020	基础破坏			TB_BSWRDSC
			bean.setGRNSPDSC(rs.getString("GRNSPDSC"));	//基础渗漏描述
			bean.setGRNUSB(String.valueOf(rs.getFloat("GRNUSB")));		//据传不均匀沉降(米)
			bean.setGROVCHWR(rs.getString("GROVCHWR"));	//基础超载破坏
		}
		if("D021".trim().equals(XQFL)){
			//D021	消能工破坏		TB_EDDWRDSC
			bean.setAPWR(rs.getString("APWR"));		//底板掀起
			bean.setWSTWR(rs.getString("WSTWR"));		//止水破坏
		}
		if("D022".trim().equals(XQFL)){
			//D022		基础排水失效		TB_BSWPLPDS
			bean.setWPPLU(rs.getString("WPPLU"));		//排水孔堵塞
			bean.setWPEQML(rs.getString("WPEQML"));		//排水设备失灵
		}
		if("D023".trim().equals(XQFL)){
			//D023	洞身破坏 			TB_HBWRDSC
			bean.setWRMS(String.valueOf(rs.getFloat("WRMS")));//破坏方量(立方米)
			bean.setLNINF(rs.getString("LNINF"));//对衬砌造成的影响
			bean.setHBGLCN(rs.getString("HBGLCN"));//洞身地质情况
		}
		if("D024".trim().equals(XQFL)){
			//D024	控导工程局部破坏	TB_CLPJPRWR
			bean.setWRD(String.valueOf(rs.getFloat("WRD")));			//破坏深度(米)
			bean.setWRL(String.valueOf(rs.getFloat("WRL")));			//破坏长度(米)
			bean.setWRGLCN(rs.getString("WRGLCN"));		//破坏处地质情况
		}
		if("D025".trim().equals(XQFL)){
			//D025	控导工程冲毁		TB_CLPJSCDN
			bean.setSCDMBU(String.valueOf(rs.getFloat("SCDMBU")));		//冲毁体积(立方米)
			bean.setSCDML(String.valueOf(rs.getFloat("SCDML")));		//冲毁长度(米)
			bean.setSCDMD(String.valueOf(rs.getFloat("SCDMD")));		//冲毁深度(米)
			bean.setSCDMGLCN(rs.getString("SCDMGLCN"));	//冲毁处地质情况
		}
		}catch(Exception ex){
			ex.printStackTrace();
			}
		return bean;
	}
	
}
