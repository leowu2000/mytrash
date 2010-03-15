package com.upload;

import java.sql.ResultSet;

public class UploadBean {
	private String title;
	private String WTDPDT;
	private String FENLEI;
	private String WTDPCD;
	private String GCFLDM;
	private String num;
	private String tbcname;
	private String TbName;
	private String ID;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWTDPDT() {
		return WTDPDT;
	}
	public void setWTDPDT(String wTDPDT) {
		WTDPDT = wTDPDT;
	}
	public String getFENLEI() {
		return FENLEI;
	}
	public void setFENLEI(String fENLEI) {
		FENLEI = fENLEI;
	}
	public String getWTDPCD() {
		return WTDPCD;
	}
	public void setWTDPCD(String wTDPCD) {
		WTDPCD = wTDPCD;
	}
	public String getGCFLDM() {
		return GCFLDM;
	}
	public void setGCFLDM(String gCFLDM) {
		GCFLDM = gCFLDM;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTbcname() {
		return tbcname;
	}
	public void setTbcname(String tbcname) {
		this.tbcname = tbcname;
	}
	public String getTbName() {
		return TbName;
	}
	public void setTbName(String tbName) {
		TbName = tbName;
	}
	
	public static UploadBean getUploadBeanFromRs(ResultSet rs){
		UploadBean bean = new UploadBean();
		try{
			bean.setTitle(rs.getString(1));
			bean.setWTDPDT(rs.getString(2));
			bean.setFENLEI(rs.getString(3));
			bean.setWTDPCD(rs.getString(4));
			bean.setGCFLDM(rs.getString(5));
			bean.setNum(String.valueOf(rs.getInt(6)));
			bean.setTbcname(rs.getString(7));
			bean.setTbName(rs.getString(8));
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return bean;
	}

}
