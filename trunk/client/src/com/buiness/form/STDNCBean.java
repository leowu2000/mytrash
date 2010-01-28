package com.buiness.form;

import java.sql.ResultSet;

public class STDNCBean {
	private String DNCNO;//������
	private String PJNO;//���̱��
	private String STTPCD;//���������
	private String DAGTM;//����ʱ��
	private String DNCNM;//��������
	private String XQFLDM;//����������
	private String DNCGR;//���鼶��
	private String DAGPLCCH;//���յص�׮��	
	private String DAGLO;//���ղ�λ
	private String RDEPL;//���շ���
	private String RDERESCN;//������Դ�䱸
	private String TPN;//Ⱥ��Ͷ��(��)
	private String PLAPN;//��ž�Ͷ��(��)
	private String PLIPN;//�侯Ͷ��(��)
	private String RDECNRL;//��չ�����
	private String DNCCUAN;//����ԭ�����
	private String DNCESTDV;//���鷢չ����
	private String DNCPBNFZ;//����Ӱ�췶Χ
	private String RZ;//��ǰ����ˮλ(��)
	private String WTHCN;//����ʱ�������
	private String FHYWTHCN;//δ��ˮ���������
	private String DNCADDSC;//��������
	private String WTDPCD;//���λ����
	private String WTDPDT;//�ʱ��
	
	
	
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
			bean.setDNCNO(rs.getString("DNCNO"));//������
			bean.setPJNO(rs.getString("PJNO"));//���̱��
			bean.setSTTPCD(rs.getString("STTPCD"));//���������
			bean.setDAGTM(rs.getString("DAGTM"));//����hijian
			bean.setDNCNM(rs.getString("DNCNM"));//��������
			bean.setXQFLDM(rs.getString("XQFLDM"));//�����������
			bean.setDNCGR(rs.getString("DNCGR"));//���鼶��
			bean.setDAGPLCCH(rs.getString("DAGPLCCH"));//���յص�׮��
			bean.setDAGLO(rs.getString("DAGLO"));//���ղ�λ
			bean.setRDEPL(rs.getString("RDEPL"));//���շ���
			bean.setRDERESCN(rs.getString("RDERESCN"));//������Դ�䱸
			bean.setTPN(rs.getString("TPN"));//Ⱥ��Ͷ��(��)
			bean.setPLAPN(rs.getString("PLAPN"));//��ž�Ͷ��(��)
			bean.setPLIPN(rs.getString("PLIPN"));//�侯Ͷ��(��)
			bean.setRDECNRL(rs.getString("RDECNRL"));//��չ�����
			bean.setDNCCUAN(rs.getString("DNCCUAN"));//����ԭ�����
			bean.setDNCESTDV(rs.getString("DNCESTDV"));//���鷢չ����
			bean.setDNCPBNFZ(rs.getString("DNCPBNFZ"));//����Ӱ�췶Χ
			bean.setRZ(rs.getString("RZ"));//��ǰ����ˮλ(��)
			bean.setWTHCN(rs.getString("WTHCN"));//����ʱ�������
			bean.setFHYWTHCN(rs.getString("FHYWTHCN"));//δ��ˮ���������
			bean.setDNCADDSC(rs.getString("DNCADDSC"));//��������
			bean.setWTDPCD(rs.getString("WTDPCD"));//���λ����
			bean.setWTDPDT(rs.getString("WTDPDT"));//�ʱ��
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return bean;
	}
	
}
