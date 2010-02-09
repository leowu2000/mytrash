<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.basesoft.core.PageList"%>
<%@ page import="com.basesoft.core.PageInfo"%>
<%@page import="com.basesoft.util.StringUtil"%>
<%
List listFxxd = (List)request.getAttribute("listFxxd");
List listXq = (List)request.getAttribute("listXq");
List listYxzt = (List)request.getAttribute("listYxzt");
List listZq = (List)request.getAttribute("listZq");

int rowcount = listFxxd.size() + listXq.size() + listYxzt.size() + listZq.size();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>防汛行动</title>
    
	<script language="javascript" src="../../script/openurl.js"></script>
	<script language="javascript" src="../../script/common.js"></script>
	<script language="JavaScript">
	  function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  		  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    		  document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  		  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
	  }
	  MM_reloadPage(true);
	  
	  function unselectall()
	  {
    	if(document.form.all.checked){
		  document.form.all.checked = document.form.all.checked + 0;
        } 	
	  }
	  
	  function selectall()
	  {
    	var length = <%=rowcount%>;
    	document.form.all.checked = document.form.all.checked|0;

    	if (length == 0 ){
          return;
    	}
    	if (length ==1 )
    	{
       	  document.form.checkbox.checked=document.form.all.checked ;
    	}
    	if (length>1)
    	{
      	  for (var i = 0; i < length; i++)
       	  {
        	document.form.checkbox[i].checked=document.form.all.checked;         
       	  }
    	}
	}
	</script>
	<link rel="stylesheet" href="../../css/main.css" type="text/css">
  </head>
  
  <body>
    <table width="100%">
	  <tr>
		<td align="center" bgcolor="#FFFFFF">
		  <form name="form" method="post" action="consult.do?action=delete">
        	<div align="left">
          	  <input name=all onClick="selectall()" type=checkbox value=1>
          	  全选
          	</div>
        	<table width="100%" class="bordercolor">
			  <tr>
				<td colspan="4"  align="center"><font color="#000000"  size="+1"> 运行状态</font></td>
			  </tr>
			  <tr class="banner">
				<td width="5%">选择</td>
				<td width="40%">工程名称</td>
				<td width="30%">填报单位</td>
				<td width="20%">填报时间</td>
			  </tr>
<%	
	for(int i=0;i<listYxzt.size();i++){
		Map mapYxzt = (Map)listYxzt.get(i);
%>
			  <tr>
				<td>
				  <input type="checkbox" id="checkbox" name="checkbox<%=i + 1 %>" value="<%=mapYxzt.get("pjrno")%>">
				  <input name="typename<%=i + 1 %>" type="hidden" value="1" size="3">
				</td>
				<td><a href="javascript:openUrl('detail.do?action=yxzt&id=<%=mapYxzt.get("PJRNO")%>&fromfile=hsgl',800,550,0)"><%=mapYxzt.get("pjnm")%></a></td>
				<td><a href="javascript:openUrl('detail.do?action=yxzt&id=<%=mapYxzt.get("PJRNO")%>&fromfile=hsgl',800,550,0)"><%=mapYxzt.get("wtdpcd")%></a></td>
				<td><%=mapYxzt.get("wtdpdt")%></td>
			  </tr>
<%
	}
%>
			</table>
			<table width="100%" class="bordercolor">
			  <tr>
            	<td colspan="4" align="center"><font color="#000000"  size="+1"> 险　　情</font></td>
			  </tr>
			  <tr class="banner">
				<td width="5%">选择</td>
				<td width="40%">险情名称</td>
				<td width="30%">填报单位</td>
				<td width="20%">填报时间</td>
			  </tr>
<%
	for(int i=0;i<listXq.size();i++){
		Map mapXq = (Map)listXq.get(i);
%>
			  <tr>
				<td><input type="checkbox" id="checkbox" name="checkbox<%=listYxzt.size() + i + 1 %>" value="<%=mapXq.get("dncno")%>"><input name="typename<%=listYxzt.size() + i + 1 %>" type="hidden" value="2" size="3"></td>
				<td><a href="javascript:openUrl('detail.do?action=xq&id=<%=mapXq.get("dncno")%>&tbdw=<%=mapXq.get("WTDPCD")%>&fromfile=hsgl',800,550,0)"><%=mapXq.get("dncnm")%></a></td>
				<td><a href="javascript:openUrl('detail.do?action=xq&id=<%=mapXq.get("dncno")%>&tbdw=<%=mapXq.get("WTDPCD")%>&fromfile=hsgl',800,550,0)"><%=mapXq.get("wtdpcd")%></a></td>
				<td><%=mapXq.get("wtdpdt")%></td>
			  </tr>
<%
	}
%>
			</table>
			<table width="100%" class="bordercolor">
			  <tr>
				<td colspan="4" align="center"><font color="#000000"  size="+1"> 防汛行动</font></td>
			  </tr>
			  <tr class="banner">
				<td width="5%">选择</td>
				<td width="40%">标题</td>
				<td width="30%">填报单位</td>
				<td width="20%">填报时间</td>
			  </tr>			
<%
	for(int i=0;i<listFxxd.size();i++){
		Map mapFxxd = (Map)listFxxd.get(i);
%>
			  <tr>
				<td><input type="checkbox" id="checkbox" name="checkbox<%=listXq.size() + listYxzt.size() + i + 1 %>" value="<%=mapFxxd.get("rpjincd")%>"><input name="typename<%=listXq.size() + listYxzt.size() + i + 1 %>" type="hidden" value="3" size="3"></td>
				<td><a href="javascript:openUrl('../edit_fold/edit_fxxd.asp?id=<%=mapFxxd.get("RPJINCD")%>&tbdw=<%=mapFxxd.get("WTDPCD")%>&fromfile=hsgl',800,550,0)"><%=mapFxxd.get("wttt")%></a></td>
				<td><a href="javascript:openUrl('../edit_fold/edit_fxxd.asp?id=<%=mapFxxd.get("RPJINCD")%>&tbdw=<%=mapFxxd.get("WTDPCD")%>&fromfile=hsgl',800,550,0)"><%=mapFxxd.get("wtdpcd")%></a></td>
				<td><%=mapFxxd.get("wtdt")%></td>
			  </tr>
<%
	}
%>
			</table>
			<table width="100%" class="bordercolor">
			  <tr>
            	<td colspan="4" align="center"><font color="#000000"  size="+0"> 灾  情</font></td>
			  </tr>
				<tr class="banner">
				<td width="5%">选择</td>
				<td width="40%">标题</td>
				<td width="30%">填报单位</td>
				<td width="20%">填报时间</td>
			  </tr>
<%
	for(int i=0;i<listZq.size();i++){
		Map mapZq = (Map)listZq.get(i);
%>
			  <tr>
				<td><input type="checkbox" id="checkbox" name="checkbox<%=listFxxd.size() + listXq.size() + listYxzt.size() + i + 1 %>" value="<%=mapZq.get("rpjincd")%>"><input name="typename<%=listFxxd.size() + listXq.size() + listYxzt.size() + i + 1 %>" type="hidden" value="4" size="3"></td>
				<td><a href="javascript:openUrl('../edit_fold/edit_zq.asp?id=<%=mapZq.get("RPJINCD")%>&tbdw=<%=mapZq.get("WTDPCD")%>&fromfile=hsgl',800,550,0)"><%=mapZq.get("wttt")%></a></td>
				<td><a href="javascript:openUrl('../edit_fold/edit_zq.asp?id=<%=mapZq.get("RPJINCD")%>&tbdw=<%=mapZq.get("WTDPCD")%>&fromfile=hsgl',800,550,0)"><%=mapZq.get("wtdpcd")%></a></td>
				<td><%=mapZq.get("wtdt")%></td>
			  </tr>
<%
	}
%>
			</table>
			<input type="hidden" name="row_count" value="<%=rowcount%>"><input type="button" value="删除" onclick="form.submit()" id=button3 name=button3 class="input1">
		  </form>
		</td>
	  </tr>
	</table>
  </body>
</html>
