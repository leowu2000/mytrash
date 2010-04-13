package com.util;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LysxBean {
	private String CTCD="";
	private String CTNM="";
	private String NT="";
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
	public static LysxBean getTbcntBeanFromRs(ResultSet rs)throws SQLException{
		LysxBean bean = new LysxBean();
		bean.setCTCD(rs.getString("CTCD"));
		bean.setCTNM(rs.getString("CTNM"));
		bean.setNT(rs.getString("NT"));
		
		return bean;
		
	}
	
}
