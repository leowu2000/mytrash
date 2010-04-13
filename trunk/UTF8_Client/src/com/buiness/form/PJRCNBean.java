package com.buiness.form;

import java.sql.ResultSet;

public class PJRCNBean {
	private String PJRNO;//运行编号
	private String PJNO;//工程编号
	private String DTCDT;//检测时间
	private String PJNM;//工程名称
	private String GCFLDM;//工程分类代码
	private String DNCFC="险情预测：";//险情预测
	private String RDERESCN="抢险资源配备：";//抢险资源配备
	private String WTDPCD;//填报单位名称
	private String WTDPDT;//填报时间
	private String NT="其它：";//其它
	public String getPJRNO() {
		return PJRNO;
	}
	public void setPJRNO(String pJRNO) {
		PJRNO = pJRNO;
	}
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
	
	public static PJRCNBean getPJRCNBeanFromRs(ResultSet rs){
		PJRCNBean bean = new PJRCNBean();
		try{
			bean.setPJRNO(String.valueOf(rs.getInt("PJRNO")));//运行编号
			bean.setPJNO(String.valueOf(rs.getInt("PJNO")));//工程编号
			bean.setDTCDT(rs.getString("DTCDT"));//检测时间
			bean.setPJNM(rs.getString("PJNM"));//工程名称
			bean.setGCFLDM(rs.getString("GCFLDM"));//工程分类代码
			bean.setDNCFC(rs.getString("DNCFC"));//险情预测
			bean.setRDERESCN(rs.getString("RDERESCN"));//抢险资源配备
			bean.setWTDPCD(rs.getString("WTDPCD"));//填报单位名称
			bean.setWTDPDT(rs.getString("WTDPDT"));//填报时间
			bean.setNT(rs.getString("NT"));//其它
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return bean;
	}
	
}
