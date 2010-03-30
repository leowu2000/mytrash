package com.basesoft.modules.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;

import com.basesoft.core.CommonController;
import com.basesoft.core.PageList;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.json.JettisonMappedXmlDriver;

public class UserController extends CommonController {

	UserDAO userDAO;
	
	@Override
	protected ModelAndView doHandleRequestInternal(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception {
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		
		if("list".equals(action)){
			mv = new ModelAndView("modules/user/list");
			
			PageList pageList = userDAO.findAll(page);
			
			mv.addObject("pageList", pageList);
			return mv;
		}else if("add".equals(action)){
			String name = ServletRequestUtils.getStringParameter(request, "name", "");
			String pass = ServletRequestUtils.getStringParameter(request, "pass", "");
			String nt = ServletRequestUtils.getStringParameter(request, "nt", "");
			String auth = ServletRequestUtils.getStringParameter(request, "auth", "");
			
			String insertSql = "insert into TB_USER values('" + name + "', '" + auth + "', '" + pass + "', '" + nt + "')";
			userDAO.jdbcTemplate.execute(insertSql);
			
			response.sendRedirect("user.do?action=list&page=" + page);
			return null;
		}else if("query".equals(action)){
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			User user = userDAO.findById(id);
			XStream xstream = new XStream(new JettisonMappedXmlDriver());
			xstream.alias("item", User.class);
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0L);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().write(xstream.toXML(user));
			response.getWriter().close();
			return null;
		}else if("update".equals(action)){
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			String name = ServletRequestUtils.getStringParameter(request, "name", "");
			String pass = ServletRequestUtils.getStringParameter(request, "pass", "");
			String nt = ServletRequestUtils.getStringParameter(request, "nt", "");
			String auth = ServletRequestUtils.getStringParameter(request, "auth", "");
			
			String updateSql = "update TB_USER set NAME='" + name + "', AUTH='" + auth + "', PASS='" + pass + "', NT='" + nt + "' where NAME='" + id + "'";
			userDAO.jdbcTemplate.execute(updateSql);
			
			response.sendRedirect("user.do?action=list&page=" + page);
		}else if("delete".equals(action)){
			String[] check=request.getParameterValues("check");
			for(int i=0;i<check.length;i++){
				String deleteSql = "delete from TB_USER where NAME='" + check[i] + "'";
				userDAO.jdbcTemplate.execute(deleteSql);
			}
			
			response.sendRedirect("user.do?action=list&page=" + page);
			return null;
		}else if("validate".equals(action)){
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			User user = userDAO.findById(id);
			String b = "false";
			if(user.getName()==null){
				b = "true";
			}
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("application/ms-excel;charset=utf-8");
			response.setHeader("Content-Disposition","attachment;filename=report.xls");
			response.getWriter().write(b);
			response.getWriter().close();
			return null;
		}
		
		return null;
	}

	public void setUserDAO(UserDAO userDAO){
		this.userDAO = userDAO;
	}
}
