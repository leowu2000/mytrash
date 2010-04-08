package com.core;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;

import com.buiness.dao.BuinessDao;
import com.buiness.form.PrjBean;
import com.buiness.form.SubTempBean;

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
			String path = request.getSession().getServletContext().getRealPath("/");
			String type=request.getParameter("type");
			
			String time = request.getParameter("cjsjvalue");
			
			String detail = request.getParameter("detailvalue");
			String delFlg = request.getParameter("delFlg");
			String tabname = request.getParameter("tabname");

			Connection conn = null;
			String result_head="<table width='100%'>";
			String result = "";
			String result_detail="</table>";
			String DNCNO = request.getParameter("DNCNO");//report 共用
			if("download".equals(type)){
				String tablename = request.getParameter("tablename");
				String media_id = request.getParameter("media_id");

				Map map = BuinessDao.getMediaContent(path,tablename,media_id);
				String filename = BuinessDao.idToNameChange(path, tablename, "title", " ZLBM="+media_id);
				String WJGS = BuinessDao.idToNameChange(path, tablename, "WJGS", " ZLBM="+media_id);
				byte[] b = (byte[])map.get("lxzp");
				
				response.reset();
	            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("gbk"),"iso8859-1")+"."+WJGS);
	            response.setContentType("application/octet-stream");
	            //输出文件

	            OutputStream os = new BufferedOutputStream(response.getOutputStream());
	            os.write(b);
	            os.flush();
	            os.close();

			}else{
				if("report".trim().equals(type)){
					String filedir = request.getParameter("filepath");//report 共用
					filedir = java.net.URLDecoder.decode(filedir,"utf-8");
					String zpbt = request.getParameter("zpbtvalue");//report 共用
					zpbt = java.net.URLDecoder.decode(zpbt,"utf-8");
					String zpms = request.getParameter("zpmsvalue");
					zpms = java.net.URLDecoder.decode(zpms,"utf-8");
					time=time==""?request.getParameter("time"):time;
					time = java.net.URLDecoder.decode(time,"utf-8");
	//				conn = ConnectionPool.getConnection(path);
					if("1".trim().equals(delFlg))
						BuinessDao.deleteTempMedia(path);
					BuinessDao.insertTempMedia(path, DNCNO, time, zpbt, detail, zpms, filedir, tabname);
				}
				if("viewpic".trim().equals(type)){
					try{
						conn = ConnectionPool.getConnection(path);
	
						String id=request.getParameter("picid");
						String strsql= "SELECT * FROM TB_SUB_TEMP WHERE ZLBM="+id;
						Statement stmt= conn.createStatement();
						ResultSet rs = stmt.executeQuery(strsql);
						if(rs.next()){
							result = rs.getString("TITLE")+","+rs.getString("DTCDT")+","+rs.getString("NRMS")+","+rs.getString("LXZP");
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
						strsql = "delete FROM TB_SUB_TEMP WHERE ZLBM="+id;
					Statement stmt= conn.createStatement();
					stmt.executeUpdate(strsql);
					stmt.close();
					conn.close();
					List picList = BuinessDao.getMediaList(path, DNCNO, tabname);
					if(picList!=null && picList.size()>0){
						for(int i=0;i<picList.size();i++){
							SubTempBean bean = (SubTempBean)picList.get(i);
								result+="<tr><td><a href='#' onclick='javascript:viewThePic("+bean.getZLBM()+")'>"+bean.getTITLE()+"</a></td><td><img src='/images/small_delete.gif' onclick='javascript:deletePIC("+bean.getZLBM()+")' border=0 style='cursor:hand' title='点击删除图片'></td></tr>";
						}
					}
					result = result_head+result+result_detail;
					
				}
				if("gqcj".trim().equals(type)){
					String id = request.getParameter("changeVal");
					//获得工程行政区划和流域信息
					//根据ID 返回工程编号，
					PrjBean bean = BuinessDao.findBySql("select * from TB_PJ where PJNO="+id,path);
					String provnm = BuinessDao.getPrjCntname(bean.getCNTCD(), path);
					String gclyxx = BuinessDao.getPrjLyxx(bean.getPJNMCD(), path);
					String temp = provnm+"-"+gclyxx;
					String subtype = request.getParameter("subtype");
					if(subtype!=null && "yx".trim().equals(subtype)){
						String gclbcd=bean.getPJNMCD().substring(0,1);
						String jspcode="";
						String gclbnm = BuinessDao.idToNameChange(path,"TB_GCLB", "GCFLMC",  "GCFLDM='"+gclbcd+"'");
						if("D".trim().equals(gclbcd)
								||"E".trim().equals(gclbcd)
								||"H".trim().equals(gclbcd)
								||"P".trim().equals(gclbcd))
							jspcode="A";
						else
							jspcode = gclbcd;
						result=temp+";"+jspcode+";"+gclbnm+";"+gclbcd;
					}else{
						result=temp;
					}
				}
				
				if("delpic".trim().equals(type)){
					String tablename=request.getParameter("tablename");
					String picid = request.getParameter("picid");
					BuinessDao.deleteDB("delete from "+tablename+" where zlbm="+picid, path);
					result="sucess";
				}
				if("pre_updatepic".trim().equals(type)){
					String tablename=request.getParameter("tablename");
					String picid = request.getParameter("picid");
					SubTempBean bean = BuinessDao.findMediaBeanById(path, picid, tablename);
					if(bean!=null)
						result=bean.getTITLE()+";"+bean.getDTCDT()+";"+bean.getNRMS();
					else
						result="";
				}
				if("updateMediaMsg".trim().equals(type)){
					String tablename=request.getParameter("tablename");
					String picid = request.getParameter("picid");
					String title = request.getParameter("title");
					title = java.net.URLDecoder.decode(title,"utf-8");
					String dtcdt= request.getParameter("dtcdt");
					dtcdt = java.net.URLDecoder.decode(dtcdt,"utf-8");
					String nrms= request.getParameter("nrms");
					nrms = java.net.URLDecoder.decode(nrms,"utf-8");
					BuinessDao.updateDB("update "+tablename+" set title='"+title+"',dtcdt=#"+dtcdt
							+"#,nrms='"+nrms+"' where zlbm="+picid, path);
					
					result="sucess";
				}
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setDateHeader("Expires", 0L);
				response.setContentType("text ml; charset=GBK");
				response.getWriter().write(result);
//			response.getWriter().close();
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
