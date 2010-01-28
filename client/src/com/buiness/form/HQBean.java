package com.buiness.form;

import java.sql.ResultSet;

public class HQBean {
	//TB_QT
	//TB_QT_M
	private String RPJINCD;	//����������
	private String WTTT;		//�����
	private String WTDT;		//�ʱ��
	private String ACTICO;		//�����������
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
	
	public static HQBean getHQBeanFromRs(ResultSet rs){
		HQBean bean = new HQBean();
		try{
			bean.setRPJINCD(rs.getString("RPJINCD"));	//����������
			bean.setWTTT(rs.getString("WTTT"));		//�����
			bean.setWTDT(rs.getString("WTDT"));		//�ʱ��
			bean.setACTICO(rs.getString("ACTICO"));		//�����������
			bean.setWTDPCD(rs.getString("WTDPCD"));		//���λ����
		}catch(Exception ex){ex.printStackTrace();}
		return bean;
	}
}
