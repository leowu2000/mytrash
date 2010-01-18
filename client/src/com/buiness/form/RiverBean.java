package com.buiness.form;

import java.sql.ResultSet;

public class RiverBean {
	private String CTCD = "";//河流代码
	private String CTNM = "";//河流名称
	private String NT = "";
	public String getCTCD() {
		return CTCD;
	}
	public void setCTCD(String cTCD) {
		CTCD = cTCD;
	}
	public String getCTNM() {
		return CTNM;
	}
	public void setCTNM(String cTNM) {
		CTNM = cTNM;
	}
	public String getNT() {
		return NT;
	}
	public void setNT(String nT) {
		NT = nT;
	}
	
	public static RiverBean getRiverBeanFormRs(ResultSet rs){
		RiverBean bean = new RiverBean();
		try {
			bean.setCTCD(rs.getString("CTCD"));
			bean.setCTNM(rs.getString("CTNM"));
			bean.setNT(rs.getString("NT"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return bean;
	}
}
