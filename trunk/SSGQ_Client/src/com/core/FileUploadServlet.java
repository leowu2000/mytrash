package com.core;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
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
			String DNCNO = request.getParameter("DNCNO");//report ����
			if("report".trim().equals(type)){
				String filedir = new String(request.getParameter("filepath").getBytes("ISO-8859-1"),"GBK");//report ����
				String zpbt = new String(request.getParameter("zpbtvalue").getBytes("ISO-8859-1"),"GBK");//report ����
				String zpms = new String(request.getParameter("zpmsvalue").getBytes("ISO-8859-1"),"GBK");
				time=time==""?request.getParameter("time"):time;
				conn = ConnectionPool.getConnection(path);
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
							result+="<tr><td><a href='#' onclick='javascript:viewThePic("+bean.getZLBM()+")'>"+bean.getTITLE()+"</a></td><td><img src='/images/small_delete.gif' onclick='javascript:deletePIC("+bean.getZLBM()+")' border=0 style='cursor:hand' title='���ɾ��ͼƬ'></td></tr>";
					}
				}
				result = result_head+result+result_detail;
				
			}
			if("gqcj".trim().equals(type)){
				String id = request.getParameter("changeVal");
				//��ù�������������������Ϣ
				//����ID ���ع��̱�ţ�
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
				String title = new String(request.getParameter("title").getBytes("ISO-8859-1"),"GBK");
				String dtcdt= request.getParameter("dtcdt");
				String nrms= new String(request.getParameter("nrms").getBytes("ISO-8859-1"),"GBK");
				BuinessDao.updateDB("update "+tablename+" set title='"+title+"',dtcdt=#"+dtcdt
						+"#,nrms='"+nrms+"' where zlbm="+picid, path);
				
				result="sucess";
			}
//			response.setContentType("text/xml");
//			response.setHeader("Charset", "gb2312");
//			response.addHeader("Cache-Control", "no-cache");
//			response.getWriter().write(new String(result.getBytes("utf-8"), "iso-8859-1"));
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0L);
			response.setContentType("text ml; charset=GBK");
			response.getWriter().write(result);
			if("download".equals(type)){
				String tablename = request.getParameter("tablename");
				String media_id = request.getParameter("media_id");
				String filename = new String(request.getParameter("filename").getBytes("ISO-8859-1"),"GBK");
				
				Map map = BuinessDao.getMediaContent(path,tablename,media_id);
				
				byte[] b = (byte[])map.get("lxzp");
				
				response.reset();
	            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("gbk"),"iso8859-1"));
	            response.setContentType("application/octet-stream");
	            //����ļ�
	            OutputStream os = new BufferedOutputStream(response.getOutputStream());
	            os.write(b);
	            os.flush();
	            os.close();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}