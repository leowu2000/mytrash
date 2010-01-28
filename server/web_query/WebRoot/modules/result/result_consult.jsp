<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.support.*,org.springframework.context.*,org.springframework.jdbc.core.JdbcTemplate" %>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" src="../../script/openurl.js"></script>
<script language="javascript" src="../../script/common.js"></script>
<script language="javascript" src="../../script/onmouseover.js">
</script>
<script language="JavaScript" src="../../script/layer10.js"></script>
<link rel="stylesheet" href="../../css/main.css" type="text/css">
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
</HEAD>
<BODY >
 
<form name="result" method="post" action="">
<%	
	ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
	JdbcTemplate jdbcTemplate = (JdbcTemplate)ctx.getBean("jdbcTemplate");
	
	String tbdw = request.getAttribute("tbdw").toString();
	String commandtype = request.getAttribute("type").toString();
	
	//全部信息
	if("a".equals(commandtype)){
%>
  <table  width="68%"  border="0" cellspacing="0"  align="center"   cellpadding="0">
    <tr> 
	  <td>
<%
		String parentfile = request.getAttribute("parentfile").toString();
		if(!"defalutfile".equals(parentfile)){
%>	
	    <input type="button" name="button" value="关闭窗口" onclick="parent.focus();window.close()" class="input1">
<%
		}
%>
	  </td>
    </tr>
  </table>
<%
	}
	if("a".equals(commandtype)||"1".equals(commandtype)){
		List listYxzt = (List)request.getAttribute("listYxzt");
		if(listYxzt.size()>0){
%>
  <table  width="68%"  border="0" cellspacing="0"  align="center"   cellpadding="0" class="bordercolor">
    <tr> 
      <td  height="30" bgcolor="#336699" ><font color="#FFFFFF"><b>运行状态</b></font></td>
    </tr>
  </table>
<%
		}
		for(int i=0;i<listYxzt.size();i++){
			Map mapYxzt = (Map)listYxzt.get(i);

%>
  <table  width="68%"  border="0" cellspacing="0"  align="center"   cellpadding="0" >
    <tr> 
      <td height="20" colspan="2" align="center" class="title" ><%=mapYxzt.get("pjnm")%></td>
    </tr>
    <tr> 
      <td height="20" ><%=mapYxzt.get("provnm")%></td>
      <td height="20" align="right"><%=mapYxzt.get("wtdpdt")%></td>
    </tr>
  </table>	
  <table width="68%" border="0"  align="center"   cellpadding="0" cellspacing="0" class="bordercolor">
    <tr align="middle" height="80"> 
      <td width="16.6%" height="80" align="center"> 
<%
 	 		String sql = " select * from tb_pjr_m where pjrno = '" + mapYxzt.get("pjrno") + "'";
			List list = jdbcTemplate.queryForList(sql);

			for(int j=0;j<list.size();j++){
				Map map = (Map)list.get(j);				
				boolean temp_rowflag = true;
    			String fileName = "fxdt" + map.get("ZLBM") + "." + map.get("WJGS");
    			String filename = "gq10000.jpg";
        		int size=8000/1024;
	    		String altStr1 = "编 号:" + map.get("ZLBM");
	    		String altStr2 = "标  题:" + map.get("TITLE");
	   	 		String altStr3 = "采集单位:" + mapYxzt.get("wtdpdt");
	    		String altStr4 = "采集时间:" + map.get("DTCDT");
	    		String altStr5 = "文件名:" + filename;
	    		String altStr6 = "长 度:" + size + "kb";
	    		String altStr7 = "介绍:"; 
	    
				if("JPG".equals(map.get("WJGS").toString().toUpperCase())||"jpg".equals(map.get("WJGS").toString().toLowerCase())){
%>
        <img src="../edit_fold/imgout.asp?tablename=TB_PJR_M&media_id=<%=map.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='../edit_fold/info_yxzt.asp?fxxd_pId=<%=map.get("ZLBM")%>&title=<%=map.get("TITLE")%>&dtcdt=<%=map.get("DTCDT")%>&tbdw=<%=tbdw%>&fileName=<%=fileName%>&WJGS=<%=map.get("WJGS")%>'"> 
<% 		
        		}else
%>
        <img src="../../image/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='../edit_fold/info_yxzt.asp?fxxd_pId=<%=map.get("ZLBM")%>&title=<%=map.get("TITLE")%>&dtcdt=<%=map.get("DTCDT")%>&tbdw=<%=tbdw%>&fileName=<%=fileName%>&WJGS=<%=map.get("WJGS")%>'" WIDTH="80" HEIGHT="53"> 
<%
			}
%>
      </td>
    </tr>
  </table>

      
  <table width="68%" border="0"  align="center" cellpadding="1" cellspacing="1" bgcolor="#336699"  class="bordercolor" valign="top">
    <tr align="center"> 
      <td height="23" bgcolor="#E4E1D6">检测时间</td>
      <td height="23" bgcolor="#FFFFFF"><%=mapYxzt.get("dtcdt")%></td>
      <td height="20" bgcolor="#E4E1D6">工程所在地</td>
      <td height="20" bgcolor="#FFFFFF"><%=mapYxzt.get("provnm")%></td>
    </tr>
    <tr align="center"> 
      <td height="11" bgcolor="#E4E1D6">防汛责任人</td>
      <td height="11" bgcolor="#FFFFFF"><%=mapYxzt.get("fpduty")%></td>
      <td height="11" bgcolor="#E4E1D6">防汛责任人电话</td>
      <td height="11" bgcolor="#FFFFFF"><%=mapYxzt.get("fpdutyph")%></td>
    </tr>
    <tr align="center"> 
      <td height="7" bgcolor="#E4E1D6" >险情预测</td>
      <td height="14" bgcolor="#FFFFFF"><%=mapYxzt.get("dncfc")%></td>
      <td height="14" bgcolor="#E4E1D6">抢险资源配备</td>
      <td height="14" bgcolor="#FFFFFF"><%=mapYxzt.get("rderescn")%></td>
    </tr>
    <tr align="center"> 
      <td height="7" bgcolor="#E4E1D6">补充描述</td>
      <td height="14" bgcolor="#FFFFFF"><%=mapYxzt.get("nt")%></td>
      <td height="14" bgcolor="#E4E1D6">工程类别</td>
      <td height="14" bgcolor="#FFFFFF"><%=mapYxzt.get("gcflmc")%></td>
    </tr>
  </table>

	<%
		}	
	}
	//险情
	if("a".equals(commandtype)||"2".equals(commandtype)){
		List listXq = (List)request.getAttribute("listXq");
		if(listXq.size()>0){
	%>
<br>
<br>

  <table  width="68%"  border="0" cellspacing="0"  align="center"   cellpadding="0" class="bordercolor">
    <tr> 
      <td  height="30" bgcolor="#336699" ><font color="#FFFFFF"><b>险情</b></font></td>
    </tr>
  </table>
  <%
		}
		for(int i=0;i<listXq.size();i++){
			Map mapXq = (Map)listXq.get(i);
%>	
  <table  width="68%"  border="0"  align="center"   cellpadding="0" cellspacing="0">
    <tr > 
      <td height="28" colspan="2" align="center" class="title" ><%=mapXq.get("dncnm")%></td>
    </tr>
    <tr > 
      <td width="50%" height="29"><%=mapXq.get("pjnm")%></td>
      <td width="50%" height="28" align="right"><%=mapXq.get("dagtm")%></td>
    </tr>
  </table>
	<table width="68%" border="0" cellspacing="0"  align="center"   cellpadding="0"  class="bordercolor">
    <tr align="middle" height="80"> 
      <td width="16.6%" height="80" align="center"> 
        <%
		
			String sql = " select * from tb_stdnc_m where dncno = '" + mapXq.get("dncno") + "'";
       		List list = jdbcTemplate.queryForList(sql);
       		for(int j=0;j<list.size();j++){
       			Map map = (Map)list.get(j);
    			String fileName = "fxdt" + map.get("ZLBM") + "." + map.get("WJGS");
        		int size = 8000/1024;
	    		String altStr1 = "编 号:" + map.get("ZLBM");
	    		String altStr2 = "标  题:" + map.get("TITLE");
	    		String altStr3 = "采集单位:";
	    		String altStr4 = "采集时间:" + map.get("DTCDT");
	    		String altStr5 = "文件名:" + fileName;
	    		String altStr6 = "长 度:" + size + "kb";
	    		String altStr7 = "介绍:";

	    		if("JPG".equals(map.get("WJGS").toString().toUpperCase())||"jpg".equals(map.get("WJGS").toString().toLowerCase())){
		 %>
        <img src="../edit_fold/imgout.asp?tablename=TB_STDNC_M&media_id=<%=map.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)"  onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='../edit_fold/info_xq.asp?fxxd_pId=<%=map.get("ZLBM")%>&title=<%=map.get("TITLE")%>&dtcdt=<%=map.get("DTCDT")%>&tbdw=<%=tbdw%>&fileName=<%=fileName%>&WJGS=<%=map.get("WJGS")%>'"> 
        <% 
	    		}else{
	    %>
        <img src="../image/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='../edit_fold/info_xq.asp?fxxd_pId=<%=map.get("ZLBM")%>&title=<%=map.get("TITLE")%>&dtcdt=<%=map.get("DTCDT")%>&tbdw=<%=tbdw%>&fileName=<%=fileName%>&WJGS=<%=map.get("WJGS")%>'" WIDTH="80" HEIGHT="53"> 
        <%
	    		}
       		}
		%>
      </td>
    </tr>
  </table>

    
  <table width="68%" border="0"  align="center"  cellpadding="0" cellspacing="0" valign="top">
    <tr> 
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#336699">
          <tr align="center"> 
            <td width="18%" height="29" bgcolor="#E4E1D6"><font color=#000000>险情类别</font></td>
            <td width="32%" height="29" bgcolor="#FFFFFF"><%=mapXq.get("xqflmc")%></td>
            <td width="20%" height="29" bgcolor="#E4E1D6">险情级别</td>
            <td width="30%" height="29" bgcolor="#FFFFFF"><%=mapXq.get("dncgr")%></td>
          </tr>
          <tr align="center"> 
            <td width="18%" height="29" bgcolor="#E4E1D6"><font color=#000000>填报单位</font></td>
            <td width="32%" height="29" bgcolor="#FFFFFF"><%=mapXq.get("wtdpcd")%></td>
            <td width="20%" height="29" bgcolor="#E4E1D6">出险地点桩号</td>
            <td width="30%" height="29" bgcolor="#FFFFFF"><font color=#000000><%=mapXq.get("dagplcch")%></font></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td colspan="4"> <input type="button" id="button_detail" name="button_detail" value="详细信息" onclick="if(this.value=='详细信息'){openUrl('../edit_fold/detailinfo_xq.asp?DNCNO=<%=mapXq.get("DNCNO")%>',400,300,top);this.value='关闭信息'}else{this.value='详细信息';closeUrl('../edit_fold/detailinfo_xq.asp?DNCNO=<%=mapXq.get("DNCNO")%>')}" class="input1"> 
            </td>
          </tr>
        </table></td>
    </tr>
    <table height="29">
      <tr>
        <td></td>
      </tr>
    </table>
  </table>
	<%
		}
	}
	//防汛行动
	if("a".equals(commandtype)||"3".equals(commandtype)){
		List listFxxd = (List)request.getAttribute("listFxxd");
		if(listFxxd.size()>0){
	%>
<br>
<br>
  <table  width="68%"  border="0" cellspacing="0"  align="center"   cellpadding="0" class="bordercolor">
    <tr> 
      <td  height="30" bgcolor="#336699" ><font color="#FFFFFF"><b>防汛行动</b></font></td>
    </tr>
  </table>
  <%	
		}
		for(int i=0;i<listFxxd.size();i++){
			Map mapFxxd = (Map)listFxxd.get(i);
			String ACTICO = mapFxxd.get("ACTICO").toString();
	%>
  <table width="68%" border="0" align="center" cellpadding="0" cellspacing="0"  valign="top">
    <tr> 
      <td colspan="2" align="center" class="title" > <%=mapFxxd.get("WTTT")%> </td>
    </tr>
    <tr> 
      <td width="50%" ><%=mapFxxd.get("WTDPCD")%></td>
      <td width="50%" align="right">&nbsp;<%=mapFxxd.get("WTDT")%></td>
    </tr>
  </table>
	<table width="68%" border="0" cellspacing="0"  align="center"   cellpadding="0"  class="bordercolor">
    <tr align="middle" height="80"> 
      <td width="16.6%" height="80" align="center"> 
    <%
        
    		String sql = " select * from tb_fpacti_m where rpjincd = '" + mapFxxd.get("rpjincd") + "'";
    		List list = jdbcTemplate.queryForList(sql);

			for(int j=0;j<list.size();j++){
				Map map = (Map)list.get(j);
			
    			String fileName = "fxdt" + map.get("ZLBM") + "." + map.get("WJGS");
        		int size = 8000/1024;
	    		String altStr1 = "编 号:" + map.get("ZLBM");
	    		String altStr2 = "标  题:" + map.get("TITLE");
	    		String altStr3 = "采集单位:" ;
	    		String altStr4 = "采集时间:" + map.get("DTCDT");
	    		String altStr5 = "文件名:" + fileName;
	    		String altStr6 = "长 度:" + size + "kb";
	        	String altStr7 = "介绍:"; 
	    
	        	if("JPG".equals(map.get("WJGS").toString().toUpperCase())||"jpg".equals(map.get("WJGS").toString().toLowerCase())){
	%>
        <img src="../edit_fold/imgout.asp?tablename=TB_FPACTI_M&amp;media_id=<%=map.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='../edit_fold/info_fxxd.asp?fxxd_pId=<%=map.get("ZLBM")%>&amp;title=<%=map.get("TITLE")%>&amp;dtcdt=<%=map.get("DTCDT")%>&amp;tbdw=<%=tbdw%>&amp;fileName=<%=fileName%>&amp;WJGS=<%=map.get("WJGS")%>'"> 
        <% 	}else{  %>
        <img src="../image/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='../edit_fold/info_fxxd.asp?fxxd_pId=<%=map.get("ZLBM")%>&amp;title=<%=map.get("TITLE")%>&amp;dtcdt=<%=map.get("DTCDT")%>&amp;tbdw=<%=tbdw%>&amp;fileName=<%=fileName%>&amp;WJGS=<%=map.get("WJGS")%>'" WIDTH="80" HEIGHT="53"> 
        <%
        	}
		}
	%>
      </td>
    </tr>
  </table>
  <table width="68%" border="0" cellspacing="0"  align="center" cellpadding="0" height="60%" class="bordercolor">
    <tr> 
      <td height="80" align="center"> <textarea name="text_detail" cols="60" style="border=1 solid #002200;" rows="15" wrap="VIRTUAL" class="button_query" onchange="javascript:alter('hello');textfield.value='记录未修改'">
			<%=ACTICO%> 
          </textarea> 
      </td>
    </tr>
  </table>
	<%
		}
	}
	//灾情
	if("a".equals(commandtype)||"4".equals(commandtype)){
		List listZq = (List)request.getAttribute("listZq");
		if(listZq.size()>0){
	%>
<br>
<br>
  <table  width="68%"  border="0" cellspacing="0"  align="center"   cellpadding="0" class="bordercolor">
    <tr> 
      <td  height="30" bgcolor="#336699" ><font color="#FFFFFF"><b>灾情</b></font></td>
    </tr>
  </table>
  <%	
		}
		for(int i=0;i<listZq.size();i++){
			Map mapZq = (Map)listZq.get(i);
			String SDDSC = mapZq.get("SDDSC").toString();
	%>
  <table width="68%" height="38" border="0" align="center" cellpadding="0" cellspacing="0" valign="top">
    <tr> 
      <td height="24" colspan="2" align="center" class="title"><%=mapZq.get("WTTT")%></td>
    </tr>
    <tr> 
      <td width="50%" height="11"><%=mapZq.get("WTDPCD")%></td>
      <td width="50%" height="11" align="right"> <%=mapZq.get("WTDT")%>&nbsp; </td>
    </tr>
  </table>	
	<table width="68%" border="0"  align="center" cellpadding="0" cellspacing="0" bordercolor="#336699" class="bordercolor">
    <tr align="middle" height="80"> 
      <td width="16.6%" height="80" align="center"> 
        <%
    
    		String sql = " select * from tb_sd_m where rpjincd = '" + mapZq.get("rpjincd") + "'";
			List list = jdbcTemplate.queryForList(sql);
			
			for(int j=0;j<list.size();j++){
	 			Map map = (Map)list.get(j);
    			String fileName = "fxdt" + map.get("ZLBM") + "." + map.get("WJGS");
        		int size = 8000/1024;
	    		String altStr1 = "编 号:" + map.get("ZLBM");
	    		String altStr2 = "标  题:" + map.get("TITLE");
	    		String altStr3 = "采集单位:";
	    		String altStr4 = "采集时间:" + map.get("DTCDT");
	    		String altStr5 = "文件名:" + fileName;
	    		String altStr6 = "长 度:" + size + "kb";
	    		String altStr7="介绍:";
	    
	    		if("JPG".equals(map.get("WJGS").toString().toUpperCase())||"jpg".equals(map.get("WJGS").toString().toLowerCase())){
		 %>
       		<img src="../edit_fold/imgout.asp?tablename=TB_SD_M&media_id=<%=map.get("ZLBM")%>" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='../edit_fold/info_zq.asp?fxxd_pId=<%=map.get("ZLBM")%>&title=<%=map.get("TITLE")%>&dtcdt=<%=map.get("DTCDT")%>&tbdw=<%=tbdw%>&fileName=<%=fileName%>&WJGS=<%=map.get("WJGS")%>'"> 
         <% 	}else{  %>
            <img src="../image/lx.gif" onMouseOver="display('<%=altStr1%>','<%=altStr2%>','<%=altStr3%>','<%=altStr4%>','<%=altStr5%>','<%=altStr6%>','<%=altStr7%>',event.x,event.y)" onMouseOut="hide()" style="cursor:hand; border=0; height=60;width=100; z-index:8;" onClick="window.location='../edit_fold/info_zq.asp?fxxd_pId=<%=map.get("ZLBM")%>&title=<%=map.get("TITLE")%>&dtcdt=<%=map.get("DTCDT")%>&tbdw=<%=tbdw%>&fileName=<%=fileName%>&WJGS=<%=map.get("WJGS")%>'" WIDTH="80" HEIGHT="53"> 
         <%
          		}
			}
		 %>
        </td>
    </tr>
  </table>

  <table width="68%" border="0" cellspacing="0"  align="center" cellpadding="0" class="bordercolor">
    <tr>
      <td height="80"><div align="center"> 
          <textarea name="text_detail" cols="60%" style="border=1 solid #002200 " rows="8" readonly wrap="VIRTUAL" class="button_query" onclick="">
			<%=SDDSC%>
          </textarea>
        </div></td>
    </tr>
  </table>    
    <%
		}
    %>
  <p>&nbsp;</p>
	<%
	}
	%>

</form>
</BODY>
</HTML>