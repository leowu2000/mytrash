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
			// ��½��ʱ���ж��Ƿ���� ��ϵͳ���в�������
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
		 * ��������ҳ��
		 */
		if ("parames".trim().equals(actionType)) {
			ConfigBean bean = _getConfigBeanFromRquest(request);
			String delsql = "delete from TB_CONFIG";
			BuinessDao.deleteDB(delsql, path);
			String sql = SqlFactory.insertSql_ConfigBean(bean, path);
			BuinessDao.insertDB(sql, path);
			request.setAttribute("msg", "�������óɹ�!");
			return new ModelAndView("sys/config");
		}
		/**
		 * ɾ������������Ϣ����
		 */
		if ("delgcxq".trim().equals(actionType)) {
			String IDs[] = request.getParameterValues("RECORDID");// ������ˮ��+������ˮ��+����������
			for (String groupStr : IDs) {
				String groupArr[] = groupStr.split(";");
				// ȡ��������������
				String tablename = BuinessDao.getXqFlTabname(path, groupArr[2]);
				// ɾ����ý�������
				BuinessDao.deleteDB("delete from TB_STDNC_M where DNCNO="
						+ groupArr[1], path);
				// ɾ��������������
				BuinessDao.deleteDB("delete from " + tablename
						+ " where DNCNO=" + groupArr[1], path);
				// ɾ����������
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
		 * ����������Ϣ
		 */
		if ("add".trim().equals(actionType)) {
			String gcnm = new String(request.getParameter("PJNM").getBytes(
					"ISO-8859-1"), "GBK");
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
		 * �޸Ĺ�����Ϣǰ�鿴����
		 */
		if ("peredit".trim().equals(actionType)) {
			String IDs = request.getParameter("IDs");
			String SQL = "select * FROM TB_PJ WHERE PJNO =" + IDs + "";
			PrjBean bean = BuinessDao.findBySql(SQL, path);
			request.setAttribute("bean", bean);
			return new ModelAndView("project/prgEdit");
		}
		/**
		 * �޸Ĺ�����Ϣ
		 */
		if ("edit".trim().equals(actionType)) {
			String gclsh = request.getParameter("gclsh");
			String gcnm = new String(request.getParameter("PJNM").getBytes(
					"ISO-8859-1"), "GBK");
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
		 * �鿴������Ϣ
		 */
		if ("view".trim().equals(actionType)) {
			String gclsh = request.getParameter("gclsh");
			String SQL = "select * FROM TB_PJ WHERE PJNO =" + gclsh + "";
			PrjBean bean = BuinessDao.findBySql(SQL, path);
			request.setAttribute("bean", bean);
			return new ModelAndView("project/prgView");
		}
		/**
		 * ɾ�����̳���
		 * ����ɾ������ IDs:ȡҳ��RECORDIDs TBID:�����ư�����������","�ָ�
		 * PKFILED:��������","�ָ�,��TBID�����ݶ�Ӧ
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
			//ɾ��������Ϣ����Ӧɾ��������������Ϣ�����С����顢������TB_ST
			String IDs = request.getParameter("IDs");
			BuinessDao.deleteProject(path,IDs);
			
			return new ModelAndView("project/prgManage");
		}
		/**
		 * ��������ɼ���Ϣ
		 */
		if ("add_gqcj".trim().equals(actionType)) {
			String SAVETYPES = request.getParameter("SAVETYPES");
			String TABLENAME = request.getParameter("tabname");
			PrjBean prjBean = BuinessDao.findBySql(
					"select * from TB_PJ where PJNO="
							+ request.getParameter("GCNAME"), path);
			// ����������Ϣ
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
			// ����������Ϣ
			if ("2".trim().equals(SAVETYPES)) {
				String mainSQL = "";
				String subSQL = "";
				String DNCNO = request.getParameter("DNCNO");
				// �������Ʋ�ѯ��������ر���˵����ԭ���ľɵĽ�����
				// �������Ϊ�գ���˵��������ӵĽ��������
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
					// ִ�в����������������STDNCBean�Ľ���������ֶΡ�
					id = UUIdFactory.getMaxId(path, "TB_ST", "STTPCD");
					mainSQL = "INSERT INTO TB_ST (STTPCD,PJNO,STNM)VALUES("
							+ id + "," + bean.getPJNO() + ",'" + sttpcd + "')";
					BuinessDao.insertDB(mainSQL, path);
					bean.setSTTPCD(String.valueOf(id));
				}
				// ����������Ϣ
				bean.setDNCNO(String.valueOf(DNCNO));
				bean.setSTTPCD(String.valueOf(id));
				mainSQL = SqlFactory.insertSQL_STDNCBean(bean, path);
				// ��ȡ�������ʱ���Ϣ
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
		 * �޸Ĺ���ɼ���Ϣ
		 */
		if ("edit_gqcj".trim().equals(actionType)) {
			String SAVETYPES = request.getParameter("SAVETYPES");
			String DNCNO = request.getParameter("DNCNO");// ��������
			if ("2".trim().equals(SAVETYPES)) {// ��������
				String mainSQL = "";
				String subSQL = "";

				String XQFLDM = request.getParameter("XQFLDM");// ����������
				// �������Ʋ�ѯ��������ر���˵����ԭ���ľɵĽ�����
				// �������Ϊ�գ���˵��������ӵĽ��������
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
					// ִ�в����������������STDNCBean�Ľ���������ֶΡ�
					id = UUIdFactory.getMaxId(path, "TB_ST", "STTPCD");
					mainSQL = "INSERT INTO TB_ST (STTPCD,PJNO,STNM)VALUES("
							+ id + "," + bean.getPJNO() + ",'" + sttpcd + "')";
					BuinessDao.insertDB(mainSQL, path);
				}
				// ����������Ϣ
				BuinessDao.deleteDB(
						"delete from TB_STDNC WHERE DNCNO=" + DNCNO, path);

				bean.setDNCNO(String.valueOf(DNCNO));
				mainSQL = SqlFactory.insertSQL_STDNCBean(bean, path);
				// ȡ�ӱ�����
				String detailTablename = BuinessDao
						.getXqFlTabname(path, XQFLDM);
				BuinessDao.deleteDB("delete from " + detailTablename
						+ " WHERE DNCNO=" + DNCNO, path);
				// ��ȡ�������ʱ���Ϣ

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
				//�����������ݵ�����״̬��
				String GCFL = BuinessDao.idToNameChange(path, "TB_PJRCN", "GCFLDM", " PJRNO="+DNCNO);
				String detailTname="";
				if("B".trim().equals(GCFL))
					detailTname = "TB_RSR";
				if("K".trim().equals(GCFL))
					detailTname = "TB_WLR";
				if("N".trim().equals(GCFL))
					detailTname = "TB_COWAPJ";//=�κӹ���=N
				if("F".trim().equals(GCFL))
					detailTname = "TB_STOFLER";//=����=F
				if("D".trim().equals(GCFL)
						||"E".trim().equals(GCFL)
						||"H".trim().equals(GCFL)
						||"P".trim().equals(GCFL))
					detailTname = "TB_DKR";
				// ɾ����������
				
				BuinessDao.deleteDB(
						"delete from TB_PJRCN WHERE PJRNO=" + DNCNO, path);
				// ��������
				PJRCNBean bean = _getPJRCNBeanFromRequest(request);
				PrjBean prjBean = BuinessDao.findBySql(
						"select * from TB_PJ where PJNO="
								+ request.getParameter("GCNAME"), path);
				bean.setPJRNO(DNCNO);
				String sSQL = SqlFactory.insertSQL_PJRCNBean(bean, path,
						prjBean);
				// ɾ���ӱ�����
				BuinessDao.deleteDB("delete from "+detailTname+" WHERE PJRNO=" + DNCNO,
						path);
				// �����ӱ�����
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
		 * ����/�޸� ��Ѵ����Ϣ
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
			// �޸ķ�Ѵ��Ϣ
			if ("update".trim().equals(subAction)) {
				String RPJINCD = request.getParameter("RPJINCD");
				sSQL = "UPDATE TB_FXJB SET ISSUE=" + ISSUE + ",WTDT=#" + WTDT
						+ "#,ACTICO='" + ACTICO + "',QF='" + QF + "',SH='" + SH
						+ "',NG='" + NG + "',WTDPCD='" + WTDPCD + "',WTTT='"
						+ WTTT + "'" + " WHERE RPJINCD=" + RPJINCD;
				// ����
				BuinessDao.updateDB(sSQL, path);
				// �����Ҫ���¶�ý����Ϣ
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
				// ����
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
		 * ��������������޸ģ���Ѵ�ж���������Ϣ�����鱨��
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
			if ("edit".trim().equals(subAction)) {//�޸�
				newSQL = "UPDATE " + TABLENAME + " SET WTTT='" + MAINTITLE
						+ "',WTDT=#" + WTDT + "#,WTDPCD='" + WTDPCD + "',"
						+ FILEDNAME + "='" + CONTENT + "' WHERE RPJINCD="
						+ DNCNO;
			} else {//����
				newSQL = "INSERT INTO " + TABLENAME
						+ "(RPJINCD,WTTT,WTDT,WTDPCD," + FILEDNAME + ")VALUES("
						+ DNCNO + ",'" + MAINTITLE + "',#" + WTDT + "#,'"
						+ WTDPCD + "','" + CONTENT + "')";
			}
			List<SubTempBean> beanlist = BuinessDao.getMediaList(path, DNCNO,
					TABLENAME + "_M");
			if ("edit".trim().equals(subAction))
				BuinessDao.toUpdateDbList(path, TABLENAME + "_M", newSQL, "",
						beanlist);// ����
			else
				BuinessDao.toInsertDbList(path, TABLENAME + "_M", newSQL, "",
						beanlist);// ����
			BuinessDao.deleteTempMedia(path);
			return new ModelAndView("report/" + TABLENAME + "Manage");
		}
		/**
		 * ͨ�ò�ѯ
		 */
		if ("search".trim().equals(actionType)) {
			String searchType = request.getParameter("searchType");

			String iswhere = "";
			if ("prj".trim().equals(searchType)) {// ���̹���
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
			if ("gcxq".trim().equals(searchType)) {// ��������
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
			if ("yxzt".trim().equals(searchType)) {// ����״̬
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
			if ("fxjb".trim().equals(searchType)) {// ��Ѵ��
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
			if ("TB_FPACTI".trim().equals(searchType)// ��Ѵ�ж�
					|| "TB_QT".trim().equals(searchType)// ����
					|| "TB_SD".trim().equals(searchType)) {// ��
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
		 * ��ҳ
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
					|| "TB_FPACTI".trim().equals(towhere)// ��Ѵ�ж�
					|| "TB_QT".trim().equals(towhere)// ����
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
	 * ��ҳ���ȡ����������Ϣ ����PJRCNBean
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
				.getParameter("PJRNO"));// ���б��
		bean.setPJNO(request.getParameter("GCNAME") == null ? "" : request
				.getParameter("GCNAME"));// ���̱��
		bean.setDTCDT(request.getParameter("DTCDT") == null ? "" : request
				.getParameter("DTCDT"));// ���ʱ��
		bean.setPJNM(request.getParameter("GCNAME") == null ? "" : request
				.getParameter("GCNAME"));// ��������
		bean.setGCFLDM(request.getParameter("GCFLDM") == null ? "" : request
				.getParameter("GCFLDM"));// ���̷������
		bean.setDNCFC(DNCFC == null ? "" : DNCFC);// ����Ԥ��
		bean.setRDERESCN(RDERESCN == null ? "" : RDERESCN);// ������Դ�䱸
		bean.setWTDPCD(WTDPCD == null ? "" : WTDPCD);// ���λ����
		bean.setWTDPDT(request.getParameter("WTDPDT") == null ? "" : request
				.getParameter("WTDPDT"));// �ʱ��
		bean.setNT(NT == null ? "" : NT);// ����
		return bean;
	}

	/**
	 * ��ҳ���ȡ����������Ϣ
	 * 
	 */
	public static STDNCBean _getSTDNCeanFromRequest(HttpServletRequest request)
			throws Exception {
		STDNCBean bean = new STDNCBean();
		String DNCNM = request.getParameter("DNCNM");// ��������
		String RDEPL = request.getParameter("QXFA");// ���շ���
		String RDERESCN = request.getParameter("QXZYPB");// ������Դ�䱸
		String RDECNRL = request.getParameter("JZJJG");// ��չ�����
		String DNCCUAN = request.getParameter("XQYYFX");// ����ԭ�����
		String DNCESTDV = request.getParameter("XQFZQS");// ���鷢չ����
		String DNCPBNFZ = request.getParameter("KNYXFW");// ����Ӱ�췶Χ
		String WTHCN = request.getParameter("QXSQX");// ����ʱ�������
		String FHYWTHCN = request.getParameter("WLSWQX");// δ��ˮ���������
		String DNCADDSC = request.getParameter("BCMS");// ��������
		String WTDPCD = request.getParameter("WTDPCD");// ���λ����
		String DNCGR = request.getParameter("DNCGR");// ���鼶��
		String DAGPLCCH = request.getParameter("DAGPLCCH");// ���յص�׮��
		String DAGLO = request.getParameter("DAGLO");// ���ղ�λ
		String STTPCD = request.getParameter("STTPCD");
		bean.setDNCNM(DNCNM == null ? "" : DNCNM);// ��������
		bean.setDNCGR(DNCGR == null ? "" : DNCGR);// ���鼶��
		bean.setRDEPL(RDEPL == null ? "" : RDEPL);// ���շ���
		bean.setRDERESCN(RDERESCN == null ? "" : RDERESCN);// ������Դ�䱸
		bean.setRDECNRL(RDECNRL == null ? "" : RDECNRL);// ��չ�����
		bean.setDNCCUAN(DNCCUAN == null ? "" : DNCCUAN);// ����ԭ�����
		bean.setDNCESTDV(DNCESTDV == null ? "" : DNCESTDV);// ���鷢չ����
		bean.setDNCPBNFZ(DNCPBNFZ == null ? "" : DNCPBNFZ);// ����Ӱ�췶Χ
		bean.setWTHCN(WTHCN == null ? "" : WTHCN);// ����ʱ�������
		bean.setFHYWTHCN(FHYWTHCN == null ? "" : FHYWTHCN);// δ��ˮ���������
		bean.setDNCADDSC(DNCADDSC == null ? "" : DNCADDSC);// ��������
		bean.setWTDPCD(WTDPCD == null ? "" : WTDPCD);// ���λ����
		bean.setDAGPLCCH(DAGPLCCH == null ? "" : DAGPLCCH);// ���յص�׮��
		bean.setDAGLO(DAGLO == null ? "" : DAGLO);// ���ղ�λ

		bean.setDNCNO(request.getParameter("DNCNO") == null ? "" : request
				.getParameter("DNCNO"));// ������
		bean.setPJNO(request.getParameter("GCNAME") == null ? "" : request
				.getParameter("GCNAME"));// ���̱��
		bean.setSTTPCD(STTPCD == null ? "" : STTPCD);// ���������
		bean.setDAGTM(request.getParameter("DAGTM") == null ? "" : request
				.getParameter("DAGTM"));// ����ʱ��
		bean.setXQFLDM(request.getParameter("XQFLDM") == null ? "" : request
				.getParameter("XQFLDM"));// ����������
		bean.setTPN(request.getParameter("TPN") == "" ? "0" : request
				.getParameter("TPN"));// Ⱥ��Ͷ��(��)
		bean.setPLAPN(request.getParameter("PLAPN") == "" ? "0" : request
				.getParameter("PLAPN"));// ��ž�Ͷ��(��)
		bean.setPLIPN(request.getParameter("PLIPN") == "" ? "0" : request
				.getParameter("PLIPN"));// �侯Ͷ��(��)
		bean.setRZ(request.getParameter("RZ") == "" ? "0" : request
				.getParameter("RZ"));// ��ǰ����ˮλ(��)
		bean.setWTDPDT(request.getParameter("WTDPDT") == null ? "" : request
				.getParameter("WTDPDT"));// �ʱ��
		return bean;
	}

	/**
	 * ��ȡ�������дӱ���Ϣ
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public static RSRBean _getRSRBeanFromRquest(HttpServletRequest request)
			throws Exception {
		RSRBean bean = new RSRBean();
		String BJWHZK = request.getParameter("BJWHZK");// �ӻ����״��
		String BTWDZK = request.getParameter("BTWDZK");// �����ȶ����
		String HPHAWDQK = request.getParameter("HPHAWDQK");// ���»����ȶ����
		String XSJZWZK = request.getParameter("XSJZWZK");// йˮ���������״��
		String XNGWHZK = request.getParameter("XNGWHZK");// ���ܹ����״��
		String ZMQBJZK = request.getParameter("ZMQBJZK");// բ�š����ջ����״��
		String TXSDJZK = request.getParameter("TXSDJZK");// ͨѶ�ֶμ�״��

		bean.setPJRNO(request.getParameter("PJRNO") == null ? "" : request
				.getParameter("PJRNO"));// ���б��
		bean.setPJNO(request.getParameter("PJNO") == null ? "" : request
				.getParameter("PJNO"));// ���̱��
		bean.setDTCDT(request.getParameter("DTCDT") == null ? "" : request
				.getParameter("DTCDT"));// ���ʱ��
		bean.setPJNM(request.getParameter("PJNM") == null ? "" : request
				.getParameter("PJNM"));// ��������
		bean.setRSCLS(request.getParameter("RSCLS") == null ? "" : request
				.getParameter("RSCLS"));// ˮ�����(����/�к�/���տ�)
		bean.setRV(request.getParameter("RV") == "" ? "0" : request
				.getParameter("RV"));// ��ǰ����(��������)
		bean.setRZ(request.getParameter("RZ") == "" ? "0" : request
				.getParameter("RZ"));// ��ǰ����ˮλ(��)
		bean.setRQ(request.getParameter("RQ") == "" ? "0" : request
				.getParameter("RQ"));// ��ǰк��(������/��)
		bean.setDFPFCN(BJWHZK == null ? "" : BJWHZK);// �ӻ����״��
		bean.setDBSTBCN(BTWDZK == null ? "" : BTWDZK);// �����ȶ����
		bean.setBRBPPFCN(HPHAWDQK == null ? "" : HPHAWDQK);// ���»����ȶ����
		bean.setESPFCN(XSJZWZK == null ? "" : XSJZWZK);// йˮ���������״��
		bean.setEDDPFCN(XNGWHZK == null ? "" : XNGWHZK);// ���ܹ����״��
		bean.setGTHOPFCN(ZMQBJZK == null ? "" : ZMQBJZK);// բ�š����ջ����״��
		bean.setCOMMCN(TXSDJZK == null ? "" : TXSDJZK);// ͨѶ�ֶμ�״��
		return bean;
	}

	/**
	 * ��ȡ���������������������Ϣ
	 * 
	 * @param request
	 * @param XQFL����������
	 * @return DetailBean
	 * @throws Exception
	 */
	public static DetailBean _getDetailBeanFromRquest(
			HttpServletRequest request, String XQFL) throws Exception {

		DetailBean bean = new DetailBean();
		bean.setDNCNO(request.getParameter("DNCNO")); // ������
		bean.setPJNO(request.getParameter("GCNAME")); // ���̱��
		String STTPCD = (new String(request.getParameter("STTPCD").getBytes(
				"ISO-8859-1"), "GBK"));

		bean.setSTTPCD(STTPCD); // ���������

		bean.setDAGTM(request.getParameter("DAGTM")); // ����ʱ��
		bean.setDNCNM(request.getParameter("DNCNM")); // ��������
		if ("D004".trim().equals(XQFL) || "D003".trim().equals(XQFL)) {
			String LKGTU = request.getParameter("LKGTU");
			bean.setLKGTU(LKGTU == null ? "" : LKGTU); // ©ˮ���� ==D004==D003
		}
		if ("D006".trim().equals(XQFL) || "D012".trim().equals(XQFL)) {
			bean.setSLUPAG(request.getParameter("SLUPAG") == "" ? "0" : request
					.getParameter("SLUPAG")); // ������Ƕ�(��) ==D006==D012
		}
		if ("D007".trim().equals(XQFL) || "D009".trim().equals(XQFL)
				|| "D004".trim().equals(XQFL)|| "D003".trim().equals(XQFL)) {
			bean.setTODFTDI(request.getParameter("TODFTDI") == "" ? "0"
					: request.getParameter("TODFTDI")); // ��̽ž���(��)
														// ==D007==D009==D003==D004
		}
		if ("D009".trim().equals(XQFL) || "D011".trim().equals(XQFL)) {
			bean.setWDQ(request.getParameter("WDQ") == "" ? "0" : request
					.getParameter("WDQ"));// �ӵ�����(������/��) ==D011==D009
		}
		if ("D001".trim().equals(XQFL) || "D015".trim().equals(XQFL)) {
			bean.setDSSPN(request.getParameter("DSSPN") == "" ? "0" : request
					.getParameter("DSSPN")); // �����˿�(��) ==D001==D015
			bean.setINPN(request.getParameter("INPN") == "" ? "0" : request
					.getParameter("INPN")); // �����˿�(��) ==D001==D015
			bean.setDTHPN(request.getParameter("DTHPN") == "" ? "0" : request
					.getParameter("DTHPN")); // �����˿�(��) ==D001==D015
			bean.setWRHS(request.getParameter("WRHS") == "" ? "0" : request
					.getParameter("WRHS")); // ��������(��) ==D001==D015
			bean.setCRPDSSAR(request.getParameter("CRPDSSAR") == "" ? "0"
					: request.getParameter("CRPDSSAR")); // ũ�����������(����)
															// ==D001==D015
			bean.setSCDMFMAR(request.getParameter("SCDMFMAR") == "" ? "0"
					: request.getParameter("SCDMFMAR")); // �ٻ��������(����)
															// ==D001==D015
			bean.setDRCECLS(request.getParameter("DRCECLS") == "" ? "0"
					: request.getParameter("DRCECLS")); // ֱ�Ӿ�����ʧ(��Ԫ)
														// ==D001==D015
		}
		if ("D023".trim().equals(XQFL) || "D024".trim().equals(XQFL)) {
			bean.setWRAR(request.getParameter("WRAR") == "" ? "0" : request
					.getParameter("WRAR")); // �ƻ����(ƽ����) ==D023==D024
		}
		if ("D001".trim().equals(XQFL)) {
			// D001 ���� TB_BURDSC
			bean.setBUW(request.getParameter("BUW") == "" ? "0" : request
					.getParameter("BUW")); // ���ڿ��(��)
			bean.setBUVL(request.getParameter("BUVL") == "" ? "0" : request
					.getParameter("BUVL")); // ��������(��/��)
			bean.setBUZDF(request.getParameter("BUZDF") == "" ? "0" : request
					.getParameter("BUZDF")); // ����ˮͷ��(��)
			bean.setBUQ(request.getParameter("BUQ") == "" ? "0" : request
					.getParameter("BUQ")); // ��������(������/��)
			String BURLDGL = request.getParameter("BURLDGL");
			bean.setBURLDGL(BURLDGL == null ? "" : BURLDGL); // ���ڴ����ε�������
		}
		if ("D002".trim().equals(XQFL)) {
			// D002 ���� TB_OVFLDSC
			bean.setOVFLL(request.getParameter("OVFLL") == "" ? "0" : request
					.getParameter("OVFLL")); // ���糤��(��)
			bean.setOVFLZ(request.getParameter("OVFLZ") == "" ? "0" : request
					.getParameter("OVFLZ")); // ����ˮλ(��)
			bean.setDSQ(request.getParameter("DSQ") == "" ? "0" : request
					.getParameter("DSQ")); // ��������(������/��)
		}
		if ("D003".trim().equals(XQFL)) {
			// D003 ©�� TB_LKDSC
			bean.setLKDMT(request.getParameter("LKDMT") == "" ? "0" : request
					.getParameter("LKDMT")); // ©��ֱ��(��)
			bean.setLKQ(request.getParameter("LKQ") == "" ? "0" : request
					.getParameter("LKQ")); // ©������(��/��)
			bean.setLKWTLH(request.getParameter("LKWTLH") == "" ? "0" : request
					.getParameter("LKWTLH")); // ©��ˮ����(��)
			bean.setLKSAR(request.getParameter("LKSAR") == "" ? "0" : request
					.getParameter("LKSAR")); // ���γ�©��Ⱥ���(ƽ����)
		}
		if ("D004".trim().equals(XQFL)) {
			// D004 ��ӿ TB_PPDSC
			bean.setPPQ(request.getParameter("PPQ") == "" ? "0" : request
					.getParameter("PPQ")); // ��ӿ����(��/��)
			bean.setWTLH(request.getParameter("WTLH") == "" ? "0" : request
					.getParameter("WTLH")); // ˮ����(��)
			bean.setPPSAR(request.getParameter("PPSAR") == "" ? "0" : request
					.getParameter("PPSAR")); // ���γɹ�ӿȺ���(ƽ����)
		}
		if ("D005".trim().equals(XQFL)) {
			// D005 �ݿ� TB_PITDSC
			bean.setSBDSP(request.getParameter("SBDSP") == "" ? "0" : request
					.getParameter("SBDSP")); // �ݿ����(��)
			bean.setSBAR(request.getParameter("SBAR") == "" ? "0" : request
					.getParameter("SBAR")); // �ݿ����(ƽ����)
		}
		if ("D006".trim().equals(XQFL)) {
			// D006 ���� TB_SLDSC
			bean.setSLBU(request.getParameter("SLBU") == "" ? "0" : request
					.getParameter("SLBU")); // �������(������)
		}
		if ("D007".trim().equals(XQFL)) {
			// D007 ��ˢ TB_UNDSC
			bean.setUNDAR(request.getParameter("UNDAR") == "" ? "0" : request
					.getParameter("UNDAR")); // ��ˢ���(ƽ����)
			bean.setUNDD(request.getParameter("UNDD") == "" ? "0" : request
					.getParameter("UNDD")); // ��ˢ���(��)
			bean.setUNDL(request.getParameter("UNDL") == "" ? "0" : request
					.getParameter("UNDL")); // ��ˢ����(��)
		}
		if ("D008".trim().equals(XQFL)) {
			// D008 �ѷ� TB_CRDSC
			String CRDR = request.getParameter("CRDR");
			bean.setCRDR(CRDR == null ? "" : CRDR); // �ѷ췽��
			bean.setCRD(request.getParameter("CRD") == "" ? "0" : request
					.getParameter("CRD")); // �ѷ����(��)
			bean.setCRL(request.getParameter("CRL") == "" ? "0" : request
					.getParameter("CRL")); // �ѷ쳤��(��)
			bean.setCRW(request.getParameter("CRW") == "" ? "0" : request
					.getParameter("CRW")); // �ѷ���(����)
		}
		if ("D009".trim().equals(XQFL)) {
			// D009 ���� TB_CVDSC
			bean.setCVL(request.getParameter("CVL") == "" ? "0" : request
					.getParameter("CVL")); // ��������(��)
			bean.setCVBU(request.getParameter("CVBU") == "" ? "0" : request
					.getParameter("CVBU")); // �������(������)
			bean.setRVH(request.getParameter("RVH") == "" ? "0" : request
					.getParameter("RVH")); // �Ӱ��߶�(��)
			String FLCNDSC = request.getParameter("FLCNDSC");
			bean.setFLCNDSC(FLCNDSC == null ? "" : FLCNDSC); // ˮ���������
		}
		if ("D010".trim().equals(XQFL)) {
			// D010 ��ˮ TB_SPDSC
			bean.setSPAR(request.getParameter("SPAR") == "" ? "0" : request
					.getParameter("SPAR")); // ��ˮ���(ƽ����)
			bean.setSPQ(request.getParameter("SPQ") == "" ? "0" : request
					.getParameter("SPQ")); // ��͸����
		}
		if ("D011".trim().equals(XQFL)) {
			// D011 �˿� TB_BLBAD
			bean.setBLH(request.getParameter("BLH") == "" ? "0" : request
					.getParameter("BLH")); // �˸�(��)
			bean.setWNS(request.getParameter("WNS") == "" ? "0" : request
					.getParameter("WNS")); // ����(��)
		}
		if ("D012".trim().equals(XQFL)) {
			// D012 ���� TB_SLUDSC
			bean.setSLUDSP(request.getParameter("SLUDSP") == "" ? "0" : request
					.getParameter("SLUDSP")); // ����λ��(��)
			String SLUTP = request.getParameter("SLUTP");
			bean.setSLUTP(SLUTP); // ��������
			String SLUGLCN = request.getParameter("SLUGLCN");
			bean.setSLUGLCN(SLUGLCN == null ? "" : SLUGLCN); // ������������
		}
		if ("D013".trim().equals(XQFL)) {
			// D013 ����ʧ�� TB_HOMLFDSC
			String POWCUT = request.getParameter("POWCUT");
			String HOMLF = request.getParameter("HOMLF");
			String GSDST = request.getParameter("GSDST");
			String MLFCN = request.getParameter("MLFCN");
			bean.setPOWCUT(POWCUT == null ? "" : POWCUT); // ͣ��
			bean.setHOMLF(HOMLF == null ? "" : HOMLF); // ���ջ�ʧ��
			bean.setGSDST(GSDST == null ? "" : GSDST); // բ�ž�����
			bean.setMLFCN(MLFCN == null ? "" : MLFCN); // ʧ��ʱ����״��
		}
		if ("D014".trim().equals(XQFL)) {
			// D014 բ���ƻ� TB_GTWRDSC
			String WRDSC = request.getParameter("WRDSC");
			bean.setWRDSC(WRDSC == null ? "" : WRDSC); // �ƻ���ʽ
			bean.setWRQ(request.getParameter("WRQ") == "" ? "0" : request
					.getParameter("WRQ")); // ʧ��ʱ����(������/��)
		}
		if ("D015".trim().equals(XQFL)) {
			// D015 ���� TB_BRDMDSC
			String PJPS = request.getParameter("PJPS");
			String BRDMLDGL = request.getParameter("BRDMLDGL");
			bean.setBRDMW(request.getParameter("BRDMW")); // ���ӿ��(��)
			bean.setPJPS(PJPS == null ? "" : PJPS); // ������״
			bean.setBRZDMCDI(request.getParameter("BRZDMCDI") == "" ? "0"
					: request.getParameter("BRZDMCDI")); // ��ˮλ��̶�����(��)
			bean.setBRV(request.getParameter("BRV") == "" ? "0" : request
					.getParameter("BRV")); // ����ʱ����(��������)
			bean.setBRDMQ(request.getParameter("BRDMQ") == "" ? "0" : request
					.getParameter("BRDMQ")); // ��������(������/��)
			bean.setBRDMLDGL(BRDMLDGL == null ? "" : BRDMLDGL); // ���Ӵ����Ρ���������
		}
		if ("D016".trim().equals(XQFL)) {
			// D016 �㸲 TB_OVTUDSC
			String OVTUDR = request.getParameter("OVTUDR");
			bean.setOVTUDR(OVTUDR == null ? "" : OVTUDR); // �㸲����
			bean.setOVTUAG(request.getParameter("OVTUAG") == "" ? "0" : request
					.getParameter("OVTUAG")); // �㸲�Ƕ�(��)
		}
		if ("D017".trim().equals(XQFL)) {
			// D017 Ӧ������ TB_STREXDSC
			String CONGR = request.getParameter("CONGR");
			bean.setMXTNST(request.getParameter("MXTNST") == "" ? "0" : request
					.getParameter("MXTNST")); // �����Ӧ��(ţ/ƽ������)
			bean.setMXCMST(request.getParameter("MXCMST") == "" ? "0" : request
					.getParameter("MXCMST")); // ���ѹӦ��(ţ/ƽ������)
			bean.setCONGR(CONGR == null ? "" : CONGR); // ���������
			bean.setASTR(request.getParameter("ASTR") == "" ? "0" : request
					.getParameter("ASTR")); // ����Ӧ��ֵ(ţ/ƽ������)
		}
		if ("D018".trim().equals(XQFL)) {
			// D018 ̮�� TB_SLIDSC
			bean.setSLIAR(request.getParameter("SLIAR") == "" ? "0" : request
					.getParameter("SLIAR")); // ̮�����(ƽ����)
			bean.setSLIMS(request.getParameter("SLIMS") == "" ? "0" : request
					.getParameter("SLIMS")); // ̮������(������)
		}
		if ("D019".trim().equals(XQFL)) {
			// D019 ���� TB_PLUDSC
			String PLTNM = request.getParameter("PLTNM");
			String PLTBU = request.getParameter("PLTBU");
			bean.setPLTNM(PLTNM == null ? "" : PLTNM); // ����������
			bean.setPLTBU(PLTBU == "" ? "0" : PLTBU); // ���������(������)
		}
		if ("D020".trim().equals(XQFL)) {
			// D020 �����ƻ� TB_BSWRDSC
			String GRNSPDSC = request.getParameter("GRNSPDSC");
			String GROVCHWR = request.getParameter("GROVCHWR");
			bean.setGRNSPDSC(GRNSPDSC == null ? "" : GRNSPDSC); // ������©����
			bean.setGRNUSB(request.getParameter("GRNUSB") == "" ? "0" : request
					.getParameter("GRNUSB")); // �ݴ������ȳ���(��)
			bean.setGROVCHWR(GROVCHWR == null ? "" : GROVCHWR); // ���������ƻ�
		}
		if ("D021".trim().equals(XQFL)) {
			// D021 ���ܹ��ƻ� TB_EDDWRDSC
			String APWR = request.getParameter("APWR");
			String WSTWR = request.getParameter("WSTWR");
			bean.setAPWR(APWR == null ? "" : APWR); // �װ�����
			bean.setWSTWR(WSTWR == null ? "" : WSTWR); // ֹˮ�ƻ�
		}
		if ("D022".trim().equals(XQFL)) {
			// D022 ������ˮʧЧ TB_BSWPLPDS
			String WPPLU = request.getParameter("WPPLU");
			String WPEQML = request.getParameter("WPEQML");
			bean.setWPPLU(WPPLU == null ? "" : WPPLU); // ��ˮ�׶���
			bean.setWPEQML(WPEQML == null ? "" : WPEQML); // ��ˮ�豸ʧ��
		}
		if ("D023".trim().equals(XQFL)) {
			// D023 �����ƻ� TB_HBWRDSC
			String LNINF = request.getParameter("LNINF");
			String HBGLCN = request.getParameter("HBGLCN");
			bean.setWRMS(request.getParameter("WRMS") == "" ? "0" : request
					.getParameter("WRMS"));// �ƻ�����(������)
			bean.setLNINF(LNINF == null ? "" : LNINF);// �Գ�����ɵ�Ӱ��
			bean.setHBGLCN(HBGLCN == null ? "" : HBGLCN);// ����������
		}
		if ("D024".trim().equals(XQFL)) {
			// D024 �ص����ֲ̾��ƻ� TB_CLPJPRWR
			String WRGLCN = request.getParameter("WRGLCN");
			bean.setWRD(request.getParameter("WRD") == "" ? "0" : request
					.getParameter("WRD")); // �ƻ����(��)
			bean.setWRL(request.getParameter("WRL") == "" ? "0" : request
					.getParameter("WRL")); // �ƻ�����(��)
			bean.setWRGLCN(WRGLCN == null ? "" : WRGLCN); // �ƻ����������
		}
		if ("D025".trim().equals(XQFL)) {
			// D025 �ص����̳�� TB_CLPJSCDN
			String SCDMGLCN = request.getParameter("SCDMGLCN");
			bean.setSCDMBU(request.getParameter("SCDMBU") == "" ? "0" : request
					.getParameter("SCDMBU")); // ������(������)
			bean.setSCDML(request.getParameter("SCDML") == "" ? "0" : request
					.getParameter("SCDML")); // ��ٳ���(��)
			bean.setSCDMD(request.getParameter("SCDMD") == "" ? "0" : request
					.getParameter("SCDMD")); // ������(��)
			bean.setSCDMGLCN(SCDMGLCN == null ? "" : SCDMGLCN); // ��ٴ��������
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
		bean.setPJNO(request.getParameter("DNCNO"));		//���б��
		bean.setPJNO(request.getParameter("GCNAME"));			//���̱��
		bean.setDTCDT(request.getParameter("DTCDT"));		//���ʱ��
//		bean.setPJNM(PJNM);			//��������
		if("B".trim().equals(GCFL)
				||"D".trim().equals(GCFL)
				||"E".trim().equals(GCFL)
				||"H".trim().equals(GCFL)
				||"P".trim().equals(GCFL)){
			String BRBPPFCN = request.getParameter("BRBPPFCN");
			String RZ = request.getParameter("RZ");
			String RQ = request.getParameter("RQ");
			RZ=RZ==""?"0":RZ;RQ=RQ==""?"0":RQ;
			bean.setRZ(RZ);	//z��ǰ����ˮλ(��)========TB_RSR===TB_DKR
			bean.setRQ(RQ);	//��ǰк��(������/��)========TB_RSR===TB_DKR
			bean.setBRBPPFCN(BRBPPFCN);	//���»����ȶ����========TB_RSR===TB_DKR
		}
		if("B".trim().equals(GCFL)||"K".trim().equals(GCFL)){
			String EDDPFCN = request.getParameter("EDDPFCN");
			String GTHOPFCN = request.getParameter("GTHOPFCN");
			String COMMCN = request.getParameter("COMMCN");
			bean.setEDDPFCN(EDDPFCN);	//���ܹ����״��==========TB_RSR===TB_WLR
			bean.setGTHOPFCN(GTHOPFCN);	//բ�š����ջ����״��====TB_RSR===TB_WLR
			bean.setCOMMCN(COMMCN);	//ͨѶ�ֶμ�״��==========TB_RSR===TB_WLR
		}
		if("N".trim().equals(GCFL)
				||"F".trim().equals(GCFL)
				||"D".trim().equals(GCFL)
				||"E".trim().equals(GCFL)
				||"H".trim().equals(GCFL)
				||"P".trim().equals(GCFL)){
			bean.setBKOT(request.getParameter("BKOT"));	//���ڰ���(��/��)======TB_DKR====TB_COWAPJ===TB_STOFLER
		}
		if("B".trim().equals(GCFL)){
			//TB_RSR=ˮ��=B
			String DFPFCN = request.getParameter("DFPFCN");
			String DBSTBCN = request.getParameter("DBSTBCN");
			String ESPFCN = request.getParameter("ESPFCN");
			bean.setRSCLS(request.getParameter("RSCLS"));	//ˮ�����(����/�к�/���տ�)
			bean.setRV(request.getParameter("RV"));			//��ǰ����(��������)
			bean.setDFPFCN(DFPFCN);							//�ӻ����״��
			bean.setDBSTBCN(DBSTBCN);						//�����ȶ����
			bean.setESPFCN(ESPFCN);							//йˮ���������״��
			
		}
		if("K".trim().equals(GCFL)){
			//TB_WLR=ˮբ=K
			String GFPFCN = request.getParameter("GFPFCN");
			String STPFCN = request.getParameter("STPFCN");
			String RUPGZ = request.getParameter("RUPGZ");
			String RDWGZ = request.getParameter("RDWGZ");
			String RQO = request.getParameter("RQO");
			String RWSTOWLT = request.getParameter("RWSTOWLT");
			RUPGZ=RUPGZ==""?"0":RUPGZ;RDWGZ=RDWGZ==""?"0":RDWGZ;
			RQO=RQO==""?"0":RQO;RWSTOWLT=RWSTOWLT==""?"0":RWSTOWLT;
			bean.setWLGR(request.getParameter("WLGR")); //ˮբ�ȱ�(һ/��/��/��/��)
			bean.setRUPGZ(RUPGZ);	//��ǰբ��ˮλ(��)
			bean.setRDWGZ(RDWGZ);	//��ǰբ��ˮλ(��)
			bean.setRQO(RQO);	//��ǰ��բ����(������/��)
			bean.setRWSTOWLT(RWSTOWLT);	//��ǰˮ���բ������(��)
			bean.setGFPFCN(GFPFCN);								//�ӻ����״��
			bean.setSTPFCN(STPFCN);								//���������״��
		}
		if("N".trim().equals(GCFL)){
			//TB_COWAPJ=�κӹ���=N
			String FLCNDSC = request.getParameter("FLCNDSC");
			String WDCNDSC = request.getParameter("WDCNDSC");
			String PRCCLR = request.getParameter("PRCCLR");
			String SPURDSC = request.getParameter("SPURDSC");
			String BPPJCN = request.getParameter("BPPJCN");
			bean.setFLCNDSC(FLCNDSC);								//ˮ���������
			bean.setWDCNDSC(WDCNDSC);								//�ӵ��������
			bean.setPRCCLR(PRCCLR);								//���ϵ���ʵ
			bean.setSPURDSC(SPURDSC);								//�ص���������
			bean.setBPPJCN(BPPJCN);								//�����������
		}
		if("F".trim().equals(GCFL)){
			//TB_STOFLER=����=F
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
			bean.setDSFLWZ(DSFLWZ);			//�����(��)��ˮλ(��)
			bean.setDSFLW(DSFLW);			//�����(��)����(��������)
			bean.setTRFCN(TRFCN);				//��ͨ״��
			bean.setDKCN(DKCN);					//�׵�״��
			bean.setCWFCCN(CWFCCN);				//ͨѶԤ����ʩ״��
			bean.setSFSRCN(SFSRCN);				//��ˮ������ʩ״��
			bean.setFLFADSC(FLFADSC);			//�ֺ���ʩ״��
			bean.setIDSTCN(IDSTCN);				//��ˮվ״��
		}
		if("D".trim().equals(GCFL)
				||"E".trim().equals(GCFL)
				||"H".trim().equals(GCFL)
				||"P".trim().equals(GCFL)){
			//TB_DKR=�̷�==����==����==����
			String STECH = request.getParameter("STECH");
			String WSTODC = request.getParameter("WSTODC");
			String DKPFCN = request.getParameter("DKPFCN");
			String TSCN = request.getParameter("TSCN");
			String RV = request.getParameter("RV");
			RV=RV==""?"0":RV;WSTODC=WSTODC==""?"0":WSTODC;
			bean.setRV(RV);			//��ǰ����(��������)
			bean.setDKGR(request.getParameter("DKGR"));			//�̷�����(1/2/3/4/5)
			bean.setSTECH(STECH);								//��ֹ׮��
			bean.setWSTODC(WSTODC);								//ˮ���̶�����(��)
			bean.setDKPFCN(DKPFCN);								//�̷����״��
			bean.setTSCN(TSCN);									//���̽�����״��
		}
		return bean;
	}
	
	/**
	 * ϵͳ��������
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
