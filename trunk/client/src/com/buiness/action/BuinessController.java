package com.buiness.action;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

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
import com.buiness.form.SubTempBean;
import com.core.ConnectionPool;
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
			String SQL = "INSERT INTO TB_PJ(PJNO,PJNMCD,PJNM,CNTCD,FPDUTY,FPDUTYPH)VALUES("+UUIdFactory.getMaxId(path, "TB_PJ","PJNO")+",'"
						+gcdm+"','"+gcnm+"','"+cntcd+"','','')";
			BuinessDao.insertDB(SQL, path);

	        return new ModelAndView("project/prgManage");
		}
		if("edit".trim().equals(actionType)){
			String gclsh = request.getParameter("gclsh");
			String gcnm=new String(request.getParameter("PJNM").getBytes("ISO-8859-1"),"GBK");
			String gclb=request.getParameter("gclb");
			String cntcd=request.getParameter("cntcd");
			String hldm=request.getParameter("hldm");
			String gcdm = gclb+hldm.substring(1, 7)+cntcd.substring(0, 1);
			String SQL = "UPDATE TB_PJ SET PJNMCD='"+gcdm+"',PJNM='"+gcnm+"',CNTCD='"+cntcd+"' WHERE PJNO="+gclsh+"";
			System.out.println(SQL);
			BuinessDao.updateDB(SQL, path);
			return new ModelAndView("project/prgManage");
		}
		if("view".trim().equals(actionType)){
			String gclsh = request.getParameter("gclsh");
			String SQL = "select * FROM TB_PJ WHERE PJNO ="+gclsh+"";
			PrjBean bean = BuinessDao.findBySql(SQL, path);
			request.setAttribute("bean", bean);
			return new ModelAndView("project/prgView");
		}
		if("del".trim().equals(actionType)){
			String IDs = request.getParameter("IDs");
			String TBID = request.getParameter("TBID");
			String towhere = request.getParameter("towhere");
			towhere =towhere==null?"":towhere;
			TBID=TBID==null?"":TBID;
			String PKFILED = request.getParameter("PKFILED");
			PKFILED=PKFILED==null?"":PKFILED;
			String tbs[] = TBID.split(",");
			String fileds[] = PKFILED.split(",");
			if(tbs.length>0){
				for(int i=0;i<tbs.length;i++){
				String SQL = "DELETE FROM "+tbs[i]+" WHERE "+fileds[i]+" IN("+IDs+")";
				BuinessDao.deleteDB(SQL, path);
				}
			}
			if(!"".trim().equals(towhere))
				return new ModelAndView("report/"+towhere+"Manage");
			else
				return new ModelAndView("project/prgManage");
		}
		if("peredit".trim().equals(actionType)){
			String IDs = request.getParameter("IDs");
			String SQL = "select * FROM TB_PJ WHERE PJNO ="+IDs+"";
			PrjBean bean = BuinessDao.findBySql(SQL, path);
			request.setAttribute("bean", bean);
			return new ModelAndView("project/prgEdit");
		}
		if("add_gqcj".trim().equals(actionType)){
			String SAVETYPES = request.getParameter("SAVETYPES");
			String TABLENAME = request.getParameter("tabname");
			PrjBean prjBean = BuinessDao.findBySql("select * from TB_PJ where PJNO="+request.getParameter("GCNAME"),path);
			if("1".trim().equals(SAVETYPES)){
				PJRCNBean bean = _getPJRCNBeanFromRequest(request);
				
				int DNCNO = UUIdFactory.getMaxId(path, "TB_PJRCN","PJRNO");
				bean.setPJRNO(String.valueOf(DNCNO));
				String sSQL  = SqlFactory.insertSQL_PJRCNBean(bean, path,prjBean);
//				BuinessDao.insertDB(sSQL, path);
				RSRBean rsrbean = _getRSRBeanFromRquest(request);
				rsrbean.setPJRNO(String.valueOf(DNCNO));
				String sSQL2  = SqlFactory.insertSQL_RSRBean(rsrbean, path,prjBean);
//				BuinessDao.insertDB(sSQL2, path);
				List<SubTempBean> beanlist = BuinessDao.getMediaList(path, String.valueOf(bean.getPJNO()),"TB_PJR_M");
				BuinessDao.toInsertDbList(path, "TB_PJR_M", sSQL,sSQL2, beanlist);
//				BuinessDao.deleteTempMedia(path);
				return new ModelAndView("project/gqyxManage");
			}
			if("2".trim().equals(SAVETYPES)){
				String mainSQL = "";
				String subSQL = "";
				String DNCNO = request.getParameter("DNCNO");
				//根据名称查询，如果返回编码说明是原来的旧的建筑物
				//如果返回为空，则说明是新添加的建筑物编码
				int id=1;
				STDNCBean bean = _getSTDNCeanFromRequest(request);
				String sttpcd =bean.getSTTPCD();
				String code = BuinessDao.getIdFromNameChange(path,"TB_ST", "STTPCD", "STNM='"+sttpcd+"' AND PJNO="+bean.getPJNO());
				if(!"".trim().equals(code)){
					bean.setSTTPCD(code);
					id = new Integer(code).intValue();
				}
				else{
					//执行插入操作，并且重置STDNCBean的建筑物编码字段。
					id = UUIdFactory.getMaxId(path, "TB_ST","STTPCD");
					mainSQL = "INSERT INTO TB_ST (STTPCD,PJNO,STNM)VALUES("+id+","+bean.getPJNO()+",'"+sttpcd+"')";
					BuinessDao.insertDB(mainSQL, path);
					bean.setSTTPCD(String.valueOf(id));
				}
				//保存主表信息
				bean.setDNCNO(String.valueOf(DNCNO));
				mainSQL  = SqlFactory.insertSQL_STDNCBean(bean, path);
//				BuinessDao.insertDB(sSQL, path);
				//获取并保存资表信息
				DetailBean dBean = _getDetailBeanFromRquest(request,bean.getXQFLDM());
				dBean.setSTTPCD(String.valueOf(id));
				subSQL  = SqlFactory.insertSQL_DNCDetailBean(dBean, path, bean.getXQFLDM());
				System.out.println(subSQL);
//				BuinessDao.insertDB(sSQL, path);
//				String newSQL = "INSERT INTO "+TABLENAME+"(RPJINCD,WTTT,WTDT,WTDPCD,"+FILEDNAME+")VALUES("+DNCNO+",'"+MAINTITLE+"',#"+WTDT+"#,'"+WTDPCD+"','"+CONTENT+"')";
				List<SubTempBean> beanlist = BuinessDao.getMediaList(path, DNCNO,TABLENAME);
				BuinessDao.toInsertDbList(path, TABLENAME, mainSQL,subSQL, beanlist);
				BuinessDao.deleteTempMedia(path);
				return new ModelAndView("project/gqxqManage");
			}
			
			
		}
		if("add_fxjb".trim().equals(actionType)){//新增防汛简报信息
			String subAction = request.getParameter("subActionType");
			String ISSUE = request.getParameter("ISSUE");
			String QF = new String(request.getParameter("QF").getBytes("ISO-8859-1"),"GBK");
			String SH = new String(request.getParameter("SH").getBytes("ISO-8859-1"),"GBK");
			String NG = new String(request.getParameter("NG").getBytes("ISO-8859-1"),"GBK");
			String WTTT = new String(request.getParameter("WTTT").getBytes("ISO-8859-1"),"GBK");
			String WTDT = new String(request.getParameter("WTDT").getBytes("ISO-8859-1"),"GBK");
			String ACTICO = new String(request.getParameter("ACTICO").getBytes("ISO-8859-1"),"GBK");
			String WTDPCD = new String(request.getParameter("WTDPCD").getBytes("ISO-8859-1"),"GBK");
			String filepath = new String(request.getParameter("UpFile").getBytes("ISO-8859-1"),"GBK");
			Connection conn = ConnectionPool.getConnection(path);
			
			String sSQL = "";
			if("update".trim().equals(subAction)){
				String RPJINCD = request.getParameter("RPJINCD");
				sSQL = "UPDATE TB_FXJB SET ISSUE="+ISSUE+",WTDT=#"+WTDT+"#,ACTICO='"+ACTICO+"',QF='"+QF+"',SH='"+SH+"',NG='"+NG+"',WTDPCD='"+WTDPCD+"',WTTT='"+WTTT+"'"
					+" WHERE RPJINCD="+RPJINCD;
				//主表
				BuinessDao.updateDB(sSQL, path);
//				String sql = "INSERT INTO TB_FXJB_M(ZLBM,RPJINCD,LXZP) values(?,?,?)";
//				PreparedStatement pstmt = conn.prepareStatement(sql);
//				File f = new File(filepath);
//				FileInputStream fis = new FileInputStream(f);
//				pstmt.setInt(1, UUIdFactory.getMaxId(path, "TB_FXJB_M","ZLBM"));
//				pstmt.setString(2, String.valueOf(RPJINCD));
//				pstmt.setBinaryStream(3, fis, (int) f.length());
//				pstmt.executeUpdate();
//				pstmt.close();
//				conn.close();
				
			}else{
				int RPJINCD = UUIdFactory.getMaxId(path, "TB_FXJB","RPJINCD");
				sSQL = "INSERT INTO TB_FXJB(RPJINCD,ISSUE,WTDT,ACTICO,QF,SH,NG,WTDPCD,WTTT)VALUES("
					+RPJINCD+","+ISSUE+",#"+WTDT+"#,'"+ACTICO+"','"+QF+"','"+SH+"','"+NG+"','"
					+WTDPCD+"','"+WTTT+"')";
				//主表
				BuinessDao.insertDB(sSQL, path);
				String sql = "INSERT INTO TB_FXJB_M(ZLBM,RPJINCD,LXZP) values(?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				File f = new File(filepath);
				FileInputStream fis = new FileInputStream(f);
				pstmt.setInt(1, UUIdFactory.getMaxId(path, "TB_FXJB_M","ZLBM"));
				pstmt.setString(2, String.valueOf(RPJINCD));
				pstmt.setBinaryStream(3, fis, (int) f.length());
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			}
			return new ModelAndView("report/fxjbManage");
		}
		if("add_report".trim().equals(actionType)){
			String DNCNO = request.getParameter("DNCNO");
			String WTDPCD = new String(request.getParameter("WTDPCD").getBytes("ISO-8859-1"),"GBK");
			String TABLENAME = request.getParameter("TABLENAME");
			String WTDT = request.getParameter("WTDT");
			String MAINTITLE = new String(request.getParameter("MAINTITLE").getBytes("ISO-8859-1"),"GBK");
			String CONTENT = new String(request.getParameter("CONTENT").getBytes("ISO-8859-1"),"GBK");
			String FILEDNAME = request.getParameter("FILEDNAME");
			String newSQL = "INSERT INTO "+TABLENAME+"(RPJINCD,WTTT,WTDT,WTDPCD,"+FILEDNAME+")VALUES("+DNCNO+",'"+MAINTITLE+"',#"+WTDT+"#,'"+WTDPCD+"','"+CONTENT+"')";
			List<SubTempBean> beanlist = BuinessDao.getMediaList(path, DNCNO,TABLENAME+"_M");
			BuinessDao.toInsertDbList(path, TABLENAME+"_M", newSQL,"", beanlist);
			BuinessDao.deleteTempMedia(path);
			return new ModelAndView("report/"+TABLENAME+"Manage");
		}
		return null;
   }
	
	public static PJRCNBean _getPJRCNBeanFromRequest(HttpServletRequest request)throws Exception{
		PJRCNBean bean = new PJRCNBean();
		String DNCFC = new String(request.getParameter("XQYC").getBytes("ISO-8859-1"),"GBK");
		String RDERESCN = new String(request.getParameter("DFJZZK").getBytes("ISO-8859-1"),"GBK");
		String WTDPCD = new String(request.getParameter("WTDPCD").getBytes("ISO-8859-1"),"GBK");
		String NT = new String(request.getParameter("QT").getBytes("ISO-8859-1"),"GBK");
		
		bean.setPJRNO(request.getParameter("PJRNO")==null?"":request.getParameter("PJRNO"));//运行编号
		bean.setPJNO(request.getParameter("GCNAME")==null?"":request.getParameter("GCNAME"));//工程编号
		bean.setDTCDT(request.getParameter("DTCDT")==null?"":request.getParameter("DTCDT"));//检测时间
		bean.setPJNM(request.getParameter("GCNAME")==null?"":request.getParameter("GCNAME"));//工程名称
		bean.setGCFLDM(request.getParameter("GCFLDM")==null?"":request.getParameter("GCFLDM"));//工程分类代码
		bean.setDNCFC(DNCFC==null?"":DNCFC);//险情预测
		bean.setRDERESCN(RDERESCN==null?"":RDERESCN);//抢险资源配备
		bean.setWTDPCD(WTDPCD==null?"":WTDPCD);//填报单位名称
		bean.setWTDPDT(request.getParameter("WTDPDT")==null?"":request.getParameter("WTDPDT"));//填报时间
		bean.setNT(NT==null?"":NT);//其它
		return bean;
	}
	
	public static STDNCBean _getSTDNCeanFromRequest(HttpServletRequest request)throws Exception{
		STDNCBean bean = new STDNCBean();
		String DNCNM = new String(request.getParameter("DNCNM").getBytes("ISO-8859-1"),"GBK");//险情名称
		String RDEPL = new String(request.getParameter("QXFA").getBytes("ISO-8859-1"),"GBK");//抢险方案
		String RDERESCN = new String(request.getParameter("QXZYPB").getBytes("ISO-8859-1"),"GBK");//抢险资源配备
		String RDECNRL =  new String(request.getParameter("JZJJG").getBytes("ISO-8859-1"),"GBK");//进展及结果
		String DNCCUAN =  new String(request.getParameter("XQYYFX").getBytes("ISO-8859-1"),"GBK");//险情原因分析
		String DNCESTDV = new String(request.getParameter("XQFZQS").getBytes("ISO-8859-1"),"GBK");//险情发展趋势
		String DNCPBNFZ = new String(request.getParameter("KNYXFW").getBytes("ISO-8859-1"),"GBK");//可能影响范围
		String WTHCN = new String(request.getParameter("QXSQX").getBytes("ISO-8859-1"),"GBK");//抢险时气象情况
		String FHYWTHCN = new String(request.getParameter("WLSWQX").getBytes("ISO-8859-1"),"GBK");//未来水文气象情况
		String DNCADDSC = new String(request.getParameter("BCMS").getBytes("ISO-8859-1"),"GBK");//补充描述
		String WTDPCD = new String(request.getParameter("WTDPCD").getBytes("ISO-8859-1"),"GBK");//填报单位名称
		String DNCGR = new String(request.getParameter("DNCGR").getBytes("ISO-8859-1"),"GBK");//险情级别
		String DAGPLCCH = new String(request.getParameter("DAGPLCCH").getBytes("ISO-8859-1"),"GBK");//出险地点桩号
		String DAGLO = new String(request.getParameter("DAGLO").getBytes("ISO-8859-1"),"GBK");//出险部位
		String STTPCD = new String(request.getParameter("STTPCD").getBytes("ISO-8859-1"),"GBK");
		bean.setDNCNM(DNCNM==null?"":DNCNM);//险情名称
		bean.setDNCGR(DNCGR==null?"":DNCGR);//险情级别
		bean.setRDEPL(RDEPL==null?"":RDEPL);//抢险方案
		bean.setRDERESCN(RDERESCN==null?"":RDERESCN);//抢险资源配备
		bean.setRDECNRL(RDECNRL==null?"":RDECNRL);//进展及结果
		bean.setDNCCUAN(DNCCUAN==null?"":DNCCUAN);//险情原因分析
		bean.setDNCESTDV(DNCESTDV==null?"":DNCESTDV);//险情发展趋势
		bean.setDNCPBNFZ(DNCPBNFZ==null?"":DNCPBNFZ);//可能影响范围
		bean.setWTHCN(WTHCN==null?"":WTHCN);//抢险时气象情况
		bean.setFHYWTHCN(FHYWTHCN==null?"":FHYWTHCN);//未来水文气象情况
		bean.setDNCADDSC(DNCADDSC==null?"":DNCADDSC);//补充描述
		bean.setWTDPCD(WTDPCD==null?"":WTDPCD);//填报单位名称
		bean.setDAGPLCCH(DAGPLCCH==null?"":DAGPLCCH);//出险地点桩号
		bean.setDAGLO(DAGLO==null?"":DAGLO);//出险部位
		
		bean.setDNCNO(request.getParameter("DNCNO")==null?"":request.getParameter("DNCNO"));//险情编号
		bean.setPJNO(request.getParameter("GCNAME")==null?"":request.getParameter("GCNAME"));//工程编号
		bean.setSTTPCD(STTPCD==null?"":STTPCD);//建筑物编码
		bean.setDAGTM(request.getParameter("DAGTM")==null?"":request.getParameter("DAGTM"));//出险时间
		bean.setXQFLDM(request.getParameter("XQFLDM")==null?"":request.getParameter("XQFLDM"));//险情分类代码
		bean.setTPN(request.getParameter("TPN")==""?"0":request.getParameter("TPN"));//群众投入(人)
		bean.setPLAPN(request.getParameter("PLAPN")==""?"0":request.getParameter("PLAPN"));//解放军投入(人)
		bean.setPLIPN(request.getParameter("PLIPN")==""?"0":request.getParameter("PLIPN"));//武警投入(人)
		bean.setRZ(request.getParameter("RZ")==""?"0":request.getParameter("RZ"));//当前运行水位(米)
		bean.setWTDPDT(request.getParameter("WTDPDT")==null?"":request.getParameter("WTDPDT"));//填报时间
		return bean;
	}
	
	public static RSRBean _getRSRBeanFromRquest(HttpServletRequest request)throws Exception{
		RSRBean bean = new RSRBean();
		String BJWHZK = new String(request.getParameter("BJWHZK").getBytes("ISO-8859-1"),"GBK");//坝基完好状况
		String BTWDZK = new String(request.getParameter("BTWDZK").getBytes("ISO-8859-1"),"GBK");//坝体稳定情况
		String HPHAWDQK = new String(request.getParameter("HPHAWDQK").getBytes("ISO-8859-1"),"GBK");//护坡护岸稳定情况
		String XSJZWZK = new String(request.getParameter("XSJZWZK").getBytes("ISO-8859-1"),"GBK");//泄水建筑物完好状况
		String XNGWHZK = new String(request.getParameter("XNGWHZK").getBytes("ISO-8859-1"),"GBK");//消能工完好状况
		String ZMQBJZK = new String(request.getParameter("ZMQBJZK").getBytes("ISO-8859-1"),"GBK");//闸门、启闭机完好状况
		String TXSDJZK = new String(request.getParameter("TXSDJZK").getBytes("ISO-8859-1"),"GBK");//通讯手段及状况
		
		bean.setPJRNO(request.getParameter("PJRNO")==null?"":request.getParameter("PJRNO"));//运行编号
		bean.setPJNO(request.getParameter("PJNO")==null?"":request.getParameter("PJNO"));//工程编号
		bean.setDTCDT(request.getParameter("DTCDT")==null?"":request.getParameter("DTCDT"));//检测时间
		bean.setPJNM(request.getParameter("PJNM")==null?"":request.getParameter("PJNM"));//工程名称
		bean.setRSCLS(request.getParameter("RSCLS")==null?"":request.getParameter("RSCLS"));//水库类别(良好/尚好/病险库)
		bean.setRV(request.getParameter("RV")==null?"0":request.getParameter("RV"));//当前库容(万立方米)
		bean.setRZ(request.getParameter("RZ")==null?"0":request.getParameter("RZ"));//当前运行水位(米)
		bean.setRQ(request.getParameter("RQ")==null?"0":request.getParameter("RQ"));//当前泻量(立方米/秒)
		bean.setDFPFCN(BJWHZK==null?"":BJWHZK);//坝基完好状况
		bean.setDBSTBCN(BTWDZK==null?"":BTWDZK);//坝体稳定情况
		bean.setBRBPPFCN(HPHAWDQK==null?"":HPHAWDQK);//护坡护岸稳定情况
		bean.setESPFCN(XSJZWZK==null?"":XSJZWZK);//泄水建筑物完好状况
		bean.setEDDPFCN(XNGWHZK==null?"":XNGWHZK);//消能工完好状况
		bean.setGTHOPFCN(ZMQBJZK==null?"":ZMQBJZK);//闸门、启闭机完好状况
		bean.setCOMMCN(TXSDJZK==null?"":TXSDJZK);//通讯手段及状况
		return bean;
	}
	
	public static DetailBean _getDetailBeanFromRquest(HttpServletRequest request,String XQFL)throws Exception{
		DetailBean bean = new DetailBean();
		bean.setDNCNO(request.getParameter("DNCNO"));		//险情编号
		bean.setPJNO(request.getParameter("GCNAME"));		//工程编号
		String STTPCD = (new String(request.getParameter("STTPCD").getBytes("ISO-8859-1"),"GBK"));
		
		bean.setSTTPCD(STTPCD);		//建筑物编码
		
		bean.setDAGTM(request.getParameter("DAGTM"));		//出险时间
		bean.setDNCNM(new String(request.getParameter("DNCNM").getBytes("ISO-8859-1"),"GBK"));		//险情名称
		if("D004".trim().equals(XQFL)||"D003".trim().equals(XQFL)){
			String LKGTU = new String(request.getParameter("LKGTU").getBytes("ISO-8859-1"),"GBK");
			bean.setLKGTU(LKGTU==null?"":LKGTU);		//漏水混清	==D004==D003
		}
		if("D006".trim().equals(XQFL)||"D012".trim().equals(XQFL)){
			bean.setSLUPAG(request.getParameter("SLUPAG")==""?"0":request.getParameter("SLUPAG"));		//滑坡面角度(度)	==D006==D012
		}
		if("D007".trim().equals(XQFL)||"D009".trim().equals(XQFL)
				||"D004".trim().equals(XQFL)){
			bean.setTODFTDI(request.getParameter("TODFTDI")==""?"0":request.getParameter("TODFTDI"));		//距堤脚距离(米)	==D007==D009==D003==D004
		}
		if("D009".trim().equals(XQFL)||"D011".trim().equals(XQFL)){
			bean.setWDQ(request.getParameter("WDQ")==""?"0":request.getParameter("WDQ"));//河道流量(立方米/秒)	==D011==D009
		}
		if("D001".trim().equals(XQFL)||"D015".trim().equals(XQFL)){
			bean.setDSSPN(request.getParameter("DSSPN")==""?"0":request.getParameter("DSSPN"));		//受灾人口(人)	==D001==D015
			bean.setINPN(request.getParameter("INPN")==""?"0":request.getParameter("INPN"));		//受伤人口(人)	==D001==D015
			bean.setDTHPN(request.getParameter("DTHPN")==""?"0":request.getParameter("DTHPN"));		//死亡人口(人)	==D001==D015
			bean.setWRHS(request.getParameter("WRHS")==""?"0":request.getParameter("WRHS"));		//倒塌房屋(间)	==D001==D015
			bean.setCRPDSSAR(request.getParameter("CRPDSSAR")==""?"0":request.getParameter("CRPDSSAR"));	//农作物受灾面积(公顷)	==D001==D015
			bean.setSCDMFMAR(request.getParameter("SCDMFMAR")==""?"0":request.getParameter("SCDMFMAR"));	//毁坏耕地面积(公顷)	==D001==D015
			bean.setDRCECLS(request.getParameter("DRCECLS")==""?"0":request.getParameter("DRCECLS"));		//直接经济损失(万元)		==D001==D015
		}
		if("D023".trim().equals(XQFL)||"D024".trim().equals(XQFL)){
			bean.setWRAR(request.getParameter("WRAR")==""?"0":request.getParameter("WRAR"));		//破坏面积(平方米)	==D023==D024
		}
		if("D001".trim().equals(XQFL)){
			//D001	决口				TB_BURDSC
			bean.setBUW(request.getParameter("BUW")==""?"0":request.getParameter("BUW"));			//决口宽度(米)
			bean.setBUVL(request.getParameter("BUVL")==""?"0":request.getParameter("BUVL"));		//决口流速(米/秒)
			bean.setBUZDF(request.getParameter("BUZDF")==""?"0":request.getParameter("BUZDF"));		//决口水头差(米)
			bean.setBUQ(request.getParameter("BUQ")==""?"0":request.getParameter("BUQ"));			//决口流量(立方米/秒)
			String BURLDGL = new String(request.getParameter("BURLDGL").getBytes("ISO-8859-1"),"GBK");
			bean.setBURLDGL(BURLDGL==null?"":BURLDGL);		//决口处地形地质条件
		}
		if("D002".trim().equals(XQFL)){
			//D002	漫溢				TB_OVFLDSC
			bean.setOVFLL(request.getParameter("OVFLL")==""?"0":request.getParameter("OVFLL"));		//漫溢长度(米)
			bean.setOVFLZ(request.getParameter("OVFLZ")==""?"0":request.getParameter("OVFLZ"));		//漫溢水位(米)
			bean.setDSQ(request.getParameter("DSQ")==""?"0":request.getParameter("DSQ"));			//漫溢流量(立方米/秒)
		}
		if("D003".trim().equals(XQFL)){
			//D003	漏洞				TB_LKDSC
			bean.setLKDMT(request.getParameter("LKDMT")==""?"0":request.getParameter("LKDMT"));		//漏洞直径(米)
			bean.setLKQ(request.getParameter("LKQ")==""?"0":request.getParameter("LKQ"));			//漏洞流量(升/秒)
			bean.setLKWTLH(request.getParameter("LKWTLH")==""?"0":request.getParameter("LKWTLH"));		//漏洞水柱高(米)
			bean.setLKSAR(request.getParameter("LKSAR")==""?"0":request.getParameter("LKSAR"));		//已形成漏洞群面积(平方米)
		}
		if("D004".trim().equals(XQFL)){
			//D004	管涌				TB_PPDSC
			bean.setPPQ(request.getParameter("PPQ")==""?"0":request.getParameter("PPQ"));			//管涌流量(升/秒)
			bean.setWTLH(request.getParameter("WTLH")==""?"0":request.getParameter("WTLH"));		//水柱高(米)
			bean.setPPSAR(request.getParameter("PPSAR")==""?"0":request.getParameter("PPSAR"));		//已形成管涌群面积(平方米)
		}
		if("D005".trim().equals(XQFL)){
			//D005	陷坑				TB_PITDSC
			bean.setSBDSP(request.getParameter("SBDSP")==""?"0":request.getParameter("SBDSP"));		//陷坑深度(米)
			bean.setSBAR(request.getParameter("SBAR")==""?"0":request.getParameter("SBAR"));		//陷坑面积(平方米)
		}
		if("D006".trim().equals(XQFL)){
			//D006	滑坡 			TB_SLDSC
			bean.setSLBU(request.getParameter("SLBU")==""?"0":request.getParameter("SLBU"));		//滑坡体积(立方米)
		}
		if("D007".trim().equals(XQFL)){
			//D007	淘刷				TB_UNDSC
			bean.setUNDAR(request.getParameter("UNDAR")==""?"0":request.getParameter("UNDAR"));		//淘刷面积(平方米)
			bean.setUNDD(request.getParameter("UNDD")==""?"0":request.getParameter("UNDD"));		//淘刷深度(米)
			bean.setUNDL(request.getParameter("UNDL")==""?"0":request.getParameter("UNDL"));		//淘刷长度(米)
		}
		if("D008".trim().equals(XQFL)){
			//D008	裂缝				TB_CRDSC
			String CRDR = new String(request.getParameter("CRDR").getBytes("ISO-8859-1"),"GBK");
			bean.setCRDR(CRDR==null?"":CRDR);		//裂缝方向
			bean.setCRD(request.getParameter("CRD")==""?"0":request.getParameter("CRD"));			//裂缝深度(米)
			bean.setCRL(request.getParameter("CRL")==""?"0":request.getParameter("CRL"));			//裂缝长度(米)
			bean.setCRW(request.getParameter("CRW")==""?"0":request.getParameter("CRW"));			//裂缝宽度(厘米)
		}
		if("D009".trim().equals(XQFL)){
			//D009	崩岸				TB_CVDSC
			bean.setCVL(request.getParameter("CVL")==""?"0":request.getParameter("CVL"));			//崩塌长度(米)
			bean.setCVBU(request.getParameter("CVBU")==""?"0":request.getParameter("CVBU"));		//崩塌体积(立方米)
			bean.setRVH(request.getParameter("RVH")==""?"0":request.getParameter("RVH"));			//河岸高度(米)
			String FLCNDSC = new String(request.getParameter("FLCNDSC").getBytes("ISO-8859-1"),"GBK");
			bean.setFLCNDSC(FLCNDSC==null?"":FLCNDSC);		//水流情况描述
		}
		if("D010".trim().equals(XQFL)){
			//D010	渗水				TB_SPDSC
			bean.setSPAR(request.getParameter("SPAR")==""?"0":request.getParameter("SPAR"));		//渗水面积(平方米)
			bean.setSPQ(request.getParameter("SPQ")==""?"0":request.getParameter("SPQ"));			//渗透流量
		}
		if("D011".trim().equals(XQFL)){
			//D011	 浪坎 			TB_BLBAD
			bean.setBLH(request.getParameter("BLH")==""?"0":request.getParameter("BLH"));			//浪高(米)
			bean.setWNS(request.getParameter("WNS")==""?"0":request.getParameter("WNS"));			//风速(级)
		}
		if("D012".trim().equals(XQFL)){
			//D012	滑动				TB_SLUDSC
			bean.setSLUDSP(request.getParameter("SLUDSP")==""?"0":request.getParameter("SLUDSP"));		//滑动位移(米)
			bean.setSLUTP(request.getParameter("SLUTP")==""?"0":request.getParameter("SLUTP"));		//滑动类型
			String SLUGLCN = new String(request.getParameter("SLUGLCN").getBytes("ISO-8859-1"),"GBK");
			bean.setSLUGLCN(SLUGLCN==null?"":SLUGLCN);		//滑动面地质情况
		}
		if("D013".trim().equals(XQFL)){
			//D013	启闭失灵			TB_HOMLFDSC
			String POWCUT = new String(request.getParameter("POWCUT").getBytes("ISO-8859-1"),"GBK");
			String HOMLF = new String(request.getParameter("HOMLF").getBytes("ISO-8859-1"),"GBK");
			String GSDST = new String(request.getParameter("GSDST").getBytes("ISO-8859-1"),"GBK");
			String MLFCN = new String(request.getParameter("MLFCN").getBytes("ISO-8859-1"),"GBK");
			bean.setPOWCUT(POWCUT==null?"":POWCUT);		//停电
			bean.setHOMLF(HOMLF==null?"":HOMLF);		//启闭机失灵
			bean.setGSDST(GSDST==null?"":GSDST);		//闸门井变形
			bean.setMLFCN(MLFCN==null?"":MLFCN);		//失灵时开启状况
		}
		if("D014".trim().equals(XQFL)){
			//D014	闸门破坏			TB_GTWRDSC
			String WRDSC = new String(request.getParameter("WRDSC").getBytes("ISO-8859-1"),"GBK");
			bean.setWRDSC(WRDSC==null?"":WRDSC);		//破坏形式
			bean.setWRQ(request.getParameter("WRQ")==""?"0":request.getParameter("WRQ"));			//失事时流量(立方米/秒)
		}
		if("D015".trim().equals(XQFL)){
			//D015	溃坝				TB_BRDMDSC
			String PJPS = new String(request.getParameter("PJPS").getBytes("ISO-8859-1"),"GBK");
			String BRDMLDGL = new String(request.getParameter("BRDMLDGL").getBytes("ISO-8859-1"),"GBK");
			bean.setBRDMW(request.getParameter("BRDMW"));		//溃坝宽度(米)
			bean.setPJPS(PJPS==null?"":PJPS);		//工程现状
			bean.setBRZDMCDI(request.getParameter("BRZDMCDI")==""?"0":request.getParameter("BRZDMCDI"));	//库水位距堤顶距离(米)
			bean.setBRV(request.getParameter("BRV")==""?"0":request.getParameter("BRV"));			//溃坝时库容(万立方米)
			bean.setBRDMQ(request.getParameter("BRDMQ")==""?"0":request.getParameter("BRDMQ"));		//溃坝流量(立方米/秒)
			bean.setBRDMLDGL(BRDMLDGL==null?"":BRDMLDGL);	//溃坝处地形、地质条件
		}
		if("D016".trim().equals(XQFL)){
			//D016	倾覆				TB_OVTUDSC
			String OVTUDR = new String(request.getParameter("OVTUDR").getBytes("ISO-8859-1"),"GBK");
			bean.setOVTUDR(OVTUDR==null?"":OVTUDR);		//倾覆方向
			bean.setOVTUAG(request.getParameter("OVTUAG")==""?"0":request.getParameter("OVTUAG"));		//倾覆角度(度)
		}
		if("D017".trim().equals(XQFL)){
			//D017	应力过大			TB_STREXDSC
			String CONGR = new String(request.getParameter("CONGR").getBytes("ISO-8859-1"),"GBK");
			bean.setMXTNST(request.getParameter("MXTNST")==""?"0":request.getParameter("MXTNST"));		//最大拉应力(牛/平方毫米)
			bean.setMXCMST(request.getParameter("MXCMST")==""?"0":request.getParameter("MXCMST"));		//最大压应力(牛/平方毫米)
			bean.setCONGR(CONGR==null?"":CONGR);		//混凝土标号
			bean.setASTR(request.getParameter("ASTR")==""?"0":request.getParameter("ASTR"));		//允许应力值(牛/平方毫米)
		}
		if("D018".trim().equals(XQFL)){
			//D018	坍塌				TB_SLIDSC
			bean.setSLIAR(request.getParameter("SLIAR")==""?"0":request.getParameter("SLIAR"));		//坍塌面积(平方米)
			bean.setSLIMS(request.getParameter("SLIMS")==""?"0":request.getParameter("SLIMS"));		//坍塌方量(立方米)
		}
		if("D019".trim().equals(XQFL)){
			//D019	堵塞				TB_PLUDSC
			String PLTNM = new String(request.getParameter("PLTNM").getBytes("ISO-8859-1"),"GBK");
			String PLTBU = new String(request.getParameter("PLTBU").getBytes("ISO-8859-1"),"GBK");
			bean.setPLTNM(PLTNM==null?"":PLTNM);		//堵塞物名称
			bean.setPLTBU(PLTBU==""?"0":PLTBU);		//堵塞物体积(立方米)
		}
		if("D020".trim().equals(XQFL)){
			//D020	基础破坏			TB_BSWRDSC
			String GRNSPDSC = new String(request.getParameter("GRNSPDSC").getBytes("ISO-8859-1"),"GBK");
			String GROVCHWR = new String(request.getParameter("GROVCHWR").getBytes("ISO-8859-1"),"GBK");
			bean.setGRNSPDSC(GRNSPDSC==null?"":GRNSPDSC);	//基础渗漏描述
			bean.setGRNUSB(request.getParameter("GRNUSB")==""?"0":request.getParameter("GRNUSB"));		//据传不均匀沉降(米)
			bean.setGROVCHWR(GROVCHWR==null?"":GROVCHWR);	//基础超载破坏
		}
		if("D021".trim().equals(XQFL)){
			//D021	消能工破坏		TB_EDDWRDSC
			String APWR = new String(request.getParameter("APWR").getBytes("ISO-8859-1"),"GBK");
			String WSTWR = new String(request.getParameter("WSTWR").getBytes("ISO-8859-1"),"GBK");
			bean.setAPWR(APWR==null?"":APWR);		//底板掀起
			bean.setWSTWR(WSTWR==null?"":WSTWR);		//止水破坏
		}
		if("D022".trim().equals(XQFL)){
			//D022		基础排水失效		TB_BSWPLPDS
			String WPPLU = new String(request.getParameter("WPPLU").getBytes("ISO-8859-1"),"GBK");
			String WPEQML = new String(request.getParameter("WPEQML").getBytes("ISO-8859-1"),"GBK");
			bean.setWPPLU(WPPLU==null?"":WPPLU);		//排水孔堵塞
			bean.setWPEQML(WPEQML==null?"":WPEQML);		//排水设备失灵
		}
		if("D023".trim().equals(XQFL)){
			//D023	洞身破坏 			TB_HBWRDSC
			String LNINF = new String(request.getParameter("LNINF").getBytes("ISO-8859-1"),"GBK");
			String HBGLCN = new String(request.getParameter("HBGLCN").getBytes("ISO-8859-1"),"GBK");
			bean.setWRMS(request.getParameter("WRMS")==""?"0":request.getParameter("WRMS"));//破坏方量(立方米)
			bean.setLNINF(LNINF==null?"":LNINF);//对衬砌造成的影响
			bean.setHBGLCN(HBGLCN==null?"":HBGLCN);//洞身地质情况
		}
		if("D024".trim().equals(XQFL)){
			//D024	控导工程局部破坏	TB_CLPJPRWR
			String WRGLCN = new String(request.getParameter("WRGLCN").getBytes("ISO-8859-1"),"GBK");
			bean.setWRD(request.getParameter("WRD")==""?"0":request.getParameter("WRD"));			//破坏深度(米)
			bean.setWRL(request.getParameter("WRL")==""?"0":request.getParameter("WRL"));			//破坏长度(米)
			bean.setWRGLCN(WRGLCN==null?"":WRGLCN);		//破坏处地质情况
		}
		if("D025".trim().equals(XQFL)){
			//D025	控导工程冲毁		TB_CLPJSCDN
			String SCDMGLCN = new String(request.getParameter("SCDMGLCN").getBytes("ISO-8859-1"),"GBK");
			bean.setSCDMBU(request.getParameter("SCDMBU")==""?"0":request.getParameter("SCDMBU"));		//冲毁体积(立方米)
			bean.setSCDML(request.getParameter("SCDML")==""?"0":request.getParameter("SCDML"));		//冲毁长度(米)
			bean.setSCDMD(request.getParameter("SCDMD")==""?"0":request.getParameter("SCDMD"));		//冲毁深度(米)
			bean.setSCDMGLCN(SCDMGLCN==null?"":SCDMGLCN);	//冲毁处地质情况
		}
		return bean;
	}
}
