package com.buiness.form;

import java.sql.ResultSet;

public class DetailBean {
	
	private String DNCNO="";		//������
	private String PJNO="";		//���̱��
	private String STTPCD="";		//���������
	private String DAGTM="";		//����ʱ��
	private String DNCNM="";		//��������
	
	private String LKGTU="";		//©ˮ����				==D004==D003
	
	private String SLUPAG="";		//������Ƕ�(��)			==D006==D012
	
	private String TODFTDI="";		//��̽ž���(��)			==D007==D009==D003==D004
	
	private String WDQ="";//�ӵ�����(������/��)				==D011==D009
	
	private String DSSPN="";		//�����˿�(��)			==D001==D015
	private String INPN="";		//�����˿�(��)			==D001==D015
	private String DTHPN="";		//�����˿�(��)			==D001==D015
	private String WRHS="";		//��������(��)			==D001==D015
	private String CRPDSSAR="";	//ũ�����������(����)	==D001==D015
	private String SCDMFMAR="";	//�ٻ��������(����)		==D001==D015
	private String DRCECLS="";		//ֱ�Ӿ�����ʧ(��Ԫ)		==D001==D015
	
	private String WRAR="";		//�ƻ����(ƽ����)		==D023==D024
	//D001	����				TB_BURDSC
	private String BUW="";			//���ڿ��(��)
	private String BUVL="";		//��������(��/��)
	private String BUZDF="";		//����ˮͷ��(��)
	private String BUQ="";			//��������(������/��)
	private String BURLDGL="";		//���ڴ����ε�������
	//D002	����				TB_OVFLDSC
	private String OVFLL="";		//���糤��(��)
	private String OVFLZ="";		//����ˮλ(��)
	private String DSQ="";			//��������(������/��)
	//D003	©��				TB_LKDSC
	private String LKDMT="";		//©��ֱ��(��)
	private String LKQ="";			//©������(��/��)
	private String LKWTLH="";		//©��ˮ����(��)

	private String LKSAR="";		//���γ�©��Ⱥ���(ƽ����)
	//D004	��ӿ				TB_PPDSC
	private String PPQ="";			//��ӿ����(��/��)
	private String WTLH="";		//ˮ����(��)
	
	private String PPSAR="";		//���γɹ�ӿȺ���(ƽ����)
	//D005	�ݿ�				TB_PITDSC
	private String SBDSP="";		//�ݿ����(��)
	private String SBAR="";		//�ݿ����(ƽ����)
	
	//D006	���� 			TB_SLDSC
	private String SLBU="";		//�������(������)
	
	//D007	��ˢ				TB_UNDSC
	private String UNDAR="";		//��ˢ���(ƽ����)
	private String UNDD="";		//��ˢ���(��)
	private String UNDL="";		//��ˢ����(��)
	
	//D008	�ѷ�				TB_CRDSC
	private String CRDR="";		//�ѷ췽��
	private String CRD="";			//�ѷ����(��)
	private String CRL="";			//�ѷ쳤��(��)
	private String CRW="";			//�ѷ���(����)
	
	//D009	����				TB_CVDSC
	
	private String CVL="";			//��������(��)
	private String CVBU="";		//�������(������)
	private String RVH="";			//�Ӱ��߶�(��)
	private String FLCNDSC="";		//ˮ���������
	//D010	��ˮ				TB_SPDSC
	private String SPAR="";		//��ˮ���(ƽ����)
	private String SPQ="";			//SPQ
	//D011	 �˿� 			TB_BLBAD
	private String BLH="";			//�˸�(��)
	private String WNS="";			//����(��)
	//D012	����				TB_SLUDSC
	private String SLUDSP="";		//����λ��(��)
	private String SLUTP="";		//��������
	private String SLUGLCN="";		//������������
	//D013	����ʧ��			TB_HOMLFDSC
	private String POWCUT="";		//ͣ��
	private String HOMLF="";		//���ջ�ʧ��
	private String GSDST="";		//բ�ž�����
	private String MLFCN="";		//ʧ��ʱ����״��
	//D014	բ���ƻ�			TB_GTWRDSC
	private String WRDSC="";		//�ƻ���ʽ
	private String WRQ="";			//ʧ��ʱ����(������/��)
	//D015	����				TB_BRDMDSC
	private String BRDMW="";		//���ӿ��(��)
	private String PJPS="";		//������״
	private String BRZDMCDI="";	//��ˮλ��̶�����(��)
	private String BRV="";			//����ʱ����(��������)
	private String BRDMQ="";		//��������(������/��)
	private String BRDMLDGL="";	//���Ӵ����Ρ���������
	//D016	�㸲				TB_OVTUDSC
	private String OVTUDR="";		//�㸲����
	private String OVTUAG="";		//�㸲�Ƕ�(��)
	//D017	Ӧ������			TB_STREXDSC
	private String MXTNST="";		//�����Ӧ��(ţ/ƽ������)
	private String MXCMST="";		//���ѹӦ��(ţ/ƽ������)
	private String CONGR="";		//���������
	private String ASTR="";		//����Ӧ��ֵ(ţ/ƽ������)
	//D018	̮��				TB_SLIDSC
	private String SLIAR="";		//̮�����(ƽ����)
	private String SLIMS="";		//̮������(������)
	//D019	����				TB_PLUDSC
	private String PLTNM="";		//����������
	private String PLTBU="";		//���������(������)
	//D020	�����ƻ�			TB_BSWRDSC
	private String GRNSPDSC="";	//������©����
	private String GRNUSB="";		//�ݴ������ȳ���(��)
	private String GROVCHWR="";	//���������ƻ�
	
	//D021	���ܹ��ƻ�		TB_EDDWRDSC
	private String APWR="";		//�װ�����
	private String WSTWR="";		//ֹˮ�ƻ�
	//D022		������ˮʧЧ		TB_BSWPLPDS
	private String WPPLU="";		//��ˮ�׶���
	private String WPEQML="";		//��ˮ�豸ʧ��
	//D023	�����ƻ� 			TB_HBWRDSC
	private String WRMS="";//�ƻ�����(������)
	private String LNINF="";//�Գ�����ɵ�Ӱ��
	private String HBGLCN="";//����������
	//D024	�ص����ֲ̾��ƻ�	TB_CLPJPRWR
	
	private String WRD="";			//�ƻ����(��)
	private String WRL="";			//�ƻ�����(��)
	private String WRGLCN="";		//�ƻ����������
	//D025	�ص����̳��		TB_CLPJSCDN
	private String SCDMBU="";		//������(������)
	private String SCDML="";		//��ٳ���(��)
	private String SCDMD="";		//������(��)
	private String SCDMGLCN="";	//��ٴ��������
	
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
		bean.setDNCNO(rs.getString("DNCNO"));		//������
		bean.setPJNO(rs.getString("PJNO"));		//���̱��
		bean.setSTTPCD(rs.getString("STTPCD"));		//���������
		bean.setDAGTM(rs.getString("DAGTM"));		//����ʱ��
		bean.setDNCNM(rs.getString("DNCNM"));		//��������
		if("D004".trim().equals(XQFL)||"D003".trim().equals(XQFL)){
			bean.setLKGTU(rs.getString("LKGTU"));		//©ˮ����	==D004==D003
		}
		if("D006".trim().equals(XQFL)||"D012".trim().equals(XQFL)){
			bean.setSLUPAG(String.valueOf(rs.getFloat("SLUPAG")));		//������Ƕ�(��)	==D006==D012
		}
		if("D007".trim().equals(XQFL)||"D009".trim().equals(XQFL)
				||"D004".trim().equals(XQFL)||"D005".trim().equals(XQFL)){
			bean.setTODFTDI(String.valueOf(rs.getFloat("TODFTDI")));		//��̽ž���(��)	==D007==D009==D003==D004
		}
		if("D009".trim().equals(XQFL)||"D011".trim().equals(XQFL)){
			bean.setWDQ(String.valueOf(rs.getFloat("WDQ")));//�ӵ�����(������/��)	==D011==D009
		}
		if("D001".trim().equals(XQFL)||"D015".trim().equals(XQFL)){
			bean.setDSSPN(String.valueOf(rs.getFloat("DSSPN")));		//�����˿�(��)	==D001==D015
			bean.setINPN(String.valueOf(rs.getFloat("INPN")));		//�����˿�(��)	==D001==D015
			bean.setDTHPN(String.valueOf(rs.getFloat("DTHPN")));		//�����˿�(��)	==D001==D015
			bean.setWRHS(String.valueOf(rs.getFloat("WRHS")));		//��������(��)	==D001==D015
			bean.setCRPDSSAR(String.valueOf(rs.getFloat("CRPDSSAR")));	//ũ�����������(����)	==D001==D015
			bean.setSCDMFMAR(String.valueOf(rs.getFloat("SCDMFMAR")));	//�ٻ��������(����)	==D001==D015
			bean.setDRCECLS(String.valueOf(rs.getFloat("DRCECLS")));		//ֱ�Ӿ�����ʧ(��Ԫ)		==D001==D015
		}
		if("D023".trim().equals(XQFL)||"D024".trim().equals(XQFL)){
			bean.setWRAR(String.valueOf(rs.getFloat("WRAR")));		//�ƻ����(ƽ����)	==D023==D024
		}
		if("D001".trim().equals(XQFL)){
			//D001	����				TB_BURDSC
			bean.setBUW(String.valueOf(rs.getFloat("BUW")));			//���ڿ��(��)
			bean.setBUVL(String.valueOf(rs.getFloat("BUVL")));		//��������(��/��)
			bean.setBUZDF(String.valueOf(rs.getFloat("BUZDF")));		//����ˮͷ��(��)
			bean.setBUQ(String.valueOf(rs.getFloat("BUQ")));			//��������(������/��)
			bean.setBURLDGL(rs.getString("BURLDGL"));		//���ڴ����ε�������
		}
		if("D002".trim().equals(XQFL)){
			//D002	����				TB_OVFLDSC
			bean.setOVFLL(String.valueOf(rs.getFloat("OVFLL")));		//���糤��(��)
			bean.setOVFLZ(String.valueOf(rs.getFloat("OVFLZ")));		//����ˮλ(��)
			bean.setDSQ(String.valueOf(rs.getFloat("DSQ")));			//��������(������/��)
		}
		if("D003".trim().equals(XQFL)){
			//D003	©��				TB_LKDSC
			bean.setLKDMT(String.valueOf(rs.getFloat("LKDMT")));		//©��ֱ��(��)
			bean.setLKQ(String.valueOf(rs.getFloat("LKQ")));			//©������(��/��)
			bean.setLKWTLH(String.valueOf(rs.getFloat("LKWTLH")));		//©��ˮ����(��)
			bean.setLKSAR(String.valueOf(rs.getFloat("LKSAR")));		//���γ�©��Ⱥ���(ƽ����)
		}
		if("D004".trim().equals(XQFL)){
			//D004	��ӿ				TB_PPDSC
			bean.setPPQ(String.valueOf(rs.getFloat("PPQ")));			//��ӿ����(��/��)
			bean.setWTLH(String.valueOf(rs.getFloat("WTLH")));		//ˮ����(��)
			bean.setPPSAR(String.valueOf(rs.getFloat("PPSAR")));		//���γɹ�ӿȺ���(ƽ����)
		}
		if("D005".trim().equals(XQFL)){
			//D005	�ݿ�				TB_PITDSC
			bean.setSBDSP(String.valueOf(rs.getFloat("SBDSP")));		//�ݿ����(��)
			bean.setSBAR(String.valueOf(rs.getFloat("SBAR")));		//�ݿ����(ƽ����)
		}
		if("D006".trim().equals(XQFL)){
			//D006	���� 			TB_SLDSC
			bean.setSLBU(String.valueOf(rs.getFloat("SLBU")));		//�������(������)
		}
		if("D007".trim().equals(XQFL)){
			//D007	��ˢ				TB_UNDSC
			bean.setUNDAR(String.valueOf(rs.getFloat("UNDAR")));		//��ˢ���(ƽ����)
			bean.setUNDD(String.valueOf(rs.getFloat("UNDD")));		//��ˢ���(��)
			bean.setUNDL(String.valueOf(rs.getFloat("UNDL")));		//��ˢ����(��)
		}
		if("D008".trim().equals(XQFL)){
			//D008	�ѷ�				TB_CRDSC
			bean.setCRDR(rs.getString("CRDR"));		//�ѷ췽��
			bean.setCRD(String.valueOf(rs.getFloat("CRD")));			//�ѷ����(��)
			bean.setCRL(String.valueOf(rs.getFloat("CRL")));			//�ѷ쳤��(��)
			bean.setCRW(String.valueOf(rs.getFloat("CRW")));			//�ѷ���(����)
		}
		if("D009".trim().equals(XQFL)){
			//D009	����				TB_CVDSC
			bean.setCVL(String.valueOf(rs.getFloat("CVL")));			//��������(��)
			bean.setCVBU(String.valueOf(rs.getFloat("CVBU")));		//�������(������)
			bean.setRVH(String.valueOf(rs.getFloat("RVH")));			//�Ӱ��߶�(��)
			bean.setFLCNDSC(rs.getString("FLCNDSC"));		//ˮ���������
		}
		if("D010".trim().equals(XQFL)){
			//D010	��ˮ				TB_SPDSC
			bean.setSPAR(String.valueOf(rs.getFloat("SPAR")));		//��ˮ���(ƽ����)
			bean.setSPQ(rs.getString("SPQ"));			//SPQ
		}
		if("D011".trim().equals(XQFL)){
			//D011	 �˿� 			TB_BLBAD
			bean.setBLH(String.valueOf(rs.getFloat("BLH")));			//�˸�(��)
			bean.setWNS(String.valueOf(rs.getFloat("WNS")));			//����(��)
		}
		if("D012".trim().equals(XQFL)){
			//D012	����				TB_SLUDSC
			bean.setSLUDSP(String.valueOf(rs.getFloat("SLUDSP")));		//����λ��(��)
			bean.setSLUTP(rs.getString("SLUTP"));		//��������
			bean.setSLUGLCN(rs.getString("SLUGLCN"));		//������������
		}
		if("D013".trim().equals(XQFL)){
			//D013	����ʧ��			TB_HOMLFDSC
			bean.setPOWCUT(rs.getString("POWCUT"));		//ͣ��
			bean.setHOMLF(rs.getString("HOMLF"));		//���ջ�ʧ��
			bean.setGSDST(rs.getString("GSDST"));		//բ�ž�����
			bean.setMLFCN(rs.getString("MLFCN"));		//ʧ��ʱ����״��
		}
		if("D014".trim().equals(XQFL)){
			//D014	բ���ƻ�			TB_GTWRDSC
			bean.setWRDSC(rs.getString("WRDSC"));		//�ƻ���ʽ
			bean.setWRQ(rs.getString("WRQ"));			//ʧ��ʱ����(������/��)
		}
		if("D015".trim().equals(XQFL)){
			//D015	����				TB_BRDMDSC
			bean.setBRDMW(String.valueOf(rs.getFloat("BRDMW")));		//���ӿ��(��)
			bean.setPJPS(rs.getString("PJPS"));		//������״
			bean.setBRZDMCDI(String.valueOf(rs.getFloat("BRZDMCDI")));	//��ˮλ��̶�����(��)
			bean.setBRV(String.valueOf(rs.getFloat("BRV")));			//����ʱ����(��������)
			bean.setBRDMQ(String.valueOf(rs.getFloat("BRDMQ")));		//��������(������/��)
			bean.setBRDMLDGL(rs.getString("BRDMLDGL"));	//���Ӵ����Ρ���������
		}
		if("D016".trim().equals(XQFL)){
			//D016	�㸲				TB_OVTUDSC
			bean.setOVTUDR(rs.getString("OVTUDR"));		//�㸲����
			bean.setOVTUAG(String.valueOf(rs.getFloat("OVTUAG")));		//�㸲�Ƕ�(��)
		}
		if("D017".trim().equals(XQFL)){
			//D017	Ӧ������			TB_STREXDSC
			bean.setMXTNST(String.valueOf(rs.getFloat("MXTNST")));		//�����Ӧ��(ţ/ƽ������)
			bean.setMXCMST(String.valueOf(rs.getFloat("MXCMST")));		//���ѹӦ��(ţ/ƽ������)
			bean.setCONGR(rs.getString("CONGR"));		//���������
			bean.setASTR(String.valueOf(rs.getFloat("ASTR")));		//����Ӧ��ֵ(ţ/ƽ������)
		}
		if("D018".trim().equals(XQFL)){
			//D018	̮��				TB_SLIDSC
			bean.setSLIAR(String.valueOf(rs.getFloat("SLIAR")));		//̮�����(ƽ����)
			bean.setSLIMS(String.valueOf(rs.getFloat("SLIMS")));		//̮������(������)
		}
		if("D019".trim().equals(XQFL)){
			//D019	����				TB_PLUDSC
			bean.setPLTNM(rs.getString("PLTNM"));		//����������
			bean.setPLTBU(String.valueOf(rs.getFloat("PLTBU")));		//���������(������)
		}
		if("D020".trim().equals(XQFL)){
			//D020	�����ƻ�			TB_BSWRDSC
			bean.setGRNSPDSC(rs.getString("GRNSPDSC"));	//������©����
			bean.setGRNUSB(String.valueOf(rs.getFloat("GRNUSB")));		//�ݴ������ȳ���(��)
			bean.setGROVCHWR(rs.getString("GROVCHWR"));	//���������ƻ�
		}
		if("D021".trim().equals(XQFL)){
			//D021	���ܹ��ƻ�		TB_EDDWRDSC
			bean.setAPWR(rs.getString("APWR"));		//�װ�����
			bean.setWSTWR(rs.getString("WSTWR"));		//ֹˮ�ƻ�
		}
		if("D022".trim().equals(XQFL)){
			//D022		������ˮʧЧ		TB_BSWPLPDS
			bean.setWPPLU(rs.getString("WPPLU"));		//��ˮ�׶���
			bean.setWPEQML(rs.getString("WPEQML"));		//��ˮ�豸ʧ��
		}
		if("D023".trim().equals(XQFL)){
			//D023	�����ƻ� 			TB_HBWRDSC
			bean.setWRMS(String.valueOf(rs.getFloat("WRMS")));//�ƻ�����(������)
			bean.setLNINF(rs.getString("LNINF"));//�Գ�����ɵ�Ӱ��
			bean.setHBGLCN(rs.getString("HBGLCN"));//����������
		}
		if("D024".trim().equals(XQFL)){
			//D024	�ص����ֲ̾��ƻ�	TB_CLPJPRWR
			bean.setWRD(String.valueOf(rs.getFloat("WRD")));			//�ƻ����(��)
			bean.setWRL(String.valueOf(rs.getFloat("WRL")));			//�ƻ�����(��)
			bean.setWRGLCN(rs.getString("WRGLCN"));		//�ƻ����������
		}
		if("D025".trim().equals(XQFL)){
			//D025	�ص����̳��		TB_CLPJSCDN
			bean.setSCDMBU(String.valueOf(rs.getFloat("SCDMBU")));		//������(������)
			bean.setSCDML(String.valueOf(rs.getFloat("SCDML")));		//��ٳ���(��)
			bean.setSCDMD(String.valueOf(rs.getFloat("SCDMD")));		//������(��)
			bean.setSCDMGLCN(rs.getString("SCDMGLCN"));	//��ٴ��������
		}
		}catch(Exception ex){
			ex.printStackTrace();
			}
		return bean;
	}
	
}
