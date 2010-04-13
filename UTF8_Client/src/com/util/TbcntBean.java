package com.util;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TbcntBean {

	private String cntcd="";
	private String provnm="";
	public String getCntcd() {
		return cntcd;
	}
	public void setCntcd(String cntcd) {
		this.cntcd = cntcd;
	}
	public String getProvnm() {
		return provnm;
	}
	public void setProvnm(String provnm) {
		this.provnm = provnm;
	}
	
	public static TbcntBean getTbcntBeanFromRs(ResultSet rs)throws SQLException{
		TbcntBean bean = new TbcntBean();
		bean.setCntcd(rs.getString("cntcd"));
		bean.setProvnm(rs.getString("provnm"));
		
		return bean;
		
	}
}
