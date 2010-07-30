package com.buiness.form;

import java.sql.ResultSet;

public class PrjBean {
	private String PJNO = "";//工程流水号
	private String PJNMCD = ""; // 工程代码
	private String PJNM = ""; // 工程名称
	private String CNTCD = ""; // 行政区划代码
	private String FPDUTY = ""; // 防汛责任人
	private String FPDUTYPH = ""; // 防汛责任人电话
	private String TYPE="";
	
	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}

	public String getPJNO() {
		return PJNO;
	}

	public void setPJNO(String pJNO) {
		PJNO = pJNO;
	}

	public String getPJNMCD() {
		return PJNMCD;
	}

	public void setPJNMCD(String pJNMCD) {
		PJNMCD = pJNMCD;
	}

	public String getPJNM() {
		return PJNM;
	}

	public void setPJNM(String pJNM) {
		PJNM = pJNM;
	}

	public String getCNTCD() {
		return CNTCD;
	}

	public void setCNTCD(String cNTCD) {
		CNTCD = cNTCD;
	}

	public String getFPDUTY() {
		return FPDUTY;
	}

	public void setFPDUTY(String fPDUTY) {
		FPDUTY = fPDUTY;
	}

	public String getFPDUTYPH() {
		return FPDUTYPH;
	}

	public void setFPDUTYPH(String fPDUTYPH) {
		FPDUTYPH = fPDUTYPH;
	}

	public static PrjBean getPrjBeanFromRs(ResultSet rs) {
		PrjBean bean = new PrjBean();
		try {
			bean.setPJNO(String.valueOf(rs.getInt("PJNO")));
			bean.setCNTCD(rs.getString("CNTCD"));
			bean.setFPDUTY(rs.getString("FPDUTY"));
			bean.setFPDUTYPH(rs.getString("FPDUTYPH"));
			bean.setPJNM(rs.getString("PJNM"));
			bean.setPJNMCD(rs.getString("PJNMCD"));
			bean.setTYPE(rs.getString("TYPE"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return bean;

	}

}
