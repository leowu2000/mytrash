package com.buiness.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.buiness.dao.BuinessDao;
import com.buiness.form.PrjBean;

public class BuinessController implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
            HttpServletResponse response)throws Exception{
		String path = request.getRealPath("/");
		String actionType = request.getParameter("actionType");
		
		if("add".trim().equals(actionType)){
			String gcnm=new String(request.getParameter("PJNM").getBytes("ISO-8859-1"),"GBK");
			String gclb=request.getParameter("gclb");
			String cntcd=request.getParameter("cntcd");
			String hldm=request.getParameter("hldm");
			String gcdm = gclb+hldm.substring(1, 7)+cntcd.substring(0, 1);
			String SQL = "INSERT INTO TB_PJ(PJNMCD,PJNM,CNTCD,FPDUTY,FPDUTYPH)VALUES('"
						+gcdm+"','"+gcnm+"','"+cntcd+"','','')";
			BuinessDao.insertDB(SQL, path);

	        return new ModelAndView("project/prgManage");
		}
		if("del".trim().equals(actionType)){
			String IDs = request.getParameter("IDs");
			
			String SQL = "DELETE FROM TB_PJ WHERE PJNMCD IN("+IDs+")";
			BuinessDao.deleteDB(SQL, path);
			return new ModelAndView("project/prgManage");
		}
		if("peredit".trim().equals(actionType)){
			String IDs = request.getParameter("IDs");
			
			String SQL = "select * FROM TB_PJ WHERE PJNMCD ="+IDs+"";
			PrjBean bean = BuinessDao.findBySql(SQL, path);
			request.setAttribute("bean", bean);
			return new ModelAndView("project/prgEdit");
		}
		return null;
   }
}
