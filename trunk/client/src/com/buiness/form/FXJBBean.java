package com.buiness.form;

import java.sql.ResultSet;

public class FXJBBean {
//	TB_FXJB
//	TB_FXJB_M
	private String RPJINCD; //�򱨱��
	private String ISSUE; //��
	private String WTDT; //�����
	private String ACTICO ;//����
	private String NT1; //����
	private String QF; //ǩ����
	private String SH;//�����
	private String NG;//�����
	private String WTDPCD;//���λ
	private String WTTT;//����
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
			bean.setRPJINCD(rs.getString("RPJINCD")); //�򱨱��
			bean.setISSUE(rs.getString("ISSUE")); //��
			bean.setWTDT(rs.getString("WTDT")); //�����
			bean.setACTICO(rs.getString("ACTICO")) ;//����
			bean.setNT1(rs.getString("NT1")); //����
			bean.setQF(rs.getString("QF")); //ǩ����
			bean.setSH(rs.getString("SH"));//�����
			bean.setNG(rs.getString("NG"));//�����
			bean.setWTDPCD(rs.getString("WTDPCD"));//���λ
			bean.setWTTT(rs.getString("WTTT"));//����
		}catch(Exception ex){ex.printStackTrace();}
		return bean;
	}
	
}
