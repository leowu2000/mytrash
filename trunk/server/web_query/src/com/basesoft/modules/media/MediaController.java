package com.basesoft.modules.media;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
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
		final String realpath = request.getSession().getServletContext().getRealPath("/");
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		String path = request.getRealPath("\\images\\");
		
		if("image".equals(action)){
			String tablename = ServletRequestUtils.getStringParameter(request,"tablename","");
			String media_id = ServletRequestUtils.getStringParameter(request,"media_id","");
			
			InputStream ins = mediaDAO.getBlob(tablename, media_id);
			path = path + "\\temp.jpg";
			byte[] b = mediaDAO.saveAsFile(ins, path);
			ins.close();
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("image/*");
			response.getOutputStream().write(b);
			response.getOutputStream().close();
			return null;
		}if("image_small".equals(action)){
			String tablename = ServletRequestUtils.getStringParameter(request,"tablename","");
			String media_id = ServletRequestUtils.getStringParameter(request,"media_id","");
			
			InputStream ins = mediaDAO.getBlob(tablename, media_id);
			path = path + "\\temp.jpg";
			byte[] b = mediaDAO.saveAsFile(ins, path);
			ins.close();
			byte[] newPic = mediaDAO.getNewPic(request.getRealPath("\\images\\"));
			
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expiresponse", 0L);
			response.setContentType("image/*");
			response.getOutputStream().write(newPic);
			response.getOutputStream().close();
			return null;
		}else if("video".equals(action)){
			String tablename = ServletRequestUtils.getStringParameter(request,"tablename","");
			String media_id = ServletRequestUtils.getStringParameter(request,"media_id","");
			
			Map mapMedia = mediaDAO.getMedia(tablename, media_id);
			
			path = realpath + "\\video\\" + mapMedia.get("TITLE").toString().trim() + "." + mapMedia.get("WJGS").toString().trim();
			InputStream ins = mediaDAO.getBlob(tablename, media_id);
			mediaDAO.saveAsFile(ins, path);
			ins.close();
			
			mv = new ModelAndView("modules/media/player");
			mv.addObject("filepath", path);
			
			return mv;
		}else if("download".equals(action)){
			String tablename = ServletRequestUtils.getStringParameter(request,"tablename","");
			String media_id = ServletRequestUtils.getStringParameter(request,"media_id","");
			String filename = ServletRequestUtils.getStringParameter(request,"filename","");
			
			InputStream ins = mediaDAO.getBlob(tablename, media_id);
			path = path + "\\temp.jpg";
			byte[] b = mediaDAO.saveAsFile(ins, path);
			ins.close();
			
			response.reset();
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("gbk"),"iso8859-1"));
            response.setContentType("application/octet-stream");
            //输出文件
            OutputStream os = new BufferedOutputStream(response.getOutputStream());
            os.write(b);
            os.flush();
            os.close();
		}
		
		return null;
	}
	
	public void setMediaDAO(MediaDAO mediaDAO){
		this.mediaDAO = mediaDAO;
	}
}
