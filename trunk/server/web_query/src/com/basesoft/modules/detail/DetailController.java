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
			
			//得到防汛行动和防汛行动多媒体信息
			Map mapFxxd = detailDAO.getFxxd(id);
			List listFxxd_m = detailDAO.getFxxd_m(id);
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapFxxd", mapFxxd);
			mv.addObject("listFxxd_m", listFxxd_m);
		}else if("hq".equals(action)){//旱情
			mv = new ModelAndView("modules/detail/detail_hq");
			
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			String tbdw = ServletRequestUtils.getStringParameter(request, "tbdw", "");
			tbdw = new String(tbdw.getBytes("ISO8859-1"),"GBK");
			
			//得到旱情信息和旱情多媒体信息
			Map mapHq = detailDAO.getHq(id);
			List listHq_m = detailDAO.getHq_m(id);
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapHq", mapHq);
			mv.addObject("listHq_m", listHq_m);
		}else if("xq".equals(action)){//险情
			mv = new ModelAndView("modules/detail/detail_xq");
			
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			String tbdw = ServletRequestUtils.getStringParameter(request, "tbdw", "");
			tbdw = new String(tbdw.getBytes("ISO8859-1"),"GBK");
			
			//得到险情信息和险情多媒体信息
			Map mapXq = detailDAO.getXq(id);
			List listXq_m = detailDAO.getXq_m(id);
			Map mapXq_s = detailDAO.getXq_s(id);
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapXq", mapXq);
			mv.addObject("mapXq_s", mapXq_s);
			mv.addObject("listXq_m", listXq_m);
		}else if("yxzt".equals(action)){//运行状态
			mv = new ModelAndView("modules/detail/detail_yxzt");
			
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			String tbdw = ServletRequestUtils.getStringParameter(request, "tbdw", "");
			tbdw = new String(tbdw.getBytes("ISO8859-1"),"GBK");
			
			//得到运行状态和运行状态多媒体信息
			Map mapYxzt = detailDAO.getYxzt(id);
			List listYxzt_m = detailDAO.getYxzt_m(id);
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapYxzt", mapYxzt);
			mv.addObject("listYxzt_m", listYxzt_m);
		}else if("zq".equals(action)){//灾情
			mv = new ModelAndView("modules/detail/detail_zq");
			
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			String tbdw = ServletRequestUtils.getStringParameter(request, "tbdw", "");
			tbdw = new String(tbdw.getBytes("ISO8859-1"),"GBK");
			
			//得到灾情信息和灾情多媒体信息
			Map mapZq = detailDAO.getZq(id);
			List listZq_m = detailDAO.getZq_m(id);
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapZq", mapZq);
			mv.addObject("listZq_m", listZq_m);
		}
		
		return mv;
	}

	public void setDetailDAO(DetailDAO detailDAO) {
		this.detailDAO = detailDAO;
	}
}
