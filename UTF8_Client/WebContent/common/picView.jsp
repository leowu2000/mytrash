<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.util.*" %>
<%@ page import="com.core.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.core.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<% 
	String relPath = request.getSession().getServletContext().getRealPath("/");
	String picpath = request.getSession().getServletContext().getRealPath("/").replaceAll("\\\\","\\\\\\\\\\\\\\\\");
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", 0); 
    String pkvalue = request.getParameter("pkvalue");
    String randomNumber = request.getParameter("temp");
    String tablename = request.getParameter("tablename");
    String pkname = request.getParameter("pkname");
    List<SubTempBean> sublist = BuinessDao.getMediaBeanList(relPath,pkvalue,tablename,pkname,0);
    Connection conn = ConnectionPool.getConnection(relPath);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select ZLBM,DTCDT,TITLE,WJGS,LXZP,NRMS from "+tablename+" where "+pkname+"="+pkvalue);
	//RandomAccessFileExample.delAllFile(picpath+"\\\\common\\\\pic");
	
	Map<String,String> map=new HashMap<String,String>();
	
	while (rs.next()) {
		java.io.InputStream in = null;
		OutputStream fos = null;
		long current = System.currentTimeMillis();
		String wjgs = rs.getString("WJGS");
		String zlcode =String.valueOf(rs.getInt("ZLBM"));
		String filename = picpath+"\\\\common\\\\pic\\\\"+zlcode+"_"+current+"_demo."+wjgs;
		String picname = zlcode+"_"+current+"_demo."+wjgs;
		//if(!"MPG".equals(wjgs.toUpperCase().trim())){
			in = (InputStream)rs.getBinaryStream("LXZP");
			fos = new FileOutputStream(new File(filename));
	
			int a = 0; 
			byte[] temp = new byte[1024]; 
			while((a = in.read(temp))>0){ 
			int b = 0; 
			b+=a; 
			fos.write(temp,0,b); 
			}
		//}
		map.put(zlcode,picname);
		if(fos!=null){
			fos.flush();
			fos.close();
		}
		if(in!=null)
			in.close();
	}
	
	if(rs!=null)
		rs.close();
	conn.close();
%> 
<html>
<head>
<title></title>

</head>
<style>
a {
	text-decoration: none;
	color: #484833;

}
a:hover {
	text-decoration: underline;
	color: #6B6B4B;

}
div
{
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
	width :100px; 
	height:60px; 
}
</style>
<BODY STYLE='OVERFLOW:SCROLL;OVERFLOW-Y:HIDDEN;
	SCROLLBAR-FACE-COLOR: #E2EFF4;
	SCROLLBAR-SHADOW-COLOR: #FFFFFF;
	SCROLLBAR-3DLIGHT-COLOR: #5C9ABC;
	SCROLLBAR-ARROW-COLOR: #5C9ABC;
	SCROLLBAR-DARKSHADOW-COLOR: #5C9ABC;
	SCROLLBAR-BASE-COLOR: #FFFFFF;
	SCROLLBAR-3DLIGHT-COLOR:#ffffff;
	PADDING-BOTTOM:0px;'> 
<table width="100%" height="100%">
	<tr>
	<%if(sublist!=null && sublist.size()>0){
		int i=0;
		for(SubTempBean dbean: sublist){
			String filename=map.get(dbean.getZLBM());
			if("MPG".equals(dbean.getWJGS().trim())){
	%>
		<td>
		<table>
			<tr><td><a href="/buiness.do?actionType=media&filename=<%=filename %>" target="_blank" title="点击播放视频文件" ><img src="/images/pink-system-28.png?temp=<%=System.currentTimeMillis()%>" style="width=60;height=60;border:0" /></a></td></tr>
			<tr><td align="center" style='FONT-SIZE: 12px;'><a href="/common/player.jsp&filename=<%=filename %>" target="_blank"  title="点击播放视频文件"><%=dbean.getTITLE() %></a></td></tr>
		</table>
		</td>
	<%
			}else{
		%>
	<td>
	<table>
		<tr><td><a href="#" title="点击查看详细信息" onclick="document.parentWindow.parent.viewThePic('<%=dbean.getZLBM() %>','<%=tablename %>','/common/pic/<%=map.get(dbean.getZLBM()) %>');return false;"><img src="/common/pic/<%=map.get(dbean.getZLBM()) %>?temp=<%=System.currentTimeMillis()%>" style="width=100;height=60;border:0" /></a></td></tr>
		<tr><td align="center" style='FONT-SIZE: 12px;'><a href="#" title="点击查看详细信息" onclick="document.parentWindow.parent.viewThePic('<%=dbean.getZLBM() %>','<%=tablename %>','/common/pic/<%=map.get(dbean.getZLBM()) %>');return false;"><%=dbean.getTITLE() %></a></td></tr>
		<%
			if(i==0){
		%>
		<script>
		 document.parentWindow.parent.viewThePic('<%=dbean.getZLBM() %>','<%=tablename %>','/common/pic/<%=map.get(dbean.getZLBM()) %>');
		</script>
		<%} %>
	</table>
	</td>
	<%}i++;}} %>
	</tr>
</table>
</BODY> </html>	

