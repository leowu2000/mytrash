package com.buiness.form;

import java.sql.ResultSet;

public class FPACTIBean {
	//TB_FPACTI
	//TB_FPACTI_M
	private String RPJINCD;		//行动编号
	private String WTTT;		//填报标题
	private String WTDT;		//填报时间
	private String ACTICO;		//防汛行动内容
	private String WTDPCD;		//填报单位名称
	
	public String getRPJINCD() {
		return RPJINCD;
	}
	public void setRPJINCD(String rPJINCD) {
		RPJINCD = rPJINCD;
	}
	public String getWTTT() {
		return WTTT;
	}
	public void setWTTT(String wTTT) {
		WTTT = wTTT;
	}
	public String getWTDT() {
		return WTDT;
	}
	public void setWTDT(String wTDT) {
		WTDT = wTDT;
	}
	public String getACTICO() {
		return ACTICO;
	}
	public void setACTICO(String aCTICO) {
		ACTICO = aCTICO;
	}
	public String getWTDPCD() {
		return WTDPCD;
	}
	public void setWTDPCD(String wTDPCD) {
		WTDPCD = wTDPCD;
	}
	
	public static FPACTIBean getFPACTIBeanFromRs(ResultSet rs){
		FPACTIBean bean = new FPACTIBean();
		try{
			bean.setRPJINCD(rs.getString("RPJINCD"));		//行动编号
			bean.setWTTT(rs.getString("WTTT"));		//填报标题
			bean.setWTDT(rs.getString("WTDT"));		//填报时间
			bean.setACTICO(rs.getString("ACTICO"));		//防汛行动内容
			bean.setWTDPCD(rs.getString("WTDPCD"));		//填报单位名称
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return bean;
	}
}
