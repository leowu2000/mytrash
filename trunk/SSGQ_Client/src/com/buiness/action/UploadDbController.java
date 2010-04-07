package com.buiness.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.buiness.dao.BuinessDao;
import com.core.UUIdFactory;
import com.upload.UploadBean;
import com.upload.UploadDB;
import com.util.OutputLog;
import com.util.RandomAccessFileTool;
import com.util.ToZipFile;
import com.util.UtilDateTime;

public class UploadDbController implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
            HttpServletResponse response)throws Exception{
		String path = request.getSession().getServletContext().getRealPath("/");
		String actionType = request.getParameter("actionType");
		if("manage".trim().equals(actionType)){
			BuinessDao.deleteDB("delete from TEMP_RESULT", path);
			UploadDB.getLocalRecords(path);
			return new ModelAndView("sys/uploadManage");
		}
		if("upload".trim().equals(actionType)){
			String delSQL = "delete from TB_PICKREC";
			BuinessDao.updateDB(delSQL, path);
			//���ϴ�������Ϣ������TB_PICKREC��
			List<UploadBean> records = UploadDB.getUploadRecords(path);
			if(records!=null && records.size()>0){
				for(int i=0;i<records.size();i++){
					int id = UUIdFactory.getMaxId(path, "TB_PICKREC", "ZLBM");
					UploadBean bean = (UploadBean)records.get(i);
					String insertSQL = "INSERT INTO TB_PICKREC (ZLBM,WTDPCD,FENLEI,MEDIASIZE," 
							+"NUM,WTDPDT)VALUES("+id+",'"+bean.getWTDPCD()+"','"+bean.getTbcname()
							+"',1,"+bean.getNum()+",#"+bean.getWTDPDT()+"#)";
					BuinessDao.insertDB(insertSQL, path);
				}
			}
			//ɾ��temp_result��ʱ������
			delSQL = "delete from temp_result";
			BuinessDao.updateDB(delSQL, path);
			//���upload���ݿ�
			UploadDB.DAO_MODE_ZAP(path);
			//��ʼ��������
			String newfile = "";
			String file = path+newfile+".zip";
			boolean flg = UploadDB.copySendDataToUploadDatabase(path);
			if(flg){//ѹ�����ݿ�
				String oldfile="upload.mdb";
				newfile=UtilDateTime.nowString()+".mdb";
				RandomAccessFileTool.doAccess(path,oldfile, newfile);
				ToZipFile.zipFile(path+newfile,path+newfile+".zip");
				OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t׼���ϴ�����\tѹ�����ݳɹ�...");
			}
			OutputLog.outputLog(path, "============================================================");
			//����Զ�̷���������ʼ��������
			request.setAttribute("file", file);
			return new ModelAndView("sys/upload");
//			ConfigBean configBean = (ConfigBean)request.getSession().getAttribute("configBean");
//			String ipAddress = configBean.getSERVER_IP();
//			String serverName = configBean.getSERVER_NAME();
//			String serverPort = configBean.getSERVER_NAME();
			
		}
		return null;
	}
}