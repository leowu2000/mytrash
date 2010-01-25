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
			+UUIdFactory.getMaxId(path, "TB_PJRCN")+","//运行编号
			+bean.getPJNO()+",#"//工程编号
			+UtilDateTime.nowDateString()+"#,'"//检测时间
			+prjBean.getPJNM()+"','"//工程名称
			+bean.getGCFLDM()+"','"//工程分类代码
			+bean.getDNCFC()+"','"//险情预测
			+bean.getRDERESCN()+"','"//抢险资源配备
			+bean.getWTDPCD()+"',#"//填报单位名称
			+UtilDateTime.nowDateString()+"#,'"//填报时间
			+bean.getNT()+"')";//其它
		System.out.println(sSQL);
		return sSQL;
	}
	public static String insertSQL_STDNCBean(STDNCBean bean,String path){
		String sSQL = "INSERT TB_STDNC (DNCNO,PJNO,STTPCD,DAGTM,DNCNM,XQFLDM,DNCGR," +
				"DAGPLCCH,DAGLO,RDEPL,RDERESCN,TPN,PLAPN,PLIPN,RDECNRL,DNCCUAN,DNCESTDV,DNCPBNFZ,RZ,WTHCN" +
				",FHYWTHCN,DNCADDSC,WTDPCD,WTDPDT)VALUES("
				+UUIdFactory.getMaxId(path, "TB_PJRCN")+","//险情编号
				+bean.getPJNO()+",'"//工程编号
				+bean.getSTTPCD()+"','"//建筑物编码
				+bean.getDAGTM()+"','"//出险时间
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
				+bean.getWTDPCD()+"','"//填报单位名称
				+bean.getWTDPDT()+"')";//填报时间
		System.out.println(sSQL);
		return sSQL;
	}
	
	public static String insertSQL_PSRBean(RSRBean bean,String path,PrjBean prjBean){
		String sSQL = "INSERT INTO TB_RSR (PJRNO,PJNO,DTCDT,PJNM,RSCLS,RV,RZ,RQ,DFPFCN,DBSTBCN," +
				"BRBPPFCN,ESPFCN,EDDPFCN,GTHOPFCN,COMMCN)VALUES("
				+UUIdFactory.getMaxId(path, "TB_PJRCN")+","
				+prjBean.getPJNO()+",#"
				+UtilDateTime.nowDateString()+"#,'"// 运行编号
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
		System.out.println(sSQL);
		return sSQL;
	}
	
}
