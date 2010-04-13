package com.buiness.form;

import java.sql.ResultSet;

public class ConfigBean {
	
	private String CLIENT_TYPE="";
	private String XZQH_S=" ";
	private String XZQH_SI=" ";
	private String XZQH_X=" ";
	private String LYSX_LY=" ";
	private String LYSX_SX=" ";
	private String LYSX_YJZL=" ";
	private String LYSX_EJZL=" ";
	private String SERVER_NAME="";
	private String SERVER_IP="";
	private String SERVER_PORT="";
	private String TBDW="";
	private String BSDW="";
	private String FXZRR="";
	private String LXDH="";
	private String QF="";
	private String NG="";
	private String SH="";

	public String getCLIENT_TYPE() {
		return CLIENT_TYPE;
	}

	public void setCLIENT_TYPE(String cLIENTTYPE) {
		CLIENT_TYPE = cLIENTTYPE;
	}

	public String getXZQH_S() {
		return XZQH_S;
	}

	public void setXZQH_S(String xZQHS) {
		XZQH_S = xZQHS;
	}

	public String getXZQH_SI() {
		return XZQH_SI;
	}

	public void setXZQH_SI(String xZQHSI) {
		XZQH_SI = xZQHSI;
	}

	public String getXZQH_X() {
		return XZQH_X;
	}

	public void setXZQH_X(String xZQHX) {
		XZQH_X = xZQHX;
	}

	public String getLYSX_LY() {
		return LYSX_LY;
	}

	public void setLYSX_LY(String lYSXLY) {
		LYSX_LY = lYSXLY;
	}

	public String getLYSX_SX() {
		return LYSX_SX;
	}

	public void setLYSX_SX(String lYSXSX) {
		LYSX_SX = lYSXSX;
	}

	public String getLYSX_YJZL() {
		return LYSX_YJZL;
	}

	public void setLYSX_YJZL(String lYSXYJZL) {
		LYSX_YJZL = lYSXYJZL;
	}

	public String getLYSX_EJZL() {
		return LYSX_EJZL;
	}

	public void setLYSX_EJZL(String lYSXEJZL) {
		LYSX_EJZL = lYSXEJZL;
	}

	public String getSERVER_NAME() {
		return SERVER_NAME;
	}

	public void setSERVER_NAME(String sERVERNAME) {
		SERVER_NAME = sERVERNAME;
	}

	public String getSERVER_IP() {
		return SERVER_IP;
	}

	public void setSERVER_IP(String sERVERIP) {
		SERVER_IP = sERVERIP;
	}

	public String getSERVER_PORT() {
		return SERVER_PORT;
	}

	public void setSERVER_PORT(String sERVERPORT) {
		SERVER_PORT = sERVERPORT;
	}

	public String getTBDW() {
		return TBDW;
	}

	public void setTBDW(String tBDW) {
		TBDW = tBDW;
	}

	public String getBSDW() {
		return BSDW;
	}

	public void setBSDW(String bSDW) {
		BSDW = bSDW;
	}

	public String getFXZRR() {
		return FXZRR;
	}

	public void setFXZRR(String fXZRR) {
		FXZRR = fXZRR;
	}

	public String getLXDH() {
		return LXDH;
	}

	public void setLXDH(String lXDH) {
		LXDH = lXDH;
	}

	public String getQF() {
		return QF;
	}

	public void setQF(String qF) {
		QF = qF;
	}

	public String getNG() {
		return NG;
	}

	public void setNG(String nG) {
		NG = nG;
	}

	public String getSH() {
		return SH;
	}

	public void setSH(String sH) {
		SH = sH;
	}

	public static ConfigBean getConfigBeanFromRs(ResultSet rs) {
		ConfigBean bean = new ConfigBean();
		try {
			bean.setCLIENT_TYPE(rs.getString("CLIENT_TYPE"));
			bean.setXZQH_S(rs.getString("XZQH_S"));
			bean.setXZQH_SI(rs.getString("XZQH_SI"));
			bean.setXZQH_X(rs.getString("XZQH_X"));
			bean.setLYSX_LY(rs.getString("LYSX_LY"));
			bean.setLYSX_SX(rs.getString("LYSX_SX"));
			bean.setLYSX_YJZL(rs.getString("LYSX_YJZL"));
			bean.setLYSX_EJZL(rs.getString("LYSX_EJZL"));
			bean.setSERVER_NAME(rs.getString("SERVER_NAME"));
			bean.setSERVER_IP(rs.getString("SERVER_IP"));
			bean.setSERVER_PORT(rs.getString("SERVER_PORT"));
			bean.setTBDW(rs.getString("TBDW"));
			bean.setBSDW(rs.getString("BSDW"));
			bean.setFXZRR(rs.getString("FXZRR"));
			bean.setLXDH(rs.getString("LXDH"));
			bean.setQF(rs.getString("QF"));
			bean.setNG(rs.getString("NG"));
			bean.setSH(rs.getString("SH"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return bean;
	}

}
