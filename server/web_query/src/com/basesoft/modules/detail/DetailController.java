package com.basesoft.modules.detail;

import java.util.ArrayList;
import java.util.HashMap;
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
		
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		String tbdw = ServletRequestUtils.getStringParameter(request, "tbdw", "");
		tbdw = new String(tbdw.getBytes("ISO8859-1"),"GBK");
		if("fxjb".equals(action)){//防汛简报
			mv = new ModelAndView("modules/detail/detail_fxjb");
			
			//得到防汛简报和防汛简报多媒体信息
			Map mapFxjb = detailDAO.getFxjb(id);
			List listFxjb_m = detailDAO.getFxjb_m(id);
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapFxjb", mapFxjb);
			mv.addObject("listFxjb_m", listFxjb_m);
		}else if("fxxd".equals(action)){//防汛行动
			mv = new ModelAndView("modules/detail/detail_fxxd");
			
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
		}else if("xq1".equals(action)){//险情
			mv = new ModelAndView("modules/detail/detail_xq1");
			
			//得到险情信息和险情多媒体信息
			Map mapXq1 = detailDAO.getXq1(id);
			
			//得到险情分类信息
			String tablename = detailDAO.getXqflTable(mapXq1.get("xqfldm").toString());
			Map mapXqflxx = detailDAO.getXqflxx(tablename, id);
			String xqflmc = detailDAO.getXqflmc(id);
			
			mv.addObject("id", id);
			mv.addObject("page", page);
			mv.addObject("mapXq1", mapXq1);
			mv.addObject("mapXqflxx", mapXqflxx);
			mv.addObject("xqflmc", xqflmc);
		}else if("yxzt".equals(action)){//运行状态
			mv = new ModelAndView("modules/detail/detail_yxzt");
			
			//得到运行状态和运行状态多媒体信息
			Map mapYxzt = detailDAO.getYxzt(id);
			List listYxzt_m = detailDAO.getYxzt_m(id);
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapYxzt", mapYxzt);
			mv.addObject("listYxzt_m", listYxzt_m);
		}else if("yxzt1".equals(action)){//运行状态
			mv = new ModelAndView("modules/detail/detail_yxzt1");
			
			//得到运行状态和运行状态多媒体信息
			Map mapYxzt = detailDAO.getYxzt(id);
			List listYxzt_m = detailDAO.getYxzt_m(id);
			
			//得到工程分类信息
			String tablename = detailDAO.getGcflTable(mapYxzt.get("GCFLDM").toString());
			Map mapGcflxx = detailDAO.getGcflxx(tablename, id);
			String gcflmc = detailDAO.getGcflmc(id);
			
			mv.addObject("id", id);
			mv.addObject("mapYxzt", mapYxzt);
			mv.addObject("listYxzt_m", listYxzt_m);
			mv.addObject("mapGcflxx", mapGcflxx);
			mv.addObject("gcflmc", gcflmc);
		}else if("zq".equals(action)){//灾情
			mv = new ModelAndView("modules/detail/detail_zq");
			
			//得到灾情信息和灾情多媒体信息
			Map mapZq = detailDAO.getZq(id);
			List listZq_m = detailDAO.getZq_m(id);
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapZq", mapZq);
			mv.addObject("listZq_m", listZq_m);
		}else if("fxjb_print".equals(action)){
			int size = ServletRequestUtils.getIntParameter(request, "size", 800);
			
			//得到防汛简报和防汛简报多媒体信息
			Map mapFxjb = detailDAO.getFxjb(id);
			List listFxjb_m = detailDAO.getFxjb_m(id);
			
			mv = new ModelAndView("modules/detail/print_fxjb");
			
			mv.addObject("id", id);
			mv.addObject("tbdw", tbdw);
			mv.addObject("page", page);
			mv.addObject("mapFxjb", mapFxjb);
			mv.addObject("listFxjb_m", listFxjb_m);
			
		}else if("index".equals(action)){//获取首页面信息详细
			String tablename = ServletRequestUtils.getStringParameter(request, "tablename", "");
			
			Map mapIndex = new HashMap();
			List listIndex_m = new ArrayList();
			
			if("TB_FPACTI".equals(tablename)){//防汛行动
				mapIndex = detailDAO.getFxxd(id);
				listIndex_m = detailDAO.getFxxd_m(id);
			}else if("TB_FXJB".equals(tablename)){//防汛简报
				mapIndex = detailDAO.getFxjb(id);
				listIndex_m = detailDAO.getFxjb_m(id);
			}else if("TB_QT".equals(tablename)){//旱情
				mapIndex = detailDAO.getHq(id);
				listIndex_m = detailDAO.getHq_m(id);
			}else if("TB_SD".equals(tablename)){//灾情
				mapIndex = detailDAO.getZq(id);
				listIndex_m = detailDAO.getZq_m(id);
			}else if("TB_PJRCN".equals(tablename)){//运行状态
				mapIndex = detailDAO.getYxzt(id);
				listIndex_m = detailDAO.getYxzt_m(id);
			}else if("TB_STDNC".equals(tablename)){//险情
				mapIndex = detailDAO.getXq(id);
				listIndex_m = detailDAO.getXq_m(id);
			}
			
			mv = new ModelAndView("modules/detail/detail_index");
			mv.addObject("mapIndex", mapIndex);
			mv.addObject("listIndex_m", listIndex_m);
			mv.addObject("tablename", tablename);
		}
		
		return mv;
	}

	public void setDetailDAO(DetailDAO detailDAO) {
		this.detailDAO = detailDAO;
	}
}
