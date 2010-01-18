package com.buiness.form;

import java.sql.ResultSet;

public class PrjBean {
	private String PJNMCD = ""; // ���̴���
	private String PJNM = ""; // ��������
	private String CNTCD = ""; // ������������
	private String FPDUTY = ""; // ��Ѵ������
	private String FPDUTYPH = ""; // ��Ѵ�����˵绰

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
			bean.setCNTCD(rs.getString("CNTCD"));
			bean.setFPDUTY(rs.getString("FPDUTY"));
			bean.setFPDUTYPH(rs.getString("FPDUTYPH"));
			bean.setPJNM(rs.getString("PJNM"));
			bean.setPJNMCD(rs.getString("PJNMCD"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return bean;

	}

}
