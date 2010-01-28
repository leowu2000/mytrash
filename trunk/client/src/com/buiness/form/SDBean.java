package com.buiness.form;

import java.sql.ResultSet;

public class SDBean {
	private String RPJINCD;	//灾情编号
	private String WTTT;		//填报标题
	private String WTDT;		//填报时间
	private String SDDSC;		//灾情描述
	private String DISCU;		//灾害成因
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
	public String getSDDSC() {
		return SDDSC;
	}
	public void setSDDSC(String sDDSC) {
		SDDSC = sDDSC;
	}
	public String getDISCU() {
		return DISCU;
	}
	public void setDISCU(String dISCU) {
		DISCU = dISCU;
	}
	public String getWTDPCD() {
		return WTDPCD;
	}
	public void setWTDPCD(String wTDPCD) {
		WTDPCD = wTDPCD;
	}
	public static SDBean getSDBeanFromRs(ResultSet rs){
		SDBean bean = new SDBean();
		try{
			bean.setRPJINCD(rs.getString("RPJINCD"));	//灾情编号
			bean.setWTTT(rs.getString("WTTT"));		//填报标题
			bean.setWTDT(rs.getString("WTDT"));		//填报时间
			bean.setSDDSC(rs.getString("SDDSC"));		//灾情描述
			bean.setDISCU(rs.getString("DISCU"));		//灾害成因
			bean.setWTDPCD(rs.getString("WTDPCD"));		//填报单位名称
		}catch(Exception ex){ex.printStackTrace();}
		return bean;
	}
	
}
