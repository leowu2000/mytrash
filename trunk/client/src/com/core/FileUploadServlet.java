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
			String filedir = request.getParameter("filepath");
			String cjsj = request.getParameter("cjsjvalue");
			String zpbt = request.getParameter("zpbtvalue");
			String zpms = request.getParameter("zpmsvalue");
			String detail = request.getParameter("detailvalue");
			Connection conn = null;
			String result = "";
			if("upload".trim().equals(type)){
				try{
					conn = ConnectionPool.getConnection(path);
					String sql = "";
					if("1".trim().equals(saveType)){//运行状态
						sql = "INSERT INTO TB_PJR_M(ZLBM,PJRNO,DTCDT,TITLE,WJGS,NRMS,LXZP) values(?,?,?,?,?,?,?)";
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
					if("2".trim().equals(saveType)){//险情信息
						String xqfldm = request.getParameter("xqfldm");
						String xqbt = request.getParameter("xqbt");
						String DAGLO = request.getParameter("DAGLO");
						String WTDPCD = request.getParameter("WTDPCD");
						int id = UUIdFactory.getMaxId(path, "TB_PJR_M");
						String mainSQL = "INSERT INTO TB_STDNC (DNCNO,PJNO,STTPCD,DNCNM,XQFLDM,WTDPCD)" +
								"VALUES("+id+","+gclsh+","+DAGLO+",'"+xqbt+"'"+xqfldm+"','"+WTDPCD+"')";
						Statement stmt = conn.createStatement();
						stmt.execute(mainSQL);
						//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
						//资料编码,险情编号,采集时间,标题,文件格式,内容描述,录像照片
						sql = "INSERT INTO TB_STDNC_M(ZLBM,DNCNO,DTCDT,TITLE,WJGS,NRMS,LXZP) values(?,?,?,?,?,?,?)";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						File f = new File(filedir);
						FileInputStream fis = new FileInputStream(f);
						pstmt.setInt(1, UUIdFactory.getMaxId(path, "TB_PJR_M"));
						pstmt.setString(2, String.valueOf(id));
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
				if("1".trim().equals(saveType)){//运行状态
					picList = BuinessDao.getSelectList("TB_PJR_M",new String[]{"ZLBM","TITLE"},path,"WHERE PJRNO="+gclsh);
				}
				if("2".trim().equals(saveType)){//险情信息
					//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
					//资料编码,险情编号,采集时间,标题,文件格式,内容描述,录像照片
					picList = BuinessDao.getSelectList("TB_STDNC_M",new String[]{"ZLBM","TITLE"},path,"WHERE PJRNO="+gclsh);
				}
				if(picList!=null && picList.size()>0){
					for(int i=0;i<picList.size();i++){
						Map<Object,Object> map = (Map<Object,Object>)picList.get(i);
							result+="<a href='#' onclick='javascript:viewThePic("+map.get("id")+")'>"+map.get("value")+"</a>\t<img src='/images/small_delete.gif' onclick='javascript:deletePIC("+map.get("id")+")' border=0 style='cursor:hand' title='点击删除图片'><br/>";
					}
				}
				
			}
			if("viewpic".trim().equals(type)){
				try{
					conn = ConnectionPool.getConnection(path);

					String id=request.getParameter("picid");
					String strsql="";
					if("1".trim().equals(saveType)){//运行状态
						strsql = "SELECT * FROM TB_PJR_M WHERE ZLBM="+id;
					}
					if("2".trim().equals(saveType)){//险情信息
						//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
						//资料编码,险情编号,采集时间,标题,文件格式,内容描述,录像照片
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
				if("1".trim().equals(saveType)){//运行状态
					strsql = "delete FROM TB_PJR_M WHERE ZLBM="+id;
				}
				if("2".trim().equals(saveType)){//险情信息
					//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
					//资料编码,险情编号,采集时间,标题,文件格式,内容描述,录像照片
					strsql = "delete FROM TB_STDNC_M WHERE ZLBM="+id;
				}
				Statement stmt= conn.createStatement();
				stmt.executeUpdate(strsql);
				stmt.close();
				conn.close();
				List<Map<Object,Object>> picList = null;
				if("1".trim().equals(saveType)){//运行状态
					picList = BuinessDao.getSelectList("TB_PJR_M",new String[]{"ZLBM","TITLE"},path,"WHERE PJRNO="+gclsh);
				}
				if("2".trim().equals(saveType)){//险情信息
					//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
					//资料编码,险情编号,采集时间,标题,文件格式,内容描述,录像照片
					picList = BuinessDao.getSelectList("TB_STDNC_M",new String[]{"ZLBM","TITLE"},path,"WHERE PJRNO="+gclsh);
				}
				if(picList!=null && picList.size()>0){
					for(int i=0;i<picList.size();i++){
						Map<Object,Object> map = (Map<Object,Object>)picList.get(i);
							result+="<a href='#' onclick='javascript:viewThePic("+map.get("id")+")'>"+map.get("value")+"</a>\t<img src='/images/small_delete.gif' onclick='javascript:deletePIC("+map.get("id")+")' border=0 style='cursor:hand' title='点击删除图片'><br/>";
					}
				}
				
			}
			if("gqcj".trim().equals(type)){
				String id = request.getParameter("changeVal");
				//获得工程行政区划和流域信息
				//根据ID 返回工程编号，
				PrjBean bean = BuinessDao.findBySql("select * from TB_PJ where PJNO="+id,path);
				String provnm = BuinessDao.getPrjCntname(bean.getCNTCD(), path);
				String gclyxx = BuinessDao.getPrjLyxx(bean.getPJNMCD(), path);
				String temp = provnm+"-"+gclyxx;
				String pictemp ="";
				List<Map<Object,Object>> picList = null;

				if("1".trim().equals(saveType)){//运行状态
					picList = BuinessDao.getSelectList("TB_PJR_M",new String[]{"ZLBM","TITLE"},path,"WHERE PJRNO="+id);
				}
				if("2".trim().equals(saveType)){//险情信息
					//ZLBM	DNCND	DTCDT	TITLE	WJGS	NRMS	LXZP
					//资料编码,险情编号,采集时间,标题,文件格式,内容描述,录像照片
					picList = BuinessDao.getSelectList("TB_STDNC_M",new String[]{"ZLBM","TITLE"},path,"WHERE PJRNO="+id);
				}
				if(picList!=null && picList.size()>0){
					for(int i=0;i<picList.size();i++){
						Map<Object,Object> map = (Map<Object,Object>)picList.get(i);
						pictemp+="<a href='#' onclick='javascript:viewThePic("+map.get("id")+")'>"+map.get("value")+"</a>\t<img src='/images/small_delete.gif' onclick='javascript:deletePIC("+map.get("id")+")' border=0 style='cursor:hand' title='点击删除图片'><br/>";
					}
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
