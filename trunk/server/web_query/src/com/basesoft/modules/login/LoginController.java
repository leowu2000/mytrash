package com.basesoft.modules.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;

import com.basesoft.core.CommonController;

public class LoginController extends CommonController {

	LoginDAO loginDAO;
	
	@Override
	protected ModelAndView doHandleRequestInternal(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception {
		// TODO Auto-generated method stub
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		
		if("login".equals(action)){
			String username = ServletRequestUtils.getStringParameter(request, "username", "");
			String password = ServletRequestUtils.getStringParameter(request, "password", "");
			response.sendRedirect("/main/mainFrame.jsp");
		}
		
		return null;
	}

	public void setLoginDAO(LoginDAO loginDAO){
		this.loginDAO = loginDAO;
	}
}
