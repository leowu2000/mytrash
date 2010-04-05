package com.buiness.dao;

import com.buiness.form.ConfigBean;
import com.buiness.form.DetailBean;
import com.buiness.form.PJRCNBean;
import com.buiness.form.PjrDetailBean;
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
	
	public static String insertSql_ConfigBean(ConfigBean bean,String path){
		String sSQL = "INSERT INTO TB_CONFIG("
				+"CLIENT_TYPE,XZQH_S,XZQH_SI,XZQH_X,LYSX_LY,LYSX_SX,LYSX_YJZL,LYSX_EJZL,"
				+"SERVER_NAME,SERVER_IP,SERVER_PORT,TBDW,BSDW,FXZRR,LXDH,QF,NG,SH)VALUES("
				+"'"+bean.getCLIENT_TYPE()+"','"+bean.getXZQH_S()+"','"+bean.getXZQH_SI()
				+"','"+bean.getXZQH_X()+"','"+bean.getLYSX_LY()+"','"+bean.getLYSX_SX()
				+"','"+bean.getLYSX_YJZL()+"','"+bean.getLYSX_EJZL()+"','"+bean.getSERVER_NAME()
				+"','"+bean.getSERVER_IP()+"','"+bean.getSERVER_PORT()+"','"+bean.getTBDW()
				+"','"+bean.getBSDW()+"','"+bean.getFXZRR()
				+"','"+bean.getLXDH()+"','"+bean.getQF()+"','"+bean.getNG()+"','"+bean.getSH()+"')";
		return sSQL ;
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
				+bean.getPJRNO()+","
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
	
	public static String insertSQL_PjrBean(PjrDetailBean bean,String path,PrjBean prjbean,String GCFL){
		String dinarySubsql=bean.getPJRNO()+","+prjbean.getPJNO()+",#"+bean.getDTCDT()+"#,'"+prjbean.getPJNM()+"','";
		String insertSql ="";
		if("B".trim().equals(GCFL)){
			//TB_RSR=ˮ��=B
			insertSql = "INSERT INTO TB_RSR (PJRNO,PJNO,DTCDT,PJNM,RSCLS,RV,RZ,RQ,DFPFCN,DBSTBCN," +
					"BRBPPFCN,ESPFCN,EDDPFCN,GTHOPFCN,COMMCN)VALUES("
					+dinarySubsql
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
					+bean.getCOMMCN()+"')";						//йˮ���������״��
			
		}
		if("K".trim().equals(GCFL)){
			//TB_WLR=ˮբ=K
			insertSql = "INSERT INTO TB_WLR (PJRNO,PJNO,DTCDT,PJNM," 
					+"WLGR,RUPGZ,RDWGZ,RQO,RWSTOWLT,GFPFCN,STPFCN," 
					+"EDDPFCN,GTHOPFCN,COMMCN)VALUES("
					+dinarySubsql
					+bean.getWLGR()+"'," //ˮբ�ȱ�(һ/��/��/��/��)
					+bean.getRUPGZ()+","	//��ǰբ��ˮλ(��)
					+bean.getRDWGZ()+","	//��ǰբ��ˮλ(��)
					+bean.getRQO()+","	//��ǰ��բ����(������/��)
					+bean.getRWSTOWLT()+",'"	//��ǰˮ���բ������(��)
					+bean.getGFPFCN()+"','"		//�ӻ����״��
					+bean.getSTPFCN()+"','"			//���������״��
					+bean.getEDDPFCN()+"','"	//���ܹ����״��==========TB_RSR===TB_WLR
					+bean.getGTHOPFCN()+"','"	//բ�š����ջ����״��====TB_RSR===TB_WLR
					+bean.getCOMMCN()+"')";	//ͨѶ�ֶμ�״��==========TB_RSR===TB_WLR
					
					
		}
		if("N".trim().equals(GCFL)){
			//TB_COWAPJ=�κӹ���=N
			insertSql = "INSERT INTO TB_COWAPJ (PJRNO,PJNO,DTCDT,PJNM," 
				+"BKOT,FLCNDSC,WDCNDSC,PRCCLR,SPURDSC,BPPJCN)VALUES("
				+dinarySubsql
				+bean.getBKOT()+"','"	//���ڰ���(��/��)======TB_DKR====TB_COWAPJ===TB_STOFLER
				+bean.getFLCNDSC()+"','"								//ˮ���������
				+bean.getWDCNDSC()+"','"								//�ӵ��������
				+bean.getPRCCLR()+"','"								//���ϵ���ʵ
				+bean.getSPURDSC()+"','"								//�ص���������
				+bean.getBPPJCN()+"')";								//�����������
		}
		if("F".trim().equals(GCFL)){
			//TB_STOFLER=����=F
			insertSql = "INSERT INTO TB_STOFLER (PJRNO,PJNO,DTCDT,PJNM," 
					+"BKOT,DSFLWZ,DSFLW,TRFCN,DKCN,CWFCCN,SFSRCN," 
					+"FLFADSC,IDSTCN)VALUES("
					+dinarySubsql
					+bean.getBKOT()+"',"	//���ڰ���(��/��)======TB_DKR====TB_COWAPJ===TB_STOFLER
					+bean.getDSFLWZ()+","			//�����(��)��ˮλ(��)
					+bean.getDSFLW()+",'"			//�����(��)����(��������)
					+bean.getTRFCN()+"','"			//��ͨ״��
					+bean.getDKCN()+"','"					//�׵�״��
					+bean.getCWFCCN()+"','"			//ͨѶԤ����ʩ״��
					+bean.getSFSRCN()+"','"				//��ˮ������ʩ״��
					+bean.getFLFADSC()+"','"			//�ֺ���ʩ״��
					+bean.getIDSTCN()+"')";				//��ˮվ״��
		}
		if("D".trim().equals(GCFL)
				||"E".trim().equals(GCFL)
				||"H".trim().equals(GCFL)
				||"P".trim().equals(GCFL)){
			//TB_DKR=�̷�==����==����==����
			insertSql = "INSERT INTO TB_DKR (PJRNO,PJNO,DTCDT,PJNM," 
						+"DKGR,BKOT,STECH,RZ,RQ,WSTODC,DKPFCN," 
						+"TSCN,BRBPPFCN)VALUES("
						+dinarySubsql
						+bean.getDKGR()+"','"			//�̷�����(1/2/3/4/5)
						+bean.getBKOT()+"','"
						+bean.getSTECH()+"',"								//��ֹ׮��
						+bean.getRZ()+","	//z��ǰ����ˮλ(��)========TB_RSR===TB_DKR
						+bean.getRQ()+","	//��ǰк��(������/��)========TB_RSR===TB_DKR
						+bean.getWSTODC()+",'"	
						+bean.getDKPFCN()+"','"								//�̷����״��
						+bean.getTSCN()+"','"								//���̽�����״��
						+bean.getBRBPPFCN()+"')";	//���»����ȶ����========TB_RSR===TB_DKR
						
		}
		return insertSql;
	}
	
	public static String insertSQL_DNCDetailBean(DetailBean bean,String path,String XQFLDM){
		String tablename = BuinessDao.getXqFlTabname(path, XQFLDM);
		String dinarySubsql=bean.getDNCNO()+","+bean.getPJNO()+","+bean.getSTTPCD()+",#"+bean.getDAGTM()+"#,'"+bean.getDNCNM()+"'";
		String insertSql ="";
		//D001	����				TB_BURDSC	
		if("D001".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"BUW,BUVL,BUZDF,BUQ,BURLDGL)VALUES("
						+dinarySubsql
						+","+bean.getDSSPN()+","+bean.getINPN()+","+bean.getDTHPN()+","+bean.getWRHS()+","+bean.getCRPDSSAR()
						+","+bean.getSCDMFMAR()+","+bean.getDRCECLS()
						+","+bean.getBUW()+","+bean.getBUVL()+","+bean.getBUZDF()+","+bean.getBUQ()+",'"+bean.getBURLDGL()+"')";
		//D002	����				TB_OVFLDSC
		if("D002".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVFLL,OVFLZ,DSQ)VALUES("
						+dinarySubsql
						+","+bean.getOVFLL()+","+bean.getOVFLZ()+","+bean.getDSQ()+")";
		//D003	©��				TB_LKDSC
		if("D003".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,TODFTDI,"
						+"LKDMT,LKQ,LKWTLH,LKSAR)VALUES("
						+dinarySubsql
						+",'"+bean.getLKGTU()+"',"+bean.getTODFTDI()
						+","+bean.getLKDMT()+","+bean.getLKQ()+","+bean.getLKWTLH()+","+bean.getLKSAR()+")";
		//D004	��ӿ				TB_PPDSC
		if("D004".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,"
						+"TODFTDI,"
						+"PPQ,WTLH,PPSAR)VALUES("
						+dinarySubsql
						+",'"+bean.getLKGTU()
						+"',"+bean.getPPQ()
						+","+bean.getTODFTDI()+","+bean.getWTLH()+","+bean.getPPSAR()+")";
		//D005	�ݿ�				TB_PITDSC
		if("D005".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SBDSP,SBAR)VALUES("
						+dinarySubsql
						+","+bean.getSBDSP()+","+bean.getSBAR()+")";
		//D006	���� 			TB_SLDSC
		if("D006".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLBU)VALUES("
						+dinarySubsql
						+","+bean.getSLUPAG()+","+bean.getSLBU()+")";
		//D007	��ˢ				TB_UNDSC
		if("D007".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"UNDAR,UNDD,UNDL)VALUES("
						+dinarySubsql
						+","+bean.getTODFTDI()
						+","+bean.getUNDAR()+","+bean.getUNDD()+","+bean.getUNDL()+")";
		//D008	�ѷ�				TB_CRDSC
		if("D008".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"CRDR,CRD,CRL,CRW)VALUES("
						+dinarySubsql
						+",'"+bean.getCRDR()+"',"+bean.getCRD()+","+bean.getCRL()+","+bean.getCRW()+")";
		//D009	����				TB_CVDSC
		if("D009".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"WDQ,"
						+"CVL,CVBU,RVH,FLCNDSC)VALUES("
						+dinarySubsql
						+","+bean.getTODFTDI()
						+","+bean.getWDQ()
						+","+bean.getCVL()+","+bean.getCVBU()+","+bean.getRVH()+",'"+bean.getFLCNDSC()+"')";
		//D010	��ˮ				TB_SPDSC
		if("D010".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SPAR,SPQ)VALUES("
						+dinarySubsql
						+","+bean.getSPAR()+","+bean.getSPQ()+")";
		//D011	 �˿� 			TB_BLBAD
		if("D011".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WDQ,"
						+"BLH,WNS)VALUES("
						+dinarySubsql
						+","+bean.getWDQ()
						+","+bean.getBLH()+","+bean.getWNS()+")";
		//D012	����				TB_SLUDSC
		if("D012".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLUDSP,SLUTP,SLUGLCN)VALUES("
						+dinarySubsql
						+","+bean.getSLUPAG()
						+","+bean.getSLUDSP()+",'"+bean.getSLUTP()+"','"+bean.getSLUGLCN()+"')";

		//D013	����ʧ��			TB_HOMLFDSC
		if("D013".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"POWCUT,HOMLF,GSDST,MLFCN)VALUES("
						+dinarySubsql
						+",'"+bean.getPOWCUT()+"','"+bean.getHOMLF()+"','"+bean.getGSDST()+"','"+bean.getMLFCN()+"')";
		//D014	բ���ƻ�			TB_GTWRDSC
		if("D014".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRDSC,WRQ)VALUES("
						+dinarySubsql
						+",'"+bean.getWRDSC()+"',"+bean.getWRQ()+")";
		//D015	����				TB_BRDMDSC
		if("D015".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"PJPS,BRDMLDGL,BRDMW,BRZDMCDI,BRV,BRDMQ)VALUES("
						+dinarySubsql
						+","+bean.getDSSPN()+","+bean.getINPN()+","+bean.getDTHPN()+","+bean.getWRHS()
						+","+bean.getCRPDSSAR()+","+bean.getSCDMFMAR()+","+bean.getDRCECLS()
						+",'"+bean.getPJPS()+"','"+bean.getBRDMLDGL()+"',"+bean.getBRDMW()+","+bean.getBRZDMCDI()
						+","+bean.getBRV()+","+bean.getBRDMQ()+")";
		//D016	�㸲				TB_OVTUDSC
		if("D016".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVTUDR,OVTUAG)VALUES("
						+dinarySubsql
						+",'"+bean.getOVTUDR()
						+"',"+bean.getOVTUAG()+")";
		//D017	Ӧ������			TB_STREXDSC
		if("D017".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"MXTNST,MXCMST,CONGR,ASTR)VALUES("
						+dinarySubsql
						+","+bean.getMXTNST()+","+bean.getMXCMST()+",'"+bean.getCONGR()+"',"+bean.getASTR()+")";
		//D018	̮��				TB_SLIDSC
		if("D018".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLIAR,SLIMS)VALUES("
						+dinarySubsql
						+","+bean.getSLIAR()+","+bean.getSLIMS()+")";
		//D019	����				TB_PLUDSC
		if("D019".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"PLTNM,PLTBU)VALUES("
						+dinarySubsql
						+",'"+bean.getPLTNM()+"',"+bean.getPLTBU()+")";
		//D020	�����ƻ�			TB_BSWRDSC
		if("D020".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"GRNSPDSC,GROVCHWR,GRNUSB)VALUES("
						+dinarySubsql
						+",'"+bean.getGRNSPDSC()+"','"+bean.getGROVCHWR()+"',"+bean.getGRNUSB()+")";
		//D021	���ܹ��ƻ�		TB_EDDWRDSC
		if("D021".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"APWR,WSTWR)VALUES("
						+dinarySubsql
						+",'"+bean.getAPWR()+"','"+bean.getWSTWR()+"')";
		//D022	������ˮʧЧ		TB_BSWPLPDS
		if("D022".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WPPLU,WPEQML)VALUES("
						+dinarySubsql
						+",'"+bean.getWPPLU()+"','"+bean.getWPEQML()+"')";
		//D023	�����ƻ� 			TB_HBWRDSC
		if("D023".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"LNINF,HBGLCN,WRMS)VALUES("
						+dinarySubsql
						+","+bean.getWRAR()
						+",'"+bean.getLNINF()+"','"+bean.getHBGLCN()+"',"+bean.getWRMS()+")";
		//D024	�ص����ֲ̾��ƻ�	TB_CLPJPRWR
		if("D024".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"WRGLCN,WRD,WRL)VALUES("
						+dinarySubsql
						+","+bean.getWRAR()
						+",'"+bean.getWRGLCN()+"',"+bean.getWRD()+","+bean.getWRL()+")";
		//D025	�ص����̳��		TB_CLPJSCDN
		if("D025".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SCDMGLCN,SCDMBU,SCDML,SCDMD)VALUES("
						+dinarySubsql
						+",'"+bean.getSCDMGLCN()+"',"+bean.getSCDMBU()+","+bean.getSCDML()+","+bean.getSCDMD()+")";
		//D026	ɽ���ֺ�		TB_TORRENTS
		if("D026".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,DSSAREA,DTHPN,WRHS,DRCECLS,DAYDP,TDP,DSSTP)VALUES("
						+dinarySubsql
						+","+bean.getDSSPN()+","+bean.getDSSAREA()+","+bean.getDTHPN()+","+bean.getWRHS()+","
						+bean.getDRCECLS()+","+bean.getDAYDP()+","+bean.getTDP()+",'"+bean.getDSSTP()+"')";
		return insertSql;
	}

}
