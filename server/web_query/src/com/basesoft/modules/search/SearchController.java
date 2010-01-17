package com.basesoft.modules.search;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;

import com.basesoft.core.CommonController;
import com.basesoft.core.PageList;

public class SearchController extends CommonController {

	SearchDAO searchDAO;
	
	@Override
	protected ModelAndView doHandleRequestInternal(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception {
		// TODO Auto-generated method stub
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		
		if("main".equals(action)){//主页查询
			//信息类型
			String select_sortinfo = ServletRequestUtils.getStringParameter(request, "select_sortinfo", "");
			//工程类别
			String select_sort = ServletRequestUtils.getStringParameter(request, "select_sort", "");
			//行政区域
			String xzqh = ServletRequestUtils.getStringParameter(request, "xzqh", "");
			//河流水系
			String lysx = ServletRequestUtils.getStringParameter(request, "lysx", "");
			//上报时间
			String date_start = ServletRequestUtils.getStringParameter(request, "date_start", "");
			String date_end = ServletRequestUtils.getStringParameter(request, "date_end", "");
			//关键字
			String text_fill = ServletRequestUtils.getStringParameter(request, "text_fill", "");
			//工程名称
			String check_projectname = ServletRequestUtils.getStringParameter(request, "check_projectname", "");
			//填报单位
			String check_unit = ServletRequestUtils.getStringParameter(request, "check_unit", "");
			//信息标题
			String check_title = ServletRequestUtils.getStringParameter(request, "check_title", "");
			
			if("qbxx".equals(select_sortinfo)){//全部信息
				mv = new ModelAndView("/modules/result/result_qbxx");
				
			}else {
				//根据检索条件检索出的结果
				PageList listResult = searchDAO.getResult(select_sortinfo,select_sort,xzqh,lysx,date_start,date_end,text_fill,check_projectname,check_unit,check_title, page);
				
				if("yxzt".equals(select_sortinfo)){//查询运行状态
					mv = new ModelAndView("/modules/result/result_yxzt");
				}else if("xqxx".equals(select_sortinfo)){//查询险情信息类型
					mv = new ModelAndView("/modules/result/result_xqxx");
				}else if("fxjb".equals(select_sortinfo)){//查询防汛简报
					mv = new ModelAndView("/modules/result/result_fxjb");
				}else if("fxxd".equals(select_sortinfo)){//查询防汛行动
					mv = new ModelAndView("/modules/result/result_fxxd.jsp");
				}else if("zqbg".equals(select_sortinfo)){//查询灾情报告
					mv = new ModelAndView("/modules/result/result_zqg");
				}else if("hqbg".equals(select_sortinfo)){//查询旱情报告
					mv = new ModelAndView("/modules/result/result_hqbg.jsp");
				}
				
				mv.addObject("pageList", listResult);
			}
		}else if("search_consult".equals(action)){
			mv = new ModelAndView("/modules/search/search_consult.jsp");
			
			int xq_count,yx_count,fx_count,zq_count,total_count;
		    xq_count = 0;
		    yx_count = 0;
		    fx_count = 0;
		    zq_count = 0;
		    
			List list = searchDAO.getHistory();
			
			for(int i=0;i<list.size();i++){
				Map map = (Map)list.get(i);
				String type = map.get("type")==null?"":map.get("type").toString();
				if("1".equals(type)){//运行状态
					yx_count = yx_count + 1;
				}else if("2".equals(type)){//险情
					xq_count = xq_count + 1;
				}else if("3".equals(type)){//防汛行动
					fx_count = fx_count + 1;
				}else if("4".equals(type)){//灾情
					zq_count = zq_count + 1;
				}
			}
			total_count = yx_count + xq_count + fx_count + zq_count;
			
			mv.addObject("xq_count", xq_count);
			mv.addObject("yx_count", yx_count);
			mv.addObject("fx_count", fx_count);
			mv.addObject("zq_count", zq_count);
			mv.addObject("total_count", total_count);
			return mv;
		}
		
		return mv;
	}

	public void setSearchDAO(SearchDAO searchDAO) {
		this.searchDAO = searchDAO;
	}
	
}
