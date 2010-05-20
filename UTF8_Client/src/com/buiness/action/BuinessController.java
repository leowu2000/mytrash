package com.buiness.action;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.buiness.dao.BuinessDao;
import com.buiness.dao.SqlFactory;
import com.buiness.form.ConfigBean;
import com.buiness.form.DetailBean;
import com.buiness.form.PJRCNBean;
import com.buiness.form.PjrDetailBean;
import com.buiness.form.PrjBean;
import com.buiness.form.RSRBean;
import com.buiness.form.STDNCBean;
import com.buiness.form.SubTempBean;
import com.core.ConnectionPool;
import com.core.UUIdFactory;
import com.util.UtilDateTime;

public class BuinessController implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String path = request.getSession().getServletContext().getRealPath("/");
		String actionType = request.getParameter("actionType");
		request.setCharacterEncoding("GBK");
		
		if ("login".trim().equals(actionType)) {
			// 登陆的时候判断是否进行 了系统运行参数配置
			String searchSql = "select * from TB_CONFIG";
			Connection conn = ConnectionPool.getConnection(path);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(searchSql);
			if (rs.next())
				return new ModelAndView("/project/xq/gqxqManage");
			else
				return new ModelAndView("sys/config");
		}
		/**
		 * 参数设置页面
		 */
		if ("parames".trim().equals(actionType)) {
			ConfigBean bean = GetParametsUtil._getConfigBeanFromRquest(request);
			String delsql = "delete from TB_CONFIG";
			BuinessDao.deleteDB(delsql, path);
			String sql = SqlFactory.insertSql_ConfigBean(bean, path);
			BuinessDao.insertDB(sql, path);
			request.setAttribute("msg", "参数设置成功!");
			return new ModelAndView("sys/config");
		}
		/**
		 * 删除工程险情信息数据
		 */
		if ("delgcxq".trim().equals(actionType)) {
			String IDs[] = request.getParameterValues("RECORDID");// 工程流水号+险情流水号+险情分类代码
			for (String groupStr : IDs) {
				String groupArr[] = groupStr.split(";");
				// 取得详情代码表名称
				String tablename = BuinessDao.getXqFlTabname(path, groupArr[2]);
				// 删除多媒体表数据
				BuinessDao.deleteDB("delete from TB_STDNC_M where DNCNO="+ groupArr[1], path);
				// 删除详情分类表数据
				BuinessDao.deleteDB("delete from " + tablename+ " where DNCNO=" + groupArr[1], path);
				// 删除主表数据
				BuinessDao.deleteDB("delete from TB_STDNC where DNCNO="
						+ groupArr[1] + " and PJNO=" + groupArr[0], path);
			}
			return new ModelAndView("project/xq/gqxqManage");
		}
		if ("updatetemp".trim().equals(actionType)) {
			String updateType = request.getParameter("updateType");
			String IDs[] = null;
			if("1".trim().equals(updateType))
				IDs = request.getParameterValues("RECORDID");
			else
				IDs = request.getParameterValues("UPLOADRECORDID");
			
			if (IDs != null) {
				for (int i = 0; i < IDs.length; i++)
					BuinessDao.updateTempResult(path, IDs[i],updateType);
			}
			return new ModelAndView("sys/uploadManage");
		}
		/**
		 * 新增工程信息
		 */
		if ("add".trim().equals(actionType)) {
			String strTicketA = request.getParameter("sessiontime");
			Long strTicketB = (Long) request.getSession().getAttribute("sessiontime");
			if (strTicketA.equals(strTicketB.toString())) 
			{
				request.getSession().setAttribute("sessiontime",System.currentTimeMillis());
				String gcnm = request.getParameter("PJNM");
				String gclb = request.getParameter("gclb");
				String cntcd = request.getParameter("cntcd");
				
				String hldm = request.getParameter("hldm");
				String gcdm = gclb + hldm.substring(1, 7) + cntcd.substring(0, 1);
				String SQL = "INSERT INTO TB_PJ(PJNO,PJNMCD,PJNM,CNTCD,FPDUTY,FPDUTYPH)VALUES("
						+ UUIdFactory.getMaxId(path, "TB_PJ", "PJNO")
						+ ",'"+ gcdm+ "','" + gcnm + "','" + cntcd + "','','')";
				BuinessDao.insertDB(SQL, path);
				return new ModelAndView("project/prgManage");
			}else{
				return new ModelAndView("project/prgManage");
			}
		}
		/**
		 * 修改工程信息前查看数据
		 */
		if ("peredit".trim().equals(actionType)) {
			String IDs = request.getParameter("IDs");
			String SQL = "select * FROM TB_PJ WHERE PJNO =" + IDs + "";
			PrjBean bean = BuinessDao.findBySql(SQL, path);
			request.setAttribute("bean", bean);
			return new ModelAndView("project/prgEdit");
		}
		/**
		 * 修改工程信息
		 */
		if ("edit".trim().equals(actionType)) {
			String gclsh = request.getParameter("gclsh");
			String gcnm = request.getParameter("PJNM");
			String gclb = request.getParameter("gclb");
			String cntcd = request.getParameter("cntcd");
			String hldm = request.getParameter("hldm");
			String gcdm = gclb + hldm.substring(1, 7) + cntcd.substring(0, 1);
			String SQL = "UPDATE TB_PJ SET PJNMCD='" + gcdm + "',PJNM='" + gcnm
					+ "',CNTCD='" + cntcd + "' WHERE PJNO=" + gclsh + "";
			BuinessDao.updateDB(SQL, path);
			return new ModelAndView("project/prgManage");
		}
		/**
		 * 查看工程信息
		 */
		if ("view".trim().equals(actionType)) {
			String gclsh = request.getParameter("gclsh");
			String SQL = "select * FROM TB_PJ WHERE PJNO =" + gclsh + "";
			PrjBean bean = BuinessDao.findBySql(SQL, path);
			request.setAttribute("bean", bean);
			return new ModelAndView("project/prgView");
		}
		/**
		 * 删除工程除外
		 * 公用删除数据 IDs:取页面RECORDIDs TBID:表名称包括关联表用","分割
		 * PKFILED:表主键用","分割,跟TBID表数据对应
		 */
		if ("del".trim().equals(actionType)) {
			String IDs = request.getParameter("IDs");
			String TBID = request.getParameter("TBID");
			String towhere = request.getParameter("towhere");
			towhere = towhere == null ? "" : towhere;
			TBID = TBID == null ? "" : TBID;
			String PKFILED = request.getParameter("PKFILED");
			PKFILED = PKFILED == null ? "" : PKFILED;
			String tbs[] = TBID.split(",");
			String fileds[] = PKFILED.split(",");
			if (tbs.length > 0) {
				for (int i = 0; i < tbs.length; i++) {
					String SQL = "DELETE FROM " + tbs[i] + " WHERE "+ fileds[i] + " IN(" + IDs + ")";
					BuinessDao.deleteDB(SQL, path);
				}
			}
			if (!"".trim().equals(towhere)){
				if("gqyx".trim().equals(towhere))
					return new ModelAndView("project/yx/" + towhere + "Manage");
				else
					return new ModelAndView("report/" + towhere + "Manage");
			}
			else
				return new ModelAndView("project/prgManage");
		}
		if("delpj".trim().equals(actionType)){
			//删除工程信息，相应删除其他关联的信息，运行、险情、建筑物TB_ST
			String IDs = request.getParameter("IDs");
			BuinessDao.deleteProject(path,IDs);
			
			return new ModelAndView("project/prgManage");
		}
		/**
		 * 新增工情采集信息
		 */
		if ("add_gqcj".trim().equals(actionType)) {
			String SAVETYPES = request.getParameter("SAVETYPES");
			String TABLENAME = request.getParameter("tabname");
			PrjBean prjBean = BuinessDao.findBySql(
					"select * from TB_PJ where PJNO="
							+ request.getParameter("GCNAME"), path);
			String strTicketA = request.getParameter("sessiontime");
			Long strTicketB = (Long) request.getSession().getAttribute("sessiontime");
			if (strTicketA.equals(strTicketB.toString())) 
			{
				request.getSession().setAttribute("sessiontime",System.currentTimeMillis());
				// 工程运行信息
				if ("1".trim().equals(SAVETYPES)) {
					PJRCNBean bean = GetParametsUtil._getPJRCNBeanFromRequest(request);
	
					String DNCNO = request.getParameter("DNCNO");
					bean.setPJRNO(String.valueOf(DNCNO));
					String sSQL = SqlFactory.insertSQL_PJRCNBean(bean, path,
							prjBean);
					PjrDetailBean pjdbean = GetParametsUtil._getPjrDetailBeanFormReqeust(request,bean.getGCFLDM());
					pjdbean.setPJRNO(String.valueOf(DNCNO));
					String sSQL2 = SqlFactory.insertSQL_PjrBean(pjdbean, path,
							prjBean,bean.getGCFLDM());
					List<SubTempBean> beanlist = BuinessDao.getMediaList(path,
							DNCNO, "TB_PJR_M");
					BuinessDao.toInsertDbList(path, "TB_PJR_M", sSQL, sSQL2,
							beanlist);
					BuinessDao.deleteTempMedia(path);
					return new ModelAndView("project/yx/gqyxManage");
				}
				// 工程险情信息
				if ("2".trim().equals(SAVETYPES)) {
					String mainSQL = "";
					String subSQL = "";
					String DNCNO = request.getParameter("DNCNO");
					// 根据名称查询，如果返回编码说明是原来的旧的建筑物
					// 如果返回为空，则说明是新添加的建筑物编码
					int id = 1;
					STDNCBean bean = GetParametsUtil._getSTDNCeanFromRequest(request);
					String sttpcd = bean.getSTTPCD();
					String code = BuinessDao.getIdFromNameChange(path, "TB_ST",
							"STTPCD", "STNM='" + sttpcd + "' AND PJNO="
									+ bean.getPJNO());
					if (!"".trim().equals(code)) {
						bean.setSTTPCD(code);
						id = new Integer(code).intValue();
					} else {
						// 执行插入操作，并且重置STDNCBean的建筑物编码字段。
						id = UUIdFactory.getMaxId(path, "TB_ST", "STTPCD");
						mainSQL = "INSERT INTO TB_ST (STTPCD,PJNO,STNM)VALUES("
								+ id + "," + bean.getPJNO() + ",'" + sttpcd + "')";
						BuinessDao.insertDB(mainSQL, path);
						bean.setSTTPCD(String.valueOf(id));
					}
					// 保存主表信息
					bean.setDNCNO(String.valueOf(DNCNO));
					bean.setSTTPCD(String.valueOf(id));
					mainSQL = SqlFactory.insertSQL_STDNCBean(bean, path);
					// 获取并保存资表信息
					DetailBean dBean = GetParametsUtil._getDetailBeanFromRquest(request, bean.getXQFLDM());
					dBean.setSTTPCD(String.valueOf(id));
					subSQL = SqlFactory.insertSQL_DNCDetailBean(dBean, path, bean.getXQFLDM());
					List<SubTempBean> beanlist = BuinessDao.getMediaList(path,DNCNO, TABLENAME);
					BuinessDao.toInsertDbList(path, TABLENAME, mainSQL, subSQL,beanlist);
					BuinessDao.deleteTempMedia(path);
					return new ModelAndView("project/xq/gqxqManage");
				}
			}else{
				if ("1".trim().equals(SAVETYPES)) 
					return new ModelAndView("project/yx/gqyxManage");
				else
					return new ModelAndView("project/xq/gqxqManage");
			}

		}
		/**
		 * 修改工情采集信息
		 */
		if ("edit_gqcj".trim().equals(actionType)) {
			String SAVETYPES = request.getParameter("SAVETYPES");
			String DNCNO = request.getParameter("DNCNO");// 主表主键
			if ("2".trim().equals(SAVETYPES)) {// 工程险情
				String mainSQL = "";
				String subSQL = "";

				String XQFLDM = request.getParameter("XQFLDM");// 险情分类代码
				// 根据名称查询，如果返回编码说明是原来的旧的建筑物
				// 如果返回为空，则说明是新添加的建筑物编码
				int id = 1;
				STDNCBean bean = GetParametsUtil._getSTDNCeanFromRequest(request);
				String sttpcd = bean.getSTTPCD();
				String code = BuinessDao.getIdFromNameChange(path, "TB_ST",
						"STTPCD", "STNM='" + sttpcd + "' AND PJNO="+ bean.getPJNO());
				if (!"".trim().equals(code)) {
					bean.setSTTPCD(code);
					id = new Integer(code).intValue();
				} else {
					// 执行插入操作，并且重置STDNCBean的建筑物编码字段。
					id = UUIdFactory.getMaxId(path, "TB_ST", "STTPCD");
					mainSQL = "INSERT INTO TB_ST (STTPCD,PJNO,STNM)VALUES("
							+ id + "," + bean.getPJNO() + ",'" + sttpcd + "')";
					BuinessDao.insertDB(mainSQL, path);
				}
				// 保存主表信息
				BuinessDao.deleteDB("delete from TB_STDNC WHERE DNCNO=" + DNCNO, path);
				bean.setDNCNO(String.valueOf(DNCNO));
				mainSQL = SqlFactory.insertSQL_STDNCBean(bean, path);
				// 取子表名称
				String detailTablename = BuinessDao.getXqFlTabname(path, XQFLDM);
				BuinessDao.deleteDB("delete from " + detailTablename+ " WHERE DNCNO=" + DNCNO, path);
				// 获取并保存资表信息

				DetailBean dBean = GetParametsUtil._getDetailBeanFromRquest(request, XQFLDM);
				dBean.setSTTPCD(String.valueOf(id));
				subSQL = SqlFactory.insertSQL_DNCDetailBean(dBean, path, bean.getXQFLDM());
				List<SubTempBean> beanlist = BuinessDao.getMediaList(path,DNCNO, "TB_STDNC_M");
				BuinessDao.toInsertDbList(path, "TB_STDNC_M", mainSQL, subSQL,beanlist);
				BuinessDao.deleteTempMedia(path);
				return new ModelAndView("project/xq/gqxqManage");
			} else {
				//反回主表数据的运行状态码
				String GCFL = BuinessDao.idToNameChange(path, "TB_PJRCN", "GCFLDM", " PJRNO="+DNCNO);
				String detailTname="";
				if("B".trim().equals(GCFL))detailTname = "TB_RSR";
				if("K".trim().equals(GCFL))detailTname = "TB_WLR";
				if("N".trim().equals(GCFL))detailTname = "TB_COWAPJ";//=治河工程=N
				if("F".trim().equals(GCFL))detailTname = "TB_STOFLER";//=蓄滞=F
				if("D".trim().equals(GCFL)
						||"E".trim().equals(GCFL)
						||"H".trim().equals(GCFL)
						||"P".trim().equals(GCFL))
					detailTname = "TB_DKR";
				// 删除主表数据
				BuinessDao.deleteDB("delete from TB_PJRCN WHERE PJRNO=" + DNCNO, path);
				// 更新主表
				PJRCNBean bean = GetParametsUtil._getPJRCNBeanFromRequest(request);
				PrjBean prjBean = BuinessDao.findBySql("select * from TB_PJ where PJNO="
								+ request.getParameter("GCNAME"), path);
				bean.setPJRNO(DNCNO);
				String sSQL = SqlFactory.insertSQL_PJRCNBean(bean, path,prjBean);
				// 删除子表数据
				BuinessDao.deleteDB("delete from "+detailTname+" WHERE PJRNO=" + DNCNO,path);
				// 更新子表数据
				PjrDetailBean pjdbean = GetParametsUtil._getPjrDetailBeanFormReqeust(request,bean.getGCFLDM());
				pjdbean.setPJRNO(String.valueOf(DNCNO));
				String sSQL2 = SqlFactory.insertSQL_PjrBean(pjdbean, path,prjBean,bean.getGCFLDM());
				List<SubTempBean> beanlist = BuinessDao.getMediaList(path,DNCNO, "TB_PJR_M");
				BuinessDao.toInsertDbList(path, "TB_PJR_M", sSQL, sSQL2,beanlist);
				BuinessDao.deleteTempMedia(path);
				return new ModelAndView("project/yx/gqyxManage");
			}
		}
		/**
		 * 新增/修改 防汛简报信息
		 */
		if ("add_fxjb".trim().equals(actionType)) {//
			String subAction = request.getParameter("subActionType");
			String ISSUE = request.getParameter("ISSUE");
			String QF = request.getParameter("QF");
			String SH = request.getParameter("SH");
			String NG = request.getParameter("NG");
			String WTTT = request.getParameter("WTTT");
			String WTDT = request.getParameter("WTDT");
			String ACTICO = request.getParameter("ACTICO");
			String WTDPCD = request.getParameter("WTDPCD");
			String filepath = request.getParameter("upFileValues");
			String mediaflag = request.getParameter("mediaflag");
			Connection conn = ConnectionPool.getConnection(path);

			String sSQL = "";
			// 修改防汛信息
			if ("update".trim().equals(subAction)) {
				String RPJINCD = request.getParameter("RPJINCD");
				sSQL = "UPDATE TB_FXJB SET ISSUE=" + ISSUE + ",WTDT=#" + WTDT
						+ "#,ACTICO='" + ACTICO + "',QF='" + QF + "',SH='" + SH
						+ "',NG='" + NG + "',WTDPCD='" + WTDPCD + "',WTTT='"
						+ WTTT + "'" + " WHERE RPJINCD=" + RPJINCD;
				// 主表
				BuinessDao.updateDB(sSQL, path);
				// 如果需要更新多媒体信息
				if ("1".trim().equals(mediaflag)) {
					if(!"".trim().equals(filepath)){
						String sql = "INSERT INTO TB_FXJB_M(ZLBM,RPJINCD,DTCDT,WJGS,TITLE,LXZP) values(?,?,?,?,?,?)";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						File f = new File(filepath);
						int poi = filepath.lastIndexOf(".");
						String detail = filepath.substring(poi+1,filepath.length()).toUpperCase();
						String name = f.getName().substring(0,f.getName().lastIndexOf("."));
						FileInputStream fis = new FileInputStream(f);
						pstmt.setInt(1, UUIdFactory.getMaxId(path, "TB_FXJB_M","ZLBM"));
						pstmt.setString(2, String.valueOf(RPJINCD));
						pstmt.setString(3, UtilDateTime.nowDateString());
						pstmt.setString(4, detail);
						pstmt.setString(5, name);
						pstmt.setBinaryStream(6, fis, (int) f.length());
						pstmt.executeUpdate();
						pstmt.close();
						conn.close();
					}
				}
				return new ModelAndView("report/fxjbManage");
			} else {
				String strTicketA = request.getParameter("sessiontime");
				Long strTicketB = (Long) request.getSession().getAttribute("sessiontime");
				if (strTicketA.equals(strTicketB.toString())) 
				{
					request.getSession().setAttribute("sessiontime",System.currentTimeMillis());
					int RPJINCD = UUIdFactory.getMaxId(path, "TB_FXJB", "RPJINCD");
					sSQL = "INSERT INTO TB_FXJB(RPJINCD,ISSUE,WTDT,ACTICO,QF,SH,NG,WTDPCD,WTTT)VALUES("
							+ RPJINCD
							+ ","+ ISSUE+ ",#"+ WTDT+ "#,'"
							+ ACTICO+ "','"+ QF+ "','"+ SH
							+ "','"+ NG+ "','"+ WTDPCD
							+ "','" + WTTT + "')";
					// 主表
					BuinessDao.insertDB(sSQL, path);
					if(!"".trim().equals(filepath)){
						int poi = filepath.lastIndexOf(".");
						String detail = filepath.substring(poi+1,filepath.length()).toUpperCase();
						
						String sql = "INSERT INTO TB_FXJB_M(ZLBM,RPJINCD,DTCDT,WJGS,TITLE,LXZP) values(?,?,?,?,?,?)";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						
						File f = new File(filepath);
						String name = f.getName().substring(0,f.getName().lastIndexOf("."));
						FileInputStream fis = new FileInputStream(f);
						pstmt.setInt(1, UUIdFactory.getMaxId(path, "TB_FXJB_M",
										"ZLBM"));
						pstmt.setString(2, String.valueOf(RPJINCD));
						pstmt.setString(3, UtilDateTime.nowDateString());
						pstmt.setString(4, detail);
						pstmt.setString(5, name);
						pstmt.setBinaryStream(6, fis, (int) f.length());
						pstmt.executeUpdate();
						pstmt.close();
						conn.close();
					}
					return new ModelAndView("report/fxjbManage");
				}else{
					return new ModelAndView("report/fxjbManage");
				}
			}
		}
		/**
		 * 报告管理新增、修改：防汛行动、旱情信息、灾情报告
		 */
		if ("add_report".trim().equals(actionType)) {
			String DNCNO = request.getParameter("DNCNO");
			String WTDPCD = request.getParameter("WTDPCD");
			String TABLENAME = request.getParameter("TABLENAME");
			String WTDT = request.getParameter("WTDT");
			String MAINTITLE = request.getParameter("MAINTITLE");
			String CONTENT = request.getParameter("CONTENT").replaceAll("'", "‘");
			String FILEDNAME = request.getParameter("FILEDNAME");
			String subAction = request.getParameter("subAction");
			String newSQL = "";
			if ("edit".trim().equals(subAction)) {//修改
				newSQL = "UPDATE " + TABLENAME + " SET WTTT='" + MAINTITLE
						+ "',WTDT=#" + WTDT + "#,WTDPCD='" + WTDPCD + "',"
						+ FILEDNAME + "='" + CONTENT + "' WHERE RPJINCD="
						+ DNCNO;
			} else {//新增
				newSQL = "INSERT INTO " + TABLENAME
						+ "(RPJINCD,WTTT,WTDT,WTDPCD," + FILEDNAME + ")VALUES("
						+ DNCNO + ",'" + MAINTITLE + "',#" + WTDT + "#,'"
						+ WTDPCD + "','" + CONTENT + "')";
			}
			String strTicketA = request.getParameter("sessiontime");
			Long strTicketB = (Long) request.getSession().getAttribute("sessiontime");
			if (strTicketA.equals(strTicketB.toString())) 
			{
				request.getSession().setAttribute("sessiontime",System.currentTimeMillis());
				List<SubTempBean> beanlist = BuinessDao.getMediaList(path, DNCNO,TABLENAME + "_M");
				if ("edit".trim().equals(subAction))
					BuinessDao.toUpdateDbList(path, TABLENAME + "_M", newSQL, "",beanlist);// 更新
				else
					BuinessDao.toInsertDbList(path, TABLENAME + "_M", newSQL, "",beanlist);// 增加
				BuinessDao.deleteTempMedia(path);
				return new ModelAndView("report/" + TABLENAME + "Manage");
			}else{
				return new ModelAndView("report/" + TABLENAME + "Manage");
			}
		}
		/**
		 * 通用查询
		 */
		if ("search".trim().equals(actionType)) {
			String searchType = request.getParameter("searchType");
			String gcmc_s = "";
			String gclb_s = "";
			String xqfl_s ="";
			String selectlysx1 = "";
			String selectlysx2 = "";
			String selectzl1 = "";
			String selectzl2 = "";
			String iswhere = "";
			if("prj".trim().equals(searchType) 
					|| "gcxq".trim().equals(searchType) 
					|| "yxzt".trim().equals(searchType)
					|| "upload".trim().equals(searchType)){//获取流域信息
				gcmc_s = request.getParameter("gcmc_s");
				selectlysx1 = request.getParameter("selectlysx1");
				selectlysx2 = request.getParameter("selectlysx2");
				selectzl1 = request.getParameter("selectzl1");
				selectzl2 = request.getParameter("selectzl2");
				gclb_s = request.getParameter("gclb_s");
				request.setAttribute("gclb_s",gclb_s );
				request.setAttribute("ly_s", selectlysx1);
				request.setAttribute("sx_s", selectlysx2);
				request.setAttribute("yjzl_s", selectzl1);
				request.setAttribute("ejzl_s", selectzl2);
				request.setAttribute("gcmc_s",gcmc_s );
			}
			if ("prj".trim().equals(searchType)) {// 工程管理
				//工程名称（输入like）、工程类别、流域、水系、一级支流、二级支流
				iswhere = SqlFactory.makeSearchSQL(gcmc_s,"",gclb_s,"",
							selectlysx1,selectlysx2,selectzl1,selectzl2,"",
							"",searchType);
				request.setAttribute("isWhere", iswhere);
				return new ModelAndView("project/prgManage");
			}
			if ("gcxq".trim().equals(searchType)) {// 工程险情
				//险情名称（输入like）、工程名称、工程类别、险情分类、流域、水系、一级支流、二级支流
				String xqmc_s = request.getParameter("xqmc_s");
				xqfl_s = request.getParameter("xqfl_s");
				
				iswhere = SqlFactory.makeSearchSQL(gcmc_s,"",gclb_s,xqmc_s,
						selectlysx1,selectlysx2,selectzl1,selectzl2,"",
						"",searchType);
				request.setAttribute("xqmc_s", xqmc_s);
				request.setAttribute("xqfl_s", xqfl_s);
				request.setAttribute("isWhere", iswhere);
				return new ModelAndView("project/xq/gqxqManage");
			}
			if ("yxzt".trim().equals(searchType)) {// 运行状态
				//工程名称、工程类别、检测时间、流域、水系、一级支流、二级支流
				String jcsj_s = request.getParameter("jcsj_s");
				String jcsj_e = request.getParameter("jcsj_e");
				iswhere = SqlFactory.makeSearchSQL(gcmc_s,"",gclb_s,"",
						selectlysx1,selectlysx2,selectzl1,selectzl2,jcsj_s,
						jcsj_e,searchType);
				request.setAttribute("jcsj_s", jcsj_s);
				request.setAttribute("jcsj_e", jcsj_e);
				request.setAttribute("isWhere", iswhere);
				return new ModelAndView("project/yx/gqyxManage");
			}
			if("upload".trim().equals(searchType)){
				//标题（输入like）、类别（险情、运行、灾情等）、填报时间
				//工程名称、工程类别、险情分类、流域、水系、一级支流、二级支流
				String bt_s = request.getParameter("bt_s");
				String lb_s = request.getParameter("LB");
				String jcsj_s = request.getParameter("jcsj_s");
				String jcsj_e = request.getParameter("jcsj_e");
				iswhere = SqlFactory.makeSearchSQL(bt_s,"",lb_s,"",
						selectlysx1,selectlysx2,selectzl1,selectzl2,jcsj_s,
						jcsj_e,searchType);
				
				request.setAttribute("lb", lb_s);
				request.setAttribute("bt_s", bt_s);
				request.setAttribute("jcsj_s", jcsj_s);
				request.setAttribute("jcsj_e", jcsj_e);
				request.setAttribute("isWhere", iswhere);
				return new ModelAndView("sys/uploadManage");
			}
			if ("fxjb".trim().equals(searchType)) {// 防汛简报
				String jbbt_s = request.getParameter("bt_s");
				String tbsj_s = request.getParameter("tbsj_s");
				String tbsj_e = request.getParameter("tbsj_e");
				if (!"".trim().equals(jbbt_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " WTTT like '%" + jbbt_s + "%'";
					else
						iswhere += " and WTTT like '%" + jbbt_s + "%'";
				}
				if (!"".trim().equals(tbsj_s) && !"".trim().equals(tbsj_e)) {
					if ("".trim().equals(iswhere))
						iswhere += " WTDT >= #" + tbsj_s + " 00:00:00# and WTDT <=#"
								+ tbsj_e + " 23:59:59#";
					else
						iswhere += " and WTDT >= #" + tbsj_s
								+ " 00:00:00# and WTDT <=#" + tbsj_e + " 23:59:59#";
				}
				request.setAttribute("bt_s", jbbt_s);
				request.setAttribute("tbsj_s", tbsj_s);
				request.setAttribute("tbsj_e", tbsj_e);
				request.setAttribute("isWhere", iswhere);
				return new ModelAndView("report/fxjbManage");
			}
			if ("TB_FPACTI".trim().equals(searchType)// 防汛行动
					|| "TB_QT".trim().equals(searchType)// 旱情
					|| "TB_SD".trim().equals(searchType)) {// 灾
				String towhere = request.getParameter("towhere");
				String bt_s = request.getParameter("bt_s");
				String tbsj_s = request.getParameter("tbsj_s");
				String tbsj_e = request.getParameter("tbsj_e");
				if (!"".trim().equals(bt_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " WTTT like '%" + bt_s + "%'";
					else
						iswhere += " and WTTT like '%" + bt_s + "%'";
				}
				if (!"".trim().equals(tbsj_s) && !"".trim().equals(tbsj_e)) {
					if ("".trim().equals(iswhere))
						iswhere += " WTDT >= #" + tbsj_s + " 00:00:00# and WTDT <=#"
								+ tbsj_e + " 23:59:59#";
					else
						iswhere += " and WTDT >= #" + tbsj_s
								+ " 00:00:00# and WTDT <=#" + tbsj_e + " 23:59:59#";
				}
				
				request.setAttribute("bt_s", bt_s);
				request.setAttribute("tbsj_s", tbsj_s);
				request.setAttribute("tbsj_e", tbsj_e);
				request.setAttribute("isWhere", iswhere);
				return new ModelAndView("report/" + towhere + "Manage");
			}
			if ("upload".trim().equals(searchType)) {// 数据上传查询
				String bt_s = request.getParameter("bt_s");
				String tbsj_s = request.getParameter("tbsj_s");
				String tbsj_e = request.getParameter("tbsj_e");
				if (!"".trim().equals(bt_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " Title like '%" + bt_s + "%'";
					else
						iswhere += " and Title like '%" + bt_s + "%'";
				}
				if (!"".trim().equals(tbsj_s) && !"".trim().equals(tbsj_e)) {
					if ("".trim().equals(iswhere))
						iswhere += " WTDPDT >= #" + tbsj_s + " 00:00:00# and WTDPDT <=#"
								+ tbsj_e + " 23:59:59#";
					else
						iswhere += " and WTDPDT >= #" + tbsj_s
								+ " 00:00:00# and WTDPDT <=#" + tbsj_e + " 23:59:59#";
				}
				
				request.setAttribute("bt_s", bt_s);
				request.setAttribute("tbsj_s", tbsj_s);
				request.setAttribute("tbsj_e", tbsj_e);
				request.setAttribute("isWhere", iswhere);
				return new ModelAndView("sys/uploadManage");
			}

		}
		/**
		 * 翻页
		 */
		if ("topage".trim().equals(actionType)) {
			String towhere = request.getParameter("towhere");
			String iswhere = request.getParameter("iswhere");
			String page = request.getParameter("page");
			if ("prg".trim().equals(towhere)) {
				String gcmc_s = request.getParameter("gcmc_s");
				String gclb_s = request.getParameter("gclb_s");
				String dq_s = request.getParameter("dq_s");
				String ly_s = request.getParameter("ly_s");
				request.setAttribute("gcmc_s", gcmc_s);
				request.setAttribute("gclb_s", gclb_s);
				request.setAttribute("dq_s", dq_s);
				request.setAttribute("ly_s", ly_s);
				request.setAttribute("isWhere", iswhere);
				request.setAttribute("page", page);
				return new ModelAndView("project/" + towhere + "Manage");
			}
			if ("gqxq".trim().equals(towhere)) {
				String gcmc_s = request.getParameter("gcmc_s");
				String xqfldm_s = request.getParameter("xqfldm_s");
				String xqmc_s = request.getParameter("xqmc_s");
				request.setAttribute("gcmc_s", gcmc_s);
				request.setAttribute("xqmc_s", xqmc_s);
				request.setAttribute("xqfldm_s", xqfldm_s);
				request.setAttribute("isWhere", iswhere);
				request.setAttribute("page", page);
				return new ModelAndView("project/xq/" + towhere + "Manage");
			}
			if ("gqyx".trim().equals(towhere)) {
				String gcmc_s = request.getParameter("gcmc_s");
				String jcsj_s = request.getParameter("jcsj_s");
				String jcsj_e = request.getParameter("jcsj_e");
				request.setAttribute("gcmc_s", gcmc_s);
				request.setAttribute("jcsj_s", jcsj_s);
				request.setAttribute("jcsj_e", jcsj_e);
				request.setAttribute("isWhere", iswhere);
				request.setAttribute("page", page);
				return new ModelAndView("project/yx/" + towhere + "Manage");
			}
			if ("fxjb".trim().equals(towhere)
					|| "TB_FPACTI".trim().equals(towhere)// 防汛行动
					|| "TB_QT".trim().equals(towhere)// 旱情
					|| "TB_SD".trim().equals(towhere)) {
				String bt_s = request.getParameter("bt_s");
				String tbsj_s = request.getParameter("tbsj_s");
				String tbsj_e = request.getParameter("tbsj_e");
				request.setAttribute("bt_s", bt_s);
				request.setAttribute("tbsj_s", tbsj_s);
				request.setAttribute("tbsj_e", tbsj_e);
				request.setAttribute("isWhere", iswhere);
				request.setAttribute("page", page);
				return new ModelAndView("report/" + towhere + "Manage");
			}
			if("upload".trim().equals(towhere)){
				String bt_s = request.getParameter("bt_s");
				String tbsj_s = request.getParameter("tbsj_s");
				String tbsj_e = request.getParameter("tbsj_e");
				request.setAttribute("bt_s", bt_s);
				request.setAttribute("tbsj_s", tbsj_s);
				request.setAttribute("tbsj_e", tbsj_e);
				request.setAttribute("isWhere", iswhere);
				request.setAttribute("page", page);
				return new ModelAndView("sys/uploadManage");
			}
		}
		return null;
	}
}
