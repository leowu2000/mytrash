<%@ page contentType="text/html;charset=GBK"%>
<%@ page language="java" pageEncoding="GBK"%>
<%@ page import="com.buiness.dao.*"%>
<%@ page import="java.util.*"%>
<%
    String id = request.getParameter("prjid")==null?"":request.getParameter("prjid");
	String path = request.getRealPath("/");
	BuinessDao buDAO = new BuinessDao();
	List<Map<Object,Object>> resultList = BuinessDao.getSelectListInt("TB_ST",new String[]{"STTPCD","STNM"},path,"where PJNO="+id+"");
    StringBuffer sb = new StringBuffer("");
    if(resultList!=null){ 
    	sb.append("[");
    	if(resultList!=null && resultList.size()>0){
			for(int i=0;i<resultList.size();i++){
				Map<Object,Object> map = (Map<Object,Object>)resultList.get(i);
				if(i+1==resultList.size())
					sb.append("['"+new Integer(map.get("id").toString()	)+"','"+map.get("value")+"']");
				else
					sb.append("['"+new Integer(map.get("id").toString()	)+"','"+map.get("value")+"'],");
			}
    	}
    	sb.append("]");
    }
    response.setHeader("Cache-Control","no-store");    
    response.setHeader("Pragma","no-cache");    
    response.setDateHeader("Expires", 0);   
    
    response.getWriter().write(sb.toString());
    response.getWriter().close();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
  </head>
  
  <body>

  </body>
</html>
