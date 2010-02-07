<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.core.PageList"%>
<%@ page import="com.basesoft.core.PageInfo"%>
<%@page import="com.basesoft.util.StringUtil"%>
<%
	Map mapQbxx = (Map)request.getAttribute("mapQbxx");

	List listXq = (List)mapQbxx.get("listXq");
	List listYxzt = (List)mapQbxx.get("listYxzt");
	List listFxjb = (List)mapQbxx.get("listFxjb");
	List listFxxd = (List)mapQbxx.get("listFxxd");
	List listZq = (List)mapQbxx.get("listZq");
	List listHq = (List)mapQbxx.get("listHq");
	
	int totalCount = listXq.size() + listYxzt.size() + listFxjb.size() + listFxxd.size() + listZq.size() + listHq.size();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>全部信息</title>
    
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
          <table width="100%" border="0"  class="font_define">
            <tr  class="banner"> 
<%   
    		if(totalCount == 0){
%>
              <td>没有满足条件的记录！！！</td>
<%
    		}else{
%>
			  <td width="30%">标题</td>                                                                                                        
			  <td width="25%">填报单位名称</td>                                                                                                    
			  <td width="20%">填报时间</td>                                                                                                        
			  <td width="15%">信息类型</td>                                                                                                        
            </tr>
<%                                                                                                                                                                                                                                           
    		}
%>
<%
			for(int i=0;i<listXq.size();i++){
				Map mapXq = (Map)listXq.get(i);
%>
            <tr> 
			  <td><a href="javascript:openUrl('detail.do?action=xq&id=<%=mapXq.get("DNCNO") %>&tbdw=<%=mapXq.get("WTDPCD") %>',800,550,0)"><%=mapXq.get("DNCNM") %></a></td>                                                                                             
			  <td><a href="javascript:openUrl('detail.do?action=xq&id=<%=mapXq.get("DNCNO") %>&tbdw=<%=mapXq.get("WTDPCD") %>',800,550,0)"><%=mapXq.get("WTDPCD") %></a></td>
			  <td><%=StringUtil.DateToString((Date)mapXq.get("WTDPDT"),"yyyy-MM-dd") %></td>                                                                                              
			  <td>险情</td> 
			</tr>
<%
			}
%>
<%
			for(int i=0;i<listYxzt.size();i++){
				Map mapYxzt = (Map)listYxzt.get(i);
%>
            <tr> 
			  <td><a href="javascript:openUrl('detail.do?action=yxzt&id=<%=mapYxzt.get("PJRNO") %>&tbdw=<%=mapYxzt.get("WTDPCD") %>',800,550,0)"><%=mapYxzt.get("PJNM") %></a></td>                                                                                             
			  <td><a href="javascript:openUrl('detail.do?action=yxzt&id=<%=mapYxzt.get("PJRNO") %>&tbdw=<%=mapYxzt.get("WTDPCD") %>',800,550,0)"><%=mapYxzt.get("WTDPCD") %></a></td>
			  <td><%=StringUtil.DateToString((Date)mapYxzt.get("WTDPDT"),"yyyy-MM-dd") %></td>                                                                                              
			  <td>运行状态</td> 
			</tr>
<%
			}
%>
<%
			for(int i=0;i<listFxjb.size();i++){
				Map mapFxjb = (Map)listFxjb.get(i);
%>
            <tr> 
			  <td><a href="javascript:openUrl('detail.do?action=fxjb&id=<%=mapFxjb.get("RPJINCD") %>&tbdw=<%=mapFxjb.get("WTDPCD") %>',800,550,0)"><%=mapFxjb.get("WTTT") %></a></td>                                                                                             
			  <td><a href="javascript:openUrl('detail.do?action=fxjb&id=<%=mapFxjb.get("RPJINCD") %>&tbdw=<%=mapFxjb.get("WTDPCD") %>',800,550,0)"><%=mapFxjb.get("WTDPCD") %></a></td>
			  <td><%=StringUtil.DateToString((Date)mapFxjb.get("WTDT"),"yyyy-MM-dd") %></td>                                                                                              
			  <td>防汛简报</td> 
			</tr>
<%
			}
%>
<%
			for(int i=0;i<listFxxd.size();i++){
				Map mapFxxd = (Map)listFxxd.get(i);
%>
            <tr> 
			  <td><a href="javascript:openUrl('detail.do?action=fxxd&id=<%=mapFxxd.get("RPJINCD") %>&tbdw=<%=mapFxxd.get("WTDPCD") %>',800,550,0)"><%=mapFxxd.get("WTTT") %></a></td>                                                                                             
			  <td><a href="javascript:openUrl('detail.do?action=fxxd&id=<%=mapFxxd.get("RPJINCD") %>&tbdw=<%=mapFxxd.get("WTDPCD") %>',800,550,0)"><%=mapFxxd.get("WTDPCD") %></a></td>
			  <td><%=StringUtil.DateToString((Date)mapFxxd.get("WTDT"),"yyyy-MM-dd") %></td>                                                                                              
			  <td>防汛行动</td> 
			</tr>
<%
			}
%>
<%
			for(int i=0;i<listZq.size();i++){
				Map mapZq = (Map)listZq.get(i);
%>
            <tr> 
			  <td><a href="javascript:openUrl('detail.do?action=zq&id=<%=mapZq.get("RPJINCD") %>&tbdw=<%=mapZq.get("WTDPCD") %>',800,550,0)"><%=mapZq.get("WTTT") %></a></td>                                                                                             
			  <td><a href="javascript:openUrl('detail.do?action=zq&id=<%=mapZq.get("RPJINCD") %>&tbdw=<%=mapZq.get("WTDPCD") %>',800,550,0)"><%=mapZq.get("WTDPCD") %></a></td>
			  <td><%=StringUtil.DateToString((Date)mapZq.get("WTDT"),"yyyy-MM-dd") %></td>                                                                                              
			  <td>灾情</td> 
			</tr>
<%
			}
%>
<%
			for(int i=0;i<listHq.size();i++){
				Map mapHq = (Map)listHq.get(i);
%>
            <tr> 
			  <td><a href="javascript:openUrl('detail.do?action=hq&id=<%=mapHq.get("RPJINCD") %>&tbdw=<%=mapHq.get("WTDPCD") %>',800,550,0)"><%=mapHq.get("WTTT") %></a></td>                                                                                             
			  <td><a href="javascript:openUrl('detail.do?action=hq&id=<%=mapHq.get("RPJINCD") %>&tbdw=<%=mapHq.get("WTDPCD") %>',800,550,0)"><%=mapHq.get("WTDPCD") %></a></td>
			  <td><%=StringUtil.DateToString((Date)mapHq.get("WTDT"),"yyyy-MM-dd") %></td>                                                                                              
			  <td>旱情</td> 
			</tr>
<%
			}
%>
            <tr class="banner" width="100%"> 
              <td colspan="4" height="1"></td>
            </tr>
    	  </table>
    	</td>
      </tr>
    </table> 
  </body>
</html>
