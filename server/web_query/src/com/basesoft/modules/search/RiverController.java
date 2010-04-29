package com.basesoft.modules.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;

import com.basesoft.core.CommonController;
import com.basesoft.util.StringUtil;

public class RiverController extends CommonController {

	RiverDAO riverDAO;
	
	@Override
	protected ModelAndView doHandleRequestInternal(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception {
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		
		if("AJAX_LY".equals(action)){//生成水系select
			String ly = ServletRequestUtils.getStringParameter(request, "ly", "");
			
			List listSx = riverDAO.getSx(ly);
			
			StringBuffer sb = new StringBuffer();
			sb.append("<select name='sx' id='sx' onchange='changeSx(this.value);'>");
			String options = StringUtil.createOptions(listSx, "CTCD", "CTNM");
			sb.append("</select>");
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("application/*;charset=utf-8");
			response.getWriter().write(sb.toString());
			response.getWriter().close();
			return null;
		}else if("AJAX_SX".equals(action)){//生成一级支流select
			String sx = ServletRequestUtils.getStringParameter(request, "sx", "");
			
			List listSx = riverDAO.getZl1(sx);
			
			StringBuffer sb = new StringBuffer();
			sb.append("<select name='zl1' id='zl1' onchange='changeZl(this.value);'>");
			String options = StringUtil.createOptions(listSx, "CTCD", "CTNM");
			sb.append("</select>");
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("application/*;charset=utf-8");
			response.getWriter().write(sb.toString());
			response.getWriter().close();
			return null;
		}else if("AJAX_ZL".equals(action)){//生成二级支流select
			String zl1 = ServletRequestUtils.getStringParameter(request, "zl1", "");
			
			List listSx = riverDAO.getZl2(zl1);
			
			StringBuffer sb = new StringBuffer();
			sb.append("<select name='zl2' id='zl2'>");
			String options = StringUtil.createOptions(listSx, "CTCD", "CTNM");
			sb.append("</select>");
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("application/*;charset=utf-8");
			response.getWriter().write(sb.toString());
			response.getWriter().close();
			return null;
		}
		
		return null;
	}

	public void setRiverDAO(RiverDAO riverDAO){
		this.riverDAO = riverDAO;
	}
}
