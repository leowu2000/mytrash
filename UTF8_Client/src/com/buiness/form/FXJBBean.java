package com.buiness.form;

import java.sql.ResultSet;

public class FXJBBean {
//	TB_FXJB
//	TB_FXJB_M
	private String RPJINCD; //简报编号
	private String ISSUE; //期
	private String WTDT; //填报日期
	private String ACTICO ;//正文
	private String NT1; //抄报
	private String QF; //签发人
	private String SH;//审核人
	private String NG;//拟稿人
	private String WTDPCD;//填报单位
	private String WTTT;//标题
	public String getRPJINCD() {
		return RPJINCD;
	}
	public void setRPJINCD(String rPJINCD) {
		RPJINCD = rPJINCD;
	}
	public String getISSUE() {
		return ISSUE;
	}
	public void setISSUE(String iSSUE) {
		ISSUE = iSSUE;
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
	public String getNT1() {
		return NT1;
	}
	public void setNT1(String nT1) {
		NT1 = nT1;
	}
	public String getQF() {
		return QF;
	}
	public void setQF(String qF) {
		QF = qF;
	}
	public String getSH() {
		return SH;
	}
	public void setSH(String sH) {
		SH = sH;
	}
	public String getNG() {
		return NG;
	}
	public void setNG(String nG) {
		NG = nG;
	}
	public String getWTDPCD() {
		return WTDPCD;
	}
	public void setWTDPCD(String wTDPCD) {
		WTDPCD = wTDPCD;
	}
	public String getWTTT() {
		return WTTT;
	}
	public void setWTTT(String wTTT) {
		WTTT = wTTT;
	}
	public static FXJBBean getFXJBBeanFromRs(ResultSet rs){
		FXJBBean bean = new FXJBBean();
		try{
			bean.setRPJINCD(String.valueOf(rs.getInt("RPJINCD"))); //简报编号
			bean.setISSUE(String.valueOf(rs.getInt("ISSUE"))); //期
			bean.setWTDT(rs.getString("WTDT")); //填报日期
			bean.setACTICO(rs.getString("ACTICO")) ;//正文
			bean.setNT1(rs.getString("NT1")); //抄报
			bean.setQF(rs.getString("QF")); //签发人
			bean.setSH(rs.getString("SH"));//审核人
			bean.setNG(rs.getString("NG"));//拟稿人
			bean.setWTDPCD(rs.getString("WTDPCD"));//填报单位
			bean.setWTTT(rs.getString("WTTT"));//标题
		}catch(Exception ex){ex.printStackTrace();}
		return bean;
	}
	
}
