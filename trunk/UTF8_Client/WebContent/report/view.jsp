<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/common/session.jsp"%>
<% 
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    FXJBBean bean = (FXJBBean)request.getSession().getAttribute("fxjbBean");
    String RPJINCD = bean.getRPJINCD();
    Connection conn = ConnectionPool.getConnection(relPath);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select ZLBM,DTCDT,TITLE,WJGS,LXZP,NRMS from TB_FXJB_M where RPJINCD="+RPJINCD);
%> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>

</head>

<style media="screen" type="text/css" >

td {
	font-size: 10pt;
	padding-left: 5px;
}
a {
	text-decoration: none;
	color: #484833;

}
a:hover {
	text-decoration: underline;
	color: #6B6B4B;

}
body {
	SCROLLBAR-FACE-COLOR: #E2EFF4;
	SCROLLBAR-SHADOW-COLOR: #FFFFFF;
	SCROLLBAR-3DLIGHT-COLOR: #5C9ABC;
	SCROLLBAR-ARROW-COLOR: #5C9ABC;
	SCROLLBAR-DARKSHADOW-COLOR: #5C9ABC;
	SCROLLBAR-BASE-COLOR: #FFFFFF;
}
.newFont{
	font-size:18px;
	color:#4B4B4B;
	font-weight:bold;
	font-family:'楷体_GB2312';
}
.input_btn{
	color: #484833; 
	background-color: #F9FEF3; 
	border: #A59D9D;
	border-style: solid; 
	border-top-width: 1px; 
	border-right-width: 1px; 
	border-bottom-width: 1px; 
	border-left-width: 1px;
}
</style>

<script language="JAVASCRIPT">

function printpage(m_printpage1){

    var printStr = document.all.item(m_printpage1).innerHTML;
	
    var oldstr = document.body.innerHTML;
    document.body.innerHTML = printStr;
    window.print(); 
    document.body.innerHTML = oldstr;
    return true;
}
</script>
<body >
<form name="frm">
<span id="printTab">
<table width="790" align="center" >
	<tr height="280"><td colspan="5"><img src="/images/head.jpg"></img></td></tr>
	<tr><td align="center" colspan="5">
	<font style="font-size:20px;color:#000000;font-weight:bold;font-family:'楷体_GB2312';">
	第 <%=bean.getISSUE() %> 期</font></td></tr>
	<tr>
		<td width="30">&nbsp;</td>
		<td width="100" align="left">
		<font style="font-size:20px;color:#000000;font-weight:bold;font-family:'楷体_GB2312';">
		<%=configBean.getTBDW() %></font></td>
		<td width="300">&nbsp;</td>
		<td width="190" align="right">
		<font style="font-size:20px;color:#000000;font-weight:bold;font-family:'楷体_GB2312';">
		<%=UtilDateTime.nowDateStringCN().substring(0,10).trim() %></font></td>
		<td width="30">&nbsp;</td>
	</tr>
		<tr><td colspan="5"><hr size="1" width="700" style="border-top:1px;COLOR: #000000;HEIGHT:0;"></td></tr>
		<tr><td colspan="5" align="center">
		<font style="font-size:24px;color:#000000;font-weight:bold;font-family:'楷体_GB2312';">
		<%=bean.getWTTT() %></font>
		</td>
	</tr>
	<tr>
		<td width="30">&nbsp;</td>
		<td colspan="3">
		<%=bean.getACTICO()%>
		</td>
		<td width="30">&nbsp;</td>
	</tr>
	<tr><td colspan="5"><hr size="1" width="700" style="border-top:1px;COLOR: #000000;HEIGHT:0;"></td></tr>
	<tr height="20" >
		<td width="30">&nbsp;</td>
		<td colspan="3" align="left">
		<font style="font-size:20px;color:#4B4B4B;font-weight:bold;font-family:'楷体_GB2312';">
		报送单位：</font>
		<font style="font-size:18px;color:#000000;font-weight:bold;font-family:'楷体_GB2312';">
		<%=configBean.getBSDW() %></font>
		</td>
		<td width="30">&nbsp;</td>
	</tr>
	<tr><td colspan="5" align="center"><hr size="1" width="700" style="border-top:1px;COLOR: #000000;HEIGHT:0;"></td></tr>
	<tr height="20" >
		<td width="30">&nbsp;</td>
		<td align="left">
		<font style="font-size:20px;color:#4B4B4B;font-weight:bold;font-family:'楷体_GB2312';">
		签发：</font>
		<font style="font-size:18px;color:#000000;font-weight:bold;font-family:'楷体_GB2312';">
		<%=bean.getQF() %></font></td>
		<td align="center">
		<font style="font-size:20px;color:#4B4B4B;font-weight:bold;font-family:'楷体_GB2312';">
		审核：</font>
		<font style="font-size:18px;color:#000000;font-weight:bold;font-family:'楷体_GB2312';">
		<%=bean.getSH() %></font></td>
		<td align="right">
		<font style="font-size:20px;color:#4B4B4B;font-weight:bold;font-family:'楷体_GB2312';">
		拟搞：</font>
		<font style="font-size:18px;color:#000000;font-weight:bold;font-family:'楷体_GB2312';">
		<%=bean.getNG() %></font></td>
		<td width="30">&nbsp;</td>
	</tr>
	<tr><td colspan="5" align="center"><hr size="1" width="700" style="border-top:1px;COLOR: #000000;HEIGHT:0;"></td></tr>
	</table>
</span>
</form>
<br>
<table width="790" align="center">
	<tr><td colspan="5" align="center">
		<input type="button" value=" 打  印 " name="" class="input_btn" onclick="javascript:printpage('printTab')"/>
		&nbsp;&nbsp;&nbsp;
		<input type="button" value=" 关  闭 " name="" class="input_btn"onclick="javascript:window.close()"/>
	</td></tr>
	<%
		while(rs.next()){
			String filename = rs.getString("TITLE")+"."+rs.getString("WJGS");
	%>
	<tr>
	<td width="50">&nbsp;</td>
	<td colspan="3"><font style="padding-left:60px;">
	附件：<a href="/FileUploadServlet?type=download&tablename=TB_FXJB_M&media_id=<%=rs.getString("ZLBM") %>&filename=<%=filename %>"><%=filename%></a>(注：保存附件时，请一定将在此显示的附件文件的名称和扩展名作为保存文件的名称和扩展名，否则可能出现文件类型错误，而无法打开!)
	</font></td></tr>
	<%} %>
</table>
</body>
<%
rs.close();
conn.close();
%>
</html>
