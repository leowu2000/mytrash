package com.buiness.form;

import java.sql.ResultSet;

public class STDNCBean {
	private String DNCNO;//险情编号
	private String PJNO;//工程编号
	private String STTPCD;//建筑物编码
	private String DAGTM;//出险时间
	private String DNCNM;//险情名称
	private String XQFLDM;//险情分类代码
	private String DNCGR;//险情级别
	private String DAGPLCCH;//出险地点桩号	
	private String DAGLO;//出险部位
	private String RDEPL="";//抢险方案
	private String RDERESCN="";//抢险资源配备
	private String TPN;//群众投入(人)
	private String PLAPN;//解放军投入(人)
	private String PLIPN;//武警投入(人)
	private String RDECNRL="";//进展及结果
	private String DNCCUAN="";//险情原因分析
	private String DNCESTDV="";//险情发展趋势
	private String DNCPBNFZ="";//可能影响范围
	private String RZ;//当前运行水位(米)
	private String WTHCN="";//抢险时气象情况
	private String FHYWTHCN="";//未来水文气象情况
	private String DNCADDSC="";//补充描述
	private String WTDPCD;//填报单位名称
	private String WTDPDT;//填报时间
	
	public String getDAGLO() {
		return DAGLO;
	}
	public void setDAGLO(String dAGLO) {
		DAGLO = dAGLO;
	}
	public String getRDEPL() {
		return RDEPL;
	}
	public void setRDEPL(String rDEPL) {
		RDEPL = rDEPL;
	}
	public String getRDERESCN() {
		return RDERESCN;
	}
	public void setRDERESCN(String rDERESCN) {
		RDERESCN = rDERESCN;
	}
	public String getDNCNO() {
		return DNCNO;
	}
	public void setDNCNO(String dNCNO) {
		DNCNO = dNCNO;
	}
	public String getPJNO() {
		return PJNO;
	}
	public void setPJNO(String pJNO) {
		PJNO = pJNO;
	}
	public String getSTTPCD() {
		return STTPCD;
	}
	public void setSTTPCD(String sTTPCD) {
		STTPCD = sTTPCD;
	}
	public String getDAGTM() {
		return DAGTM;
	}
	public void setDAGTM(String dAGTM) {
		DAGTM = dAGTM;
	}
	public String getDNCNM() {
		return DNCNM;
	}
	public void setDNCNM(String dNCNM) {
		DNCNM = dNCNM;
	}
	public String getXQFLDM() {
		return XQFLDM;
	}
	public void setXQFLDM(String xQFLDM) {
		XQFLDM = xQFLDM;
	}
	public String getDNCGR() {
		return DNCGR;
	}
	public void setDNCGR(String dNCGR) {
		DNCGR = dNCGR;
	}
	public String getDAGPLCCH() {
		return DAGPLCCH;
	}
	public void setDAGPLCCH(String dAGPLCCH) {
		DAGPLCCH = dAGPLCCH;
	}
	public String getTPN() {
		return TPN;
	}
	public void setTPN(String tPN) {
		TPN = tPN;
	}
	public String getPLAPN() {
		return PLAPN;
	}
	public void setPLAPN(String pLAPN) {
		PLAPN = pLAPN;
	}
	public String getPLIPN() {
		return PLIPN;
	}
	public void setPLIPN(String pLIPN) {
		PLIPN = pLIPN;
	}
	public String getRDECNRL() {
		return RDECNRL;
	}
	public void setRDECNRL(String rDECNRL) {
		RDECNRL = rDECNRL;
	}
	public String getDNCCUAN() {
		return DNCCUAN;
	}
	public void setDNCCUAN(String dNCCUAN) {
		DNCCUAN = dNCCUAN;
	}
	public String getDNCESTDV() {
		return DNCESTDV;
	}
	public void setDNCESTDV(String dNCESTDV) {
		DNCESTDV = dNCESTDV;
	}
	public String getDNCPBNFZ() {
		return DNCPBNFZ;
	}
	public void setDNCPBNFZ(String dNCPBNFZ) {
		DNCPBNFZ = dNCPBNFZ;
	}
	public String getRZ() {
		return RZ;
	}
	public void setRZ(String rZ) {
		RZ = rZ;
	}
	public String getWTHCN() {
		return WTHCN;
	}
	public void setWTHCN(String wTHCN) {
		WTHCN = wTHCN;
	}
	public String getFHYWTHCN() {
		return FHYWTHCN;
	}
	public void setFHYWTHCN(String fHYWTHCN) {
		FHYWTHCN = fHYWTHCN;
	}
	public String getDNCADDSC() {
		return DNCADDSC;
	}
	public void setDNCADDSC(String dNCADDSC) {
		DNCADDSC = dNCADDSC;
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
	
	public static STDNCBean getSTDNCBeanFromRs(ResultSet rs){
		STDNCBean bean = new STDNCBean();
		try{
			bean.setDNCNO(String.valueOf(rs.getInt("DNCNO")));//险情编号
			bean.setPJNO(String.valueOf(rs.getInt("PJNO")));//工程编号
			bean.setSTTPCD(String.valueOf(rs.getInt("STTPCD")));//建筑物编码
			bean.setDAGTM(rs.getString("DAGTM"));//出现hijian
			bean.setDNCNM(rs.getString("DNCNM"));//险情名称
			bean.setXQFLDM(rs.getString("XQFLDM"));//险情分类嗲马
			bean.setDNCGR(rs.getString("DNCGR"));//险情级别
			bean.setDAGPLCCH(rs.getString("DAGPLCCH"));//出险地点桩号
			bean.setDAGLO(rs.getString("DAGLO"));//出险部位
			bean.setRDEPL(rs.getString("RDEPL"));//抢险方案
			bean.setRDERESCN(rs.getString("RDERESCN"));//抢险资源配备
			bean.setTPN(String.valueOf(rs.getInt("TPN")));//群众投入(人)
			bean.setPLAPN(String.valueOf(rs.getInt("PLAPN")));//解放军投入(人)
			bean.setPLIPN(String.valueOf(rs.getInt("PLIPN")));//武警投入(人)
			bean.setRDECNRL(rs.getString("RDECNRL"));//进展及结果
			bean.setDNCCUAN(rs.getString("DNCCUAN"));//险情原因分析
			bean.setDNCESTDV(rs.getString("DNCESTDV"));//险情发展趋势
			bean.setDNCPBNFZ(rs.getString("DNCPBNFZ"));//可能影响范围
			bean.setRZ(String.valueOf(rs.getFloat("RZ")));//当前运行水位(米)
			bean.setWTHCN(rs.getString("WTHCN"));//抢险时气象情况
			bean.setFHYWTHCN(rs.getString("FHYWTHCN"));//未来水文气象情况
			bean.setDNCADDSC(rs.getString("DNCADDSC"));//补充描述
			bean.setWTDPCD(rs.getString("WTDPCD"));//填报单位名称
			bean.setWTDPDT(rs.getString("WTDPDT"));//填报时间
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return bean;
	}
	
}
