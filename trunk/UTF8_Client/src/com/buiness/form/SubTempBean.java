package com.buiness.form;

import java.sql.ResultSet;

public class SubTempBean {
	private String ZLBM;
	private String RARENTNO;
	private String DTCDT;
	private String TITLE;
	private String WJGS;
	private String NRMS;
	private String LXZP;
	private String TBNO;
	private String TEMPNAME;

	public String getTEMPNAME() {
		return TEMPNAME;
	}

	public void setTEMPNAME(String tEMPNAME) {
		TEMPNAME = tEMPNAME;
	}

	public String getZLBM() {
		return ZLBM;
	}

	public void setZLBM(String zLBM) {
		ZLBM = zLBM;
	}

	public String getRARENTNO() {
		return RARENTNO;
	}

	public void setRARENTNO(String rARENTNO) {
		RARENTNO = rARENTNO;
	}

	public String getDTCDT() {
		return DTCDT;
	}

	public void setDTCDT(String dTCDT) {
		DTCDT = dTCDT;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	public String getWJGS() {
		return WJGS;
	}

	public void setWJGS(String wJGS) {
		WJGS = wJGS;
	}

	public String getNRMS() {
		return NRMS;
	}

	public void setNRMS(String nRMS) {
		NRMS = nRMS;
	}

	public String getLXZP() {
		return LXZP;
	}

	public void setLXZP(String lXZP) {
		LXZP = lXZP;
	}

	public String getTBNO() {
		return TBNO;
	}

	public void setTBNO(String tBNO) {
		TBNO = tBNO;
	}

	public static SubTempBean getSubTempBeanFromRs(ResultSet rs) {
		SubTempBean bean = new SubTempBean();
		try {
			bean.setZLBM(String.valueOf(rs.getInt("ZLBM")));
			bean.setRARENTNO(String.valueOf(rs.getInt("RARENTNO")));
			bean.setDTCDT(rs.getString("DTCDT"));
			bean.setTITLE(rs.getString("TITLE"));
			bean.setWJGS(rs.getString("WJGS"));
			bean.setNRMS(rs.getString("NRMS"));
			bean.setLXZP(rs.getString("LXZP"));
			bean.setTBNO(rs.getString("TBNO"));
			//bean.setTEMPNAME(rs.getString("TEMPNAME"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return bean;
	}
}
