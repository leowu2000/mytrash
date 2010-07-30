package com.basesoft.modules.search;

import java.util.ArrayList;
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
	RiverDAO riverDAO;
	
	@Override
	protected ModelAndView doHandleRequestInternal(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception {
		// TODO Auto-generated method stub
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		int page = ServletRequestUtils.getIntParameter(request, "page", 1);
		
		//信息类型
		String select_sortinfo = ServletRequestUtils.getStringParameter(request, "select_sortinfo", "");
		//工程类别
		String select_sort = ServletRequestUtils.getStringParameter(request, "select_sort", "");
		//行政区域
		String xzqh = ServletRequestUtils.getStringParameter(request, "xzqh", "");
		//河流水系
		String lysx = ServletRequestUtils.getStringParameter(request, "zl2", "");
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
		//险情标题
		String text_title =  ServletRequestUtils.getStringParameter(request, "text_title", "");
		
		if("search_multi".equals(action)){//主页查询面板
			mv = new ModelAndView("modules/search/search_multi");
			
			List listLy = riverDAO.getLy();
			
			mv.addObject("listLy", listLy);
		}else if("main".equals(action)){//主页查询
			if("qbxx".equals(select_sortinfo)){//全部信息
				mv = new ModelAndView("modules/result/result_qbxx");
				
				Map mapQbxx = searchDAO.getAllResults(select_sort, xzqh, lysx, date_start, date_end, text_fill, check_projectname, check_unit, check_title);
				
				//mv.addObject("mapQbxx", mapQbxx);
				List listXq = (List)mapQbxx.get("listXq");
				List listZq = (List)mapQbxx.get("listZq");
				List listHq = (List)mapQbxx.get("listHq");
				List listYxzt = (List)mapQbxx.get("listYxzt");
				List listFxxd = (List)mapQbxx.get("listFxxd");
				List listFxjb = (List)mapQbxx.get("listFxjb");
				
				request.getSession().setAttribute("listXq", listXq);
				request.getSession().setAttribute("listZq", listZq);
				request.getSession().setAttribute("listHq", listHq);
				request.getSession().setAttribute("listYxzt", listYxzt);
				request.getSession().setAttribute("listFxxd", listFxxd);
				request.getSession().setAttribute("listFxjb", listFxjb);
			}else {
				//根据检索条件检索出的结果
				PageList listResult = searchDAO.getResult(select_sortinfo,select_sort,xzqh,lysx,date_start,date_end,text_fill,check_projectname,check_unit,check_title, page);
				
				if("yxzt".equals(select_sortinfo)){//查询运行状态
					mv = new ModelAndView("modules/result/result_yxzt");
				}else if("xqxx".equals(select_sortinfo)){//查询险情信息类型
					mv = new ModelAndView("modules/result/result_xqxx");
				}else if("fxjb".equals(select_sortinfo)){//查询防汛简报
					mv = new ModelAndView("modules/result/result_fxjb");
				}else if("fxxd".equals(select_sortinfo)){//查询防汛行动
					mv = new ModelAndView("modules/result/result_fxxd");
				}else if("zqbg".equals(select_sortinfo)){//查询灾情报告
					mv = new ModelAndView("modules/result/result_zqbg");
				}else if("hqbg".equals(select_sortinfo)){//查询旱情报告
					mv = new ModelAndView("modules/result/result_hqbg");
				}
				
				mv.addObject("pageList", listResult);
				mv.addObject("select_sortinfo", select_sortinfo);
				mv.addObject("select_sort", select_sort);
				mv.addObject("xzqh", xzqh);
				mv.addObject("lysx", lysx);
				mv.addObject("date_start", date_start);
				mv.addObject("date_end", date_end);
				mv.addObject("text_fill", text_fill);
				mv.addObject("check_projectname", check_projectname);
				mv.addObject("check_unit", check_unit);
				mv.addObject("check_title", check_title);
				mv.addObject("qbxx", "qbxx");
			}
		}else if("search_consult".equals(action)){//会商查询
			mv = new ModelAndView("modules/search/search_consult");
			
			int xq_count,yx_count,fx_count,zq_count,total_count;
		    xq_count = 0;
		    yx_count = 0;
		    fx_count = 0;
		    zq_count = 0;
		    
			List list = searchDAO.getHS();
			
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
		}else if("xq".equals(action)){//险情查询
			PageList pageList = searchDAO.getXq(text_title, text_fill, date_start, date_end, lysx, page);
		
			mv = new ModelAndView("modules/result/result_xq");
			mv.addObject("pageList", pageList);
			mv.addObject("text_title", text_title);
			mv.addObject("text_fill", text_fill);
			mv.addObject("date_start", date_start);
			mv.addObject("date_end", date_end);
		}else if("zq".equals(action)){//灾情查询
			PageList pageList = searchDAO.getZq(text_title, text_fill, date_start, date_end, page);
			
			mv = new ModelAndView("modules/result/result_zq");
			mv.addObject("pageList", pageList);
			mv.addObject("text_title", text_title);
			mv.addObject("text_fill", text_fill);
			mv.addObject("date_start", date_start);
			mv.addObject("date_end", date_end);
		}else if("hq".equals(action)){//旱情查询
			PageList pageList = searchDAO.getHq(text_title, text_fill, date_start, date_end, page);
			
			mv = new ModelAndView("modules/result/result_hq");
			mv.addObject("pageList", pageList);
			mv.addObject("text_title", text_title);
			mv.addObject("text_fill", text_fill);
			mv.addObject("date_start", date_start);
			mv.addObject("date_end", date_end);
		}else if("yxzt".equals(action)){//运行状态查询
			
			PageList pageList = searchDAO.getYxzt(text_title, text_fill, date_start, date_end, lysx, page);
			
			mv = new ModelAndView("modules/result/result_yxzt2");
			mv.addObject("pageList", pageList);
			mv.addObject("text_title", text_title);
			mv.addObject("text_fill", text_fill);
			mv.addObject("date_start", date_start);
			mv.addObject("date_end", date_end);
		}else if("fxxd".equals(action)){//防汛行动查询
			PageList pageList = searchDAO.getFxxd(text_title, text_fill, date_start, date_end, page);
			
			mv = new ModelAndView("modules/result/result_fxxd");
			mv.addObject("pageList", pageList);
			mv.addObject("text_title", text_title);
			mv.addObject("text_fill", text_fill);
			mv.addObject("date_start", date_start);
			mv.addObject("date_end", date_end);
		}else if("fxjb".equals(action)){//防汛简报查询
			PageList pageList = searchDAO.getFxjb(text_title, text_fill, date_start, date_end, page);
			
			mv = new ModelAndView("modules/result/result_fxjb");
			mv.addObject("pageList", pageList);
			mv.addObject("text_title", text_title);
			mv.addObject("text_fill", text_fill);
			mv.addObject("date_start", date_start);
			mv.addObject("date_end", date_end);
		}else if("media".equals(action)){//多媒体查询
			//工程类别
			String radiob_gclb = ServletRequestUtils.getStringParameter(request, "radiob_gclb", "");
			//文件格式
			String radiob_gs = ServletRequestUtils.getStringParameter(request, "radiob_gs", "");
			
			PageList pageList = searchDAO.getMedia(radiob_gclb, radiob_gs, text_title, text_fill, date_start, date_end, page);
			
			mv = new ModelAndView("modules/result/result_media");
			mv.addObject("pageList", pageList);
			mv.addObject("radiob_gclb", radiob_gclb.trim());
			mv.addObject("radiob_gs", radiob_gs.trim());
			mv.addObject("text_title", text_title);
			mv.addObject("text_fill", text_fill);
			mv.addObject("date_start", date_start);
			mv.addObject("date_end", date_end);
		}else if("consult".equals(action)){//会商查询
			//会商类别
			String type = ServletRequestUtils.getStringParameter(request, "type", "");
			String parentfile = ServletRequestUtils.getStringParameter(request, "parentfile", "");
			
			mv = new ModelAndView("modules/result/result_consult");
			mv.addObject("type", type);
			mv.addObject("parentfile", parentfile);
			
			String sql = "";
			List listYxzt = new ArrayList();
			List listXq = new ArrayList();
			List listFxxd = new ArrayList();
			List listZq = new ArrayList();
			
			if("1".equals(type)||"a".equals(type)){//运行状态
				listYxzt = searchDAO.getConsultYxzt();
			}
			if("2".equals(type)||"a".equals(type)){//险情
				listXq = searchDAO.getConsultXq();
			}
			if("3".equals(type)||"a".equals(type)){//防汛行动
				listFxxd = searchDAO.getConsultFxxd();
			}
			if("4".equals(type)||"a".equals(type)){//灾情
				listZq = searchDAO.getConsultZq();
			}
			
			mv.addObject("listYxzt", listYxzt);
			mv.addObject("listXq", listXq);
			mv.addObject("listFxxd", listFxxd);
			mv.addObject("listZq", listZq);
		}else if("search_gcxx".equals(action)){//工程信息检索条件页面
			mv = new ModelAndView("modules/search/search_gcxx");
			
			List listSx = searchDAO.getGcxxSx();
			
			mv.addObject("listSx", listSx);
		}else if("search_gcxx_sxajax".equals(action)){//市县选择ajax
			String sxbm = ServletRequestUtils.getStringParameter(request, "sxbm", "1");
			
			List listLx = searchDAO.getGcxxLb(sxbm);
			
			StringBuffer sb = new StringBuffer();
			sb.append("<select name='lx' id='lx' onchange='changeLx();'>");
			for(int i=0;i<listLx.size();i++){
				Map mapLx = (Map)listLx.get(i);
				sb.append("<option value='")
				  .append(mapLx.get("LXBM"))
				  .append("'>")
				  .append(mapLx.get("LXMC"))
				  .append("</option>");
			}
			sb.append("</select>");
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("application/*;charset=utf-8");
			response.getWriter().write(sb.toString());
			response.getWriter().close();
			return null;
		}else if("search_gcxx_lxajax".equals(action)){//类型选择ajax
			String sxbm = ServletRequestUtils.getStringParameter(request, "sxbm", "1");
			String lxbm = ServletRequestUtils.getStringParameter(request, "lxbm", "1");
			
			List listGc = searchDAO.getGcxxGc(sxbm, lxbm);
			
			StringBuffer sb = new StringBuffer();
			sb.append("<select name='gc' id='gc' onchange='changeGc();'>");
			for(int i=0;i<listGc.size();i++){
				Map mapGc = (Map)listGc.get(i);
				sb.append("<option value='")
				  .append(mapGc.get("GCLJ"))
				  .append("'>")
				  .append(mapGc.get("GCMC"))
				  .append("</option>");
			}
			sb.append("</select>");
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("application/*;charset=utf-8");
			response.getWriter().write(sb.toString());
			response.getWriter().close();
			return null;
		}else if("search_gcxx_ljajax".equals(action)){//工程选择ajax
			String sxbm = ServletRequestUtils.getStringParameter(request, "sxbm", "1");
			String lxbm = ServletRequestUtils.getStringParameter(request, "lxbm", "1");
			String gclj = ServletRequestUtils.getStringParameter(request, "gclj", "");
			
			String gclj2 = searchDAO.getGcxxLj2(sxbm, lxbm, gclj);
			
			StringBuffer sb = new StringBuffer();
			sb.append(gclj)
			  .append(";")
			  .append(gclj2);
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("application/*;charset=utf-8");
			response.getWriter().write(sb.toString());
			response.getWriter().close();
			return null;
		}else if("client_gcxxajax".equals(action)){//工程选择ajax
			String sxmc = ServletRequestUtils.getStringParameter(request, "sxmc", "1");
			String lxmc = ServletRequestUtils.getStringParameter(request, "lxmc", "1");
			String skmc = ServletRequestUtils.getStringParameter(request, "skmc", "");
			
			Map mapGcxx = searchDAO.getGcxx(sxmc, lxmc, skmc);
			
			StringBuffer sb = new StringBuffer();
			sb.append(mapGcxx.get("GCLJ"))
			  .append(";")
			  .append(mapGcxx.get("GCLJ2"));
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("application/*;charset=utf-8");
			response.getWriter().write(sb.toString());
			response.getWriter().close();
			return null;
		}else if("search_index".equals(action)){//首页面左侧列表
			mv = new ModelAndView("modules/result/result_index");
			
			List listIndex = searchDAO.getIndex();
			
			mv.addObject("listIndex", listIndex);
		}else if("search_index_m".equals(action)){//首页面左侧列表
			mv = new ModelAndView("modules/result/result_index_m");
			
			List listIndex_m = searchDAO.getIndexMedia();
			
			mv.addObject("listIndex_m", listIndex_m);
		}
		
		return mv;
	}

	public void setSearchDAO(SearchDAO searchDAO) {
		this.searchDAO = searchDAO;
	}
	
	public void setRiverDAO(RiverDAO riverDAO){
		this.riverDAO = riverDAO;
	}
}
