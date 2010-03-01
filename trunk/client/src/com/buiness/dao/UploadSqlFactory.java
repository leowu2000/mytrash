package com.buiness.dao;

import java.sql.ResultSet;

import com.buiness.form.ConfigBean;
import com.buiness.form.DetailBean;
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
				+rs.getInt("RZ")+"','"//��ǰ����ˮλ(��)
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
				+rs.getInt("RV")+","// ��ǰ����(��������)
				+rs.getInt("RZ")+","// ��ǰ����ˮλ(��)
				+rs.getInt("RQ")+",'"// ��ǰк��(������/��)
				+rs.getString("DFPFCN")+"','"// �ӻ����״��
				+rs.getString("DBSTBCN")+"','"// �����ȶ����
				+rs.getString("BRBPPFCN")+"','"// ���»����ȶ����
				+rs.getString("ESPFCN")+"','"// йˮ���������״��
				+rs.getString("EDDPFCN")+"','"// ���ܹ����״��
				+rs.getString("GTHOPFCN")+"','"// բ�š����ջ����״��
				+rs.getString("COMMCN")+"')";
		return sSQL;
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
						+","+rs.getInt("DSSPN")+","+rs.getInt("INPN")+","+rs.getInt("DTHPN")+","+rs.getInt("WRHS")+","+rs.getInt("CRPDSSAR")
						+","+rs.getInt("SCDMFMAR")+","+rs.getInt("DRCECLS")
						+","+rs.getInt("BUW")+","+rs.getInt("BUVL")+","+rs.getInt("BUZDF")+","+rs.getInt("BUQ")+",'"+rs.getString("BURLDGL")+"')";
		//D002	����				TB_OVFLDSC
		if("D002".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVFLL,OVFLZ,DSQ)VALUES("
						+dinarySubsql
						+","+rs.getInt("OVFLL")+","+rs.getInt("OVFLZ")+","+rs.getInt("DSQ")+")";
		//D003	©��				TB_LKDSC
		if("D003".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,"
						+"LKDMT,LKQ,LKWTLH,LKSAR)VALUES("
						+dinarySubsql
						+",'"+rs.getString("LKGTU")
						+"',"+rs.getInt("LKDMT")+","+rs.getInt("LKQ")+","+rs.getInt("LKWTLH")+","+rs.getInt("LKSAR")+")";
		//D004	��ӿ				TB_PPDSC
		if("D004".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,"
						+"TODFTDI,"
						+"PPQ,WTLH,PPSAR)VALUES("
						+dinarySubsql
						+",'"+rs.getString("LKGTU")
						+"',"+rs.getInt("PPQ")
						+","+rs.getInt("TODFTDI")+","+rs.getInt("WTLH")+","+rs.getInt("PPSAR")+")";
		//D005	�ݿ�				TB_PITDSC
		if("D005".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SBDSP,SBAR)VALUES("
						+dinarySubsql
						+","+rs.getInt("SBDSP")+","+rs.getInt("SBAR")+")";
		//D006	���� 			TB_SLDSC
		if("D006".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLBU)VALUES("
						+dinarySubsql
						+","+rs.getInt("SLUPAG")+","+rs.getInt("SLBU")+")";
		//D007	��ˢ				TB_UNDSC
		if("D007".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"UNDAR,UNDD,UNDL)VALUES("
						+dinarySubsql
						+","+rs.getInt("TODFTDI")
						+","+rs.getInt("UNDAR")+","+rs.getInt("UNDD")+","+rs.getInt("UNDL")+")";
		//D008	�ѷ�				TB_CRDSC
		if("D008".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"CRDR,CRD,CRL,CRW)VALUES("
						+dinarySubsql
						+",'"+rs.getString("CRDR")+"',"+rs.getInt("CRD")+","+rs.getInt("CRL")+","+rs.getInt("CRW")+")";
		//D009	����				TB_CVDSC
		if("D009".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"WDQ,"
						+"CVL,CVBU,RVH,FLCNDSC)VALUES("
						+dinarySubsql
						+","+rs.getInt("TODFTDI")
						+","+rs.getInt("WDQ")
						+","+rs.getInt("CVL")+","+rs.getInt("CVBU")+","+rs.getInt("RVH")+",'"+rs.getString("FLCNDSC")+"')";
		//D010	��ˮ				TB_SPDSC
		if("D010".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SPAR,SPQ)VALUES("
						+dinarySubsql
						+","+rs.getInt("SPAR")+","+rs.getInt("SPQ")+")";
		//D011	 �˿� 			TB_BLBAD
		if("D011".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WDQ,"
						+"BLH,WNS)VALUES("
						+dinarySubsql
						+","+rs.getInt("WDQ")
						+","+rs.getInt("BLH")+","+rs.getInt("WNS")+")";
		//D012	����				TB_SLUDSC
		if("D012".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLUDSP,SLUTP,SLUGLCN)VALUES("
						+dinarySubsql
						+","+rs.getInt("SLUPAG")
						+","+rs.getInt("SLUDSP")+","+rs.getString("SLUTP")+",'"+rs.getString("SLUGLCN")+"')";

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
						+",'"+rs.getString("WRDSC")+"',"+rs.getInt("WRQ")+")";
		//D015	����				TB_BRDMDSC
		if("D015".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"PJPS,BRDMLDGL,BRDMW,BRZDMCDI,BRV,BRDMQ)VALUES("
						+dinarySubsql
						+","+rs.getInt("DSSPN")+","+rs.getInt("INPN")+","+rs.getInt("DTHPN")+","+rs.getInt("WRHS")
						+","+rs.getInt("CRPDSSAR")+","+rs.getInt("SCDMFMAR")+","+rs.getInt("DRCECLS")
						+",'"+rs.getString("PJPS")+"','"+rs.getString("BRDMLDGL")+"',"+rs.getInt("BRDMW")+","+rs.getInt("BRZDMCDI")
						+","+rs.getInt("BRV")+","+rs.getInt("BRDMQ")+")";
		//D016	�㸲				TB_OVTUDSC
		if("D016".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVTUDR,OVTUAG)VALUES("
						+dinarySubsql
						+",'"+rs.getString("OVTUDR")
						+"',"+rs.getInt("OVTUAG")+")";
		//D017	Ӧ������			TB_STREXDSC
		if("D017".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"MXTNST,MXCMST,CONGR,ASTR)VALUES("
						+dinarySubsql
						+","+rs.getInt("MXTNST")+","+rs.getInt("MXCMST")+",'"+rs.getString("CONGR")+"',"+rs.getInt("ASTR")+")";
		//D018	̮��				TB_SLIDSC
		if("D018".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLIAR,SLIMS)VALUES("
						+dinarySubsql
						+","+rs.getInt("SLIAR")+","+rs.getInt("SLIMS")+")";
		//D019	����				TB_PLUDSC
		if("D019".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"PLTNM,PLTBU)VALUES("
						+dinarySubsql
						+",'"+rs.getString("PLTNM")+"',"+rs.getInt("PLTBU")+")";
		//D020	�����ƻ�			TB_BSWRDSC
		if("D020".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"GRNSPDSC,GROVCHWR,GRNUSB)VALUES("
						+dinarySubsql
						+",'"+rs.getString("GRNSPDSC")+"','"+rs.getString("GROVCHWR")+"',"+rs.getInt("GRNUSB")+")";
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
						+","+rs.getInt("WRAR")
						+",'"+rs.getString("LNINF")+"','"+rs.getString("HBGLCN")+"',"+rs.getInt("WRMS")+")";
		//D024	�ص����ֲ̾��ƻ�	TB_CLPJPRWR
		if("D024".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"WRGLCN,WRD,WRL)VALUES("
						+dinarySubsql
						+","+rs.getInt("WRAR")
						+",'"+rs.getString("WRGLCN")+"',"+rs.getInt("WRD")+","+rs.getInt("WRL")+")";
		//D025	�ص����̳��		TB_CLPJSCDN
		if("D025".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SCDMGLCN,SCDMBU,SCDML,SCDMD)VALUES("
						+dinarySubsql
						+",'"+rs.getString("SCDMGLCN")+"',"+rs.getInt("SCDMBU")+","+rs.getInt("SCDML")+","+rs.getInt("SCDMD")+")";
		System.out.println(XQFLDM+"::"+insertSql);
		return insertSql;
	}

}
