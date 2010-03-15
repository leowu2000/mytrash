package com.buiness.form;

import java.sql.ResultSet;

public class PjrDetailBean {
	
	private String PJRNO="";		//运行编号
	private String PJNO="";			//工程编号
	private String DTCDT="";		//检测时间
	private String PJNM="";			//工程名称
	
	//TB_RSR	水库	B
	private String RSCLS="";			//水库类别(良好/尚好/病险库)
	private String RV="";			//当前库容(万立方米)
	private String RZ="";			//z当前运行水位(米)========TB_RSR===TB_DKR
	private String RQ="";			//当前泻量(立方米/秒)========TB_RSR===TB_DKR
	private String DFPFCN="坝基完好状况:";			//坝基完好状况
	private String DBSTBCN="坝体稳定情况:";			//坝体稳定情况
	private String BRBPPFCN="护坡护岸完好状况:";			//护坡护岸稳定情况========TB_RSR===TB_DKR
	private String ESPFCN="泄水建筑物状况:";			//泄水建筑物完好状况
	private String EDDPFCN="消能工完好状况:";			//消能工完好状况==========TB_RSR===TB_WLR
	private String GTHOPFCN="闸门、启闭机状况:";			//闸门、启闭机完好状况====TB_RSR===TB_WLR
	private String COMMCN="通讯手段及状况:";			//通讯手段及状况==========TB_RSR===TB_WLR
	//TB_WLR 	水闸	K
	private String WLGR="";			 //水闸等别(一/二/三/四/五)
	private String RUPGZ="";			//当前闸上水位(米)
	private String RDWGZ="";			//当前闸下水位(米)
	private String RQO="";			//当前过闸流量(立方米/秒)
	private String RWSTOWLT="";			//当前水面距闸顶距离(米)
	private String GFPFCN="坝基状况:";			//坝基完好状况
	private String STPFCN="建筑物状况:";			//建筑物完好状况
	//TB_COWAPJ 治河工程	N
	private String BKOT="";			//所在岸别(左/右)======TB_DKR====TB_COWAPJ===TB_STOFLER
	private String FLCNDSC="水流情况状况:";			//水流情况描述
	private String WDCNDSC="河道情况状况:";			//河道情况描述
	private String PRCCLR="清障状况:";			//清障的落实
	private String SPURDSC="控导工程状况:";			//控导工程描述
	private String BPPJCN="护岸工程状况:";			//护岸工程情况
	//TB_STOFLER	蓄滞	F
	private String DSFLWZ="";			//设计行(蓄)洪水位(米)
	private String DSFLW="";			//设计行(蓄)洪量(万立方米)
	private String TRFCN="人员转移情况:";			//交通状况
	private String DKCN="圩堤状况:";				//圩堤状况
	private String CWFCCN="通讯预警设施状况:";			//通讯预警设施状况
	private String SFSRCN="避水救生设施状况:";			//避水救生设施状况
	private String FLFADSC="分洪设施状况:";			//分洪设施状况
	private String IDSTCN="退水设施状况:";			//排水站状况
	//TB_DKR	堤防==海堤==圩垸==穿堤
	private String DKGR="";			//堤防级别(1/2/3/4/5)
	private String STECH="";			//起止桩号
	private String WSTODC="";			//水面距堤顶距离(米)
	private String DKPFCN="堤防完好状况:";			//堤防完好状况
	private String TSCN="穿堤建筑物状况:";				//穿堤建筑物状况
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
			bean.setPJRNO(rs.getString("PJRNO"));	//运行编号
			bean.setPJNO(rs.getString("PJNO"));	//工程编号
			bean.setDTCDT(rs.getString("DTCDT"));	//检测时间
			bean.setPJNM(rs.getString("PJNM"));	//工程名称
			if("B".trim().equals(GCFL)
					||"D".trim().equals(GCFL)
					||"E".trim().equals(GCFL)
					||"H".trim().equals(GCFL)
					||"P".trim().equals(GCFL)){
				bean.setRZ(rs.getString("RZ"));	//z当前运行水位(米)========TB_RSR===TB_DKR
				bean.setRQ(rs.getString("RQ"));	//当前泻量(立方米/秒)========TB_RSR===TB_DKR
				bean.setBRBPPFCN(rs.getString("BRBPPFCN"));	//护坡护岸稳定情况========TB_RSR===TB_DKR
			}
			if("B".trim().equals(GCFL)||"K".trim().equals(GCFL)){
				bean.setEDDPFCN(rs.getString("EDDPFCN"));	//消能工完好状况==========TB_RSR===TB_WLR
				bean.setGTHOPFCN(rs.getString("GTHOPFCN"));	//闸门、启闭机完好状况====TB_RSR===TB_WLR
				bean.setCOMMCN(rs.getString("COMMCN"));	//通讯手段及状况==========TB_RSR===TB_WLR
			}
			if("N".trim().equals(GCFL)||"F".trim().equals(GCFL)){
				bean.setBKOT(rs.getString("BKOT"));	//所在岸别(左/右)======TB_DKR====TB_COWAPJ===TB_STOFLER
			}
			if("B".trim().equals(GCFL)){
				//TB_RSR=水库=B
				bean.setRSCLS(rs.getString("RSCLS"));	//水库类别(良好/尚好/病险库)
				bean.setRV(rs.getString("RV"));	//当前库容(万立方米)
				bean.setDFPFCN(rs.getString("DFPFCN"));	//坝基完好状况
				bean.setDBSTBCN(rs.getString("DBSTBCN"));	//坝体稳定情况
				bean.setESPFCN(rs.getString("ESPFCN"));	//泄水建筑物完好状况
				
			}
			if("K".trim().equals(GCFL)){
				//TB_WLR=水闸=K
				bean.setWLGR(rs.getString("WLGR")); //水闸等别(一/二/三/四/五)
				bean.setRUPGZ(rs.getString("RUPGZ"));	//当前闸上水位(米)
				bean.setRDWGZ(rs.getString("RDWGZ"));	//当前闸下水位(米)
				bean.setRQO(rs.getString("RQO"));	//当前过闸流量(立方米/秒)
				bean.setRWSTOWLT(rs.getString("RWSTOWLT"));	//当前水面距闸顶距离(米)
				bean.setGFPFCN(rs.getString("GFPFCN"));	//坝基完好状况
				bean.setSTPFCN(rs.getString("STPFCN"));	//建筑物完好状况
			}
			if("N".trim().equals(GCFL)){
				//TB_COWAPJ=治河工程=N
				bean.setFLCNDSC(rs.getString("FLCNDSC"));	//水流情况描述
				bean.setWDCNDSC(rs.getString("WDCNDSC"));	//河道情况描述
				bean.setPRCCLR(rs.getString("PRCCLR"));	//清障的落实
				bean.setSPURDSC(rs.getString("SPURDSC"));	//控导工程描述
				bean.setBPPJCN(rs.getString("BPPJCN"));	//护岸工程情况
			}
			if("F".trim().equals(GCFL)){
				//TB_STOFLER=蓄滞=F
				bean.setDSFLWZ(rs.getString("DSFLWZ"));	//设计行(蓄)洪水位(米)
				bean.setDSFLW(rs.getString("DSFLW"));	//设计行(蓄)洪量(万立方米)
				bean.setTRFCN(rs.getString("TRFCN"));	//交通状况
				bean.setDKCN(rs.getString("DKCN"));	//圩堤状况
				bean.setCWFCCN(rs.getString("CWFCCN"));	//通讯预警设施状况
				bean.setSFSRCN(rs.getString("SFSRCN"));	//避水救生设施状况
				bean.setFLFADSC(rs.getString("FLFADSC"));	//分洪设施状况
				bean.setIDSTCN(rs.getString("IDSTCN"));	//排水站状况
			}
			if("D".trim().equals(GCFL)
					||"E".trim().equals(GCFL)
					||"H".trim().equals(GCFL)
					||"P".trim().equals(GCFL)||"A".trim().equals(GCFL)){
				//TB_DKR=堤防==海堤==圩垸==穿堤
				bean.setBKOT(rs.getString("BKOT"));
				bean.setDKGR(rs.getString("DKGR"));	//堤防级别(1/2/3/4/5)
				bean.setSTECH(rs.getString("STECH"));	//起止桩号
				bean.setWSTODC(rs.getString("WSTODC"));	//水面距堤顶距离(米)
				bean.setDKPFCN(rs.getString("DKPFCN"));	//堤防完好状况
				bean.setTSCN(rs.getString("TSCN"));	//穿堤建筑物状况
			}

		}catch(Exception ex){
			ex.printStackTrace();
		}
		return bean;
	}
}
