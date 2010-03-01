package com.buiness.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.buiness.dao.BuinessDao;
import com.core.UUIdFactory;
import com.util.RandomAccessFileExample;
import com.util.ToZipFile;
import com.util.UploadBean;
import com.util.UploadDB;

public class UploadDbController implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
            HttpServletResponse response)throws Exception{
		String path = request.getSession().getServletContext().getRealPath("/");
		String actionType = request.getParameter("actionType");
		if("upload".trim().equals(actionType)){
			//将上传数据信息拷备到TB_PICKREC中
			String delSQL = "delete from TB_PICKREC";
			BuinessDao.updateDB(delSQL, path);
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
			//删除temp_result临时表数据
			delSQL = "delete from temp_result";
			BuinessDao.updateDB(delSQL, path);
			//清空upload数据库
			UploadDB.DAO_MODE_ZAP(path);
			//开始拷备数据
			boolean flg = UploadDB.copySendDataToUploadDatabase(path);
			if(flg){//压缩数据库
				String oldfile="upload.mdb";
				String newfile="dbback.mdb";
				RandomAccessFileExample.doAccess(path,oldfile, newfile);
				ToZipFile.zipFile(path+newfile,path+"upload.zip");
			}
			//连接远程服务器，开始传送数据
		}
		return null;
	}
}
