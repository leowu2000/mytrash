package com.basesoft.modules.detail;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;

import com.basesoft.core.CommonController;

public class DetailController extends CommonController {

	DetailDAO detailDAO;
	
	@Override
	protected ModelAndView doHandleRequestInternal(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception {
		
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		
		if("fxjb".equals(action)){
			mv = new ModelAndView("modules/detail/detail_fxjb");
			
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			String tbdw = ServletRequestUtils.getStringParameter(request, "tbdw", "");
			tbdw = new String(tbdw.getBytes("ISO8859-1"),"GBK");
			
			//得到防汛简报和防汛简报多媒体信息
			Map mapFxjb = detailDAO.getFxjb(id);
			List listFxjb_m = detailDAO.getFxjb_m(id);
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapFxjb", mapFxjb);
			mv.addObject("listFxjb_m", listFxjb_m);
		}else if("fxxd".equals(action)){
			mv = new ModelAndView("modules/detail/detail_fxxd");
			
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			String tbdw = ServletRequestUtils.getStringParameter(request, "tbdw", "");
			tbdw = new String(tbdw.getBytes("ISO8859-1"),"GBK");
			
			//得到防汛简报和防汛简报多媒体信息
			Map mapFxxd = detailDAO.getFxxd(id);
			List listFxxd_m = detailDAO.getFxxd_m(id);
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapFxxd", mapFxxd);
			mv.addObject("listFxxd_m", listFxxd_m);
		}
		
		return mv;
	}

	public void setDetailDAO(DetailDAO detailDAO) {
		this.detailDAO = detailDAO;
	}
}
