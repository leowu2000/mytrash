package com.buiness.dao;

import java.sql.ResultSet;

import com.buiness.form.ConfigBean;
import com.buiness.form.DetailBean;
import com.buiness.form.PjrDetailBean;
import com.buiness.form.PrjBean;
import com.buiness.form.RSRBean;
import com.buiness.form.STDNCBean;
import com.core.UUIdFactory;
import com.util.UtilDateTime;

public class UploadSqlFactory {
	
public static String uploadSQL_PJBean(ResultSet rs)throws java.sql.SQLException {
		
		String sSQL = "INSERT INTO TB_PJ(PJNO,PJNMCD,"
			+"PJNM,CNTCD,FPDUTY,FPDUTYPH)VALUES("
			+rs.getInt("PJNO")+",'"
			+rs.getString("PJNMCD")+"','"
			+rs.getString("PJNM")+"','"
			+rs.getString("CNTCD")+"','"
			+rs.getString("FPDUTY")+"','"
			+rs.getString("FPDUTYPH")+"')";
		return sSQL;
	}
	
public static String uploadSQL_REPORTBean(ResultSet rs,String tablename)throws java.sql.SQLException {
			
			String sSQL = "INSERT INTO "+tablename+"(RPJINCD,WTTT,"
				+"WTDT,ACTICO,WTDPCD)VALUES("
				+rs.getInt("RPJINCD")+","
				+rs.getString("WTTT")+",#"
				+rs.getString("WTDT")+"#,'"
				+rs.getString("ACTICO")+"','"
				+rs.getString("WTDPCD")+"')";
			return sSQL;
		}
	
public static String uploadSQL_FXJBBean(ResultSet rs)throws java.sql.SQLException {
		
		String sSQL = "INSERT INTO TB_FXJB(RPJINCD,ISSUE,WTTT,"
			+"WTDT,ACTICO,NT1,QF,SH,NG,WTDPCD)VALUES("
			+rs.getInt("RPJINCD")+","
			+rs.getInt("ISSUE")+","
			+rs.getString("WTTT")+",#"
			+rs.getString("WTDT")+"#,'"
			+rs.getString("ACTICO")+"','"
			+rs.getString("NT1")+"','"
			+rs.getString("QF")+"','"
			+rs.getString("SH")+"','"
			+rs.getString("NG")+"','"
			+rs.getString("WTDPCD")+"')";
		return sSQL;
	}
	
public static String uploadSQL_PJRCNBean(ResultSet rs)throws java.sql.SQLException {
		
		String sSQL = "INSERT INTO TB_PJRCN(PJRNO,PJNO,DTCDT,PJNM,"
			+"GCFLDM,DNCFC,RDERESCN,WTDPCD,WTDPDT,NT)VALUES("
			+rs.getInt("PJRNO")+","//���б��
			+rs.getInt("PJNO")+",#"//���̱��
			+rs.getString("DTCDT")+"#,'"//���ʱ��
			+rs.getString("PJNM")+"','"//��������
			+rs.getString("GCFLDM")+"','"//���̷������
			+rs.getString("DNCFC")+"','"//����Ԥ��
			+rs.getString("RDERESCN")+"','"//������Դ�䱸
			+rs.getString("WTDPCD")+"',#"//���λ����
			+rs.getString("WTDPDT")+"#,'"//�ʱ��
			+rs.getString("NT")+"')";//����
		return sSQL;
	}
	
public static String uploadSQL_STDNCBean(ResultSet rs,String XQFLDM)throws java.sql.SQLException {
		String sSQL = "INSERT INTO TB_STDNC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,XQFLDM,DNCGR," +
				"DAGPLCCH,DAGLO,RDEPL,RDERESCN,TPN,PLAPN,PLIPN,RDECNRL,DNCCUAN,DNCESTDV,DNCPBNFZ,RZ,WTHCN" +
				",FHYWTHCN,DNCADDSC,WTDPCD,WTDPDT)VALUES("
				+rs.getInt("DNCNO")+","//������
				+rs.getInt("PJNO")+",'"//���̱��
				+rs.getString("STTPCD")+"',#"//���������
				+rs.getString("DAGTM")+"#,'"//����ʱ��
				+rs.getString("DNCNM")+"','"//��������
				+XQFLDM+"','"//����������
				+rs.getString("DNCGR")+"','"//���鼶��
				+rs.getString("DAGPLCCH")+"','"//���յص�׮��
				+rs.getString("DAGLO")+"','"//���ղ�λ
				+rs.getString("RDEPL")+"','"//���շ���
				+rs.getString("RDERESCN")+"','"//������Դ�䱸
				+rs.getInt("TPN")+"','"//Ⱥ��Ͷ��(��)
				+rs.getInt("PLAPN")+"','"//��ž�Ͷ��(��)
				+rs.getInt("PLIPN")+"','"//�侯Ͷ��(��)
				+rs.getString("RDECNRL")+"','"//��չ�����
				+rs.getString("DNCCUAN")+"','"//����ԭ�����
				+rs.getString("DNCESTDV")+"','"//���鷢չ����
				+rs.getString("DNCPBNFZ")+"','"//����Ӱ�췶Χ
				+rs.getFloat("RZ")+"','"//��ǰ����ˮλ(��)
				+rs.getString("WTHCN")+"','"//����ʱ�������
				+rs.getString("FHYWTHCN")+"','"//δ��ˮ���������
				+rs.getString("DNCADDSC")+"','"//��������
				+rs.getString("WTDPCD")+"',#"//���λ����
				+rs.getString("WTDPDT")+"#)";//�ʱ��
		return sSQL;
	}
	
public static String uploadSQL_RSRBean(ResultSet rs)throws java.sql.SQLException {
		String sSQL = "INSERT INTO TB_RSR (PJRNO,PJNO,DTCDT,PJNM,RSCLS,RV,RZ,RQ,DFPFCN,DBSTBCN," +
				"BRBPPFCN,ESPFCN,EDDPFCN,GTHOPFCN,COMMCN)VALUES("
				+rs.getInt("PJRNO")+","
				+rs.getString("PJNO")+",#"
				+rs.getString("DTCDT")+"#,'"
				+rs.getString("PJNM")+"','"// ��������
				+rs.getString("RSCLS")+"',"// ˮ�����(����/�к�/���տ�)
				+rs.getFloat("RV")+","// ��ǰ����(��������)
				+rs.getFloat("RZ")+","// ��ǰ����ˮλ(��)
				+rs.getFloat("RQ")+",'"// ��ǰк��(������/��)
				+rs.getString("DFPFCN")+"','"// �ӻ����״��
				+rs.getString("DBSTBCN")+"','"// �����ȶ����
				+rs.getString("BRBPPFCN")+"','"// ���»����ȶ����
				+rs.getString("ESPFCN")+"','"// йˮ���������״��
				+rs.getString("EDDPFCN")+"','"// ���ܹ����״��
				+rs.getString("GTHOPFCN")+"','"// բ�š����ջ����״��
				+rs.getString("COMMCN")+"')";
		return sSQL;
	}
	
public static String uploadSQL_PjrDetailBean(ResultSet rs,String GCFL)throws java.sql.SQLException {
		String dinarySubsql=rs.getInt("PJRNO")+","+rs.getInt("PJNO")+",#"+rs.getString("DTCDT")+"#,'"+rs.getString("PJNM")+"','";
		String insertSql ="";
		if("B".trim().equals(GCFL)){
			//TB_RSR=ˮ��=B
			insertSql = "INSERT INTO TB_RSR (PJRNO,PJNO,DTCDT,PJNM,RSCLS,RV,RZ,RQ,DFPFCN,DBSTBCN," +
					"BRBPPFCN,ESPFCN,EDDPFCN,GTHOPFCN,COMMCN)VALUES("
					+dinarySubsql
					+rs.getString("RSCLS")+"',"// ˮ�����(����/�к�/���տ�)
					+rs.getFloat("RV")+","// ��ǰ����(��������)
					+rs.getFloat("RZ")+","// ��ǰ����ˮλ(��)
					+rs.getFloat("RQ")+",'"// ��ǰк��(������/��)
					+rs.getString("DFPFCN")+"','"// �ӻ����״��
					+rs.getString("DBSTBCN")+"','"// �����ȶ����
					+rs.getString("BRBPPFCN")+"','"// ���»����ȶ����
					+rs.getString("ESPFCN")+"','"// йˮ���������״��
					+rs.getString("EDDPFCN")+"','"// ���ܹ����״��
					+rs.getString("GTHOPFCN")+"','"// բ�š����ջ����״��
					+rs.getString("COMMCN")+"')";						//йˮ���������״��
			
		}
		if("K".trim().equals(GCFL)){
			//TB_WLR=ˮբ=K
			insertSql = "INSERT INTO TB_DKR (PJRNO,PJNO,DTCDT,PJNM," 
					+"WLGR,RUPGZ,RDWGZ,RQO,RWSTOWLT,GFPFCN,STPFCN," 
					+"EDDPFCN,GTHOPFCN,COMMCN)VALUES("
					+dinarySubsql
					+rs.getString("WLGR")+"'," //ˮբ�ȱ�(һ/��/��/��/��)
					+rs.getFloat("RUPGZ")+","	//��ǰբ��ˮλ(��)
					+rs.getFloat("RDWGZ")+","	//��ǰբ��ˮλ(��)
					+rs.getFloat("RQO")+","	//��ǰ��բ����(������/��)
					+rs.getFloat("RWSTOWLT")+",'"	//��ǰˮ���բ������(��)
					+rs.getString("GFPFCN")+"','"		//�ӻ����״��
					+rs.getString("STPFCN")+"','"			//���������״��
					+rs.getString("EDDPFCN")+"','"	//���ܹ����״��==========TB_RSR===TB_WLR
					+rs.getString("GTHOPFCN")+"','"	//բ�š����ջ����״��====TB_RSR===TB_WLR
					+rs.getString("COMMCN")+"')";	//ͨѶ�ֶμ�״��==========TB_RSR===TB_WLR
		}
		if("N".trim().equals(GCFL)){
			//TB_COWAPJ=�κӹ���=N
			insertSql = "INSERT INTO TB_DKR (PJRNO,PJNO,DTCDT,PJNM," 
				+"BKOT,FLCNDSC,WDCNDSC,PRCCLR,SPURDSC,BPPJCN)VALUES("
				+dinarySubsql
				+rs.getString("BKOT")+"','"	//���ڰ���(��/��)======TB_DKR====TB_COWAPJ===TB_STOFLER
				+rs.getString("FLCNDSC")+"','"	//ˮ���������
				+rs.getString("WDCNDSC")+"','"	//�ӵ��������
				+rs.getString("PRCCLR")+"','"		//���ϵ���ʵ
				+rs.getString("SPURDSC")+"','"	//�ص���������
				+rs.getString("BPPJCN")+"')";		//�����������
		}
		if("F".trim().equals(GCFL)){
			//TB_STOFLER=����=F
			insertSql = "INSERT INTO TB_DKR (PJRNO,PJNO,DTCDT,PJNM," 
					+"BKOT,DSFLWZ,DSFLW,TRFCN,DKCN,CWFCCN,SFSRCN," 
					+"FLFADSC,IDSTCN)VALUES("
					+dinarySubsql
					+rs.getString("BKOT")+"',"	//���ڰ���(��/��)======TB_DKR====TB_COWAPJ===TB_STOFLER
					+rs.getFloat("DSFLWZ")+","			//�����(��)��ˮλ(��)
					+rs.getFloat("DSFLW")+","			//�����(��)����(��������)
					+rs.getString("TRFCN")+",'"			//��ͨ״��
					+rs.getString("DKCN")+"','"					//�׵�״��
					+rs.getString("CWFCCN")+"','"			//ͨѶԤ����ʩ״��
					+rs.getString("SFSRCN")+"','"				//��ˮ������ʩ״��
					+rs.getString("FLFADSC")+"','"			//�ֺ���ʩ״��
					+rs.getString("IDSTCN")+"')";				//��ˮվ״��
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
						+rs.getString("DKGR")+"','"			//�̷�����(1/2/3/4/5)
						+rs.getString("BKOT")+"','"
						+rs.getString("STECH")+"',"								//��ֹ׮��
						+rs.getFloat("RZ")+","	//z��ǰ����ˮλ(��)========TB_RSR===TB_DKR
						+rs.getFloat("RQ")+","	//��ǰк��(������/��)========TB_RSR===TB_DKR
						+rs.getFloat("WSTODC")+",'"	
						+rs.getString("DKPFCN")+"','"								//�̷����״��
						+rs.getString("TSCN")+"','"								//���̽�����״��
						+rs.getString("BRBPPFCN")+"')";	//���»����ȶ����========TB_RSR===TB_DKR
						
		}
		return insertSql;
	}
	
public static String uploadSQL_DNCDetailBean(ResultSet rs,String XQFLDM,String tablename)throws java.sql.SQLException {

		String dinarySubsql=rs.getInt("DNCNO")+","+rs.getInt("PJNO")+","
							+rs.getInt("STTPCD")+",#"+rs.getString("DAGTM")+"#,'"
							+rs.getString("DNCNM")+"'";
		String insertSql ="";
		//D001	����				TB_BURDSC	
		if("D001".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"BUW,BUVL,BUZDF,BUQ,BURLDGL)VALUES("
						+dinarySubsql
						+","+rs.getInt("DSSPN")+","+rs.getInt("INPN")+","+rs.getInt("DTHPN")+","+rs.getFloat("WRHS")+","+rs.getFloat("CRPDSSAR")
						+","+rs.getFloat("SCDMFMAR")+","+rs.getFloat("DRCECLS")
						+","+rs.getFloat("BUW")+","+rs.getFloat("BUVL")+","+rs.getFloat("BUZDF")+","+rs.getFloat("BUQ")+",'"+rs.getString("BURLDGL")+"')";
		//D002	����				TB_OVFLDSC
		if("D002".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVFLL,OVFLZ,DSQ)VALUES("
						+dinarySubsql
						+","+rs.getFloat("OVFLL")+","+rs.getFloat("OVFLZ")+","+rs.getFloat("DSQ")+")";
		//D003	©��				TB_LKDSC
		if("D003".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,TODFTDI,"
						+"LKDMT,LKQ,LKWTLH,LKSAR)VALUES("
						+dinarySubsql
						+",'"+rs.getString("LKGTU")+"',"+rs.getString("TODFTDI")
						+","+rs.getFloat("LKDMT")+","+rs.getFloat("LKQ")+","+rs.getFloat("LKWTLH")+","+rs.getFloat("LKSAR")+")";
		//D004	��ӿ				TB_PPDSC
		if("D004".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,"
						+"TODFTDI,"
						+"PPQ,WTLH,PPSAR)VALUES("
						+dinarySubsql
						+",'"+rs.getString("LKGTU")
						+"',"+rs.getFloat("PPQ")
						+","+rs.getFloat("TODFTDI")+","+rs.getFloat("WTLH")+","+rs.getFloat("PPSAR")+")";
		//D005	�ݿ�				TB_PITDSC
		if("D005".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SBDSP,SBAR)VALUES("
						+dinarySubsql
						+","+rs.getFloat("SBDSP")+","+rs.getFloat("SBAR")+")";
		//D006	���� 			TB_SLDSC
		if("D006".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLBU)VALUES("
						+dinarySubsql
						+","+rs.getFloat("SLUPAG")+","+rs.getFloat("SLBU")+")";
		//D007	��ˢ				TB_UNDSC
		if("D007".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"UNDAR,UNDD,UNDL)VALUES("
						+dinarySubsql
						+","+rs.getFloat("TODFTDI")
						+","+rs.getFloat("UNDAR")+","+rs.getFloat("UNDD")+","+rs.getFloat("UNDL")+")";
		//D008	�ѷ�				TB_CRDSC
		if("D008".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"CRDR,CRD,CRL,CRW)VALUES("
						+dinarySubsql
						+",'"+rs.getString("CRDR")+"',"+rs.getFloat("CRD")+","+rs.getFloat("CRL")+","+rs.getFloat("CRW")+")";
		//D009	����				TB_CVDSC
		if("D009".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"WDQ,"
						+"CVL,CVBU,RVH,FLCNDSC)VALUES("
						+dinarySubsql
						+","+rs.getFloat("TODFTDI")
						+","+rs.getFloat("WDQ")
						+","+rs.getFloat("CVL")+","+rs.getFloat("CVBU")+","+rs.getFloat("RVH")+",'"+rs.getString("FLCNDSC")+"')";
		//D010	��ˮ				TB_SPDSC
		if("D010".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SPAR,SPQ)VALUES("
						+dinarySubsql
						+","+rs.getFloat("SPAR")+","+rs.getFloat("SPQ")+")";
		//D011	 �˿� 			TB_BLBAD
		if("D011".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WDQ,"
						+"BLH,WNS)VALUES("
						+dinarySubsql
						+","+rs.getFloat("WDQ")
						+","+rs.getFloat("BLH")+","+rs.getFloat("WNS")+")";
		//D012	����				TB_SLUDSC
		if("D012".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLUDSP,SLUTP,SLUGLCN)VALUES("
						+dinarySubsql
						+","+rs.getFloat("SLUPAG")
						+","+rs.getFloat("SLUDSP")+",'"+rs.getString("SLUTP")+"','"+rs.getString("SLUGLCN")+"')";

		//D013	����ʧ��			TB_HOMLFDSC
		if("D013".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"POWCUT,HOMLF,GSDST,MLFCN)VALUES("
						+dinarySubsql
						+",'"+rs.getString("POWCUT")+"','"+rs.getString("HOMLF")+"','"+rs.getString("GSDST")+"','"+rs.getString("MLFCN")+"')";
		//D014	բ���ƻ�			TB_GTWRDSC
		if("D014".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRDSC,WRQ)VALUES("
						+dinarySubsql
						+",'"+rs.getString("WRDSC")+"',"+rs.getFloat("WRQ")+")";
		//D015	����				TB_BRDMDSC
		if("D015".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"PJPS,BRDMLDGL,BRDMW,BRZDMCDI,BRV,BRDMQ)VALUES("
						+dinarySubsql
						+","+rs.getInt("DSSPN")+","+rs.getInt("INPN")+","+rs.getInt("DTHPN")+","+rs.getFloat("WRHS")
						+","+rs.getFloat("CRPDSSAR")+","+rs.getFloat("SCDMFMAR")+","+rs.getFloat("DRCECLS")
						+",'"+rs.getString("PJPS")+"','"+rs.getString("BRDMLDGL")+"',"+rs.getFloat("BRDMW")+","+rs.getFloat("BRZDMCDI")
						+","+rs.getFloat("BRV")+","+rs.getFloat("BRDMQ")+")";
		//D016	�㸲				TB_OVTUDSC
		if("D016".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVTUDR,OVTUAG)VALUES("
						+dinarySubsql
						+",'"+rs.getString("OVTUDR")
						+"',"+rs.getFloat("OVTUAG")+")";
		//D017	Ӧ������			TB_STREXDSC
		if("D017".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"MXTNST,MXCMST,CONGR,ASTR)VALUES("
						+dinarySubsql
						+","+rs.getFloat("MXTNST")+","+rs.getFloat("MXCMST")+",'"+rs.getString("CONGR")+"',"+rs.getFloat("ASTR")+")";
		//D018	̮��				TB_SLIDSC
		if("D018".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLIAR,SLIMS)VALUES("
						+dinarySubsql
						+","+rs.getFloat("SLIAR")+","+rs.getFloat("SLIMS")+")";
		//D019	����				TB_PLUDSC
		if("D019".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"PLTNM,PLTBU)VALUES("
						+dinarySubsql
						+",'"+rs.getString("PLTNM")+"',"+rs.getFloat("PLTBU")+")";
		//D020	�����ƻ�			TB_BSWRDSC
		if("D020".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"GRNSPDSC,GROVCHWR,GRNUSB)VALUES("
						+dinarySubsql
						+",'"+rs.getString("GRNSPDSC")+"','"+rs.getString("GROVCHWR")+"',"+rs.getFloat("GRNUSB")+")";
		//D021	���ܹ��ƻ�		TB_EDDWRDSC
		if("D021".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"APWR,WSTWR)VALUES("
						+dinarySubsql
						+",'"+rs.getString("APWR")+"','"+rs.getString("WSTWR")+"')";
		//D022	������ˮʧЧ		TB_BSWPLPDS
		if("D022".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WPPLU,WPEQML)VALUES("
						+dinarySubsql
						+",'"+rs.getString("WPPLU")+"','"+rs.getString("WPEQML")+"')";
		//D023	�����ƻ� 			TB_HBWRDSC
		if("D023".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"LNINF,HBGLCN,WRMS)VALUES("
						+dinarySubsql
						+","+rs.getFloat("WRAR")
						+",'"+rs.getString("LNINF")+"','"+rs.getString("HBGLCN")+"',"+rs.getFloat("WRMS")+")";
		//D024	�ص����ֲ̾��ƻ�	TB_CLPJPRWR
		if("D024".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"WRGLCN,WRD,WRL)VALUES("
						+dinarySubsql
						+","+rs.getFloat("WRAR")
						+",'"+rs.getString("WRGLCN")+"',"+rs.getFloat("WRD")+","+rs.getFloat("WRL")+")";
		//D025	�ص����̳��		TB_CLPJSCDN
		if("D025".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SCDMGLCN,SCDMBU,SCDML,SCDMD)VALUES("
						+dinarySubsql
						+",'"+rs.getString("SCDMGLCN")+"',"+rs.getFloat("SCDMBU")+","+rs.getFloat("SCDML")+","+rs.getFloat("SCDMD")+")";
		//D026	ɽ���ֺ�		TB_TORRENTS
		if("D026".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,DSSAREA,DTHPN,WRHS,DRCECLS,DAYDP,TDP,DSSTP)VALUES("
						+dinarySubsql
						+","+rs.getInt("DSSPN")+","+rs.getInt("DSSAREA")+","+rs.getInt("DTHPN")+","+rs.getFloat("WRHS")+","
						+rs.getFloat("DRCECLS")+","+rs.getFloat("DAYDP")+","+rs.getFloat("TDP")+",'"+rs.getString("DSSTP")+"')";
		return insertSql;
	}

}
