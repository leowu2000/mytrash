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
			+UUIdFactory.getMaxId(path, "TB_PJRCN","PJRNO")+","//运行编号
			+prjBean.getPJNO()+",#"//工程编号
			+UtilDateTime.nowDateString()+"#,'"//检测时间
			+prjBean.getPJNM()+"','"//工程名称
			+bean.getGCFLDM()+"','"//工程分类代码
			+bean.getDNCFC()+"','"//险情预测
			+bean.getRDERESCN()+"','"//抢险资源配备
			+bean.getWTDPCD()+"',#"//填报单位名称
			+UtilDateTime.nowDateString()+"#,'"//填报时间
			+bean.getNT()+"')";//其它
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
				+bean.getDNCNO()+","//险情编号
				+bean.getPJNO()+",'"//工程编号
				+bean.getSTTPCD()+"',#"//建筑物编码
				+bean.getDAGTM()+"#,'"//出险时间
				+bean.getDNCNM()+"','"//险情名称
				+bean.getXQFLDM()+"','"//险情分类代码
				+bean.getDNCGR()+"','"//险情级别
				+bean.getDAGPLCCH()+"','"//出险地点桩号
				+bean.getDAGLO()+"','"//出险部位
				+bean.getRDEPL()+"','"//抢险方案
				+bean.getRDERESCN()+"','"//抢险资源配备
				+bean.getTPN()+"','"//群众投入(人)
				+bean.getPLAPN()+"','"//解放军投入(人)
				+bean.getPLIPN()+"','"//武警投入(人)
				+bean.getRDECNRL()+"','"//进展及结果
				+bean.getDNCCUAN()+"','"//险情原因分析
				+bean.getDNCESTDV()+"','"//险情发展趋势
				+bean.getDNCPBNFZ()+"','"//可能影响范围
				+bean.getRZ()+"','"//当前运行水位(米)
				+bean.getWTHCN()+"','"//抢险时气象情况
				+bean.getFHYWTHCN()+"','"//未来水文气象情况
				+bean.getDNCADDSC()+"','"//补充描述
				+bean.getWTDPCD()+"',#"//填报单位名称
				+UtilDateTime.nowDateString()+"#)";//填报时间
		return sSQL;
	}
	
	public static String insertSQL_RSRBean(RSRBean bean,String path,PrjBean prjBean){
		String sSQL = "INSERT INTO TB_RSR (PJRNO,PJNO,DTCDT,PJNM,RSCLS,RV,RZ,RQ,DFPFCN,DBSTBCN," +
				"BRBPPFCN,ESPFCN,EDDPFCN,GTHOPFCN,COMMCN)VALUES("
				+bean.getPJRNO()+","
				+prjBean.getPJNO()+",#"
				+UtilDateTime.nowDateString()+"#,'"
				+prjBean.getPJNM()+"','"// 工程名称
				+bean.getRSCLS()+"',"// 水库类别(良好/尚好/病险库)
				+bean.getRV()+","// 当前库容(万立方米)
				+bean.getRZ()+","// 当前运行水位(米)
				+bean.getRQ()+",'"// 当前泻量(立方米/秒)
				+bean.getDFPFCN()+"','"// 坝基完好状况
				+bean.getDBSTBCN()+"','"// 坝体稳定情况
				+bean.getBRBPPFCN()+"','"// 护坡护岸稳定情况
				+bean.getESPFCN()+"','"// 泄水建筑物完好状况
				+bean.getEDDPFCN()+"','"// 消能工完好状况
				+bean.getGTHOPFCN()+"','"// 闸门、启闭机完好状况
				+bean.getCOMMCN()+"')";
		return sSQL;
	}
	
	public static String insertSQL_PjrBean(PjrDetailBean bean,String path,PrjBean prjbean,String GCFL){
		String dinarySubsql=bean.getPJRNO()+","+prjbean.getPJNO()+",#"+bean.getDTCDT()+"#,'"+prjbean.getPJNM()+"','";
		String insertSql ="";
		if("B".trim().equals(GCFL)){
			//TB_RSR=水库=B
			insertSql = "INSERT INTO TB_RSR (PJRNO,PJNO,DTCDT,PJNM,RSCLS,RV,RZ,RQ,DFPFCN,DBSTBCN," +
					"BRBPPFCN,ESPFCN,EDDPFCN,GTHOPFCN,COMMCN)VALUES("
					+dinarySubsql
					+bean.getRSCLS()+"',"// 水库类别(良好/尚好/病险库)
					+bean.getRV()+","// 当前库容(万立方米)
					+bean.getRZ()+","// 当前运行水位(米)
					+bean.getRQ()+",'"// 当前泻量(立方米/秒)
					+bean.getDFPFCN()+"','"// 坝基完好状况
					+bean.getDBSTBCN()+"','"// 坝体稳定情况
					+bean.getBRBPPFCN()+"','"// 护坡护岸稳定情况
					+bean.getESPFCN()+"','"// 泄水建筑物完好状况
					+bean.getEDDPFCN()+"','"// 消能工完好状况
					+bean.getGTHOPFCN()+"','"// 闸门、启闭机完好状况
					+bean.getCOMMCN()+"')";						//泄水建筑物完好状况
			
		}
		if("K".trim().equals(GCFL)){
			//TB_WLR=水闸=K
			insertSql = "INSERT INTO TB_WLR (PJRNO,PJNO,DTCDT,PJNM," 
					+"WLGR,RUPGZ,RDWGZ,RQO,RWSTOWLT,GFPFCN,STPFCN," 
					+"EDDPFCN,GTHOPFCN,COMMCN)VALUES("
					+dinarySubsql
					+bean.getWLGR()+"'," //水闸等别(一/二/三/四/五)
					+bean.getRUPGZ()+","	//当前闸上水位(米)
					+bean.getRDWGZ()+","	//当前闸下水位(米)
					+bean.getRQO()+","	//当前过闸流量(立方米/秒)
					+bean.getRWSTOWLT()+",'"	//当前水面距闸顶距离(米)
					+bean.getGFPFCN()+"','"		//坝基完好状况
					+bean.getSTPFCN()+"','"			//建筑物完好状况
					+bean.getEDDPFCN()+"','"	//消能工完好状况==========TB_RSR===TB_WLR
					+bean.getGTHOPFCN()+"','"	//闸门、启闭机完好状况====TB_RSR===TB_WLR
					+bean.getCOMMCN()+"')";	//通讯手段及状况==========TB_RSR===TB_WLR
					
					
		}
		if("N".trim().equals(GCFL)){
			//TB_COWAPJ=治河工程=N
			insertSql = "INSERT INTO TB_COWAPJ (PJRNO,PJNO,DTCDT,PJNM," 
				+"BKOT,FLCNDSC,WDCNDSC,PRCCLR,SPURDSC,BPPJCN)VALUES("
				+dinarySubsql
				+bean.getBKOT()+"','"	//所在岸别(左/右)======TB_DKR====TB_COWAPJ===TB_STOFLER
				+bean.getFLCNDSC()+"','"								//水流情况描述
				+bean.getWDCNDSC()+"','"								//河道情况描述
				+bean.getPRCCLR()+"','"								//清障的落实
				+bean.getSPURDSC()+"','"								//控导工程描述
				+bean.getBPPJCN()+"')";								//护岸工程情况
		}
		if("F".trim().equals(GCFL)){
			//TB_STOFLER=蓄滞=F
			insertSql = "INSERT INTO TB_STOFLER (PJRNO,PJNO,DTCDT,PJNM," 
					+"BKOT,DSFLWZ,DSFLW,TRFCN,DKCN,CWFCCN,SFSRCN," 
					+"FLFADSC,IDSTCN)VALUES("
					+dinarySubsql
					+bean.getBKOT()+"',"	//所在岸别(左/右)======TB_DKR====TB_COWAPJ===TB_STOFLER
					+bean.getDSFLWZ()+","			//设计行(蓄)洪水位(米)
					+bean.getDSFLW()+",'"			//设计行(蓄)洪量(万立方米)
					+bean.getTRFCN()+"','"			//交通状况
					+bean.getDKCN()+"','"					//圩堤状况
					+bean.getCWFCCN()+"','"			//通讯预警设施状况
					+bean.getSFSRCN()+"','"				//避水救生设施状况
					+bean.getFLFADSC()+"','"			//分洪设施状况
					+bean.getIDSTCN()+"')";				//排水站状况
		}
		if("D".trim().equals(GCFL)
				||"E".trim().equals(GCFL)
				||"H".trim().equals(GCFL)
				||"P".trim().equals(GCFL)){
			//TB_DKR=堤防==海堤==圩垸==穿堤
			insertSql = "INSERT INTO TB_DKR (PJRNO,PJNO,DTCDT,PJNM," 
						+"DKGR,BKOT,STECH,RZ,RQ,WSTODC,DKPFCN," 
						+"TSCN,BRBPPFCN)VALUES("
						+dinarySubsql
						+bean.getDKGR()+"','"			//堤防级别(1/2/3/4/5)
						+bean.getBKOT()+"','"
						+bean.getSTECH()+"',"								//起止桩号
						+bean.getRZ()+","	//z当前运行水位(米)========TB_RSR===TB_DKR
						+bean.getRQ()+","	//当前泻量(立方米/秒)========TB_RSR===TB_DKR
						+bean.getWSTODC()+",'"	
						+bean.getDKPFCN()+"','"								//堤防完好状况
						+bean.getTSCN()+"','"								//穿堤建筑物状况
						+bean.getBRBPPFCN()+"')";	//护坡护岸稳定情况========TB_RSR===TB_DKR
						
		}
		return insertSql;
	}
	
	public static String insertSQL_DNCDetailBean(DetailBean bean,String path,String XQFLDM){
		String tablename = BuinessDao.getXqFlTabname(path, XQFLDM);
		String dinarySubsql=bean.getDNCNO()+","+bean.getPJNO()+","+bean.getSTTPCD()+",#"+bean.getDAGTM()+"#,'"+bean.getDNCNM()+"'";
		String insertSql ="";
		//D001	决口				TB_BURDSC	
		if("D001".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"BUW,BUVL,BUZDF,BUQ,BURLDGL)VALUES("
						+dinarySubsql
						+","+bean.getDSSPN()+","+bean.getINPN()+","+bean.getDTHPN()+","+bean.getWRHS()+","+bean.getCRPDSSAR()
						+","+bean.getSCDMFMAR()+","+bean.getDRCECLS()
						+","+bean.getBUW()+","+bean.getBUVL()+","+bean.getBUZDF()+","+bean.getBUQ()+",'"+bean.getBURLDGL()+"')";
		//D002	漫溢				TB_OVFLDSC
		if("D002".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVFLL,OVFLZ,DSQ)VALUES("
						+dinarySubsql
						+","+bean.getOVFLL()+","+bean.getOVFLZ()+","+bean.getDSQ()+")";
		//D003	漏洞				TB_LKDSC
		if("D003".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,TODFTDI,"
						+"LKDMT,LKQ,LKWTLH,LKSAR)VALUES("
						+dinarySubsql
						+",'"+bean.getLKGTU()+"',"+bean.getTODFTDI()
						+","+bean.getLKDMT()+","+bean.getLKQ()+","+bean.getLKWTLH()+","+bean.getLKSAR()+")";
		//D004	管涌				TB_PPDSC
		if("D004".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,"
						+"TODFTDI,"
						+"PPQ,WTLH,PPSAR)VALUES("
						+dinarySubsql
						+",'"+bean.getLKGTU()
						+"',"+bean.getPPQ()
						+","+bean.getTODFTDI()+","+bean.getWTLH()+","+bean.getPPSAR()+")";
		//D005	陷坑				TB_PITDSC
		if("D005".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SBDSP,SBAR)VALUES("
						+dinarySubsql
						+","+bean.getSBDSP()+","+bean.getSBAR()+")";
		//D006	滑坡 			TB_SLDSC
		if("D006".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLBU)VALUES("
						+dinarySubsql
						+","+bean.getSLUPAG()+","+bean.getSLBU()+")";
		//D007	淘刷				TB_UNDSC
		if("D007".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"UNDAR,UNDD,UNDL)VALUES("
						+dinarySubsql
						+","+bean.getTODFTDI()
						+","+bean.getUNDAR()+","+bean.getUNDD()+","+bean.getUNDL()+")";
		//D008	裂缝				TB_CRDSC
		if("D008".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"CRDR,CRD,CRL,CRW)VALUES("
						+dinarySubsql
						+",'"+bean.getCRDR()+"',"+bean.getCRD()+","+bean.getCRL()+","+bean.getCRW()+")";
		//D009	崩岸				TB_CVDSC
		if("D009".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"WDQ,"
						+"CVL,CVBU,RVH,FLCNDSC)VALUES("
						+dinarySubsql
						+","+bean.getTODFTDI()
						+","+bean.getWDQ()
						+","+bean.getCVL()+","+bean.getCVBU()+","+bean.getRVH()+",'"+bean.getFLCNDSC()+"')";
		//D010	渗水				TB_SPDSC
		if("D010".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SPAR,SPQ)VALUES("
						+dinarySubsql
						+","+bean.getSPAR()+","+bean.getSPQ()+")";
		//D011	 浪坎 			TB_BLBAD
		if("D011".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WDQ,"
						+"BLH,WNS)VALUES("
						+dinarySubsql
						+","+bean.getWDQ()
						+","+bean.getBLH()+","+bean.getWNS()+")";
		//D012	滑动				TB_SLUDSC
		if("D012".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLUDSP,SLUTP,SLUGLCN)VALUES("
						+dinarySubsql
						+","+bean.getSLUPAG()
						+","+bean.getSLUDSP()+",'"+bean.getSLUTP()+"','"+bean.getSLUGLCN()+"')";

		//D013	启闭失灵			TB_HOMLFDSC
		if("D013".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"POWCUT,HOMLF,GSDST,MLFCN)VALUES("
						+dinarySubsql
						+",'"+bean.getPOWCUT()+"','"+bean.getHOMLF()+"','"+bean.getGSDST()+"','"+bean.getMLFCN()+"')";
		//D014	闸门破坏			TB_GTWRDSC
		if("D014".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRDSC,WRQ)VALUES("
						+dinarySubsql
						+",'"+bean.getWRDSC()+"',"+bean.getWRQ()+")";
		//D015	溃坝				TB_BRDMDSC
		if("D015".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"PJPS,BRDMLDGL,BRDMW,BRZDMCDI,BRV,BRDMQ)VALUES("
						+dinarySubsql
						+","+bean.getDSSPN()+","+bean.getINPN()+","+bean.getDTHPN()+","+bean.getWRHS()
						+","+bean.getCRPDSSAR()+","+bean.getSCDMFMAR()+","+bean.getDRCECLS()
						+",'"+bean.getPJPS()+"','"+bean.getBRDMLDGL()+"',"+bean.getBRDMW()+","+bean.getBRZDMCDI()
						+","+bean.getBRV()+","+bean.getBRDMQ()+")";
		//D016	倾覆				TB_OVTUDSC
		if("D016".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVTUDR,OVTUAG)VALUES("
						+dinarySubsql
						+",'"+bean.getOVTUDR()
						+"',"+bean.getOVTUAG()+")";
		//D017	应力过大			TB_STREXDSC
		if("D017".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"MXTNST,MXCMST,CONGR,ASTR)VALUES("
						+dinarySubsql
						+","+bean.getMXTNST()+","+bean.getMXCMST()+",'"+bean.getCONGR()+"',"+bean.getASTR()+")";
		//D018	坍塌				TB_SLIDSC
		if("D018".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLIAR,SLIMS)VALUES("
						+dinarySubsql
						+","+bean.getSLIAR()+","+bean.getSLIMS()+")";
		//D019	堵塞				TB_PLUDSC
		if("D019".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"PLTNM,PLTBU)VALUES("
						+dinarySubsql
						+",'"+bean.getPLTNM()+"',"+bean.getPLTBU()+")";
		//D020	基础破坏			TB_BSWRDSC
		if("D020".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"GRNSPDSC,GROVCHWR,GRNUSB)VALUES("
						+dinarySubsql
						+",'"+bean.getGRNSPDSC()+"','"+bean.getGROVCHWR()+"',"+bean.getGRNUSB()+")";
		//D021	消能工破坏		TB_EDDWRDSC
		if("D021".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"APWR,WSTWR)VALUES("
						+dinarySubsql
						+",'"+bean.getAPWR()+"','"+bean.getWSTWR()+"')";
		//D022	基础排水失效		TB_BSWPLPDS
		if("D022".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WPPLU,WPEQML)VALUES("
						+dinarySubsql
						+",'"+bean.getWPPLU()+"','"+bean.getWPEQML()+"')";
		//D023	洞身破坏 			TB_HBWRDSC
		if("D023".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"LNINF,HBGLCN,WRMS)VALUES("
						+dinarySubsql
						+","+bean.getWRAR()
						+",'"+bean.getLNINF()+"','"+bean.getHBGLCN()+"',"+bean.getWRMS()+")";
		//D024	控导工程局部破坏	TB_CLPJPRWR
		if("D024".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"WRGLCN,WRD,WRL)VALUES("
						+dinarySubsql
						+","+bean.getWRAR()
						+",'"+bean.getWRGLCN()+"',"+bean.getWRD()+","+bean.getWRL()+")";
		//D025	控导工程冲毁		TB_CLPJSCDN
		if("D025".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SCDMGLCN,SCDMBU,SCDML,SCDMD)VALUES("
						+dinarySubsql
						+",'"+bean.getSCDMGLCN()+"',"+bean.getSCDMBU()+","+bean.getSCDML()+","+bean.getSCDMD()+")";
		//D026	山洪灾害		TB_TORRENTS
		if("D026".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,DSSAREA,DTHPN,WRHS,DRCECLS,DAYDP,TDP,DSSTP)VALUES("
						+dinarySubsql
						+","+bean.getDSSPN()+","+bean.getDSSAREA()+","+bean.getDTHPN()+","+bean.getWRHS()+","
						+bean.getDRCECLS()+","+bean.getDAYDP()+","+bean.getTDP()+",'"+bean.getDSSTP()+"')";
		return insertSql;
	}

}
