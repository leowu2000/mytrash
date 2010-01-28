package com.core;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buiness.dao.BuinessDao;
import com.buiness.form.PrjBean;

public class FileUploadServlet extends HttpServlet {

	/**
	 * core
	 */
	private static final long serialVersionUID = 1L;

	public void init() throws ServletException {
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String path = request.getRealPath("/");
			String type=request.getParameter("type");
			String gclsh = request.getParameter("gclsh");
			String saveType = request.getParameter("saveType");
			String filedir = request.getParameter("filepath");//report ����
			String cjsj = request.getParameter("cjsjvalue");
			String zpbt = request.getParameter("zpbtvalue");//report ����
			String zpms = request.getParameter("zpmsvalue");
			String detail = request.getParameter("detailvalue");
			Connection conn = null;
			String result = "";
			String DNCNO = request.getParameter("DNCNO");//report ����
			if("report".trim().equals(type)){
				String time = request.getParameter("time");
				String tabname = request.getParameter("tabname");
				conn = ConnectionPool.getConnection(path);
				String sql = "";
				sql = "INSERT INTO "+tabname+"(ZLBM,RPJINCD,DTCDT,TITLE,LXZP) values(?,?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				File f = new File(filedir);
				FileInputStream fis = new FileInputStream(f);
				pstmt.setInt(1, UUIdFactory.getMaxId(path, tabname));
				pstmt.setString(2, DNCNO);
				pstmt.setString(3, time);
				pstmt.setString(4, zpbt);
				pstmt.setBinaryStream(5, fis, (int) f.length());
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
				List picList = BuinessDao.getSelectList(tabname,new String[]{"ZLBM","TITLE"},path,"WHERE RPJINCD="+DNCNO);
				if(picList!=null && picList.size()>0){
					for(int i=0;i<picList.size();i++){
						Map<Object,Object> map = (Map<Object,Object>)picList.get(i);
							result+="<a href='#' onclick='javascript:viewTheReportPic("+map.get("id")+")'>"+map.get("value")+"</a>\t<img src='/images/small_delete.gif' onclick='javascript:deletePIC("+map.get("id")+")' border=0 style='cursor:hand' title='���ɾ��ͼƬ'><br/>";
					}
				}
			}
			if("upload".trim().equals(type)){
				try{
					conn = ConnectionPool.getConnection(path);
					String sql = "";
					if("1".trim().equals(saveType)){//����״̬
						sql = "INSERT INTO TB_PJR_M(ZLBM,PJRNO,DTCDT,TITLE,WJGS,NRMS,LXZP) values(?,?,?,?,?)";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						File f = new File(filedir);
						FileInputStream fis = new FileInputStream(f);
						pstmt.setInt(1, UUIdFactory.getMaxId(path, "TB_PJR_M"));
						pstmt.setString(2, gclsh);
						pstmt.setString(3, cjsj);
						pstmt.setString(4, zpbt);
						pstmt.setString(5, detail);
						pstmt.setString(6, zpms);
						pstmt.setBinaryStream(7, fis, (int) f.length());
						pstmt.executeUpdate();
						pstmt.close();
						conn.close();
					}
					if("2".trim().equals(saveType)){//������Ϣ
						
//						String xqfldm = request.getParameter("XQFL");
//						String xqbt = request.getParameter("XQBT");
//						String DAGLO = request.getParameter("CXBW");
//						String WTDPCD = request.getParameter("TBDW");
//						int id = UUIdFactory.getMaxId(path, "TB_PJR_M");
//						String mainSQL = "INSERT INTO TB_STDNC (DNCNO,PJNO,STTPCD,DNCNM,XQFLDM,WTDPCD)" +
//								"VALUES("+id+","+gclsh+","+DAGLO+",'"+xqbt+"'"+xqfldm+"','"+WTDPCD+"')";
//						Statement stmt = conn.createStatement();
//						stmt.execute(mainSQL);
						//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
						//���ϱ���,������,�ɼ�ʱ��,����,�ļ���ʽ,��������,¼����Ƭ
						sql = "INSERT INTO TB_STDNC_M(ZLBM,DNCNO,DTCDT,TITLE,WJGS,NRMS,LXZP) values(?,?,?,?,?,?,?)";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						File f = new File(filedir);
						FileInputStream fis = new FileInputStream(f);
						pstmt.setInt(1, UUIdFactory.getMaxId(path, "TB_STDNC_M"));
						pstmt.setString(2, DNCNO);
						pstmt.setString(3, cjsj);
						pstmt.setString(4, zpbt);
						pstmt.setString(5, detail);
						pstmt.setString(6, zpms);
						pstmt.setBinaryStream(7, fis, (int) f.length());
						pstmt.executeUpdate();
						pstmt.close();
						conn.close();
					}
					
				}catch(Exception ex){
					ex.printStackTrace();
				}
				List<Map<Object,Object>> picList = null;
				if("1".trim().equals(saveType)){//����״̬
					picList = BuinessDao.getSelectList("TB_PJR_M",new String[]{"ZLBM","TITLE"},path,"WHERE PJRNO="+gclsh);
				}
				if("2".trim().equals(saveType)){//������Ϣ
					//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
					//���ϱ���,������,�ɼ�ʱ��,����,�ļ���ʽ,��������,¼����Ƭ
					picList = BuinessDao.getSelectList("TB_STDNC_M",new String[]{"ZLBM","TITLE"},path,"WHERE DNCNO="+DNCNO);
				}
				if(picList!=null && picList.size()>0){
					for(int i=0;i<picList.size();i++){
						Map<Object,Object> map = (Map<Object,Object>)picList.get(i);
							result+="<a href='#' onclick='javascript:viewThePic("+map.get("id")+")'>"+map.get("value")+"</a>\t<img src='/images/small_delete.gif' onclick='javascript:deletePIC("+map.get("id")+")' border=0 style='cursor:hand' title='���ɾ��ͼƬ'><br/>";
					}
				}
				
			}
			if("viewpic".trim().equals(type)){
				try{
					conn = ConnectionPool.getConnection(path);

					String id=request.getParameter("picid");
					String strsql="";
					if("1".trim().equals(saveType)){//����״̬
						strsql = "SELECT * FROM TB_PJR_M WHERE ZLBM="+id;
					}
					if("2".trim().equals(saveType)){//������Ϣ
						//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
						//���ϱ���,������,�ɼ�ʱ��,����,�ļ���ʽ,��������,¼����Ƭ
						strsql = "SELECT * FROM TB_STDNC_M WHERE ZLBM="+id;
					}
					Statement stmt= conn.createStatement();
					ResultSet rs = stmt.executeQuery(strsql);
					if(rs.next()){
						result = rs.getString("TITLE")+","+rs.getString("DTCDT")+","+rs.getString("NRMS");
					}
					rs.close();
					stmt.close();
					conn.close();
				}catch(Exception ex){
					ex.printStackTrace();
				}
			}

			if("del".trim().equals(type)){
				conn = ConnectionPool.getConnection(path);

				String id=request.getParameter("picid");
				String strsql="";
				if("1".trim().equals(saveType)){//����״̬
					strsql = "delete FROM TB_PJR_M WHERE ZLBM="+id;
				}
				if("2".trim().equals(saveType)){//������Ϣ
					//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
					//���ϱ���,������,�ɼ�ʱ��,����,�ļ���ʽ,��������,¼����Ƭ
					List dnlist = BuinessDao.getSelectList("TB_STDNC_M",new String[]{"DNCNO","ZLBM"},path,"WHERE ZLBM="+id);
					if(dnlist != null && dnlist.size()>0){
						Map<Object,Object> map = (Map<Object,Object>)dnlist.get(0);
						DNCNO = map.get("id").toString();
					}
					strsql = "delete FROM TB_STDNC_M WHERE ZLBM="+id;
				}
				Statement stmt= conn.createStatement();
				stmt.executeUpdate(strsql);
				stmt.close();
				conn.close();
				List<Map<Object,Object>> picList = null;
				if("1".trim().equals(saveType)){//����״̬
					picList = BuinessDao.getSelectList("TB_PJR_M",new String[]{"ZLBM","TITLE"},path,"WHERE PJRNO="+gclsh);
				}
				if("2".trim().equals(saveType)){//������Ϣ
					//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
					//���ϱ���,������,�ɼ�ʱ��,����,�ļ���ʽ,��������,¼����Ƭ
					picList = BuinessDao.getSelectList("TB_STDNC_M",new String[]{"ZLBM","TITLE"},path,"WHERE DNCNO="+DNCNO);
				}
				if(picList!=null && picList.size()>0){
					for(int i=0;i<picList.size();i++){
						Map<Object,Object> map = (Map<Object,Object>)picList.get(i);
							result+="<a href='#' onclick='javascript:viewThePic("+map.get("id")+")'>"+map.get("value")+"</a>\t<img src='/images/small_delete.gif' onclick='javascript:deletePIC("+map.get("id")+")' border=0 style='cursor:hand' title='���ɾ��ͼƬ'><br/>";
					}
				}
				
			}
			if("gqcj".trim().equals(type)){
				String id = request.getParameter("changeVal");
				//��ù�������������������Ϣ
				//����ID ���ع��̱�ţ�
				PrjBean bean = BuinessDao.findBySql("select * from TB_PJ where PJNO="+id,path);
				String provnm = BuinessDao.getPrjCntname(bean.getCNTCD(), path);
				String gclyxx = BuinessDao.getPrjLyxx(bean.getPJNMCD(), path);
				String temp = provnm+"-"+gclyxx;
				String pictemp ="";
				List<Map<Object,Object>> picList = null;

				if("1".trim().equals(saveType)){//����״̬
					picList = BuinessDao.getSelectList("TB_PJR_M",new String[]{"ZLBM","TITLE"},path,"WHERE PJRNO="+id);
					if(picList!=null && picList.size()>0){
						for(int i=0;i<picList.size();i++){
							Map<Object,Object> map = (Map<Object,Object>)picList.get(i);
							pictemp+="<a href='#' onclick='javascript:viewThePic("+map.get("id")+")'>"+map.get("value")+"</a>\t<img src='/images/small_delete.gif' onclick='javascript:deletePIC("+map.get("id")+")' border=0 style='cursor:hand' title='���ɾ��ͼƬ'><br/>";
						}
					}
				}
				if("2".trim().equals(saveType)){//������Ϣ
					//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
					//���ϱ���,������,�ɼ�ʱ��,����,�ļ���ʽ,��������,¼����Ƭ
//					picList = BuinessDao.getSelectList("TB_STDNC_M",new String[]{"ZLBM","TITLE"},path,"WHERE DNCNO="+id);
					pictemp="";
				}
				
				result=temp+"|"+pictemp;
				
			}
			response.setContentType("text/xml");
			response.setHeader("Charset", "gb2312");
			response.addHeader("Cache-Control", "no-cache");
			response.getWriter().write(new String(result.getBytes("utf-8"), "iso-8859-1"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
