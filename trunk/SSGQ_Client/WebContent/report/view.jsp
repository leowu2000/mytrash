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
<style type="text/css">
<!--
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
.newtr1{
	background-image:url(/images/bottom.jpg);
}
.newtr2{
	background-image:url(/images/bottom2.jpg);
}
.titletr{
	background-image:url(/images/head.jpg);
}
.newFont{
	font-size:18px;
	color:#4B4B4B;
	font-weight:bold;
	font-family:'楷体_GB2312';
}
-->
</style>

<script language="JAVASCRIPT">

function printpage(m_printpage1){

    var printStr = document.all.item(m_printpage1).innerHTML;
    var findstr = "border=0";
    var findstr2 = "cellSpacing=1";
    var newstr=printStr.replace(findstr,"border=1");
    var newstr2=newstr.replace(findstr2,"cellSpacing=0");

    var oldstr = document.body.innerHTML;
    document.body.innerHTML = newstr2;
    window.print(); 
    document.body.innerHTML = oldstr;
    return true;
}
</script>
<body >
<span id="printTab">
<table width="790" align="center">
	<tr class="titletr" height="280"><td colspan="5">&nbsp;</td></tr>
	<tr><td align="center" colspan="5" class="newFont">第 <%=bean.getISSUE() %> 期</td></tr>
	<tr>
		<td width="50">&nbsp;</td>
		<td width="100" align="right" class="newFont"><%=configBean.getTBDW() %></td>
		<td width="300">&nbsp;</td>
		<td width="190" align="right" class="newFont"><%=UtilDateTime.nowDateStringCN().substring(0,10) %></td>
		<td width="30">&nbsp;</td>
	</tr>
		<tr><td colspan="5"><img src="/images/line.jpg"></img></td></tr>
		<tr><td colspan="5" align="center">
		<font style="font-size:18px;font-weight:bold;font-family:'楷体_GB2312';">
		<%=bean.getWTTT() %>
		</font>
		</td>
	</tr>
	<tr>
		<td width="50">&nbsp;</td>
		<td colspan="3">
		<%=bean.getACTICO()%>
		</td>
	</tr>
	<tr class="newtr1" height="50" >
		<td colspan="4">
		<font style="font-size:18px;color:#4B4B4B;font-weight:bold;font-family:'楷体_GB2312';padding-left:150px;">
		<%=configBean.getBSDW() %>
		</font>
		</td>
	</tr>
	<tr class="newtr2" height="40" >
		<td colspan="4" valign="middle">
		<font style="font-size:18px;color:#4B4B4B;font-weight:bold;font-family:'楷体_GB2312';padding-left:120px;padding-top:10px;">
		<%=bean.getQF() %></font>
		<font style="font-size:18px;color:#4B4B4B;font-weight:bold;font-family:'楷体_GB2312';padding-left:193px;">
		<%=bean.getSH() %></font>
		<font style="font-size:18px;color:#4B4B4B;font-weight:bold;font-family:'楷体_GB2312';padding-left:215px;">
		<%=bean.getSH() %></font></td>
	</tr>
</span>
	<tr><td colspan="5" align="center">
		<input type="button" value=" 打  印 " name="" onclick="javascript:printpage('printTab')"/>
		&nbsp;&nbsp;&nbsp;
		<input type="button" value=" 关  闭 " name="" onclick="javascript:window.close()"/>
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
