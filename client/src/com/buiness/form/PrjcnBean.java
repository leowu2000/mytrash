package com.buiness.form;

import java.sql.ResultSet;

public class PrjcnBean {
	private String PJNO="";//���̱��
	private String DTCDT="";//���ʱ��
	private String PJNM="";//��������
	private String GCFLDM="";//���̷������
	private String DNCFC="";//����Ԥ��
	private String RDERESCN="";//������Դ�䱸
	private String WTDPCD="";//���λ����
	private String WTDPDT="";//�ʱ��
	private String NT="";//
	public String getPJNO() {
		return PJNO;
	}
	public void setPJNO(String pJNO) {
		PJNO = pJNO;
	}
	public String getDTCDT() {
		return DTCDT;
	}
	public void setDTCDT(String dTCDT) {
		DTCDT = dTCDT;
	}
	public String getPJNM() {
		return PJNM;
	}
	public void setPJNM(String pJNM) {
		PJNM = pJNM;
	}
	public String getGCFLDM() {
		return GCFLDM;
	}
	public void setGCFLDM(String gCFLDM) {
		GCFLDM = gCFLDM;
	}
	public String getDNCFC() {
		return DNCFC;
	}
	public void setDNCFC(String dNCFC) {
		DNCFC = dNCFC;
	}
	public String getRDERESCN() {
		return RDERESCN;
	}
	public void setRDERESCN(String rDERESCN) {
		RDERESCN = rDERESCN;
	}
	public String getWTDPCD() {
		return WTDPCD;
	}
	public void setWTDPCD(String wTDPCD) {
		WTDPCD = wTDPCD;
	}
	public String getWTDPDT() {
		return WTDPDT;
	}
	public void setWTDPDT(String wTDPDT) {
		WTDPDT = wTDPDT;
	}
	public String getNT() {
		return NT;
	}
	public void setNT(String nT) {
		NT = nT;
	}
	
	public static PrjcnBean getPrjcnBeanFromRs(ResultSet rs){
		PrjcnBean bean = new PrjcnBean();
		try {
			bean.setPJNO(rs.getString("PJNO"));
			bean.setDTCDT(rs.getString("DTCDT"));
			bean.setPJNM(rs.getString("PJNM"));
			bean.setGCFLDM(rs.getString("GCFLDM"));
			bean.setDNCFC(rs.getString("DNCFC"));
			bean.setRDERESCN(rs.getString("RDERESCN"));
			bean.setWTDPCD(rs.getString("WTDPCD"));
			bean.setWTDPDT(rs.getString("WTDPDT"));
			bean.setNT(rs.getString("NT"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return bean;
		
	}
	
}
