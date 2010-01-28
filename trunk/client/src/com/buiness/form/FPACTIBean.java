package com.buiness.form;

import java.sql.ResultSet;

public class FPACTIBean {
	//TB_FPACTI
	//TB_FPACTI_M
	private String RPJINCD;		//�ж����
	private String WTTT;		//�����
	private String WTDT;		//�ʱ��
	private String ACTICO;		//��Ѵ�ж�����
	private String WTDPCD;		//���λ����
	
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
			bean.setRPJINCD(rs.getString("RPJINCD"));		//�ж����
			bean.setWTTT(rs.getString("WTTT"));		//�����
			bean.setWTDT(rs.getString("WTDT"));		//�ʱ��
			bean.setACTICO(rs.getString("ACTICO"));		//��Ѵ�ж�����
			bean.setWTDPCD(rs.getString("WTDPCD"));		//���λ����
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return bean;
	}
}
