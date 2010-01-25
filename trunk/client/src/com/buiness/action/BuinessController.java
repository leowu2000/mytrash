package com.buiness.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.buiness.dao.BuinessDao;
import com.buiness.dao.SqlFactory;
import com.buiness.form.DetailBean;
import com.buiness.form.PJRCNBean;
import com.buiness.form.PrjBean;
import com.buiness.form.RSRBean;
import com.buiness.form.STDNCBean;
import com.core.UUIdFactory;

public class BuinessController implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
            HttpServletResponse response)throws Exception{
		String path = request.getRealPath("/");
		String actionType = request.getParameter("actionType");
		request.setCharacterEncoding("GBK");
		if("add".trim().equals(actionType)){
			String gcnm=new String(request.getParameter("PJNM").getBytes("ISO-8859-1"),"GBK");
			String gclb=request.getParameter("gclb");
			String cntcd=request.getParameter("cntcd");
			String hldm=request.getParameter("hldm");
			String gcdm = gclb+hldm.substring(1, 7)+cntcd.substring(0, 1);
			String SQL = "INSERT INTO TB_PJ(PJNO,PJNMCD,PJNM,CNTCD,FPDUTY,FPDUTYPH)VALUES("+UUIdFactory.getMaxId(path, "TB_PJ")+",'"
						+gcdm+"','"+gcnm+"','"+cntcd+"','','')";
			BuinessDao.insertDB(SQL, path);

	        return new ModelAndView("project/prgManage");
		}
		if("del".trim().equals(actionType)){
			String IDs = request.getParameter("IDs");
			
			String SQL = "DELETE FROM TB_PJ WHERE PJNMCD IN("+IDs+")";
			BuinessDao.deleteDB(SQL, path);
			return new ModelAndView("project/prgManage");
		}
		if("peredit".trim().equals(actionType)){
			String IDs = request.getParameter("IDs");
			String SQL = "select * FROM TB_PJ WHERE PJNMCD ="+IDs+"";
			PrjBean bean = BuinessDao.findBySql(SQL, path);
			request.setAttribute("bean", bean);
			return new ModelAndView("project/prgEdit");
		}
		if("add_gqcj".trim().equals(actionType)){
			String SAVETYPES = request.getParameter("SAVETYPES");
			
			PrjBean prjBean = BuinessDao.findBySql("select * from TB_PJ where PJNO="+request.getParameter("GCNAME"),path);
			if("1".trim().equals(SAVETYPES)){
				PJRCNBean bean = _getPJRCNBeanFromRequest(request,response);
				String sSQL  = SqlFactory.insertSQL_PJRCNBean(bean, path,prjBean);
				BuinessDao.insertDB(sSQL, path);
				RSRBean rsrbean = _getRSRBeanFromRquest(request,response);
				String sSQL2  = SqlFactory.insertSQL_PSRBean(rsrbean, path,prjBean);
				BuinessDao.insertDB(sSQL2, path);
			}
			if("2".trim().equals(SAVETYPES)){
				String sSQL = "";
				STDNCBean bean = _getSTDNCeanFromRequest(request,response);
				sSQL = SqlFactory.insertSQL_STDNCBean(bean, path);
				BuinessDao.insertDB(sSQL, path);
			}
			return new ModelAndView("project/gqcjManage");
		}
		return null;
   }
	public static PJRCNBean _getPJRCNBeanFromRequest(HttpServletRequest request,
            HttpServletResponse response)throws Exception{
		PJRCNBean bean = new PJRCNBean();
		String DNCFC = new String(request.getParameter("XQYC").getBytes("ISO-8859-1"),"GBK");
		String RDERESCN = new String(request.getParameter("DFJZZK").getBytes("ISO-8859-1"),"GBK");
		String WTDPCD = new String(request.getParameter("WTDPCD").getBytes("ISO-8859-1"),"GBK");
		String NT = new String(request.getParameter("QT").getBytes("ISO-8859-1"),"GBK");
		
		bean.setPJRNO(request.getParameter("PJRNO")==null?"":request.getParameter("PJRNO"));//���б��
		bean.setPJNO(request.getParameter("GCNAME")==null?"":request.getParameter("GCNAME"));//���̱��
		bean.setDTCDT(request.getParameter("DTCDT")==null?"":request.getParameter("DTCDT"));//���ʱ��
		bean.setPJNM(request.getParameter("GCNAME")==null?"":request.getParameter("GCNAME"));//��������
		bean.setGCFLDM(request.getParameter("GCFLDM")==null?"":request.getParameter("GCFLDM"));//���̷������
		bean.setDNCFC(DNCFC==null?"":DNCFC);//����Ԥ��
		bean.setRDERESCN(RDERESCN==null?"":RDERESCN);//������Դ�䱸
		bean.setWTDPCD(WTDPCD==null?"":WTDPCD);//���λ����
		bean.setWTDPDT(request.getParameter("WTDPDT")==null?"":request.getParameter("WTDPDT"));//�ʱ��
		bean.setNT(NT==null?"":NT);//����
		return bean;
	}
	public static STDNCBean _getSTDNCeanFromRequest(HttpServletRequest request,
            HttpServletResponse response)throws Exception{
		STDNCBean bean = new STDNCBean();
		String DNCNM = new String(request.getParameter("DNCNM").getBytes("ISO-8859-1"),"GBK");//��������
		String RDEPL = new String(request.getParameter("RDEPL").getBytes("ISO-8859-1"),"GBK");//���շ���
		String RDERESCN = new String(request.getParameter("RDERESCN").getBytes("ISO-8859-1"),"GBK");//������Դ�䱸
		String RDECNRL =  new String(request.getParameter("RDECNRL").getBytes("ISO-8859-1"),"GBK");//��չ�����
		String DNCCUAN =  new String(request.getParameter("DNCCUAN").getBytes("ISO-8859-1"),"GBK");//����ԭ�����
		String DNCESTDV = new String(request.getParameter("DNCESTDV").getBytes("ISO-8859-1"),"GBK");//���鷢չ����
		String DNCPBNFZ = new String(request.getParameter("DNCPBNFZ").getBytes("ISO-8859-1"),"GBK");//����Ӱ�췶Χ
		String WTHCN = new String(request.getParameter("WTHCN").getBytes("ISO-8859-1"),"GBK");//����ʱ�������
		String FHYWTHCN = new String(request.getParameter("FHYWTHCN").getBytes("ISO-8859-1"),"GBK");//δ��ˮ���������
		String DNCADDSC = new String(request.getParameter("DNCADDSC").getBytes("ISO-8859-1"),"GBK");//��������
		String WTDPCD = new String(request.getParameter("WTDPCD").getBytes("ISO-8859-1"),"GBK");//���λ����
		
		bean.setDNCNO(request.getParameter("DNCNO")==null?"":request.getParameter("DNCNO"));//������
		bean.setPJNO(request.getParameter("PJNO")==null?"":request.getParameter("PJNO"));//���̱��
		bean.setSTTPCD(request.getParameter("STTPCD")==null?"":request.getParameter("STTPCD"));//���������
		bean.setDAGTM(request.getParameter("DAGTM")==null?"":request.getParameter("DAGTM"));//����ʱ��
		bean.setDNCNM(DNCNM==null?"":DNCNM);//��������
		bean.setXQFLDM(request.getParameter("XQFLDM")==null?"":request.getParameter("XQFLDM"));//����������
		bean.setDNCGR(request.getParameter("DNCGR")==null?"":request.getParameter("DNCGR"));//���鼶��
		bean.setDAGPLCCH(request.getParameter("DAGPLCCH")==null?"":request.getParameter("DAGPLCCH"));//���յص�׮��
		bean.setDAGLO(request.getParameter("DAGLO")==null?"":request.getParameter("DAGLO"));//���ղ�λ
		bean.setRDEPL(RDEPL==null?"":RDEPL);//���շ���
		bean.setRDERESCN(RDERESCN==null?"":RDERESCN);//������Դ�䱸
		bean.setTPN(request.getParameter("TPN")==null?"":request.getParameter("TPN"));//Ⱥ��Ͷ��(��)
		bean.setPLAPN(request.getParameter("PLAPN")==null?"":request.getParameter("PLAPN"));//��ž�Ͷ��(��)
		bean.setPLIPN(request.getParameter("PLIPN")==null?"":request.getParameter("PLIPN"));//�侯Ͷ��(��)
		bean.setRDECNRL(RDECNRL==null?"":RDECNRL);//��չ�����
		bean.setDNCCUAN(DNCCUAN==null?"":DNCCUAN);//����ԭ�����
		bean.setDNCESTDV(DNCESTDV==null?"":DNCESTDV);//���鷢չ����
		bean.setDNCPBNFZ(DNCPBNFZ==null?"":DNCPBNFZ);//����Ӱ�췶Χ
		bean.setRZ(request.getParameter("RZ")==null?"":request.getParameter("RZ"));//��ǰ����ˮλ(��)
		bean.setWTHCN(WTHCN==null?"":WTHCN);//����ʱ�������
		bean.setFHYWTHCN(FHYWTHCN==null?"":FHYWTHCN);//δ��ˮ���������
		bean.setDNCADDSC(DNCADDSC==null?"":DNCADDSC);//��������
		bean.setWTDPCD(WTDPCD==null?"":WTDPCD);//���λ����
		bean.setWTDPDT(request.getParameter("WTDPDT")==null?"":request.getParameter("WTDPDT"));//�ʱ��
		return bean;
	}
	
	public static RSRBean _getRSRBeanFromRquest(HttpServletRequest request,
            HttpServletResponse response)throws Exception{
		RSRBean bean = new RSRBean();
		String BJWHZK = new String(request.getParameter("BJWHZK").getBytes("ISO-8859-1"),"GBK");//�ӻ����״��
		String BTWDZK = new String(request.getParameter("BTWDZK").getBytes("ISO-8859-1"),"GBK");//�����ȶ����
		String HPHAWDQK = new String(request.getParameter("HPHAWDQK").getBytes("ISO-8859-1"),"GBK");//���»����ȶ����
		String XSJZWZK = new String(request.getParameter("XSJZWZK").getBytes("ISO-8859-1"),"GBK");//йˮ���������״��
		String XNGWHZK = new String(request.getParameter("XNGWHZK").getBytes("ISO-8859-1"),"GBK");//���ܹ����״��
		String ZMQBJZK = new String(request.getParameter("ZMQBJZK").getBytes("ISO-8859-1"),"GBK");//բ�š����ջ����״��
		String TXSDJZK = new String(request.getParameter("TXSDJZK").getBytes("ISO-8859-1"),"GBK");//ͨѶ�ֶμ�״��
		
		bean.setPJRNO(request.getParameter("PJRNO")==null?"":request.getParameter("PJRNO"));//���б��
		bean.setPJNO(request.getParameter("PJNO")==null?"":request.getParameter("PJNO"));//���̱��
		bean.setDTCDT(request.getParameter("DTCDT")==null?"":request.getParameter("DTCDT"));//���ʱ��
		bean.setPJNM(request.getParameter("PJNM")==null?"":request.getParameter("PJNM"));//��������
		bean.setRSCLS(request.getParameter("RSCLS")==null?"":request.getParameter("RSCLS"));//ˮ�����(����/�к�/���տ�)
		bean.setRV(request.getParameter("RV")==null?"0":request.getParameter("RV"));//��ǰ����(��������)
		bean.setRZ(request.getParameter("RZ")==null?"0":request.getParameter("RZ"));//��ǰ����ˮλ(��)
		bean.setRQ(request.getParameter("RQ")==null?"0":request.getParameter("RQ"));//��ǰк��(������/��)
		bean.setDFPFCN(BJWHZK==null?"":BJWHZK);//�ӻ����״��
		bean.setDBSTBCN(BTWDZK==null?"":BTWDZK);//�����ȶ����
		bean.setBRBPPFCN(HPHAWDQK==null?"":HPHAWDQK);//���»����ȶ����
		bean.setESPFCN(XSJZWZK==null?"":XSJZWZK);//йˮ���������״��
		bean.setEDDPFCN(XNGWHZK==null?"":XNGWHZK);//���ܹ����״��
		bean.setGTHOPFCN(ZMQBJZK==null?"":ZMQBJZK);//բ�š����ջ����״��
		bean.setCOMMCN(TXSDJZK==null?"":TXSDJZK);//ͨѶ�ֶμ�״��
		return bean;
	}
	
	public static DetailBean _getDetailBeanFromRquest(HttpServletRequest request,
            HttpServletResponse response,String XQFL)throws Exception{
		DetailBean bean = new DetailBean();
		bean.setDNCNO(request.getParameter("DNCNO"));		//������
		bean.setPJNO(request.getParameter("PJNO"));		//���̱��
		bean.setSTTPCD(request.getParameter("STTPCD"));		//���������
		bean.setDAGTM(request.getParameter("DAGTM"));		//����ʱ��
		bean.setDNCNM(request.getParameter("DNCNM"));		//��������
		if("D004".trim().equals(XQFL)||"D003".trim().equals(XQFL)){
			String LKGTU = new String(request.getParameter("LKGTU").getBytes("ISO-8859-1"),"GBK");
			bean.setLKGTU(LKGTU==null?"":LKGTU);		//©ˮ����	==D004==D003
		}
		if("D006".trim().equals(XQFL)||"D012".trim().equals(XQFL)){
			bean.setSLUPAG(request.getParameter("SLUPAG"));		//������Ƕ�(��)	==D006==D012
		}
		if("D007".trim().equals(XQFL)||"D009".trim().equals(XQFL)
				||"D004".trim().equals(XQFL)||"D005".trim().equals(XQFL)){
			bean.setTODFTDI(request.getParameter("TODFTDI"));		//��̽ž���(��)	==D007==D009==D003==D004
		}
		if("D009".trim().equals(XQFL)||"D011".trim().equals(XQFL)){
			bean.setWDQ(request.getParameter("WDQ"));//�ӵ�����(������/��)	==D011==D009
		}
		if("D001".trim().equals(XQFL)||"D015".trim().equals(XQFL)){
			bean.setDSSPN(request.getParameter("DSSPN"));		//�����˿�(��)	==D001==D015
			bean.setINPN(request.getParameter("INPN"));		//�����˿�(��)	==D001==D015
			bean.setDTHPN(request.getParameter("DTHPN"));		//�����˿�(��)	==D001==D015
			bean.setWRHS(request.getParameter("WRHS"));		//��������(��)	==D001==D015
			bean.setCRPDSSAR(request.getParameter("CRPDSSAR"));	//ũ�����������(����)	==D001==D015
			bean.setSCDMFMAR(request.getParameter("SCDMFMAR"));	//�ٻ��������(����)	==D001==D015
			bean.setDRCECLS(request.getParameter("DRCECLS"));		//ֱ�Ӿ�����ʧ(��Ԫ)		==D001==D015
		}
		if("D023".trim().equals(XQFL)||"D024".trim().equals(XQFL)){
			bean.setWRAR(request.getParameter("WRAR"));		//�ƻ����(ƽ����)	==D023==D024
		}
		if("D001".trim().equals(XQFL)){
			//D001	����				TB_BURDSC
			bean.setBUW(request.getParameter("BUW"));			//���ڿ���(��)
			bean.setBUVL(request.getParameter("BUVL"));		//��������(��/��)
			bean.setBUZDF(request.getParameter("BUZDF"));		//����ˮͷ��(��)
			bean.setBUQ(request.getParameter("BUQ"));			//��������(������/��)
			String BURLDGL = new String(request.getParameter("BURLDGL").getBytes("ISO-8859-1"),"GBK");
			bean.setBURLDGL(BURLDGL==null?"":BURLDGL);		//���ڴ����ε�������
		}
		if("D002".trim().equals(XQFL)){
			//D002	����				TB_OVFLDSC
			bean.setOVFLL(request.getParameter("OVFLL"));		//���糤��(��)
			bean.setOVFLZ(request.getParameter("OVFLZ"));		//����ˮλ(��)
			bean.setDSQ(request.getParameter("DSQ"));			//��������(������/��)
		}
		if("D003".trim().equals(XQFL)){
			//D003	©��				TB_LKDSC
			bean.setLKDMT(request.getParameter("LKDMT"));		//©��ֱ��(��)
			bean.setLKQ(request.getParameter("LKQ"));			//©������(��/��)
			bean.setLKWTLH(request.getParameter("LKWTLH"));		//©��ˮ����(��)
			bean.setLKSAR(request.getParameter("LKSAR"));		//���γ�©��Ⱥ���(ƽ����)
		}
		if("D004".trim().equals(XQFL)){
			//D004	��ӿ				TB_PPDSC
			bean.setPPQ(request.getParameter("PPQ"));			//��ӿ����(��/��)
			bean.setWTLH(request.getParameter("WTLH"));		//ˮ����(��)
			bean.setPPSAR(request.getParameter("PPSAR"));		//���γɹ�ӿȺ���(ƽ����)
		}
		if("D005".trim().equals(XQFL)){
			//D005	�ݿ�				TB_PITDSC
			bean.setSBDSP(request.getParameter("SBDSP"));		//�ݿ����(��)
			bean.setSBAR(request.getParameter("SBAR"));		//�ݿ����(ƽ����)
		}
		if("D006".trim().equals(XQFL)){
			//D006	���� 			TB_SLDSC
			bean.setSLBU(request.getParameter("SLBU"));		//�������(������)
		}
		if("D007".trim().equals(XQFL)){
			//D007	��ˢ				TB_UNDSC
			bean.setUNDAR(request.getParameter("UNDAR"));		//��ˢ���(ƽ����)
			bean.setUNDD(request.getParameter("UNDD"));		//��ˢ���(��)
			bean.setUNDL(request.getParameter("UNDL"));		//��ˢ����(��)
		}
		if("D008".trim().equals(XQFL)){
			//D008	�ѷ�				TB_CRDSC
			String CRDR = new String(request.getParameter("CRDR").getBytes("ISO-8859-1"),"GBK");
			bean.setCRDR(CRDR==null?"":CRDR);		//�ѷ췽��
			bean.setCRD(request.getParameter("CRD"));			//�ѷ����(��)
			bean.setCRL(request.getParameter("CRL"));			//�ѷ쳤��(��)
			bean.setCRW(request.getParameter("CRW"));			//�ѷ����(����)
		}
		if("D009".trim().equals(XQFL)){
			//D009	����				TB_CVDSC
			bean.setCVL(request.getParameter("CVL"));			//��������(��)
			bean.setCVBU(request.getParameter("CVBU"));		//�������(������)
			bean.setRVH(request.getParameter("RVH"));			//�Ӱ��߶�(��)
			String FLCNDSC = new String(request.getParameter("FLCNDSC").getBytes("ISO-8859-1"),"GBK");
			bean.setFLCNDSC(FLCNDSC==null?"":FLCNDSC);		//ˮ���������
		}
		if("D010".trim().equals(XQFL)){
			//D010	��ˮ				TB_SPDSC
			bean.setSPAR(request.getParameter("SPAR"));		//��ˮ���(ƽ����)
			bean.setSPQ(request.getParameter("SPQ"));			//��͸����
		}
		if("D011".trim().equals(XQFL)){
			//D011	 �˿� 			TB_BLBAD
			bean.setBLH(request.getParameter("BLH"));			//�˸�(��)
			bean.setWNS(request.getParameter("WNS"));			//����(��)
		}
		if("D012".trim().equals(XQFL)){
			//D012	����				TB_SLUDSC
			bean.setSLUDSP(request.getParameter("SLUDSP"));		//����λ��(��)
			bean.setSLUTP(request.getParameter("SLUTP"));		//��������
			String SLUGLCN = new String(request.getParameter("SLUGLCN").getBytes("ISO-8859-1"),"GBK");
			bean.setSLUGLCN(SLUGLCN==null?"":SLUGLCN);		//������������
		}
		if("D013".trim().equals(XQFL)){
			//D013	����ʧ��			TB_HOMLFDSC
			String POWCUT = new String(request.getParameter("POWCUT").getBytes("ISO-8859-1"),"GBK");
			String HOMLF = new String(request.getParameter("HOMLF").getBytes("ISO-8859-1"),"GBK");
			String GSDST = new String(request.getParameter("GSDST").getBytes("ISO-8859-1"),"GBK");
			String MLFCN = new String(request.getParameter("MLFCN").getBytes("ISO-8859-1"),"GBK");
			bean.setPOWCUT(POWCUT==null?"":POWCUT);		//ͣ��
			bean.setHOMLF(HOMLF==null?"":HOMLF);		//���ջ�ʧ��
			bean.setGSDST(GSDST==null?"":GSDST);		//բ�ž�����
			bean.setMLFCN(MLFCN==null?"":MLFCN);		//ʧ��ʱ����״��
		}
		if("D014".trim().equals(XQFL)){
			//D014	բ���ƻ�			TB_GTWRDSC
			String WRDSC = new String(request.getParameter("WRDSC").getBytes("ISO-8859-1"),"GBK");
			bean.setWRDSC(WRDSC==null?"":WRDSC);		//�ƻ���ʽ
			bean.setWRQ(request.getParameter("WRQ"));			//ʧ��ʱ����(������/��)
		}
		if("D015".trim().equals(XQFL)){
			//D015	����				TB_BRDMDSC
			String PJPS = new String(request.getParameter("PJPS").getBytes("ISO-8859-1"),"GBK");
			String BRDMLDGL = new String(request.getParameter("BRDMLDGL").getBytes("ISO-8859-1"),"GBK");
			bean.setBRDMW(request.getParameter("BRDMW"));		//���ӿ���(��)
			bean.setPJPS(PJPS==null?"":PJPS);		//������״
			bean.setBRZDMCDI(request.getParameter("BRZDMCDI"));	//��ˮλ��̶�����(��)
			bean.setBRV(request.getParameter("BRV"));			//����ʱ����(��������)
			bean.setBRDMQ(request.getParameter("BRDMQ"));		//��������(������/��)
			bean.setBRDMLDGL(BRDMLDGL==null?"":BRDMLDGL);	//���Ӵ����Ρ���������
		}
		if("D016".trim().equals(XQFL)){
			//D016	�㸲				TB_OVTUDSC
			String OVTUDR = new String(request.getParameter("OVTUDR").getBytes("ISO-8859-1"),"GBK");
			bean.setOVTUDR(OVTUDR==null?"":OVTUDR);		//�㸲����
			bean.setOVTUAG(request.getParameter("OVTUAG"));		//�㸲�Ƕ�(��)
		}
		if("D017".trim().equals(XQFL)){
			//D017	Ӧ������			TB_STREXDSC
			String CONGR = new String(request.getParameter("CONGR").getBytes("ISO-8859-1"),"GBK");
			bean.setMXTNST(request.getParameter("MXTNST"));		//�����Ӧ��(ţ/ƽ������)
			bean.setMXCMST(request.getParameter("MXCMST"));		//���ѹӦ��(ţ/ƽ������)
			bean.setCONGR(CONGR==null?"":CONGR);		//���������
			bean.setASTR(request.getParameter("ASTR"));		//����Ӧ��ֵ(ţ/ƽ������)
		}
		if("D018".trim().equals(XQFL)){
			//D018	̮��				TB_SLIDSC
			bean.setSLIAR(request.getParameter("SLIAR"));		//̮�����(ƽ����)
			bean.setSLIMS(request.getParameter("SLIMS"));		//̮������(������)
		}
		if("D019".trim().equals(XQFL)){
			//D019	����				TB_PLUDSC
			String PLTNM = new String(request.getParameter("PLTNM").getBytes("ISO-8859-1"),"GBK");
			String PLTBU = new String(request.getParameter("PLTBU").getBytes("ISO-8859-1"),"GBK");
			bean.setPLTNM(PLTNM==null?"":PLTNM);		//����������
			bean.setPLTBU(PLTBU==null?"":PLTBU);		//���������(������)
		}
		if("D020".trim().equals(XQFL)){
			//D020	�����ƻ�			TB_BSWRDSC
			String GRNSPDSC = new String(request.getParameter("GRNSPDSC").getBytes("ISO-8859-1"),"GBK");
			String GROVCHWR = new String(request.getParameter("GROVCHWR").getBytes("ISO-8859-1"),"GBK");
			bean.setGRNSPDSC(GRNSPDSC==null?"":GRNSPDSC);	//������©����
			bean.setGRNUSB(request.getParameter("GRNUSB"));		//�ݴ������ȳ���(��)
			bean.setGROVCHWR(GROVCHWR==null?"":GROVCHWR);	//���������ƻ�
		}
		if("D021".trim().equals(XQFL)){
			//D021	���ܹ��ƻ�		TB_EDDWRDSC
			String APWR = new String(request.getParameter("APWR").getBytes("ISO-8859-1"),"GBK");
			String WSTWR = new String(request.getParameter("WSTWR").getBytes("ISO-8859-1"),"GBK");
			bean.setAPWR(APWR==null?"":APWR);		//�װ�����
			bean.setWSTWR(WSTWR==null?"":WSTWR);		//ֹˮ�ƻ�
		}
		if("D022".trim().equals(XQFL)){
			//D022		������ˮʧЧ		TB_BSWPLPDS
			String WPPLU = new String(request.getParameter("WPPLU").getBytes("ISO-8859-1"),"GBK");
			String WPEQML = new String(request.getParameter("WPEQML").getBytes("ISO-8859-1"),"GBK");
			bean.setWPPLU(WPPLU==null?"":WPPLU);		//��ˮ�׶���
			bean.setWPEQML(WPEQML==null?"":WPEQML);		//��ˮ�豸ʧ��
		}
		if("D023".trim().equals(XQFL)){
			//D023	�����ƻ� 			TB_HBWRDSC
			String LNINF = new String(request.getParameter("LNINF").getBytes("ISO-8859-1"),"GBK");
			String HBGLCN = new String(request.getParameter("HBGLCN").getBytes("ISO-8859-1"),"GBK");
			bean.setWRMS(request.getParameter("WRMS"));//�ƻ�����(������)
			bean.setLNINF(LNINF==null?"":LNINF);//�Գ�����ɵ�Ӱ��
			bean.setHBGLCN(HBGLCN==null?"":HBGLCN);//�����������
		}
		if("D024".trim().equals(XQFL)){
			//D024	�ص����ֲ̾��ƻ�	TB_CLPJPRWR
			String WRGLCN = new String(request.getParameter("WRGLCN").getBytes("ISO-8859-1"),"GBK");
			bean.setWRD(request.getParameter("WRD"));			//�ƻ����(��)
			bean.setWRL(request.getParameter("WRL"));			//�ƻ�����(��)
			bean.setWRGLCN(WRGLCN==null?"":WRGLCN);		//�ƻ����������
		}
		if("D025".trim().equals(XQFL)){
			//D025	�ص����̳��		TB_CLPJSCDN
			String SCDMGLCN = new String(request.getParameter("SCDMGLCN").getBytes("ISO-8859-1"),"GBK");
			bean.setSCDMBU(request.getParameter("SCDMBU"));		//������(������)
			bean.setSCDML(request.getParameter("SCDML"));		//��ٳ���(��)
			bean.setSCDMD(request.getParameter("SCDMD"));		//������(��)
			bean.setSCDMGLCN(SCDMGLCN==null?"":SCDMGLCN);	//��ٴ��������
		}
		return bean;
	}
}