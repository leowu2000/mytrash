package com.buiness.form;

import java.sql.ResultSet;

public class PjrDetailBean {
	
	private String PJRNO="";		//���б��
	private String PJNO="";			//���̱��
	private String DTCDT="";		//���ʱ��
	private String PJNM="";			//��������
	
	//TB_RSR	ˮ��	B
	private String RSCLS="";			//ˮ�����(����/�к�/���տ�)
	private String RV="";			//��ǰ����(��������)
	private String RZ="";			//z��ǰ����ˮλ(��)========TB_RSR===TB_DKR
	private String RQ="";			//��ǰк��(������/��)========TB_RSR===TB_DKR
	private String DFPFCN="�ӻ����״��:";			//�ӻ����״��
	private String DBSTBCN="�����ȶ����:";			//�����ȶ����
	private String BRBPPFCN="���»������״��:";			//���»����ȶ����========TB_RSR===TB_DKR
	private String ESPFCN="йˮ������״��:";			//йˮ���������״��
	private String EDDPFCN="���ܹ����״��:";			//���ܹ����״��==========TB_RSR===TB_WLR
	private String GTHOPFCN="բ�š����ջ�״��:";			//բ�š����ջ����״��====TB_RSR===TB_WLR
	private String COMMCN="ͨѶ�ֶμ�״��:";			//ͨѶ�ֶμ�״��==========TB_RSR===TB_WLR
	//TB_WLR 	ˮբ	K
	private String WLGR="";			 //ˮբ�ȱ�(һ/��/��/��/��)
	private String RUPGZ="";			//��ǰբ��ˮλ(��)
	private String RDWGZ="";			//��ǰբ��ˮλ(��)
	private String RQO="";			//��ǰ��բ����(������/��)
	private String RWSTOWLT="";			//��ǰˮ���բ������(��)
	private String GFPFCN="�ӻ�״��:";			//�ӻ����״��
	private String STPFCN="������״��:";			//���������״��
	//TB_COWAPJ �κӹ���	N
	private String BKOT="";			//���ڰ���(��/��)======TB_DKR====TB_COWAPJ===TB_STOFLER
	private String FLCNDSC="ˮ�����״��:";			//ˮ���������
	private String WDCNDSC="�ӵ����״��:";			//�ӵ��������
	private String PRCCLR="����״��:";			//���ϵ���ʵ
	private String SPURDSC="�ص�����״��:";			//�ص���������
	private String BPPJCN="��������״��:";			//�����������
	//TB_STOFLER	����	F
	private String DSFLWZ="";			//�����(��)��ˮλ(��)
	private String DSFLW="";			//�����(��)����(��������)
	private String TRFCN="��Աת�����:";			//��ͨ״��
	private String DKCN="�׵�״��:";				//�׵�״��
	private String CWFCCN="ͨѶԤ����ʩ״��:";			//ͨѶԤ����ʩ״��
	private String SFSRCN="��ˮ������ʩ״��:";			//��ˮ������ʩ״��
	private String FLFADSC="�ֺ���ʩ״��:";			//�ֺ���ʩ״��
	private String IDSTCN="��ˮ��ʩ״��:";			//��ˮվ״��
	//TB_DKR	�̷�==����==����==����
	private String DKGR="";			//�̷�����(1/2/3/4/5)
	private String STECH="";			//��ֹ׮��
	private String WSTODC="";			//ˮ���̶�����(��)
	private String DKPFCN="�̷����״��:";			//�̷����״��
	private String TSCN="���̽�����״��:";				//���̽�����״��
	public String getPJRNO() {
		return PJRNO;
	}
	public void setPJRNO(String pJRNO) {
		PJRNO = pJRNO;
	}
	public String getPJNO() {
		return PJNO;
	}
	public void setPJNO(String pJNO) {
		PJNO = pJNO;
	}
	public String getDTCDT() {
		return DTCDT;
	}
	public void setDTCDT(String dTCDT) {
		DTCDT = dTCDT;
	}
	public String getPJNM() {
		return PJNM;
	}
	public void setPJNM(String pJNM) {
		PJNM = pJNM;
	}
	public String getRSCLS() {
		return RSCLS;
	}
	public void setRSCLS(String rSCLS) {
		RSCLS = rSCLS;
	}
	public String getRV() {
		return RV;
	}
	public void setRV(String rV) {
		RV = rV;
	}
	public String getRZ() {
		return RZ;
	}
	public void setRZ(String rZ) {
		RZ = rZ;
	}
	public String getRQ() {
		return RQ;
	}
	public void setRQ(String rQ) {
		RQ = rQ;
	}
	public String getDFPFCN() {
		return DFPFCN;
	}
	public void setDFPFCN(String dFPFCN) {
		DFPFCN = dFPFCN;
	}
	public String getDBSTBCN() {
		return DBSTBCN;
	}
	public void setDBSTBCN(String dBSTBCN) {
		DBSTBCN = dBSTBCN;
	}
	public String getBRBPPFCN() {
		return BRBPPFCN;
	}
	public void setBRBPPFCN(String bRBPPFCN) {
		BRBPPFCN = bRBPPFCN;
	}
	public String getESPFCN() {
		return ESPFCN;
	}
	public void setESPFCN(String eSPFCN) {
		ESPFCN = eSPFCN;
	}
	public String getEDDPFCN() {
		return EDDPFCN;
	}
	public void setEDDPFCN(String eDDPFCN) {
		EDDPFCN = eDDPFCN;
	}
	public String getGTHOPFCN() {
		return GTHOPFCN;
	}
	public void setGTHOPFCN(String gTHOPFCN) {
		GTHOPFCN = gTHOPFCN;
	}
	public String getCOMMCN() {
		return COMMCN;
	}
	public void setCOMMCN(String cOMMCN) {
		COMMCN = cOMMCN;
	}
	public String getWLGR() {
		return WLGR;
	}
	public void setWLGR(String wLGR) {
		WLGR = wLGR;
	}
	public String getRUPGZ() {
		return RUPGZ;
	}
	public void setRUPGZ(String rUPGZ) {
		RUPGZ = rUPGZ;
	}
	public String getRDWGZ() {
		return RDWGZ;
	}
	public void setRDWGZ(String rDWGZ) {
		RDWGZ = rDWGZ;
	}
	public String getRQO() {
		return RQO;
	}
	public void setRQO(String rQO) {
		RQO = rQO;
	}
	public String getRWSTOWLT() {
		return RWSTOWLT;
	}
	public void setRWSTOWLT(String rWSTOWLT) {
		RWSTOWLT = rWSTOWLT;
	}
	public String getGFPFCN() {
		return GFPFCN;
	}
	public void setGFPFCN(String gFPFCN) {
		GFPFCN = gFPFCN;
	}
	public String getSTPFCN() {
		return STPFCN;
	}
	public void setSTPFCN(String sTPFCN) {
		STPFCN = sTPFCN;
	}
	public String getBKOT() {
		return BKOT;
	}
	public void setBKOT(String bKOT) {
		BKOT = bKOT;
	}
	public String getFLCNDSC() {
		return FLCNDSC;
	}
	public void setFLCNDSC(String fLCNDSC) {
		FLCNDSC = fLCNDSC;
	}
	public String getWDCNDSC() {
		return WDCNDSC;
	}
	public void setWDCNDSC(String wDCNDSC) {
		WDCNDSC = wDCNDSC;
	}
	public String getPRCCLR() {
		return PRCCLR;
	}
	public void setPRCCLR(String pRCCLR) {
		PRCCLR = pRCCLR;
	}
	public String getSPURDSC() {
		return SPURDSC;
	}
	public void setSPURDSC(String sPURDSC) {
		SPURDSC = sPURDSC;
	}
	public String getBPPJCN() {
		return BPPJCN;
	}
	public void setBPPJCN(String bPPJCN) {
		BPPJCN = bPPJCN;
	}
	public String getDSFLWZ() {
		return DSFLWZ;
	}
	public void setDSFLWZ(String dSFLWZ) {
		DSFLWZ = dSFLWZ;
	}
	public String getDSFLW() {
		return DSFLW;
	}
	public void setDSFLW(String dSFLW) {
		DSFLW = dSFLW;
	}
	public String getTRFCN() {
		return TRFCN;
	}
	public void setTRFCN(String tRFCN) {
		TRFCN = tRFCN;
	}
	public String getDKCN() {
		return DKCN;
	}
	public void setDKCN(String dKCN) {
		DKCN = dKCN;
	}
	public String getCWFCCN() {
		return CWFCCN;
	}
	public void setCWFCCN(String cWFCCN) {
		CWFCCN = cWFCCN;
	}
	public String getSFSRCN() {
		return SFSRCN;
	}
	public void setSFSRCN(String sFSRCN) {
		SFSRCN = sFSRCN;
	}
	public String getFLFADSC() {
		return FLFADSC;
	}
	public void setFLFADSC(String fLFADSC) {
		FLFADSC = fLFADSC;
	}
	public String getIDSTCN() {
		return IDSTCN;
	}
	public void setIDSTCN(String iDSTCN) {
		IDSTCN = iDSTCN;
	}
	public String getDKGR() {
		return DKGR;
	}
	public void setDKGR(String dKGR) {
		DKGR = dKGR;
	}
	public String getSTECH() {
		return STECH;
	}
	public void setSTECH(String sTECH) {
		STECH = sTECH;
	}
	public String getWSTODC() {
		return WSTODC;
	}
	public void setWSTODC(String wSTODC) {
		WSTODC = wSTODC;
	}
	public String getDKPFCN() {
		return DKPFCN;
	}
	public void setDKPFCN(String dKPFCN) {
		DKPFCN = dKPFCN;
	}
	public String getTSCN() {
		return TSCN;
	}
	public void setTSCN(String tSCN) {
		TSCN = tSCN;
	}
	
	public static PjrDetailBean getPjrDetailBeanFromRs(ResultSet rs,String GCFL){
		PjrDetailBean bean = new PjrDetailBean();
		try{
			bean.setPJRNO(rs.getString("PJRNO"));	//���б��
			bean.setPJNO(rs.getString("PJNO"));	//���̱��
			bean.setDTCDT(rs.getString("DTCDT"));	//���ʱ��
			bean.setPJNM(rs.getString("PJNM"));	//��������
			if("B".trim().equals(GCFL)
					||"D".trim().equals(GCFL)
					||"E".trim().equals(GCFL)
					||"H".trim().equals(GCFL)
					||"P".trim().equals(GCFL)){
				bean.setRZ(rs.getString("RZ"));	//z��ǰ����ˮλ(��)========TB_RSR===TB_DKR
				bean.setRQ(rs.getString("RQ"));	//��ǰк��(������/��)========TB_RSR===TB_DKR
				bean.setBRBPPFCN(rs.getString("BRBPPFCN"));	//���»����ȶ����========TB_RSR===TB_DKR
			}
			if("B".trim().equals(GCFL)||"K".trim().equals(GCFL)){
				bean.setEDDPFCN(rs.getString("EDDPFCN"));	//���ܹ����״��==========TB_RSR===TB_WLR
				bean.setGTHOPFCN(rs.getString("GTHOPFCN"));	//բ�š����ջ����״��====TB_RSR===TB_WLR
				bean.setCOMMCN(rs.getString("COMMCN"));	//ͨѶ�ֶμ�״��==========TB_RSR===TB_WLR
			}
			if("N".trim().equals(GCFL)||"F".trim().equals(GCFL)){
				bean.setBKOT(rs.getString("BKOT"));	//���ڰ���(��/��)======TB_DKR====TB_COWAPJ===TB_STOFLER
			}
			if("B".trim().equals(GCFL)){
				//TB_RSR=ˮ��=B
				bean.setRSCLS(rs.getString("RSCLS"));	//ˮ�����(����/�к�/���տ�)
				bean.setRV(rs.getString("RV"));	//��ǰ����(��������)
				bean.setDFPFCN(rs.getString("DFPFCN"));	//�ӻ����״��
				bean.setDBSTBCN(rs.getString("DBSTBCN"));	//�����ȶ����
				bean.setESPFCN(rs.getString("ESPFCN"));	//йˮ���������״��
				
			}
			if("K".trim().equals(GCFL)){
				//TB_WLR=ˮբ=K
				bean.setWLGR(rs.getString("WLGR")); //ˮբ�ȱ�(һ/��/��/��/��)
				bean.setRUPGZ(rs.getString("RUPGZ"));	//��ǰբ��ˮλ(��)
				bean.setRDWGZ(rs.getString("RDWGZ"));	//��ǰբ��ˮλ(��)
				bean.setRQO(rs.getString("RQO"));	//��ǰ��բ����(������/��)
				bean.setRWSTOWLT(rs.getString("RWSTOWLT"));	//��ǰˮ���բ������(��)
				bean.setGFPFCN(rs.getString("GFPFCN"));	//�ӻ����״��
				bean.setSTPFCN(rs.getString("STPFCN"));	//���������״��
			}
			if("N".trim().equals(GCFL)){
				//TB_COWAPJ=�κӹ���=N
				bean.setFLCNDSC(rs.getString("FLCNDSC"));	//ˮ���������
				bean.setWDCNDSC(rs.getString("WDCNDSC"));	//�ӵ��������
				bean.setPRCCLR(rs.getString("PRCCLR"));	//���ϵ���ʵ
				bean.setSPURDSC(rs.getString("SPURDSC"));	//�ص���������
				bean.setBPPJCN(rs.getString("BPPJCN"));	//�����������
			}
			if("F".trim().equals(GCFL)){
				//TB_STOFLER=����=F
				bean.setDSFLWZ(rs.getString("DSFLWZ"));	//�����(��)��ˮλ(��)
				bean.setDSFLW(rs.getString("DSFLW"));	//�����(��)����(��������)
				bean.setTRFCN(rs.getString("TRFCN"));	//��ͨ״��
				bean.setDKCN(rs.getString("DKCN"));	//�׵�״��
				bean.setCWFCCN(rs.getString("CWFCCN"));	//ͨѶԤ����ʩ״��
				bean.setSFSRCN(rs.getString("SFSRCN"));	//��ˮ������ʩ״��
				bean.setFLFADSC(rs.getString("FLFADSC"));	//�ֺ���ʩ״��
				bean.setIDSTCN(rs.getString("IDSTCN"));	//��ˮվ״��
			}
			if("D".trim().equals(GCFL)
					||"E".trim().equals(GCFL)
					||"H".trim().equals(GCFL)
					||"P".trim().equals(GCFL)||"A".trim().equals(GCFL)){
				//TB_DKR=�̷�==����==����==����
				bean.setBKOT(rs.getString("BKOT"));
				bean.setDKGR(rs.getString("DKGR"));	//�̷�����(1/2/3/4/5)
				bean.setSTECH(rs.getString("STECH"));	//��ֹ׮��
				bean.setWSTODC(rs.getString("WSTODC"));	//ˮ���̶�����(��)
				bean.setDKPFCN(rs.getString("DKPFCN"));	//�̷����״��
				bean.setTSCN(rs.getString("TSCN"));	//���̽�����״��
			}

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return bean;
	}
}
