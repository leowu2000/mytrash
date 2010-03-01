package com.buiness.form;

import java.sql.ResultSet;

public class RSRBean {
	private String PJRNO;							// 运行编号
	private String PJNO;							// 工程编号
	private String DTCDT;							// 检测时间
	private String PJNM;							// 工程名称
	private String RSCLS;							// 水库类别(良好/尚好/病险库)
	private String RV;								// 当前库容(万立方米)
	private String RZ;								// 当前运行水位(米)
	private String RQ;								// 当前泻量(立方米/秒)
	private String DFPFCN="坝基完好状况：";			// 坝基完好状况
	private String DBSTBCN="坝体稳定情况：";			// 坝体稳定情况
	private String BRBPPFCN="护坡护岸稳定情况：";		// 护坡护岸稳定情况
	private String ESPFCN="泄水建筑物完好状况：";		// 泄水建筑物完好状况
	private String EDDPFCN="消能工完好状况：";			// 消能工完好状况
	private String GTHOPFCN="闸门、启闭机完好状况：";	// 闸门、启闭机完好状况
	private String COMMCN="通讯手段及状况：";			// 通讯手段及状况

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

	public static RSRBean getPJRCNBeanFromRs(ResultSet rs){
		RSRBean bean = new RSRBean();
		try{
			bean.setPJRNO(rs.getString("PJRNO"));//运行编号
			bean.setPJNO(rs.getString("PJNO"));//工程编号
			bean.setDTCDT(rs.getString("DTCDT"));//检测时间
			bean.setPJNM(rs.getString("PJNM"));//工程名称
			bean.setRSCLS(rs.getString("RSCLS"));//水库类别(良好/尚好/病险库)
			bean.setRV(rs.getString("RV"));//当前库容(万立方米)
			bean.setRZ(rs.getString("RZ"));//当前运行水位(米)
			bean.setRQ(rs.getString("RQ"));//当前泻量(立方米/秒)
			bean.setDFPFCN(rs.getString("DFPFCN"));//坝基完好状况
			bean.setDBSTBCN(rs.getString("DBSTBCN"));//坝体稳定情况
			bean.setBRBPPFCN(rs.getString("BRBPPFCN"));//护坡护岸稳定情况
			bean.setESPFCN(rs.getString("ESPFCN"));//泄水建筑物完好状况
			bean.setEDDPFCN(rs.getString("EDDPFCN"));//消能工完好状况
			bean.setGTHOPFCN(rs.getString("GTHOPFCN"));//闸门、启闭机完好状况
			bean.setCOMMCN(rs.getString("COMMCN"));//通讯手段及状况
		}catch(Exception ex){
			ex.printStackTrace();
		}
	return bean;
	}
}
