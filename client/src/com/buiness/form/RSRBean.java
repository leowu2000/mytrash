package com.buiness.form;

import java.sql.ResultSet;

public class RSRBean {
	private String PJRNO;							// ���б��
	private String PJNO;							// ���̱��
	private String DTCDT;							// ���ʱ��
	private String PJNM;							// ��������
	private String RSCLS;							// ˮ�����(����/�к�/���տ�)
	private String RV;								// ��ǰ����(��������)
	private String RZ;								// ��ǰ����ˮλ(��)
	private String RQ;								// ��ǰк��(������/��)
	private String DFPFCN="�ӻ����״����";			// �ӻ����״��
	private String DBSTBCN="�����ȶ������";			// �����ȶ����
	private String BRBPPFCN="���»����ȶ������";		// ���»����ȶ����
	private String ESPFCN="йˮ���������״����";		// йˮ���������״��
	private String EDDPFCN="���ܹ����״����";			// ���ܹ����״��
	private String GTHOPFCN="բ�š����ջ����״����";	// բ�š����ջ����״��
	private String COMMCN="ͨѶ�ֶμ�״����";			// ͨѶ�ֶμ�״��

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

	public String getRSCLS() {
		return RSCLS;
	}

	public void setRSCLS(String rSCLS) {
		RSCLS = rSCLS;
	}

	public String getRV() {
		return RV;
	}

	public void setRV(String rV) {
		RV = rV;
	}

	public String getRZ() {
		return RZ;
	}

	public void setRZ(String rZ) {
		RZ = rZ;
	}

	public String getRQ() {
		return RQ;
	}

	public void setRQ(String rQ) {
		RQ = rQ;
	}

	public String getDFPFCN() {
		return DFPFCN;
	}

	public void setDFPFCN(String dFPFCN) {
		DFPFCN = dFPFCN;
	}

	public String getDBSTBCN() {
		return DBSTBCN;
	}

	public void setDBSTBCN(String dBSTBCN) {
		DBSTBCN = dBSTBCN;
	}

	public String getBRBPPFCN() {
		return BRBPPFCN;
	}

	public void setBRBPPFCN(String bRBPPFCN) {
		BRBPPFCN = bRBPPFCN;
	}

	public String getESPFCN() {
		return ESPFCN;
	}

	public void setESPFCN(String eSPFCN) {
		ESPFCN = eSPFCN;
	}

	public String getEDDPFCN() {
		return EDDPFCN;
	}

	public void setEDDPFCN(String eDDPFCN) {
		EDDPFCN = eDDPFCN;
	}

	public String getGTHOPFCN() {
		return GTHOPFCN;
	}

	public void setGTHOPFCN(String gTHOPFCN) {
		GTHOPFCN = gTHOPFCN;
	}

	public String getCOMMCN() {
		return COMMCN;
	}

	public void setCOMMCN(String cOMMCN) {
		COMMCN = cOMMCN;
	}

	public static RSRBean getPJRCNBeanFromRs(ResultSet rs){
		RSRBean bean = new RSRBean();
		try{
			bean.setPJRNO(rs.getString("PJRNO"));//���б��
			bean.setPJNO(rs.getString("PJNO"));//���̱��
			bean.setDTCDT(rs.getString("DTCDT"));//���ʱ��
			bean.setPJNM(rs.getString("PJNM"));//��������
			bean.setRSCLS(rs.getString("RSCLS"));//ˮ�����(����/�к�/���տ�)
			bean.setRV(rs.getString("RV"));//��ǰ����(��������)
			bean.setRZ(rs.getString("RZ"));//��ǰ����ˮλ(��)
			bean.setRQ(rs.getString("RQ"));//��ǰк��(������/��)
			bean.setDFPFCN(rs.getString("DFPFCN"));//�ӻ����״��
			bean.setDBSTBCN(rs.getString("DBSTBCN"));//�����ȶ����
			bean.setBRBPPFCN(rs.getString("BRBPPFCN"));//���»����ȶ����
			bean.setESPFCN(rs.getString("ESPFCN"));//йˮ���������״��
			bean.setEDDPFCN(rs.getString("EDDPFCN"));//���ܹ����״��
			bean.setGTHOPFCN(rs.getString("GTHOPFCN"));//բ�š����ջ����״��
			bean.setCOMMCN(rs.getString("COMMCN"));//ͨѶ�ֶμ�״��
		}catch(Exception ex){
			ex.printStackTrace();
		}
	return bean;
	}
}
