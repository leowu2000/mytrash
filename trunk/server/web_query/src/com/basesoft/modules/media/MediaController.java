package com.basesoft.modules.media;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;

import com.basesoft.core.CommonController;

public class MediaController extends CommonController {

	MediaDAO mediaDAO;
	
	@Override
	protected ModelAndView doHandleRequestInternal(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception {
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		
		if("image".equals(action)){
			String tablename = ServletRequestUtils.getStringParameter(request,"tablename","");
			String pId = ServletRequestUtils.getStringParameter(request,"media_id","");
			
			Map map = mediaDAO.getImage(tablename, pId);
			
			byte[] b = (byte[])map.get("lxzp");
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("image/*");
			response.getOutputStream().write(b);
			response.getOutputStream().close();
			return null;
		}
		
		return null;
	}
	
	public void setMediaDAO(MediaDAO mediaDAO){
		this.mediaDAO = mediaDAO;
	}
}
