<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.core.PageList"%>
<%@ page import="com.basesoft.core.PageInfo"%>
<%@page import="com.basesoft.util.StringUtil"%>
<%
PageList pageList = (PageList)request.getAttribute("pageList");
PageInfo pageInfo = pageList.getPageInfo();
List list = pageList.getList();

String radiob_gclb = request.getAttribute("radiob_gclb").toString();
String radiob_gs = request.getAttribute("radiob_gs").toString();
String text_title = request.getAttribute("text_title").toString();
String text_fill = request.getAttribute("text_fill").toString();
String date_start = request.getAttribute("date_start").toString();
String date_end = request.getAttribute("date_end").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>多媒体信息</title>
    
	<script language="javascript" src="../../script/openurl.js"></script>
	<script language="javascript" src="../../script/common.js"></script>
	<script language="JavaScript">
	<!--
	  function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  		  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    		  document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  		  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
	  }
	  MM_reloadPage(true);
	// -->
	</script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
  </head>
  
  <body>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#003366">
      <tr>
        <td bgcolor="#FFFFFF">        
        <table  width="100%" border="0" class="font_define">                                                                                                                  
	<tr  class="banner">
	<%
    if (list.size()==0){
    %>
    
    <td align='center'> 
		没有满足条件的记录！！！    
    </td>
    <%
	}else {
	%>                                                                                        
		<td width="15%" align="center">示例图</td>
        <td width="35%" align="center">标题</td>
        <td width="15%" align="center">文件格式</td>
        <td width="25%" align="center">采集时间</td>                                                                                                       
	</tr>                                                                                                                    
                                                                                                                                 
<%  
	}                                                                                                                                                                                                                                            
	for(int i=0;i<list.size();i++){
		Map map = (Map)list.get(i);
		String url = "";
		String imageurl = "";
		if("xq".equals(radiob_gclb)){//险情
			url = "detail.do?action=xq&id=" + map.get("dncno") + "&curent_pagecount=" + pageList.getPageInfo().getCurPage() + "&tbdw=" + map.get("WTDPCD");
			imageurl = "media.do?action=image_small&tablename=TB_STDNC_M&media_id=" + map.get("ZLBM");
		}else if("yxzt".equals(radiob_gclb)){//运行状态
			url = "detail.do?action=yxzt&id=" + map.get("PJRNO") + "&tbdw=" + map.get("WTDPCD");
			imageurl = "media.do?action=image_small&tablename=TB_PJR_M&media_id=" + map.get("ZLBM");
		}else if("zq".equals(radiob_gclb)){//灾情
			url = "detail.do?action=zq&id=" + map.get("RPJINCD") + "curent_pagecount=" + pageList.getPageInfo().getCurPage() + "&tbdw=" + map.get("WTDPCD");
			imageurl = "media.do?action=image_small&tablename=TB_SD_M&media_id=" + map.get("ZLBM");
		}else if("fxxd".equals(radiob_gclb)){//防汛行动
			url = "detail.do?action=fxxd&id=" + map.get("RPJINCD") + "&curent_pagecount=" + pageList.getPageInfo().getCurPage() + "&tbdw=" + map.get("WTDPCD");
			imageurl = "media.do?action=image_small&tablename=TB_FPACTI_M&media_id=" + map.get("ZLBM");
		}
		
		String ext = map.get("WJGS")==null?"":map.get("WJGS").toString().trim().toUpperCase();
%>                                                                                                                               
	<tr>
       <td align="center">
	       <a href="javascript:openUrl('<%=url %>',800,550,0)">
		   <%if("JPG".equals(ext)||"JPEG".equals(ext)){ %>
		       <img src="<%=imageurl %>" width=30 height=30> 
		   <%}else{ %>
		   	   <img src="../../images/lx.gif" width=30 height=30> 
		   <%} %>
		   </a>
		</td>
        <td align="">
			<a href="javascript:openUrl('<%=url %>',800,550,0)"><%=map.get("title")%></a>
		</td>
        <td align="center"><%=map.get("wjgs")%></td>
		<td align="center"><%=StringUtil.DateToString((Date)map.get("dtcdt"),"yyyy-MM-dd") %></td>                                                                                        
	</tr>                                                                                                                    
<%            
	}                                                                                                       
%>                                                                                                                               
    <tr class="banner" width="100%"> 
        <td colspan="6" height="1"></td>
      </tr>                                                                                                                               
	<tr>                                                                                                                     
	<td colspan="6">
<table  class="font_define" width="100%">
	<tr>
	<td align='right'>     
	<%=pageInfo.getHtml("/search.do?action=media&radiob_gclb=" + radiob_gclb + "&radiob_gs=" + radiob_gs + "&text_title=" + text_title + "&text_fill=" + text_fill + "&date_start=" + date_start + "&date_end=" + date_end) %>                                                                                                                 
	</td>	
	</tr>
</table>
</td>
	</tr>
  </body>
</html>
