package com.buiness.dao;

import com.buiness.form.DetailBean;
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
			+UUIdFactory.getMaxId(path, "TB_PJRCN","PJRNO")+","//���б��
			+prjBean.getPJNO()+",#"//���̱��
			+UtilDateTime.nowDateString()+"#,'"//���ʱ��
			+prjBean.getPJNM()+"','"//��������
			+bean.getGCFLDM()+"','"//���̷������
			+bean.getDNCFC()+"','"//����Ԥ��
			+bean.getRDERESCN()+"','"//������Դ�䱸
			+bean.getWTDPCD()+"',#"//���λ����
			+UtilDateTime.nowDateString()+"#,'"//�ʱ��
			+bean.getNT()+"')";//����
		return sSQL;
	}
	
	public static String insertSQL_STDNCBean(STDNCBean bean,String path){
		String sSQL = "INSERT INTO TB_STDNC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,XQFLDM,DNCGR," +
				"DAGPLCCH,DAGLO,RDEPL,RDERESCN,TPN,PLAPN,PLIPN,RDECNRL,DNCCUAN,DNCESTDV,DNCPBNFZ,RZ,WTHCN" +
				",FHYWTHCN,DNCADDSC,WTDPCD,WTDPDT)VALUES("
				+bean.getDNCNO()+","//������
				+bean.getPJNO()+",'"//���̱��
				+bean.getSTTPCD()+"',#"//���������
				+bean.getDAGTM()+"#,'"//����ʱ��
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
				+bean.getWTDPCD()+"',#"//���λ����
				+UtilDateTime.nowDateString()+"#)";//�ʱ��
		return sSQL;
	}
	
	public static String insertSQL_RSRBean(RSRBean bean,String path,PrjBean prjBean){
		String sSQL = "INSERT INTO TB_RSR (PJRNO,PJNO,DTCDT,PJNM,RSCLS,RV,RZ,RQ,DFPFCN,DBSTBCN," +
				"BRBPPFCN,ESPFCN,EDDPFCN,GTHOPFCN,COMMCN)VALUES("
				+UUIdFactory.getMaxId(path, "TB_RSR","PJRNO")+","
				+prjBean.getPJNO()+",#"
				+UtilDateTime.nowDateString()+"#,'"
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
		return sSQL;
	}
	
	public static String insertSQL_DNCDetailBean(DetailBean bean,String path,String XQFLDM){
		String dinarySubsql=bean.getDNCNO()+","+bean.getPJNO()+","+bean.getSTTPCD()+",#"+bean.getDAGTM()+"#,'"+bean.getDNCNM()+"'";
		String insertSql ="";
		//D001	����				TB_BURDSC	
		if("D001".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_BURDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"BUW,BUVL,BUZDF,BUQ,BURLDGL)VALUES("
						+dinarySubsql
						+","+bean.getDSSPN()+","+bean.getINPN()+","+bean.getDTHPN()+","+bean.getWRHS()+","+bean.getCRPDSSAR()
						+","+bean.getSCDMFMAR()+","+bean.getDRCECLS()
						+","+bean.getBUW()+","+bean.getBUVL()+","+bean.getBUZDF()+","+bean.getBUQ()+",'"+bean.getBURLDGL()+"')";
		//D002	����				TB_OVFLDSC
		if("D002".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_OVFLDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVFLL,OVFLZ,DSQ)VALUES("
						+dinarySubsql
						+","+bean.getOVFLL()+","+bean.getOVFLZ()+","+bean.getDSQ()+")";
		//D003	©��				TB_LKDSC
		if("D003".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_LKDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,"
						+"LKDMT,LKQ,LKWTLH,LKSAR)VALUES("
						+dinarySubsql
						+",'"+bean.getLKGTU()
						+"',"+bean.getLKDMT()+","+bean.getLKQ()+","+bean.getLKWTLH()+","+bean.getLKSAR()+")";
		//D004	��ӿ				TB_PPDSC
		if("D004".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_PPDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,"
						+"TODFTDI,"
						+"PPQ,WTLH,PPSAR)VALUES("
						+dinarySubsql
						+",'"+bean.getLKGTU()
						+"',"+bean.getPPQ()
						+","+bean.getTODFTDI()+","+bean.getWTLH()+","+bean.getPPSAR()+")";
		//D005	�ݿ�				TB_PITDSC
		if("D005".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_PITDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SBDSP,SBAR)VALUES("
						+dinarySubsql
						+","+bean.getSBDSP()+","+bean.getSBAR()+")";
		//D006	���� 			TB_SLDSC
		if("D006".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_SLDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLBU)VALUES("
						+dinarySubsql
						+","+bean.getSLUPAG()+","+bean.getSLBU()+")";
		//D007	��ˢ				TB_UNDSC
		if("D007".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_UNDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"UNDAR,UNDD,UNDL)VALUES("
						+dinarySubsql
						+","+bean.getTODFTDI()
						+","+bean.getUNDAR()+","+bean.getUNDD()+","+bean.getUNDL()+")";
		//D008	�ѷ�				TB_CRDSC
		if("D008".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_CRDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"CRDR,CRD,CRL,CRW)VALUES("
						+dinarySubsql
						+",'"+bean.getCRDR()+"',"+bean.getCRD()+","+bean.getCRL()+","+bean.getCRW()+")";
		//D009	����				TB_CVDSC
		if("D009".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_CVDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"WDQ,"
						+"CVL,CVBU,RVH,FLCNDSC)VALUES("
						+dinarySubsql
						+","+bean.getTODFTDI()
						+","+bean.getWDQ()
						+","+bean.getCVL()+","+bean.getCVBU()+","+bean.getRVH()+",'"+bean.getFLCNDSC()+"')";
		//D010	��ˮ				TB_SPDSC
		if("D010".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_SPDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SPAR,SPQ)VALUES("
						+dinarySubsql
						+","+bean.getSPAR()+","+bean.getSPQ()+")";
		//D011	 �˿� 			TB_BLBAD
		if("D011".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_BLBADSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WDQ,"
						+"BLH,WNS)VALUES("
						+dinarySubsql
						+","+bean.getWDQ()
						+","+bean.getBLH()+","+bean.getWNS()+")";
		//D012	����				TB_SLUDSC
		if("D012".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_SLUDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLUDSP,SLUTP,SLUGLCN)VALUES("
						+dinarySubsql
						+","+bean.getSLUPAG()
						+","+bean.getSLUDSP()+","+bean.getSLUTP()+",'"+bean.getSLUGLCN()+"')";

		//D013	����ʧ��			TB_HOMLFDSC
		if("D013".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_HOMLFDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"POWCUT,HOMLF,GSDST,MLFCN)VALUES("
						+dinarySubsql
						+",'"+bean.getPOWCUT()+"','"+bean.getHOMLF()+"','"+bean.getGSDST()+"','"+bean.getMLFCN()+"')";
		//D014	բ���ƻ�			TB_GTWRDSC
		if("D014".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_GTWRDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRDSC,WRQ)VALUES("
						+dinarySubsql
						+",'"+bean.getWRDSC()+"',"+bean.getWRQ()+")";
		//D015	����				TB_BRDMDSC
		if("D015".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_BRDMDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"PJPS,BRDMLDGL,BRDMW,BRZDMCDI,BRV,BRDMQ)VALUES("
						+dinarySubsql
						+","+bean.getDSSPN()+","+bean.getINPN()+","+bean.getDTHPN()+","+bean.getWRHS()
						+","+bean.getCRPDSSAR()+","+bean.getSCDMFMAR()+","+bean.getDRCECLS()
						+",'"+bean.getPJPS()+"','"+bean.getBRDMLDGL()+"',"+bean.getBRDMW()+","+bean.getBRZDMCDI()
						+","+bean.getBRV()+","+bean.getBRDMQ()+")";
		//D016	�㸲				TB_OVTUDSC
		if("D016".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_OVTUDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVTUDR,OVTUAG)VALUES("
						+dinarySubsql
						+",'"+bean.getOVTUDR()
						+"',"+bean.getOVTUAG()+")";
		//D017	Ӧ������			TB_STREXDSC
		if("D017".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_STREXDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"MXTNST,MXCMST,CONGR,ASTR)VALUES("
						+dinarySubsql
						+","+bean.getMXTNST()+","+bean.getMXCMST()+",'"+bean.getCONGR()+"',"+bean.getASTR()+")";
		//D018	̮��				TB_SLIDSC
		if("D018".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_SLIDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLIAR,SLIMS)VALUES("
						+dinarySubsql
						+","+bean.getSLIAR()+","+bean.getSLIMS()+")";
		//D019	����				TB_PLUDSC
		if("D019".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_PLUDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"PLTNM,PLTBU)VALUES("
						+dinarySubsql
						+",'"+bean.getPLTNM()+"',"+bean.getPLTBU()+")";
		//D020	�����ƻ�			TB_BSWRDSC
		if("D020".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_BSWRDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"GRNSPDSC,GROVCHWR,GRNUSB)VALUES("
						+dinarySubsql
						+",'"+bean.getGRNSPDSC()+"','"+bean.getGROVCHWR()+"',"+bean.getGRNUSB()+")";
		//D021	���ܹ��ƻ�		TB_EDDWRDSC
		if("D021".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_EDDWRDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"APWR,WSTWR)VALUES("
						+dinarySubsql
						+",'"+bean.getAPWR()+"','"+bean.getWSTWR()+"')";
		//D022	������ˮʧЧ		TB_BSWPLPDS
		if("D022".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_BSWPLPDS (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WPPLU,WPEQML)VALUES("
						+dinarySubsql
						+",'"+bean.getWPPLU()+"','"+bean.getWPEQML()+"')";
		//D023	�����ƻ� 			TB_HBWRDSC
		if("D023".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_HBWRDSC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"LNINF,HBGLCN,WRMS)VALUES("
						+dinarySubsql
						+","+bean.getWRAR()
						+",'"+bean.getLNINF()+"','"+bean.getHBGLCN()+"',"+bean.getWRMS()+")";
		//D024	�ص����ֲ̾��ƻ�	TB_CLPJPRWR
		if("D024".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_CLPJPRWR (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"WRGLCN,WRD,WRL)VALUES("
						+dinarySubsql
						+","+bean.getWRAR()
						+",'"+bean.getWRGLCN()+"',"+bean.getWRD()+","+bean.getWRL()+")";
		//D025	�ص����̳��		TB_CLPJSCDN
		if("D025".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO TB_CLPJSCDN (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SCDMGLCN,SCDMBU,SCDML,SCDMD)VALUES("
						+dinarySubsql
						+",'"+bean.getSCDMGLCN()+"',"+bean.getSCDMBU()+","+bean.getSCDML()+","+bean.getSCDMD()+")";
		System.out.println(XQFLDM+"::"+insertSql);
		return insertSql;
	}

}
