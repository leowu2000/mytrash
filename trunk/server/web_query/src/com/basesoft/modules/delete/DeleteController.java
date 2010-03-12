package com.basesoft.modules.delete;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;

import com.basesoft.core.CommonController;

public class DeleteController extends CommonController {

	DeleteDAO deleteDAO;
	
	@Override
	protected ModelAndView doHandleRequestInternal(HttpServletRequest request,
			HttpServletResponse response, ModelAndView mv) throws Exception {
		String action = ServletRequestUtils.getStringParameter(request, "action", "");
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		
		if("fxjb".equals(action)){//防汛简报删除
			deleteDAO.deleteFxjb(id);
		}else if("fxxd".equals(action)){//防汛行动删除
			deleteDAO.deleteFxxd(id);
		}else if("hq".equals(action)){//旱情信息删除
			deleteDAO.deleteHq(id);
		}else if("xq".equals(action)){//险情信息删除
			deleteDAO.deleteXq(id);
		}else if("yxzt".equals(action)){//运行状态删除
			deleteDAO.deleteYxzt(id);
		}else if("zq".equals(action)){//灾情信息删除
			deleteDAO.deleteZq(id);
		}
		
		return null;
	}

	public void setDeleteDAO(DeleteDAO deleteDAO){
		this.deleteDAO = deleteDAO;
	}
}
