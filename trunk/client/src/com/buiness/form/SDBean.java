package com.buiness.form;

import java.sql.ResultSet;

public class SDBean {
	private String RPJINCD;	//������
	private String WTTT;		//�����
	private String WTDT;		//�ʱ��
	private String SDDSC;		//��������
	private String DISCU;		//�ֺ�����
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
			bean.setRPJINCD(rs.getString("RPJINCD"));	//������
			bean.setWTTT(rs.getString("WTTT"));		//�����
			bean.setWTDT(rs.getString("WTDT"));		//�ʱ��
			bean.setSDDSC(rs.getString("SDDSC"));		//��������
			bean.setDISCU(rs.getString("DISCU"));		//�ֺ�����
			bean.setWTDPCD(rs.getString("WTDPCD"));		//���λ����
		}catch(Exception ex){ex.printStackTrace();}
		return bean;
	}
	
}
