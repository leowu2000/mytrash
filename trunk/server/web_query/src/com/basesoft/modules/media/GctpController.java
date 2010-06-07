package com.basesoft.modules.media;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.basesoft.core.CommonController;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.json.JettisonMappedXmlDriver;

public class GctpController extends CommonController {

	GctpDAO gctpDAO;
	
	@Override
	protected ModelAndView doHandleRequestInternal(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception {
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		String gclj = ServletRequestUtils.getStringParameter(request, "gclj", "");
		String returnUrl = "gctp.do?action=gctp&gclj=" + gclj; 
		
		if("gctp".equals(action)){//工程图片
			HttpSession session = request.getSession();
			String isAdmin = session.getAttribute("isAdmin")==null?"false":session.getAttribute("isAdmin").toString();
			
			if("true".equals(isAdmin)){
				//mv = new ModelAndView("modules/gctp/list");
				mv = new ModelAndView("modules/result/result_gctp");
			}else {
				mv = new ModelAndView("modules/result/result_gctp");
			}
			
			List<?> listGctp = gctpDAO.findGctp(gclj);
			
			mv.addObject("listGctp", listGctp);
			mv.addObject("gclj", gclj);
		}else if("manager".equals(action)){//工程图片
			mv = new ModelAndView("modules/gctp/list");
			List<?> listGctp = gctpDAO.findGctp(gclj);
			
			mv.addObject("listGctp", listGctp);
			mv.addObject("gclj", gclj);
		}else if("add".equals(action)){
			String name = ServletRequestUtils.getStringParameter(request, "name", "");
			String note = ServletRequestUtils.getStringParameter(request, "note", "");
			String id = UUID.randomUUID().toString().replaceAll("-", "");
			Gctp gctp = new Gctp();
			gctp.setId(id);
			gctp.setName(name);
			gctp.setNote(note);
			gctp.setGclj(gclj);
			
			MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest)request;
			MultipartFile file = mpRequest.getFile("file");
			
			if(file!=null){
				if(file.getSize()!=0){
					gctpDAO.addGctp(gctp, file);
				}
			}
			
			response.sendRedirect(returnUrl);
		}else if("query".equals(action)){
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			
			Gctp gctp = gctpDAO.findById(id);
			XStream xstream = new XStream(new JettisonMappedXmlDriver());
			xstream.alias("item", Gctp.class);
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0L);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().write(xstream.toXML(gctp));
			response.getWriter().close();
			return null;
		}else if("update".equals(action)){
			String id = ServletRequestUtils.getStringParameter(request, "id", "");
			String name = ServletRequestUtils.getStringParameter(request, "name", "");
			String note = ServletRequestUtils.getStringParameter(request, "note", "");
			Gctp gctp = new Gctp();
			gctp.setId(id);
			gctp.setName(name);
			gctp.setNote(note);
			gctp.setGclj(gclj);
			
			MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest)request;
			MultipartFile file = mpRequest.getFile("file");
			
			if(file!=null){
				if(file.getSize()!=0){
					gctpDAO.updateGctp(gctp, file);
				}
			}
			
			response.sendRedirect(returnUrl);
			return null;
		}else if("delete".equals(action)){
			String[] check=request.getParameterValues("check");
			//循环按id删除
			for(int i=0;i<check.length;i++){
				String deleteSql = "delete from TB_GCTP where ID='" + check[i] + "'";
				gctpDAO.jdbcTemplate.execute(deleteSql);
			}
			
			response.sendRedirect(returnUrl);
			return null;
		}
		
		return mv;
	}

	public void setGctpDAO(GctpDAO gctpDAO){
		this.gctpDAO = gctpDAO;
	}
}
