package com.util;

import java.sql.ResultSet;
import java.sql.SQLException;

public class GclbBean {
	private String GCFLDM="";
	private String GCFLMC="";
	public String getGCFLDM() {
		return GCFLDM;
	}
	public void setGCFLDM(String gCFLDM) {
		GCFLDM = gCFLDM;
	}
	public String getGCFLMC() {
		return GCFLMC;
	}
	public void setGCFLMC(String gCFLMC) {
		GCFLMC = gCFLMC;
	}
	
	public static GclbBean getTbcntBeanFromRs(ResultSet rs)throws SQLException{
		GclbBean bean = new GclbBean();
		bean.setGCFLDM(rs.getString("GCFLDM"));
		bean.setGCFLMC(rs.getString("GCFLMC"));
		
		return bean;
		
	}
}
