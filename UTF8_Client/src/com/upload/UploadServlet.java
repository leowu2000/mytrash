package com.upload;

import java.io.File;
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
		
		String path = request.getSession().getServletContext().getRealPath("/");
		String type=request.getParameter("type");
		if("zip".trim().equals(type)){
			String delSQL = "delete from TB_PICKREC";
			BuinessDao.updateDB(delSQL, path);
			// 将上传数据信息拷备到TB_PICKREC中
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
			}
			// 删除temp_result临时表数据
			delSQL = "delete from temp_result";
			BuinessDao.updateDB(delSQL, path);
			// 清空upload数据库
			UploadDB.DAO_MODE_ZAP(path);
			// 开始拷备数据
			String newfile = "";
			String file = path + newfile + ".zip";
			boolean flg = UploadDB.copySendDataToUploadDatabase(path);
			if (flg) {// 压缩数据库
				String oldfile = "upload.mdb";
				newfile = UtilDateTime.nowString() + ".mdb";
				RandomAccessFileTool.doAccess(path, oldfile, newfile);
				try {
					ToZipFile.zipFile(path + newfile, path + newfile + ".zip");
					OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()
							+ "\t压缩数据成功...");
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
					new String("1".getBytes("utf-8"), "iso-8859-1"));
		}
		// 连接远程服务器，开始传送数据
		if("connect".trim().equals(type)){
			ConfigBean configbean = (ConfigBean)request.getSession().getAttribute("configBean");
			String zipfilename = (String)request.getSession().getAttribute("zipfilename");
			String ip = configbean.getSERVER_IP();
			String name = configbean.getSERVER_NAME();
			String port = configbean.getSERVER_PORT();
			String state="";
			if("".trim().equals(ip)||ip==null
					|| "".trim().equals(name)||name==null
					|| "".trim().equals(port)||port==null){
				OutputLog.outputLog(path,
				"============连接远程服务器错误=======上传失败！=======");
				state="0";
			}else{
				DataUploader data = new DataUploader();
				state=data.upload(ip,Integer.parseInt(port),zipfilename );
				OutputLog.outputLog(path,
				"============数据上传成功！=======");
				
			}
			File file = new File(zipfilename);
			file.delete();
			response.setContentType("text/xml");
			response.setHeader("Charset", "gb2312");
			response.addHeader("Cache-Control", "no-cache");
			response.getWriter().write(
					new String(state.getBytes("utf-8"), "iso-8859-1"));
		}

	}

	public void init() throws ServletException {
		// Put your code here
	}
}
