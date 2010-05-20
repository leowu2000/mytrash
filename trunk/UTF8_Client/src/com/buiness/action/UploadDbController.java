package com.buiness.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.buiness.dao.BuinessDao;
import com.upload.UploadDB;

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
		return null;
	}
}
