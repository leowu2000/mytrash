package com.buiness.dao;

import com.buiness.form.PJRCNBean;
import com.buiness.form.PrjBean;
import com.buiness.form.RSRBean;
import com.buiness.form.STDNCBean;
import com.core.UUIdFactory;
import com.util.UtilDateTime;

public class SqlFactory {
	public static String insertSQL_PJRCNBean(PJRCNBean bean,String path,PrjBean prjBean){
		String sSQL = "INSERT INTO TB_PJRCN(PJRNO,PJNO,DTCDT,PJNM,"
			+"GCFLDM,DNCFC,RDERESCN,WTDPCD,WTDPDT,NT)VALUES("
			+UUIdFactory.getMaxId(path, "TB_PJRCN")+","//���б��
			+bean.getPJNO()+",#"//���̱��
			+UtilDateTime.nowDateString()+"#,'"//���ʱ��
			+prjBean.getPJNM()+"','"//��������
			+bean.getGCFLDM()+"','"//���̷������
			+bean.getDNCFC()+"','"//����Ԥ��
			+bean.getRDERESCN()+"','"//������Դ�䱸
			+bean.getWTDPCD()+"',#"//���λ����
			+UtilDateTime.nowDateString()+"#,'"//�ʱ��
			+bean.getNT()+"')";//����
		System.out.println(sSQL);
		return sSQL;
	}
	public static String insertSQL_STDNCBean(STDNCBean bean,String path){
		String sSQL = "INSERT TB_STDNC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,XQFLDM,DNCGR," +
				"DAGPLCCH,DAGLO,RDEPL,RDERESCN,TPN,PLAPN,PLIPN,RDECNRL,DNCCUAN,DNCESTDV,DNCPBNFZ,RZ,WTHCN" +
				",FHYWTHCN,DNCADDSC,WTDPCD,WTDPDT)VALUES("
				+UUIdFactory.getMaxId(path, "TB_PJRCN")+","//������
				+bean.getPJNO()+",'"//���̱��
				+bean.getSTTPCD()+"','"//���������
				+bean.getDAGTM()+"','"//����ʱ��
				+bean.getDNCNM()+"','"//��������
				+bean.getXQFLDM()+"','"//����������
				+bean.getDNCGR()+"','"//���鼶��
				+bean.getDAGPLCCH()+"','"//���յص�׮��
				+bean.getDAGLO()+"','"//���ղ�λ
				+bean.getRDEPL()+"','"//���շ���
				+bean.getRDERESCN()+"','"//������Դ�䱸
				+bean.getTPN()+"','"//Ⱥ��Ͷ��(��)
				+bean.getPLAPN()+"','"//��ž�Ͷ��(��)
				+bean.getPLIPN()+"','"//�侯Ͷ��(��)
				+bean.getRDECNRL()+"','"//��չ�����
				+bean.getDNCCUAN()+"','"//����ԭ�����
				+bean.getDNCESTDV()+"','"//���鷢չ����
				+bean.getDNCPBNFZ()+"','"//����Ӱ�췶Χ
				+bean.getRZ()+"','"//��ǰ����ˮλ(��)
				+bean.getWTHCN()+"','"//����ʱ�������
				+bean.getFHYWTHCN()+"','"//δ��ˮ���������
				+bean.getDNCADDSC()+"','"//��������
				+bean.getWTDPCD()+"','"//���λ����
				+bean.getWTDPDT()+"')";//�ʱ��
		System.out.println(sSQL);
		return sSQL;
	}
	
	public static String insertSQL_PSRBean(RSRBean bean,String path,PrjBean prjBean){
		String sSQL = "INSERT INTO TB_RSR (PJRNO,PJNO,DTCDT,PJNM,RSCLS,RV,RZ,RQ,DFPFCN,DBSTBCN," +
				"BRBPPFCN,ESPFCN,EDDPFCN,GTHOPFCN,COMMCN)VALUES("
				+UUIdFactory.getMaxId(path, "TB_PJRCN")+","
				+prjBean.getPJNO()+",#"
				+UtilDateTime.nowDateString()+"#,'"// ���б��
				+prjBean.getPJNM()+"','"// ��������
				+bean.getRSCLS()+"',"// ˮ�����(����/�к�/���տ�)
				+bean.getRV()+","// ��ǰ����(��������)
				+bean.getRZ()+","// ��ǰ����ˮλ(��)
				+bean.getRQ()+",'"// ��ǰк��(������/��)
				+bean.getDFPFCN()+"','"// �ӻ����״��
				+bean.getDBSTBCN()+"','"// �����ȶ����
				+bean.getBRBPPFCN()+"','"// ���»����ȶ����
				+bean.getESPFCN()+"','"// йˮ���������״��
				+bean.getEDDPFCN()+"','"// ���ܹ����״��
				+bean.getGTHOPFCN()+"','"// բ�š����ջ����״��
				+bean.getCOMMCN()+"')";
		System.out.println(sSQL);
		return sSQL;
	}
	
}
