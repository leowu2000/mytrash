package com.basesoft.modules.consult;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;

import com.basesoft.core.CommonController;

public class ConsultController extends CommonController {

	ConsultDAO consultDAO;
	
	@Override
	protected ModelAndView doHandleRequestInternal(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception {
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		
		if("add".equals(action)){//加入会商
			String type = ServletRequestUtils.getStringParameter(request, "type", "");
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			
			String message = "";
			
			if("fxxd".equals(type)){//防汛行动
				message = consultDAO.addConsultFxxd(id);
			}else if("xq".equals(type)){//险情
				message = consultDAO.addConsultXq(id);
			}else if("yxzt".equals(type)){//运行状态
				message = consultDAO.addConsultYxzt(id);
			}else if("zq".equals(type)){//灾情
				message = consultDAO.addConsultZq(id);
			}
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0L);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().write(message);
			response.getWriter().close();
			return null;
		}else if("manage".equals(action)){
			mv = new ModelAndView("modules/manage/manage_consult");
			
			List listFxxd = consultDAO.findConsultFxxd();
			List listXq = consultDAO.findConsultXq();
			List listYxzt = consultDAO.findConsultYxzt();
			List listZq = consultDAO.findConsultZq();
			
			mv.addObject("listFxxd", listFxxd);
			mv.addObject("listXq", listXq);
			mv.addObject("listYxzt", listYxzt);
			mv.addObject("listZq", listZq);
		}else if("delete".equals(action)){
			int row_count = ServletRequestUtils.getIntParameter(request, "row_count", 0);
			
			for(int i=1;i<row_count+1;i++){
				String id = ServletRequestUtils.getStringParameter(request, "checkbox"+i, "");
				
				if(!"".equals(id)){
					String type = ServletRequestUtils.getStringParameter(request, "typename"+i, "");
					
					consultDAO.deleteConsult(id, type);					
				}
			}
			
			response.sendRedirect("consult.do?action=manage");
			return null;
		}
		
		return mv;
	}

	public void setConsultDAO(ConsultDAO consultDAO){
		this.consultDAO = consultDAO;
	}
}
