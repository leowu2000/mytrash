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
			+rs.getInt("PJRNO")+","//运行编号
			+rs.getInt("PJNO")+",#"//工程编号
			+rs.getString("DTCDT")+"#,'"//检测时间
			+rs.getString("PJNM")+"','"//工程名称
			+rs.getString("GCFLDM")+"','"//工程分类代码
			+rs.getString("DNCFC")+"','"//险情预测
			+rs.getString("RDERESCN")+"','"//抢险资源配备
			+rs.getString("WTDPCD")+"',#"//填报单位名称
			+rs.getString("WTDPDT")+"#,'"//填报时间
			+rs.getString("NT")+"')";//其它
		return sSQL;
	}
	
public static String uploadSQL_STDNCBean(ResultSet rs,String XQFLDM)throws java.sql.SQLException {
		String sSQL = "INSERT INTO TB_STDNC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,XQFLDM,DNCGR," +
				"DAGPLCCH,DAGLO,RDEPL,RDERESCN,TPN,PLAPN,PLIPN,RDECNRL,DNCCUAN,DNCESTDV,DNCPBNFZ,RZ,WTHCN" +
				",FHYWTHCN,DNCADDSC,WTDPCD,WTDPDT)VALUES("
				+rs.getInt("DNCNO")+","//险情编号
				+rs.getInt("PJNO")+",'"//工程编号
				+rs.getString("STTPCD")+"',#"//建筑物编码
				+rs.getString("DAGTM")+"#,'"//出险时间
				+rs.getString("DNCNM")+"','"//险情名称
				+XQFLDM+"','"//险情分类代码
				+rs.getString("DNCGR")+"','"//险情级别
				+rs.getString("DAGPLCCH")+"','"//出险地点桩号
				+rs.getString("DAGLO")+"','"//出险部位
				+rs.getString("RDEPL")+"','"//抢险方案
				+rs.getString("RDERESCN")+"','"//抢险资源配备
				+rs.getInt("TPN")+"','"//群众投入(人)
				+rs.getInt("PLAPN")+"','"//解放军投入(人)
				+rs.getInt("PLIPN")+"','"//武警投入(人)
				+rs.getString("RDECNRL")+"','"//进展及结果
				+rs.getString("DNCCUAN")+"','"//险情原因分析
				+rs.getString("DNCESTDV")+"','"//险情发展趋势
				+rs.getString("DNCPBNFZ")+"','"//可能影响范围
				+rs.getFloat("RZ")+"','"//当前运行水位(米)
				+rs.getString("WTHCN")+"','"//抢险时气象情况
				+rs.getString("FHYWTHCN")+"','"//未来水文气象情况
				+rs.getString("DNCADDSC")+"','"//补充描述
				+rs.getString("WTDPCD")+"',#"//填报单位名称
				+rs.getString("WTDPDT")+"#)";//填报时间
		return sSQL;
	}
	
public static String uploadSQL_RSRBean(ResultSet rs)throws java.sql.SQLException {
		String sSQL = "INSERT INTO TB_RSR (PJRNO,PJNO,DTCDT,PJNM,RSCLS,RV,RZ,RQ,DFPFCN,DBSTBCN," +
				"BRBPPFCN,ESPFCN,EDDPFCN,GTHOPFCN,COMMCN)VALUES("
				+rs.getInt("PJRNO")+","
				+rs.getString("PJNO")+",#"
				+rs.getString("DTCDT")+"#,'"
				+rs.getString("PJNM")+"','"// 工程名称
				+rs.getString("RSCLS")+"',"// 水库类别(良好/尚好/病险库)
				+rs.getFloat("RV")+","// 当前库容(万立方米)
				+rs.getFloat("RZ")+","// 当前运行水位(米)
				+rs.getFloat("RQ")+",'"// 当前泻量(立方米/秒)
				+rs.getString("DFPFCN")+"','"// 坝基完好状况
				+rs.getString("DBSTBCN")+"','"// 坝体稳定情况
				+rs.getString("BRBPPFCN")+"','"// 护坡护岸稳定情况
				+rs.getString("ESPFCN")+"','"// 泄水建筑物完好状况
				+rs.getString("EDDPFCN")+"','"// 消能工完好状况
				+rs.getString("GTHOPFCN")+"','"// 闸门、启闭机完好状况
				+rs.getString("COMMCN")+"')";
		return sSQL;
	}
	
public static String uploadSQL_PjrDetailBean(ResultSet rs,String GCFL)throws java.sql.SQLException {
		String dinarySubsql=rs.getInt("PJRNO")+","+rs.getInt("PJNO")+",#"+rs.getString("DTCDT")+"#,'"+rs.getString("PJNM")+"','";
		String insertSql ="";
		if("B".trim().equals(GCFL)){
			//TB_RSR=水库=B
			insertSql = "INSERT INTO TB_RSR (PJRNO,PJNO,DTCDT,PJNM,RSCLS,RV,RZ,RQ,DFPFCN,DBSTBCN," +
					"BRBPPFCN,ESPFCN,EDDPFCN,GTHOPFCN,COMMCN)VALUES("
					+dinarySubsql
					+rs.getString("RSCLS")+"',"// 水库类别(良好/尚好/病险库)
					+rs.getFloat("RV")+","// 当前库容(万立方米)
					+rs.getFloat("RZ")+","// 当前运行水位(米)
					+rs.getFloat("RQ")+",'"// 当前泻量(立方米/秒)
					+rs.getString("DFPFCN")+"','"// 坝基完好状况
					+rs.getString("DBSTBCN")+"','"// 坝体稳定情况
					+rs.getString("BRBPPFCN")+"','"// 护坡护岸稳定情况
					+rs.getString("ESPFCN")+"','"// 泄水建筑物完好状况
					+rs.getString("EDDPFCN")+"','"// 消能工完好状况
					+rs.getString("GTHOPFCN")+"','"// 闸门、启闭机完好状况
					+rs.getString("COMMCN")+"')";						//泄水建筑物完好状况
			
		}
		if("K".trim().equals(GCFL)){
			//TB_WLR=水闸=K
			insertSql = "INSERT INTO TB_DKR (PJRNO,PJNO,DTCDT,PJNM," 
					+"WLGR,RUPGZ,RDWGZ,RQO,RWSTOWLT,GFPFCN,STPFCN," 
					+"EDDPFCN,GTHOPFCN,COMMCN)VALUES("
					+dinarySubsql
					+rs.getString("WLGR")+"'," //水闸等别(一/二/三/四/五)
					+rs.getFloat("RUPGZ")+","	//当前闸上水位(米)
					+rs.getFloat("RDWGZ")+","	//当前闸下水位(米)
					+rs.getFloat("RQO")+","	//当前过闸流量(立方米/秒)
					+rs.getFloat("RWSTOWLT")+",'"	//当前水面距闸顶距离(米)
					+rs.getString("GFPFCN")+"','"		//坝基完好状况
					+rs.getString("STPFCN")+"','"			//建筑物完好状况
					+rs.getString("EDDPFCN")+"','"	//消能工完好状况==========TB_RSR===TB_WLR
					+rs.getString("GTHOPFCN")+"','"	//闸门、启闭机完好状况====TB_RSR===TB_WLR
					+rs.getString("COMMCN")+"')";	//通讯手段及状况==========TB_RSR===TB_WLR
		}
		if("N".trim().equals(GCFL)){
			//TB_COWAPJ=治河工程=N
			insertSql = "INSERT INTO TB_DKR (PJRNO,PJNO,DTCDT,PJNM," 
				+"BKOT,FLCNDSC,WDCNDSC,PRCCLR,SPURDSC,BPPJCN)VALUES("
				+dinarySubsql
				+rs.getString("BKOT")+"','"	//所在岸别(左/右)======TB_DKR====TB_COWAPJ===TB_STOFLER
				+rs.getString("FLCNDSC")+"','"	//水流情况描述
				+rs.getString("WDCNDSC")+"','"	//河道情况描述
				+rs.getString("PRCCLR")+"','"		//清障的落实
				+rs.getString("SPURDSC")+"','"	//控导工程描述
				+rs.getString("BPPJCN")+"')";		//护岸工程情况
		}
		if("F".trim().equals(GCFL)){
			//TB_STOFLER=蓄滞=F
			insertSql = "INSERT INTO TB_DKR (PJRNO,PJNO,DTCDT,PJNM," 
					+"BKOT,DSFLWZ,DSFLW,TRFCN,DKCN,CWFCCN,SFSRCN," 
					+"FLFADSC,IDSTCN)VALUES("
					+dinarySubsql
					+rs.getString("BKOT")+"',"	//所在岸别(左/右)======TB_DKR====TB_COWAPJ===TB_STOFLER
					+rs.getFloat("DSFLWZ")+","			//设计行(蓄)洪水位(米)
					+rs.getFloat("DSFLW")+","			//设计行(蓄)洪量(万立方米)
					+rs.getString("TRFCN")+",'"			//交通状况
					+rs.getString("DKCN")+"','"					//圩堤状况
					+rs.getString("CWFCCN")+"','"			//通讯预警设施状况
					+rs.getString("SFSRCN")+"','"				//避水救生设施状况
					+rs.getString("FLFADSC")+"','"			//分洪设施状况
					+rs.getString("IDSTCN")+"')";				//排水站状况
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
						+rs.getString("DKGR")+"','"			//堤防级别(1/2/3/4/5)
						+rs.getString("BKOT")+"','"
						+rs.getString("STECH")+"',"								//起止桩号
						+rs.getFloat("RZ")+","	//z当前运行水位(米)========TB_RSR===TB_DKR
						+rs.getFloat("RQ")+","	//当前泻量(立方米/秒)========TB_RSR===TB_DKR
						+rs.getFloat("WSTODC")+",'"	
						+rs.getString("DKPFCN")+"','"								//堤防完好状况
						+rs.getString("TSCN")+"','"								//穿堤建筑物状况
						+rs.getString("BRBPPFCN")+"')";	//护坡护岸稳定情况========TB_RSR===TB_DKR
						
		}
		return insertSql;
	}
	
public static String uploadSQL_DNCDetailBean(ResultSet rs,String XQFLDM,String tablename)throws java.sql.SQLException {

		String dinarySubsql=rs.getInt("DNCNO")+","+rs.getInt("PJNO")+","
							+rs.getInt("STTPCD")+",#"+rs.getString("DAGTM")+"#,'"
							+rs.getString("DNCNM")+"'";
		String insertSql ="";
		//D001	决口				TB_BURDSC	
		if("D001".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"BUW,BUVL,BUZDF,BUQ,BURLDGL)VALUES("
						+dinarySubsql
						+","+rs.getInt("DSSPN")+","+rs.getInt("INPN")+","+rs.getInt("DTHPN")+","+rs.getFloat("WRHS")+","+rs.getFloat("CRPDSSAR")
						+","+rs.getFloat("SCDMFMAR")+","+rs.getFloat("DRCECLS")
						+","+rs.getFloat("BUW")+","+rs.getFloat("BUVL")+","+rs.getFloat("BUZDF")+","+rs.getFloat("BUQ")+",'"+rs.getString("BURLDGL")+"')";
		//D002	漫溢				TB_OVFLDSC
		if("D002".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVFLL,OVFLZ,DSQ)VALUES("
						+dinarySubsql
						+","+rs.getFloat("OVFLL")+","+rs.getFloat("OVFLZ")+","+rs.getFloat("DSQ")+")";
		//D003	漏洞				TB_LKDSC
		if("D003".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,TODFTDI,"
						+"LKDMT,LKQ,LKWTLH,LKSAR)VALUES("
						+dinarySubsql
						+",'"+rs.getString("LKGTU")+"',"+rs.getString("TODFTDI")
						+","+rs.getFloat("LKDMT")+","+rs.getFloat("LKQ")+","+rs.getFloat("LKWTLH")+","+rs.getFloat("LKSAR")+")";
		//D004	管涌				TB_PPDSC
		if("D004".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"LKGTU,"
						+"TODFTDI,"
						+"PPQ,WTLH,PPSAR)VALUES("
						+dinarySubsql
						+",'"+rs.getString("LKGTU")
						+"',"+rs.getFloat("PPQ")
						+","+rs.getFloat("TODFTDI")+","+rs.getFloat("WTLH")+","+rs.getFloat("PPSAR")+")";
		//D005	陷坑				TB_PITDSC
		if("D005".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SBDSP,SBAR)VALUES("
						+dinarySubsql
						+","+rs.getFloat("SBDSP")+","+rs.getFloat("SBAR")+")";
		//D006	滑坡 			TB_SLDSC
		if("D006".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLBU)VALUES("
						+dinarySubsql
						+","+rs.getFloat("SLUPAG")+","+rs.getFloat("SLBU")+")";
		//D007	淘刷				TB_UNDSC
		if("D007".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"UNDAR,UNDD,UNDL)VALUES("
						+dinarySubsql
						+","+rs.getFloat("TODFTDI")
						+","+rs.getFloat("UNDAR")+","+rs.getFloat("UNDD")+","+rs.getFloat("UNDL")+")";
		//D008	裂缝				TB_CRDSC
		if("D008".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"CRDR,CRD,CRL,CRW)VALUES("
						+dinarySubsql
						+",'"+rs.getString("CRDR")+"',"+rs.getFloat("CRD")+","+rs.getFloat("CRL")+","+rs.getFloat("CRW")+")";
		//D009	崩岸				TB_CVDSC
		if("D009".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"TODFTDI,"
						+"WDQ,"
						+"CVL,CVBU,RVH,FLCNDSC)VALUES("
						+dinarySubsql
						+","+rs.getFloat("TODFTDI")
						+","+rs.getFloat("WDQ")
						+","+rs.getFloat("CVL")+","+rs.getFloat("CVBU")+","+rs.getFloat("RVH")+",'"+rs.getString("FLCNDSC")+"')";
		//D010	渗水				TB_SPDSC
		if("D010".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SPAR,SPQ)VALUES("
						+dinarySubsql
						+","+rs.getFloat("SPAR")+","+rs.getFloat("SPQ")+")";
		//D011	 浪坎 			TB_BLBAD
		if("D011".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WDQ,"
						+"BLH,WNS)VALUES("
						+dinarySubsql
						+","+rs.getFloat("WDQ")
						+","+rs.getFloat("BLH")+","+rs.getFloat("WNS")+")";
		//D012	滑动				TB_SLUDSC
		if("D012".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLUPAG,"
						+"SLUDSP,SLUTP,SLUGLCN)VALUES("
						+dinarySubsql
						+","+rs.getFloat("SLUPAG")
						+","+rs.getFloat("SLUDSP")+",'"+rs.getString("SLUTP")+"','"+rs.getString("SLUGLCN")+"')";

		//D013	启闭失灵			TB_HOMLFDSC
		if("D013".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"POWCUT,HOMLF,GSDST,MLFCN)VALUES("
						+dinarySubsql
						+",'"+rs.getString("POWCUT")+"','"+rs.getString("HOMLF")+"','"+rs.getString("GSDST")+"','"+rs.getString("MLFCN")+"')";
		//D014	闸门破坏			TB_GTWRDSC
		if("D014".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRDSC,WRQ)VALUES("
						+dinarySubsql
						+",'"+rs.getString("WRDSC")+"',"+rs.getFloat("WRQ")+")";
		//D015	溃坝				TB_BRDMDSC
		if("D015".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,INPN,DTHPN,WRHS,CRPDSSAR,SCDMFMAR,DRCECLS,"
						+"PJPS,BRDMLDGL,BRDMW,BRZDMCDI,BRV,BRDMQ)VALUES("
						+dinarySubsql
						+","+rs.getInt("DSSPN")+","+rs.getInt("INPN")+","+rs.getInt("DTHPN")+","+rs.getFloat("WRHS")
						+","+rs.getFloat("CRPDSSAR")+","+rs.getFloat("SCDMFMAR")+","+rs.getFloat("DRCECLS")
						+",'"+rs.getString("PJPS")+"','"+rs.getString("BRDMLDGL")+"',"+rs.getFloat("BRDMW")+","+rs.getFloat("BRZDMCDI")
						+","+rs.getFloat("BRV")+","+rs.getFloat("BRDMQ")+")";
		//D016	倾覆				TB_OVTUDSC
		if("D016".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"OVTUDR,OVTUAG)VALUES("
						+dinarySubsql
						+",'"+rs.getString("OVTUDR")
						+"',"+rs.getFloat("OVTUAG")+")";
		//D017	应力过大			TB_STREXDSC
		if("D017".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"MXTNST,MXCMST,CONGR,ASTR)VALUES("
						+dinarySubsql
						+","+rs.getFloat("MXTNST")+","+rs.getFloat("MXCMST")+",'"+rs.getString("CONGR")+"',"+rs.getFloat("ASTR")+")";
		//D018	坍塌				TB_SLIDSC
		if("D018".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SLIAR,SLIMS)VALUES("
						+dinarySubsql
						+","+rs.getFloat("SLIAR")+","+rs.getFloat("SLIMS")+")";
		//D019	堵塞				TB_PLUDSC
		if("D019".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"PLTNM,PLTBU)VALUES("
						+dinarySubsql
						+",'"+rs.getString("PLTNM")+"',"+rs.getFloat("PLTBU")+")";
		//D020	基础破坏			TB_BSWRDSC
		if("D020".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"GRNSPDSC,GROVCHWR,GRNUSB)VALUES("
						+dinarySubsql
						+",'"+rs.getString("GRNSPDSC")+"','"+rs.getString("GROVCHWR")+"',"+rs.getFloat("GRNUSB")+")";
		//D021	消能工破坏		TB_EDDWRDSC
		if("D021".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"APWR,WSTWR)VALUES("
						+dinarySubsql
						+",'"+rs.getString("APWR")+"','"+rs.getString("WSTWR")+"')";
		//D022	基础排水失效		TB_BSWPLPDS
		if("D022".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WPPLU,WPEQML)VALUES("
						+dinarySubsql
						+",'"+rs.getString("WPPLU")+"','"+rs.getString("WPEQML")+"')";
		//D023	洞身破坏 			TB_HBWRDSC
		if("D023".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"LNINF,HBGLCN,WRMS)VALUES("
						+dinarySubsql
						+","+rs.getFloat("WRAR")
						+",'"+rs.getString("LNINF")+"','"+rs.getString("HBGLCN")+"',"+rs.getFloat("WRMS")+")";
		//D024	控导工程局部破坏	TB_CLPJPRWR
		if("D024".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"WRAR,"
						+"WRGLCN,WRD,WRL)VALUES("
						+dinarySubsql
						+","+rs.getFloat("WRAR")
						+",'"+rs.getString("WRGLCN")+"',"+rs.getFloat("WRD")+","+rs.getFloat("WRL")+")";
		//D025	控导工程冲毁		TB_CLPJSCDN
		if("D025".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"SCDMGLCN,SCDMBU,SCDML,SCDMD)VALUES("
						+dinarySubsql
						+",'"+rs.getString("SCDMGLCN")+"',"+rs.getFloat("SCDMBU")+","+rs.getFloat("SCDML")+","+rs.getFloat("SCDMD")+")";
		//D026	山洪灾害		TB_TORRENTS
		if("D026".trim().equals(XQFLDM.toUpperCase()))
			insertSql = "INSERT INTO "+tablename+" (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,"
						+"DSSPN,DSSAREA,DTHPN,WRHS,DRCECLS,DAYDP,TDP,DSSTP)VALUES("
						+dinarySubsql
						+","+rs.getInt("DSSPN")+","+rs.getInt("DSSAREA")+","+rs.getInt("DTHPN")+","+rs.getFloat("WRHS")+","
						+rs.getFloat("DRCECLS")+","+rs.getFloat("DAYDP")+","+rs.getFloat("TDP")+",'"+rs.getString("DSSTP")+"')";
		return insertSql;
	}

}
