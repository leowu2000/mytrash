package com.upload;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buiness.dao.BuinessDao;
import com.buiness.form.ConfigBean;
import com.core.UUIdFactory;
import com.util.OutputLog;
import com.util.RandomAccessFileTool;
import com.util.ToZipFile;
import com.util.UtilDateTime;

public class UploadServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UploadServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		// cntcd,PROVNM
		String result = "";
		String path = request.getSession().getServletContext().getRealPath("/");
		String type=request.getParameter("type");
		if("zip".trim().equals(type)){
			request.getSession().setAttribute("servletState", "����׼������...");
			String delSQL = "delete from TB_PICKREC";
			BuinessDao.updateDB(delSQL, path);
			// ���ϴ�������Ϣ������TB_PICKREC��
			List<UploadBean> records = UploadDB.getUploadRecords(path);
			if (records != null && records.size() > 0) {
				for (int i = 0; i < records.size(); i++) {
					int id = UUIdFactory.getMaxId(path, "TB_PICKREC", "ZLBM");
					UploadBean bean = (UploadBean) records.get(i);
					String insertSQL = "INSERT INTO TB_PICKREC (ZLBM,WTDPCD,FENLEI,MEDIASIZE,"
							+ "NUM,WTDPDT)VALUES("+ id+ ",'"+ bean.getWTDPCD()
							+ "','"+ bean.getTbcname()+ "',1,"+ bean.getNum()
							+ ",#" + bean.getWTDPDT() + "#)";
					BuinessDao.insertDB(insertSQL, path);
				}
				request.getSession().setAttribute("servletState", "���ڸ�������...");
				result = "���ڸ�������...";
			}
			// ɾ��temp_result��ʱ������
			delSQL = "delete from temp_result";
			BuinessDao.updateDB(delSQL, path);
			// ���upload���ݿ�
			UploadDB.DAO_MODE_ZAP(path);
			// ��ʼ��������
			String newfile = "";
			String file = path + newfile + ".zip";
			boolean flg = UploadDB.copySendDataToUploadDatabase(path);
			if (flg) {// ѹ�����ݿ�
				String oldfile = "upload.mdb";
				newfile = UtilDateTime.nowString() + ".mdb";
				RandomAccessFileTool.doAccess(path, oldfile, newfile);
				try {
					ToZipFile.zipFile(path + newfile, path + newfile + ".zip");
					OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()
							+ "\tѹ�����ݳɹ�...");
					request.getSession().setAttribute("zipfilename", path + newfile + ".zip");
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			OutputLog.outputLog(path,
					"============================================================");			
			response.setContentType("text/xml");
			response.setHeader("Charset", "gb2312");
			response.addHeader("Cache-Control", "no-cache");
			response.getWriter().write(
					new String(result.getBytes("utf-8"), "iso-8859-1"));
		}
		// ����Զ�̷���������ʼ��������
		if("connect".trim().equals(type)){
			ConfigBean configbean = (ConfigBean)request.getSession().getAttribute("configBean");
			String ip = configbean.getSERVER_IP();
			String name = configbean.getSERVER_NAME();
			String port = configbean.getSERVER_PORT();
			if("".trim().equals(ip)||ip==null
					|| "".trim().equals(name)||name==null
					|| "".trim().equals(port)||port==null){
				result = "error,����Զ�̷�������������ϵͳ���в������ã�";
				OutputLog.outputLog(path,
				"============����Զ�̷���������=======�ϴ�ʧ�ܣ�=======");
			}else{
				DataUploader data = new DataUploader();
				data.upload(ip,Integer.parseInt(port), (String)request.getSession().getAttribute("zipfilename"));
				OutputLog.outputLog(path,
				"============����Զ�̷���������=======�ϴ�ʧ�ܣ�=======");
			}
		}
		if("state".trim().equals(type)){
			String sate = (String)request.getSession().getAttribute("servletState");
			response.setContentType("text/xml");
			response.setHeader("Charset", "gb2312");
			response.addHeader("Cache-Control", "no-cache");
			response.getWriter().write(
					new String(sate.getBytes("utf-8"), "iso-8859-1"));
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}
}
