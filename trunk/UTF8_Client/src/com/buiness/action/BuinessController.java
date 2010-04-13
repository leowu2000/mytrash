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
			ConfigBean bean = _getConfigBeanFromRquest(request);
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
				BuinessDao.deleteDB("delete from TB_STDNC_M where DNCNO="
						+ groupArr[1], path);
				// 删除详情分类表数据
				BuinessDao.deleteDB("delete from " + tablename
						+ " where DNCNO=" + groupArr[1], path);
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
			String gcnm = request.getParameter("PJNM");
			String gclb = request.getParameter("gclb");
			String cntcd = request.getParameter("cntcd");
			String hldm = request.getParameter("hldm");
			String gcdm = gclb + hldm.substring(1, 7) + cntcd.substring(0, 1);
			String SQL = "INSERT INTO TB_PJ(PJNO,PJNMCD,PJNM,CNTCD,FPDUTY,FPDUTYPH)VALUES("
					+ UUIdFactory.getMaxId(path, "TB_PJ", "PJNO")
					+ ",'"
					+ gcdm
					+ "','" + gcnm + "','" + cntcd + "','','')";
			BuinessDao.insertDB(SQL, path);

			return new ModelAndView("project/prgManage");
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
					String SQL = "DELETE FROM " + tbs[i] + " WHERE "
							+ fileds[i] + " IN(" + IDs + ")";
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
			// 工程运行信息
			if ("1".trim().equals(SAVETYPES)) {
				PJRCNBean bean = _getPJRCNBeanFromRequest(request);

				String DNCNO = request.getParameter("DNCNO");
				bean.setPJRNO(String.valueOf(DNCNO));
				String sSQL = SqlFactory.insertSQL_PJRCNBean(bean, path,
						prjBean);
//				RSRBean rsrbean = _getRSRBeanFromRquest(request);
				PjrDetailBean pjdbean = _getPjrDetailBeanFormReqeust(request,bean.getGCFLDM());
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
				STDNCBean bean = _getSTDNCeanFromRequest(request);
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
				DetailBean dBean = _getDetailBeanFromRquest(request, bean
						.getXQFLDM());
				dBean.setSTTPCD(String.valueOf(id));
				subSQL = SqlFactory.insertSQL_DNCDetailBean(dBean, path, bean
						.getXQFLDM());
				List<SubTempBean> beanlist = BuinessDao.getMediaList(path,
						DNCNO, TABLENAME);
				BuinessDao.toInsertDbList(path, TABLENAME, mainSQL, subSQL,
						beanlist);
				BuinessDao.deleteTempMedia(path);
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
				STDNCBean bean = _getSTDNCeanFromRequest(request);
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
				}
				// 保存主表信息
				BuinessDao.deleteDB(
						"delete from TB_STDNC WHERE DNCNO=" + DNCNO, path);

				bean.setDNCNO(String.valueOf(DNCNO));
				mainSQL = SqlFactory.insertSQL_STDNCBean(bean, path);
				// 取子表名称
				String detailTablename = BuinessDao
						.getXqFlTabname(path, XQFLDM);
				BuinessDao.deleteDB("delete from " + detailTablename
						+ " WHERE DNCNO=" + DNCNO, path);
				// 获取并保存资表信息

				DetailBean dBean = _getDetailBeanFromRquest(request, XQFLDM);
				dBean.setSTTPCD(String.valueOf(id));
				subSQL = SqlFactory.insertSQL_DNCDetailBean(dBean, path, bean
						.getXQFLDM());
				List<SubTempBean> beanlist = BuinessDao.getMediaList(path,
						DNCNO, "TB_STDNC_M");
				BuinessDao.toInsertDbList(path, "TB_STDNC_M", mainSQL, subSQL,
						beanlist);
				BuinessDao.deleteTempMedia(path);
				return new ModelAndView("project/xq/gqxqManage");
			} else {
				//反回主表数据的运行状态码
				String GCFL = BuinessDao.idToNameChange(path, "TB_PJRCN", "GCFLDM", " PJRNO="+DNCNO);
				String detailTname="";
				if("B".trim().equals(GCFL))
					detailTname = "TB_RSR";
				if("K".trim().equals(GCFL))
					detailTname = "TB_WLR";
				if("N".trim().equals(GCFL))
					detailTname = "TB_COWAPJ";//=治河工程=N
				if("F".trim().equals(GCFL))
					detailTname = "TB_STOFLER";//=蓄滞=F
				if("D".trim().equals(GCFL)
						||"E".trim().equals(GCFL)
						||"H".trim().equals(GCFL)
						||"P".trim().equals(GCFL))
					detailTname = "TB_DKR";
				// 删除主表数据
				
				BuinessDao.deleteDB(
						"delete from TB_PJRCN WHERE PJRNO=" + DNCNO, path);
				// 更新主表
				PJRCNBean bean = _getPJRCNBeanFromRequest(request);
				PrjBean prjBean = BuinessDao.findBySql(
						"select * from TB_PJ where PJNO="
								+ request.getParameter("GCNAME"), path);
				bean.setPJRNO(DNCNO);
				String sSQL = SqlFactory.insertSQL_PJRCNBean(bean, path,
						prjBean);
				// 删除子表数据
				BuinessDao.deleteDB("delete from "+detailTname+" WHERE PJRNO=" + DNCNO,
						path);
				// 更新子表数据
//				RSRBean rsrbean = _getRSRBeanFromRquest(request);
//				rsrbean.setPJRNO(String.valueOf(DNCNO));
//				String sSQL2 = SqlFactory.insertSQL_RSRBean(rsrbean, path,
//						prjBean);
				PjrDetailBean pjdbean = _getPjrDetailBeanFormReqeust(request,bean.getGCFLDM());
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
			String filepath = request.getParameter("UpFile");
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
						String sql = "INSERT INTO TB_FXJB_M(ZLBM,RPJINCD,LXZP,TITLE) values(?,?,?,?)";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						File f = new File(filepath);
						FileInputStream fis = new FileInputStream(f);
						pstmt.setInt(1, UUIdFactory.getMaxId(path, "TB_FXJB_M",
								"ZLBM"));
						pstmt.setString(2, String.valueOf(RPJINCD));
						pstmt.setBinaryStream(3, fis, (int) f.length());
						pstmt.setString(4, f.getName());
						pstmt.executeUpdate();
						pstmt.close();
						conn.close();
					}
				}

			} else {
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
			}
			return new ModelAndView("report/fxjbManage");
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
			String CONTENT = request.getParameter("CONTENT");
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
			List<SubTempBean> beanlist = BuinessDao.getMediaList(path, DNCNO,
					TABLENAME + "_M");
			if ("edit".trim().equals(subAction))
				BuinessDao.toUpdateDbList(path, TABLENAME + "_M", newSQL, "",
						beanlist);// 更新
			else
				BuinessDao.toInsertDbList(path, TABLENAME + "_M", newSQL, "",
						beanlist);// 增加
			BuinessDao.deleteTempMedia(path);
			return new ModelAndView("report/" + TABLENAME + "Manage");
		}
		/**
		 * 通用查询
		 */
		if ("search".trim().equals(actionType)) {
			String searchType = request.getParameter("searchType");

			String iswhere = "";
			if ("prj".trim().equals(searchType)) {// 工程管理
				String gcmc_s = request.getParameter("gcmc_s");
				String gclb_s = request.getParameter("gclb_s");
				String dq_s = request.getParameter("dq_s");
				String ly_s = request.getParameter("ly_s");

				if (!"".trim().equals(gcmc_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " PJNM like '%" + gcmc_s + "%'";
					else
						iswhere += " and PJNM like '%" + gcmc_s + "%'";
				}
				if (!"".trim().equals(gclb_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " PJNMCD like '" + gclb_s + "%'";
					else
						iswhere += " and PJNMCD like '" + gclb_s + "%'";
				}
				if (!"".trim().equals(dq_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " MID(CNTCD,1,2) = '" + dq_s.substring(0, 2)
								+ "'";
					else
						iswhere += " and MID(CNTCD,1,2) '" + dq_s.substring(0, 2)
								+ "'";
				}
				if (!"".trim().equals(ly_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " MID(PJNMCD,2,1) = '" + ly_s.substring(1, 2)
								+ "'";
					else
						iswhere += " and MID(PJNMCD,2,1) = '" + ly_s.substring(1, 2)
								+ "'";
				}
				request.setAttribute("gcmc_s", gcmc_s);
				request.setAttribute("gclb_s", gclb_s);
				request.setAttribute("ly_s", ly_s);
				request.setAttribute("dq_s", dq_s);
				request.setAttribute("isWhere", iswhere);
				return new ModelAndView("project/prgManage");
			}
			if ("gcxq".trim().equals(searchType)) {// 工程险情
				String gcmc_s =request.getParameter("gcmc_s");
				String xqfldm_s = request.getParameter("xqfldm_s");
				String xqmc_s = request.getParameter("xqmc_s");
				if (!"".trim().equals(gcmc_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " PJNO = " + gcmc_s;
					else
						iswhere += " and PJNO =" + gcmc_s;
				}
				if (!"".trim().equals(xqfldm_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " XQFLDM = '" + xqfldm_s + "'";
					else
						iswhere += " and XQFLDM = '" + xqfldm_s + "'";
				}
				if (!"".trim().equals(xqmc_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " DNCNM like '%" + xqmc_s.substring(0, 2)
								+ "%'";
					else
						iswhere += " and DNCNM like '%"
								+ xqmc_s.substring(0, 2) + "%'";
				}
				request.setAttribute("gcmc_s", gcmc_s);
				request.setAttribute("xqmc_s", xqmc_s);
				request.setAttribute("xqfldm_s", xqfldm_s);
				request.setAttribute("isWhere", iswhere);
				return new ModelAndView("project/xq/gqxqManage");
			}
			if ("yxzt".trim().equals(searchType)) {// 运行状态
				String gcmc_s = request.getParameter("gcmc_s");
				String jcsj_s = request.getParameter("jcsj_s");
				String jcsj_e = request.getParameter("jcsj_e");
				if (!"".trim().equals(gcmc_s)) {
					if ("".trim().equals(iswhere))
						iswhere += " PJNO = " + gcmc_s;
					else
						iswhere += " and PJNO =" + gcmc_s;
				}
				if (!"".trim().equals(jcsj_s) && !"".trim().equals(jcsj_e)) {
					if ("".trim().equals(iswhere))
						iswhere += " DTCDT >= #" + jcsj_s
								+ " 00:00:00# and DTCDT <=#" + jcsj_e + " 23:59:59#";
					else
						iswhere += " and DTCDT >= #" + jcsj_s
								+ " 00:00:00# and DTCDT <=#" + jcsj_e + " 23:59:59#";
				}
				request.setAttribute("gcmc_s", gcmc_s);
				request.setAttribute("jcsj_s", jcsj_s);
				request.setAttribute("jcsj_e", jcsj_e);
				request.setAttribute("isWhere", iswhere);
				return new ModelAndView("project/yx/gqyxManage");
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

	/**
	 * 从页面获取工程运行信息 反回PJRCNBean
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public static PJRCNBean _getPJRCNBeanFromRequest(HttpServletRequest request)
			throws Exception {
		PJRCNBean bean = new PJRCNBean();
		String DNCFC = request.getParameter("XQYC");
		String RDERESCN = request.getParameter("DFJZZK");
		String WTDPCD = request.getParameter("WTDPCD");
		String NT = request.getParameter("QT");

		bean.setPJRNO(request.getParameter("PJRNO") == null ? "" : request
				.getParameter("PJRNO"));// 运行编号
		bean.setPJNO(request.getParameter("GCNAME") == null ? "" : request
				.getParameter("GCNAME"));// 工程编号
		bean.setDTCDT(request.getParameter("DTCDT") == null ? "" : request
				.getParameter("DTCDT"));// 检测时间
		bean.setPJNM(request.getParameter("GCNAME") == null ? "" : request
				.getParameter("GCNAME"));// 工程名称
		bean.setGCFLDM(request.getParameter("GCFLDM") == null ? "" : request
				.getParameter("GCFLDM"));// 工程分类代码
		bean.setDNCFC(DNCFC == null ? "" : DNCFC);// 险情预测
		bean.setRDERESCN(RDERESCN == null ? "" : RDERESCN);// 抢险资源配备
		bean.setWTDPCD(WTDPCD == null ? "" : WTDPCD);// 填报单位名称
		bean.setWTDPDT(request.getParameter("WTDPDT") == null ? "" : request
				.getParameter("WTDPDT"));// 填报时间
		bean.setNT(NT == null ? "" : NT);// 其它
		return bean;
	}

	/**
	 * 从页面获取工程险情信息
	 * 
	 */
	public static STDNCBean _getSTDNCeanFromRequest(HttpServletRequest request)
			throws Exception {
		STDNCBean bean = new STDNCBean();
		String DNCNM = request.getParameter("DNCNM");// 险情名称
		String RDEPL = request.getParameter("QXFA");// 抢险方案
		String RDERESCN = request.getParameter("QXZYPB");// 抢险资源配备
		String RDECNRL = request.getParameter("JZJJG");// 进展及结果
		String DNCCUAN = request.getParameter("XQYYFX");// 险情原因分析
		String DNCESTDV = request.getParameter("XQFZQS");// 险情发展趋势
		String DNCPBNFZ = request.getParameter("KNYXFW");// 可能影响范围
		String WTHCN = request.getParameter("QXSQX");// 抢险时气象情况
		String FHYWTHCN = request.getParameter("WLSWQX");// 未来水文气象情况
		String DNCADDSC = request.getParameter("BCMS");// 补充描述
		String WTDPCD = request.getParameter("WTDPCD");// 填报单位名称
		String DNCGR = request.getParameter("DNCGR");// 险情级别
		String DAGPLCCH = request.getParameter("DAGPLCCH");// 出险地点桩号
		String DAGLO = request.getParameter("DAGLO");// 出险部位
		String STTPCD = request.getParameter("STTPCD");
		bean.setDNCNM(DNCNM == null ? "" : DNCNM);// 险情名称
		bean.setDNCGR(DNCGR == null ? "" : DNCGR);// 险情级别
		bean.setRDEPL(RDEPL == null ? "" : RDEPL);// 抢险方案
		bean.setRDERESCN(RDERESCN == null ? "" : RDERESCN);// 抢险资源配备
		bean.setRDECNRL(RDECNRL == null ? "" : RDECNRL);// 进展及结果
		bean.setDNCCUAN(DNCCUAN == null ? "" : DNCCUAN);// 险情原因分析
		bean.setDNCESTDV(DNCESTDV == null ? "" : DNCESTDV);// 险情发展趋势
		bean.setDNCPBNFZ(DNCPBNFZ == null ? "" : DNCPBNFZ);// 可能影响范围
		bean.setWTHCN(WTHCN == null ? "" : WTHCN);// 抢险时气象情况
		bean.setFHYWTHCN(FHYWTHCN == null ? "" : FHYWTHCN);// 未来水文气象情况
		bean.setDNCADDSC(DNCADDSC == null ? "" : DNCADDSC);// 补充描述
		bean.setWTDPCD(WTDPCD == null ? "" : WTDPCD);// 填报单位名称
		bean.setDAGPLCCH(DAGPLCCH == null ? "" : DAGPLCCH);// 出险地点桩号
		bean.setDAGLO(DAGLO == null ? "" : DAGLO);// 出险部位

		bean.setDNCNO(request.getParameter("DNCNO") == null ? "" : request
				.getParameter("DNCNO"));// 险情编号
		bean.setPJNO(request.getParameter("GCNAME") == null ? "" : request
				.getParameter("GCNAME"));// 工程编号
		bean.setSTTPCD(STTPCD == null ? "" : STTPCD);// 建筑物编码
		bean.setDAGTM(request.getParameter("DAGTM") == null ? "" : request
				.getParameter("DAGTM"));// 出险时间
		bean.setXQFLDM(request.getParameter("XQFLDM") == null ? "" : request
				.getParameter("XQFLDM"));// 险情分类代码
		bean.setTPN(request.getParameter("TPN") == "" ? "0" : request
				.getParameter("TPN"));// 群众投入(人)
		bean.setPLAPN(request.getParameter("PLAPN") == "" ? "0" : request
				.getParameter("PLAPN"));// 解放军投入(人)
		bean.setPLIPN(request.getParameter("PLIPN") == "" ? "0" : request
				.getParameter("PLIPN"));// 武警投入(人)
		bean.setRZ(request.getParameter("RZ") == "" ? "0" : request
				.getParameter("RZ"));// 当前运行水位(米)
		bean.setWTDPDT(request.getParameter("WTDPDT") == null ? "" : request
				.getParameter("WTDPDT"));// 填报时间
		return bean;
	}

	/**
	 * 获取工程运行从表信息
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public static RSRBean _getRSRBeanFromRquest(HttpServletRequest request)
			throws Exception {
		RSRBean bean = new RSRBean();
		String BJWHZK = request.getParameter("BJWHZK");// 坝基完好状况
		String BTWDZK = request.getParameter("BTWDZK");// 坝体稳定情况
		String HPHAWDQK = request.getParameter("HPHAWDQK");// 护坡护岸稳定情况
		String XSJZWZK = request.getParameter("XSJZWZK");// 泄水建筑物完好状况
		String XNGWHZK = request.getParameter("XNGWHZK");// 消能工完好状况
		String ZMQBJZK = request.getParameter("ZMQBJZK");// 闸门、启闭机完好状况
		String TXSDJZK = request.getParameter("TXSDJZK");// 通讯手段及状况

		bean.setPJRNO(request.getParameter("PJRNO") == null ? "" : request
				.getParameter("PJRNO"));// 运行编号
		bean.setPJNO(request.getParameter("PJNO") == null ? "" : request
				.getParameter("PJNO"));// 工程编号
		bean.setDTCDT(request.getParameter("DTCDT") == null ? "" : request
				.getParameter("DTCDT"));// 检测时间
		bean.setPJNM(request.getParameter("PJNM") == null ? "" : request
				.getParameter("PJNM"));// 工程名称
		bean.setRSCLS(request.getParameter("RSCLS") == null ? "" : request
				.getParameter("RSCLS"));// 水库类别(良好/尚好/病险库)
		bean.setRV(request.getParameter("RV") == "" ? "0" : request
				.getParameter("RV"));// 当前库容(万立方米)
		bean.setRZ(request.getParameter("RZ") == "" ? "0" : request
				.getParameter("RZ"));// 当前运行水位(米)
		bean.setRQ(request.getParameter("RQ") == "" ? "0" : request
				.getParameter("RQ"));// 当前泻量(立方米/秒)
		bean.setDFPFCN(BJWHZK == null ? "" : BJWHZK);// 坝基完好状况
		bean.setDBSTBCN(BTWDZK == null ? "" : BTWDZK);// 坝体稳定情况
		bean.setBRBPPFCN(HPHAWDQK == null ? "" : HPHAWDQK);// 护坡护岸稳定情况
		bean.setESPFCN(XSJZWZK == null ? "" : XSJZWZK);// 泄水建筑物完好状况
		bean.setEDDPFCN(XNGWHZK == null ? "" : XNGWHZK);// 消能工完好状况
		bean.setGTHOPFCN(ZMQBJZK == null ? "" : ZMQBJZK);// 闸门、启闭机完好状况
		bean.setCOMMCN(TXSDJZK == null ? "" : TXSDJZK);// 通讯手段及状况
		return bean;
	}

	/**
	 * 获取工程险情险情分类代码表信息
	 * 
	 * @param request
	 * @param XQFL险情分类代码
	 * @return DetailBean
	 * @throws Exception
	 */
	public static DetailBean _getDetailBeanFromRquest(
			HttpServletRequest request, String XQFL) throws Exception {

		DetailBean bean = new DetailBean();
		bean.setDNCNO(request.getParameter("DNCNO")); // 险情编号
		bean.setPJNO(request.getParameter("GCNAME")); // 工程编号
		String STTPCD = request.getParameter("STTPCD");

		bean.setSTTPCD(STTPCD); // 建筑物编码

		bean.setDAGTM(request.getParameter("DAGTM")); // 出险时间
		bean.setDNCNM(request.getParameter("DNCNM")); // 险情名称
		if ("D004".trim().equals(XQFL) || "D003".trim().equals(XQFL)) {
			String LKGTU = request.getParameter("LKGTU");
			bean.setLKGTU(LKGTU == null ? "" : LKGTU); // 漏水混清 ==D004==D003
		}
		if ("D006".trim().equals(XQFL) || "D012".trim().equals(XQFL)) {
			bean.setSLUPAG(request.getParameter("SLUPAG") == "" ? "0" : request
					.getParameter("SLUPAG")); // 滑坡面角度(度) ==D006==D012
		}
		if ("D007".trim().equals(XQFL) || "D009".trim().equals(XQFL)
				|| "D004".trim().equals(XQFL)|| "D003".trim().equals(XQFL)) {
			bean.setTODFTDI(request.getParameter("TODFTDI") == "" ? "0"
					: request.getParameter("TODFTDI")); // 距堤脚距离(米)
														// ==D007==D009==D003==D004
		}
		if ("D009".trim().equals(XQFL) || "D011".trim().equals(XQFL)) {
			bean.setWDQ(request.getParameter("WDQ") == "" ? "0" : request
					.getParameter("WDQ"));// 河道流量(立方米/秒) ==D011==D009
		}
		if ("D001".trim().equals(XQFL) || "D015".trim().equals(XQFL)) {
			bean.setDSSPN(request.getParameter("DSSPN") == "" ? "0" : request
					.getParameter("DSSPN")); // 受灾人口(人) ==D001==D015
			bean.setINPN(request.getParameter("INPN") == "" ? "0" : request
					.getParameter("INPN")); // 受伤人口(人) ==D001==D015
			bean.setDTHPN(request.getParameter("DTHPN") == "" ? "0" : request
					.getParameter("DTHPN")); // 死亡人口(人) ==D001==D015
			bean.setWRHS(request.getParameter("WRHS") == "" ? "0" : request
					.getParameter("WRHS")); // 倒塌房屋(间) ==D001==D015
			bean.setCRPDSSAR(request.getParameter("CRPDSSAR") == "" ? "0"
					: request.getParameter("CRPDSSAR")); // 农作物受灾面积(公顷)
															// ==D001==D015
			bean.setSCDMFMAR(request.getParameter("SCDMFMAR") == "" ? "0"
					: request.getParameter("SCDMFMAR")); // 毁坏耕地面积(公顷)
															// ==D001==D015
			bean.setDRCECLS(request.getParameter("DRCECLS") == "" ? "0"
					: request.getParameter("DRCECLS")); // 直接经济损失(万元)
														// ==D001==D015
		}
		if ("D023".trim().equals(XQFL) || "D024".trim().equals(XQFL)) {
			bean.setWRAR(request.getParameter("WRAR") == "" ? "0" : request
					.getParameter("WRAR")); // 破坏面积(平方米) ==D023==D024
		}
		if ("D001".trim().equals(XQFL)) {
			// D001 决口 TB_BURDSC
			bean.setBUW(request.getParameter("BUW") == "" ? "0" : request
					.getParameter("BUW")); // 决口宽度(米)
			bean.setBUVL(request.getParameter("BUVL") == "" ? "0" : request
					.getParameter("BUVL")); // 决口流速(米/秒)
			bean.setBUZDF(request.getParameter("BUZDF") == "" ? "0" : request
					.getParameter("BUZDF")); // 决口水头差(米)
			bean.setBUQ(request.getParameter("BUQ") == "" ? "0" : request
					.getParameter("BUQ")); // 决口流量(立方米/秒)
			String BURLDGL = request.getParameter("BURLDGL");
			bean.setBURLDGL(BURLDGL == null ? "" : BURLDGL); // 决口处地形地质条件
		}
		if ("D002".trim().equals(XQFL)) {
			// D002 漫溢 TB_OVFLDSC
			bean.setOVFLL(request.getParameter("OVFLL") == "" ? "0" : request
					.getParameter("OVFLL")); // 漫溢长度(米)
			bean.setOVFLZ(request.getParameter("OVFLZ") == "" ? "0" : request
					.getParameter("OVFLZ")); // 漫溢水位(米)
			bean.setDSQ(request.getParameter("DSQ") == "" ? "0" : request
					.getParameter("DSQ")); // 漫溢流量(立方米/秒)
		}
		if ("D003".trim().equals(XQFL)) {
			// D003 漏洞 TB_LKDSC
			bean.setLKDMT(request.getParameter("LKDMT") == "" ? "0" : request
					.getParameter("LKDMT")); // 漏洞直径(米)
			bean.setLKQ(request.getParameter("LKQ") == "" ? "0" : request
					.getParameter("LKQ")); // 漏洞流量(升/秒)
			bean.setLKWTLH(request.getParameter("LKWTLH") == "" ? "0" : request
					.getParameter("LKWTLH")); // 漏洞水柱高(米)
			bean.setLKSAR(request.getParameter("LKSAR") == "" ? "0" : request
					.getParameter("LKSAR")); // 已形成漏洞群面积(平方米)
		}
		if ("D004".trim().equals(XQFL)) {
			// D004 管涌 TB_PPDSC
			bean.setPPQ(request.getParameter("PPQ") == "" ? "0" : request
					.getParameter("PPQ")); // 管涌流量(升/秒)
			bean.setWTLH(request.getParameter("WTLH") == "" ? "0" : request
					.getParameter("WTLH")); // 水柱高(米)
			bean.setPPSAR(request.getParameter("PPSAR") == "" ? "0" : request
					.getParameter("PPSAR")); // 已形成管涌群面积(平方米)
		}
		if ("D005".trim().equals(XQFL)) {
			// D005 陷坑 TB_PITDSC
			bean.setSBDSP(request.getParameter("SBDSP") == "" ? "0" : request
					.getParameter("SBDSP")); // 陷坑深度(米)
			bean.setSBAR(request.getParameter("SBAR") == "" ? "0" : request
					.getParameter("SBAR")); // 陷坑面积(平方米)
		}
		if ("D006".trim().equals(XQFL)) {
			// D006 滑坡 TB_SLDSC
			bean.setSLBU(request.getParameter("SLBU") == "" ? "0" : request
					.getParameter("SLBU")); // 滑坡体积(立方米)
		}
		if ("D007".trim().equals(XQFL)) {
			// D007 淘刷 TB_UNDSC
			bean.setUNDAR(request.getParameter("UNDAR") == "" ? "0" : request
					.getParameter("UNDAR")); // 淘刷面积(平方米)
			bean.setUNDD(request.getParameter("UNDD") == "" ? "0" : request
					.getParameter("UNDD")); // 淘刷深度(米)
			bean.setUNDL(request.getParameter("UNDL") == "" ? "0" : request
					.getParameter("UNDL")); // 淘刷长度(米)
		}
		if ("D008".trim().equals(XQFL)) {
			// D008 裂缝 TB_CRDSC
			String CRDR = request.getParameter("CRDR");
			bean.setCRDR(CRDR == null ? "" : CRDR); // 裂缝方向
			bean.setCRD(request.getParameter("CRD") == "" ? "0" : request
					.getParameter("CRD")); // 裂缝深度(米)
			bean.setCRL(request.getParameter("CRL") == "" ? "0" : request
					.getParameter("CRL")); // 裂缝长度(米)
			bean.setCRW(request.getParameter("CRW") == "" ? "0" : request
					.getParameter("CRW")); // 裂缝宽度(厘米)
		}
		if ("D009".trim().equals(XQFL)) {
			// D009 崩岸 TB_CVDSC
			bean.setCVL(request.getParameter("CVL") == "" ? "0" : request
					.getParameter("CVL")); // 崩塌长度(米)
			bean.setCVBU(request.getParameter("CVBU") == "" ? "0" : request
					.getParameter("CVBU")); // 崩塌体积(立方米)
			bean.setRVH(request.getParameter("RVH") == "" ? "0" : request
					.getParameter("RVH")); // 河岸高度(米)
			String FLCNDSC = request.getParameter("FLCNDSC");
			bean.setFLCNDSC(FLCNDSC == null ? "" : FLCNDSC); // 水流情况描述
		}
		if ("D010".trim().equals(XQFL)) {
			// D010 渗水 TB_SPDSC
			bean.setSPAR(request.getParameter("SPAR") == "" ? "0" : request
					.getParameter("SPAR")); // 渗水面积(平方米)
			bean.setSPQ(request.getParameter("SPQ") == "" ? "0" : request
					.getParameter("SPQ")); // 渗透流量
		}
		if ("D011".trim().equals(XQFL)) {
			// D011 浪坎 TB_BLBAD
			bean.setBLH(request.getParameter("BLH") == "" ? "0" : request
					.getParameter("BLH")); // 浪高(米)
			bean.setWNS(request.getParameter("WNS") == "" ? "0" : request
					.getParameter("WNS")); // 风速(级)
		}
		if ("D012".trim().equals(XQFL)) {
			// D012 滑动 TB_SLUDSC
			bean.setSLUDSP(request.getParameter("SLUDSP") == "" ? "0" : request
					.getParameter("SLUDSP")); // 滑动位移(米)
			String SLUTP = request.getParameter("SLUTP");
			bean.setSLUTP(SLUTP); // 滑动类型
			String SLUGLCN = request.getParameter("SLUGLCN");
			bean.setSLUGLCN(SLUGLCN == null ? "" : SLUGLCN); // 滑动面地质情况
		}
		if ("D013".trim().equals(XQFL)) {
			// D013 启闭失灵 TB_HOMLFDSC
			String POWCUT = request.getParameter("POWCUT");
			String HOMLF = request.getParameter("HOMLF");
			String GSDST = request.getParameter("GSDST");
			String MLFCN = request.getParameter("MLFCN");
			bean.setPOWCUT(POWCUT == null ? "" : POWCUT); // 停电
			bean.setHOMLF(HOMLF == null ? "" : HOMLF); // 启闭机失灵
			bean.setGSDST(GSDST == null ? "" : GSDST); // 闸门井变形
			bean.setMLFCN(MLFCN == null ? "" : MLFCN); // 失灵时开启状况
		}
		if ("D014".trim().equals(XQFL)) {
			// D014 闸门破坏 TB_GTWRDSC
			String WRDSC = request.getParameter("WRDSC");
			bean.setWRDSC(WRDSC == null ? "" : WRDSC); // 破坏形式
			bean.setWRQ(request.getParameter("WRQ") == "" ? "0" : request
					.getParameter("WRQ")); // 失事时流量(立方米/秒)
		}
		if ("D015".trim().equals(XQFL)) {
			// D015 溃坝 TB_BRDMDSC
			String PJPS = request.getParameter("PJPS");
			String BRDMLDGL = request.getParameter("BRDMLDGL");
			bean.setBRDMW(request.getParameter("BRDMW")); // 溃坝宽度(米)
			bean.setPJPS(PJPS == null ? "" : PJPS); // 工程现状
			bean.setBRZDMCDI(request.getParameter("BRZDMCDI") == "" ? "0"
					: request.getParameter("BRZDMCDI")); // 库水位距堤顶距离(米)
			bean.setBRV(request.getParameter("BRV") == "" ? "0" : request
					.getParameter("BRV")); // 溃坝时库容(万立方米)
			bean.setBRDMQ(request.getParameter("BRDMQ") == "" ? "0" : request
					.getParameter("BRDMQ")); // 溃坝流量(立方米/秒)
			bean.setBRDMLDGL(BRDMLDGL == null ? "" : BRDMLDGL); // 溃坝处地形、地质条件
		}
		if ("D016".trim().equals(XQFL)) {
			// D016 倾覆 TB_OVTUDSC
			String OVTUDR = request.getParameter("OVTUDR");
			bean.setOVTUDR(OVTUDR == null ? "" : OVTUDR); // 倾覆方向
			bean.setOVTUAG(request.getParameter("OVTUAG") == "" ? "0" : request
					.getParameter("OVTUAG")); // 倾覆角度(度)
		}
		if ("D017".trim().equals(XQFL)) {
			// D017 应力过大 TB_STREXDSC
			String CONGR = request.getParameter("CONGR");
			bean.setMXTNST(request.getParameter("MXTNST") == "" ? "0" : request
					.getParameter("MXTNST")); // 最大拉应力(牛/平方毫米)
			bean.setMXCMST(request.getParameter("MXCMST") == "" ? "0" : request
					.getParameter("MXCMST")); // 最大压应力(牛/平方毫米)
			bean.setCONGR(CONGR == null ? "" : CONGR); // 混凝土标号
			bean.setASTR(request.getParameter("ASTR") == "" ? "0" : request
					.getParameter("ASTR")); // 允许应力值(牛/平方毫米)
		}
		if ("D018".trim().equals(XQFL)) {
			// D018 坍塌 TB_SLIDSC
			bean.setSLIAR(request.getParameter("SLIAR") == "" ? "0" : request
					.getParameter("SLIAR")); // 坍塌面积(平方米)
			bean.setSLIMS(request.getParameter("SLIMS") == "" ? "0" : request
					.getParameter("SLIMS")); // 坍塌方量(立方米)
		}
		if ("D019".trim().equals(XQFL)) {
			// D019 堵塞 TB_PLUDSC
			String PLTNM = request.getParameter("PLTNM");
			String PLTBU = request.getParameter("PLTBU");
			bean.setPLTNM(PLTNM == null ? "" : PLTNM); // 堵塞物名称
			bean.setPLTBU(PLTBU == "" ? "0" : PLTBU); // 堵塞物体积(立方米)
		}
		if ("D020".trim().equals(XQFL)) {
			// D020 基础破坏 TB_BSWRDSC
			String GRNSPDSC = request.getParameter("GRNSPDSC");
			String GROVCHWR = request.getParameter("GROVCHWR");
			bean.setGRNSPDSC(GRNSPDSC == null ? "" : GRNSPDSC); // 基础渗漏描述
			bean.setGRNUSB(request.getParameter("GRNUSB") == "" ? "0" : request
					.getParameter("GRNUSB")); // 据传不均匀沉降(米)
			bean.setGROVCHWR(GROVCHWR == null ? "" : GROVCHWR); // 基础超载破坏
		}
		if ("D021".trim().equals(XQFL)) {
			// D021 消能工破坏 TB_EDDWRDSC
			String APWR = request.getParameter("APWR");
			String WSTWR = request.getParameter("WSTWR");
			bean.setAPWR(APWR == null ? "" : APWR); // 底板掀起
			bean.setWSTWR(WSTWR == null ? "" : WSTWR); // 止水破坏
		}
		if ("D022".trim().equals(XQFL)) {
			// D022 基础排水失效 TB_BSWPLPDS
			String WPPLU = request.getParameter("WPPLU");
			String WPEQML = request.getParameter("WPEQML");
			bean.setWPPLU(WPPLU == null ? "" : WPPLU); // 排水孔堵塞
			bean.setWPEQML(WPEQML == null ? "" : WPEQML); // 排水设备失灵
		}
		if ("D023".trim().equals(XQFL)) {
			// D023 洞身破坏 TB_HBWRDSC
			String LNINF = request.getParameter("LNINF");
			String HBGLCN = request.getParameter("HBGLCN");
			bean.setWRMS(request.getParameter("WRMS") == "" ? "0" : request
					.getParameter("WRMS"));// 破坏方量(立方米)
			bean.setLNINF(LNINF == null ? "" : LNINF);// 对衬砌造成的影响
			bean.setHBGLCN(HBGLCN == null ? "" : HBGLCN);// 洞身地质情况
		}
		if ("D024".trim().equals(XQFL)) {
			// D024 控导工程局部破坏 TB_CLPJPRWR
			String WRGLCN = request.getParameter("WRGLCN");
			bean.setWRD(request.getParameter("WRD") == "" ? "0" : request
					.getParameter("WRD")); // 破坏深度(米)
			bean.setWRL(request.getParameter("WRL") == "" ? "0" : request
					.getParameter("WRL")); // 破坏长度(米)
			bean.setWRGLCN(WRGLCN == null ? "" : WRGLCN); // 破坏处地质情况
		}
		if ("D025".trim().equals(XQFL)) {
			// D025 控导工程冲毁 TB_CLPJSCDN
			String SCDMGLCN = request.getParameter("SCDMGLCN");
			bean.setSCDMBU(request.getParameter("SCDMBU") == "" ? "0" : request
					.getParameter("SCDMBU")); // 冲毁体积(立方米)
			bean.setSCDML(request.getParameter("SCDML") == "" ? "0" : request
					.getParameter("SCDML")); // 冲毁长度(米)
			bean.setSCDMD(request.getParameter("SCDMD") == "" ? "0" : request
					.getParameter("SCDMD")); // 冲毁深度(米)
			bean.setSCDMGLCN(SCDMGLCN == null ? "" : SCDMGLCN); // 冲毁处地质情况
		}
		if("D026".trim().equals(XQFL)){
			String DSSTP = request.getParameter("DSSTP");
			bean.setDSSPN(request.getParameter("DSSPN")==""?"0":request.getParameter("DSSPN"));
			bean.setDSSAREA(request.getParameter("DSSAREA")==""?"0":request.getParameter("DSSAREA"));
			bean.setDTHPN(request.getParameter("DTHPN")==""?"0":request.getParameter("DTHPN"));
			bean.setWRHS(request.getParameter("WRHS")==""?"0":request.getParameter("WRHS"));
			bean.setDRCECLS(request.getParameter("DRCECLS")==""?"0":request.getParameter("DRCECLS"));
			bean.setDAYDP(request.getParameter("DAYDP")==""?"0":request.getParameter("DAYDP"));
			bean.setTDP(request.getParameter("TDP")==""?"0":request.getParameter("TDP"));
			bean.setDSSTP(DSSTP == null ? "" : DSSTP);
		}
		return bean;
	}

	public static PjrDetailBean _getPjrDetailBeanFormReqeust(
			HttpServletRequest request, String GCFL) throws Exception {
		PjrDetailBean bean = new PjrDetailBean();
//		String PJNM = new String(request.getParameter("PJNM")
//				.getBytes("ISO-8859-1"), "GBK");
		bean.setPJNO(request.getParameter("DNCNO"));		//运行编号
		bean.setPJNO(request.getParameter("GCNAME"));			//工程编号
		bean.setDTCDT(request.getParameter("DTCDT"));		//检测时间
//		bean.setPJNM(PJNM);			//工程名称
		if("B".trim().equals(GCFL)
				||"D".trim().equals(GCFL)
				||"E".trim().equals(GCFL)
				||"H".trim().equals(GCFL)
				||"P".trim().equals(GCFL)){
			String BRBPPFCN = request.getParameter("BRBPPFCN");
			String RZ = request.getParameter("RZ");
			String RQ = request.getParameter("RQ");
			RZ=RZ==""?"0":RZ;RQ=RQ==""?"0":RQ;
			bean.setRZ(RZ);	//z当前运行水位(米)========TB_RSR===TB_DKR
			bean.setRQ(RQ);	//当前泻量(立方米/秒)========TB_RSR===TB_DKR
			bean.setBRBPPFCN(BRBPPFCN);	//护坡护岸稳定情况========TB_RSR===TB_DKR
		}
		if("B".trim().equals(GCFL)||"K".trim().equals(GCFL)){
			String EDDPFCN = request.getParameter("EDDPFCN");
			String GTHOPFCN = request.getParameter("GTHOPFCN");
			String COMMCN = request.getParameter("COMMCN");
			bean.setEDDPFCN(EDDPFCN);	//消能工完好状况==========TB_RSR===TB_WLR
			bean.setGTHOPFCN(GTHOPFCN);	//闸门、启闭机完好状况====TB_RSR===TB_WLR
			bean.setCOMMCN(COMMCN);	//通讯手段及状况==========TB_RSR===TB_WLR
		}
		if("N".trim().equals(GCFL)
				||"F".trim().equals(GCFL)
				||"D".trim().equals(GCFL)
				||"E".trim().equals(GCFL)
				||"H".trim().equals(GCFL)
				||"P".trim().equals(GCFL)){
			bean.setBKOT(request.getParameter("BKOT"));	//所在岸别(左/右)======TB_DKR====TB_COWAPJ===TB_STOFLER
		}
		if("B".trim().equals(GCFL)){
			//TB_RSR=水库=B
			String DFPFCN = request.getParameter("DFPFCN");
			String DBSTBCN = request.getParameter("DBSTBCN");
			String ESPFCN = request.getParameter("ESPFCN");
			bean.setRSCLS(request.getParameter("RSCLS"));	//水库类别(良好/尚好/病险库)
			bean.setRV(request.getParameter("RV")==""?"0":request.getParameter("RV"));			//当前库容(万立方米)
			bean.setDFPFCN(DFPFCN);							//坝基完好状况
			bean.setDBSTBCN(DBSTBCN);						//坝体稳定情况
			bean.setESPFCN(ESPFCN);							//泄水建筑物完好状况
			
		}
		if("K".trim().equals(GCFL)){
			//TB_WLR=水闸=K
			String GFPFCN = request.getParameter("GFPFCN");
			String STPFCN = request.getParameter("STPFCN");
			String RUPGZ = request.getParameter("RUPGZ");
			String RDWGZ = request.getParameter("RDWGZ");
			String RQO = request.getParameter("RQO");
			String RWSTOWLT = request.getParameter("RWSTOWLT");
			RUPGZ=RUPGZ==""?"0":RUPGZ;RDWGZ=RDWGZ==""?"0":RDWGZ;
			RQO=RQO==""?"0":RQO;RWSTOWLT=RWSTOWLT==""?"0":RWSTOWLT;
			bean.setWLGR(request.getParameter("WLGR")); //水闸等别(一/二/三/四/五)
			bean.setRUPGZ(RUPGZ);	//当前闸上水位(米)
			bean.setRDWGZ(RDWGZ);	//当前闸下水位(米)
			bean.setRQO(RQO);	//当前过闸流量(立方米/秒)
			bean.setRWSTOWLT(RWSTOWLT);	//当前水面距闸顶距离(米)
			bean.setGFPFCN(GFPFCN);								//坝基完好状况
			bean.setSTPFCN(STPFCN);								//建筑物完好状况
		}
		if("N".trim().equals(GCFL)){
			//TB_COWAPJ=治河工程=N
			String FLCNDSC = request.getParameter("FLCNDSC");
			String WDCNDSC = request.getParameter("WDCNDSC");
			String PRCCLR = request.getParameter("PRCCLR");
			String SPURDSC = request.getParameter("SPURDSC");
			String BPPJCN = request.getParameter("BPPJCN");
			bean.setFLCNDSC(FLCNDSC);								//水流情况描述
			bean.setWDCNDSC(WDCNDSC);								//河道情况描述
			bean.setPRCCLR(PRCCLR);								//清障的落实
			bean.setSPURDSC(SPURDSC);								//控导工程描述
			bean.setBPPJCN(BPPJCN);								//护岸工程情况
		}
		if("F".trim().equals(GCFL)){
			//TB_STOFLER=蓄滞=F
			String TRFCN = request.getParameter("TRFCN");
			String DKCN = request.getParameter("DKCN");
			String CWFCCN = request.getParameter("CWFCCN");
			String SFSRCN = request.getParameter("SFSRCN");
			String FLFADSC = request.getParameter("FLFADSC");
			String IDSTCN = request.getParameter("IDSTCN");
			String DSFLW = request.getParameter("DSFLW");
			String DSFLWZ = request.getParameter("DSFLWZ");
			DSFLW=DSFLW==""?"0":DSFLW;
			DSFLWZ=DSFLWZ==""?"0":DSFLWZ;
			bean.setDSFLWZ(DSFLWZ);			//设计行(蓄)洪水位(米)
			bean.setDSFLW(DSFLW);			//设计行(蓄)洪量(万立方米)
			bean.setTRFCN(TRFCN);				//交通状况
			bean.setDKCN(DKCN);					//圩堤状况
			bean.setCWFCCN(CWFCCN);				//通讯预警设施状况
			bean.setSFSRCN(SFSRCN);				//避水救生设施状况
			bean.setFLFADSC(FLFADSC);			//分洪设施状况
			bean.setIDSTCN(IDSTCN);				//排水站状况
		}
		if("D".trim().equals(GCFL)
				||"E".trim().equals(GCFL)
				||"H".trim().equals(GCFL)
				||"P".trim().equals(GCFL)){
			//TB_DKR=堤防==海堤==圩垸==穿堤
			String STECH = request.getParameter("STECH");
			String WSTODC = request.getParameter("WSTODC");
			String DKPFCN = request.getParameter("DKPFCN");
			String TSCN = request.getParameter("TSCN");
			String RV = request.getParameter("RV");
			RV=RV==""?"0":RV;WSTODC=WSTODC==""?"0":WSTODC;
			bean.setRV(RV);			//当前库容(万立方米)
			bean.setDKGR(request.getParameter("DKGR"));			//堤防级别(1/2/3/4/5)
			bean.setSTECH(STECH);								//起止桩号
			bean.setWSTODC(WSTODC);								//水面距堤顶距离(米)
			bean.setDKPFCN(DKPFCN);								//堤防完好状况
			bean.setTSCN(TSCN);									//穿堤建筑物状况
		}
		return bean;
	}
	
	/**
	 * 系统参数配置
	 * 
	 * @param request
	 * @return ConfigBean
	 * @throws Exception
	 */
	public static ConfigBean _getConfigBeanFromRquest(HttpServletRequest request)
			throws Exception {
		ConfigBean bean = new ConfigBean();
		String CLIENT_TYPE = request.getParameter("CLIENT_TYPE");
		CLIENT_TYPE = CLIENT_TYPE == null ? "" : CLIENT_TYPE;
		String XZQH_S = request.getParameter("selectz");
		XZQH_S = XZQH_S == null ? "" :XZQH_S;
		String XZQH_SI = request.getParameter("selects");
		XZQH_SI = XZQH_SI == null ? "" : XZQH_SI;
		String XZQH_X = request.getParameter("selectx");
		XZQH_X = XZQH_X == null ? "" : XZQH_X;
		String LYSX_LY = request.getParameter("selectlysx1");
		LYSX_LY = LYSX_LY == null ? "" : LYSX_LY;
		String LYSX_SX = request.getParameter("selectlysx2");
		LYSX_SX = LYSX_SX == null ? "" : LYSX_SX;
		String LYSX_YJZL = request.getParameter("selectzl1");
		LYSX_YJZL = LYSX_YJZL == null ? "" : LYSX_YJZL;
		String LYSX_EJZL = request.getParameter("selectzl2");
		LYSX_EJZL = LYSX_EJZL == null ? "" : LYSX_EJZL;
		String SERVER_NAME = request.getParameter("SERVER_NAME");
		SERVER_NAME = SERVER_NAME == null ? "" : SERVER_NAME;
		String SERVER_IP = request.getParameter("SERVER_IP");
		SERVER_IP = SERVER_IP == null ? "" : SERVER_IP;
		String SERVER_PORT = request.getParameter("SERVER_PORT");
		SERVER_PORT = SERVER_PORT == null ? "" : SERVER_PORT;
		String TBDW = request.getParameter("TBDW");
		TBDW = TBDW == null ? "" : TBDW;
		String BSDW = request.getParameter("BSDW");
		BSDW = BSDW == null ? "" : BSDW;
		String FXZRR = request.getParameter("FXZRR");
		FXZRR = FXZRR == null ? "" : FXZRR;
		String LXDH = request.getParameter("LXDH");
		LXDH = LXDH == null ? "" : LXDH;
		String QF = request.getParameter("QF");
		QF = QF == null ? "" : QF;
		String NG = request.getParameter("NG");
		NG = NG == null ? "" : NG;
		String SH = request.getParameter("SH");
		SH = SH == null ? "" : SH;
		bean.setCLIENT_TYPE(CLIENT_TYPE);
		bean.setXZQH_S(XZQH_S);
		bean.setXZQH_SI(XZQH_SI);
		bean.setXZQH_X(XZQH_X);
		bean.setLYSX_LY(LYSX_LY);
		bean.setLYSX_SX(LYSX_SX);
		bean.setLYSX_YJZL(LYSX_YJZL);
		bean.setLYSX_EJZL(LYSX_EJZL);
		bean.setSERVER_NAME(SERVER_NAME);
		bean.setSERVER_IP(SERVER_IP);
		bean.setSERVER_PORT(SERVER_PORT);
		bean.setTBDW(TBDW);
		bean.setBSDW(BSDW);
		bean.setFXZRR(FXZRR);
		bean.setLXDH(LXDH);
		bean.setQF(QF);
		bean.setNG(NG);
		bean.setSH(SH);

		return bean;
	}
}
