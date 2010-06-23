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
   // response.setHeader("Pragma","No-cache"); 
   // response.setHeader("Cache-Control","no-cache"); 
   // response.setDateHeader("Expires", 0); 
	String from = request.getParameter("from");
    String pkvalue = request.getParameter("pkvalue");
    String tablename = request.getParameter("tablename");
    String pkname = request.getParameter("pkname");
    List<SubTempBean> sublist = null;
    if("edit".trim().equals(from))
    	sublist = BuinessDao.getMediaBeanList(relPath,pkvalue,tablename,pkname,0);
    else 
    	sublist = BuinessDao.getMediaBeanList(relPath,pkvalue,tablename,pkname,1);
    Connection conn = ConnectionPool.getConnection(relPath);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select ZLBM,DTCDT,TITLE,WJGS,LXZP,NRMS from "+tablename+" where "+pkname+"="+pkvalue);
	
	Map<String,String> map=new HashMap<String,String>();
	
	while (rs.next()) {
		java.io.InputStream in = null;
		OutputStream fos = null;
		long current = System.currentTimeMillis();
		String wjgs = rs.getString("WJGS");
		String zlcode =String.valueOf(rs.getInt("ZLBM"));
		String filename = picpath+"\\\\common\\\\pic\\\\"+zlcode+"_"+current+"_demo."+wjgs;
		String picname = zlcode+"_"+current+"_demo."+wjgs;
		if(!"MPG".equals(wjgs.toUpperCase().trim())){
			in = (InputStream)rs.getBinaryStream("LXZP");
			fos = new FileOutputStream(new File(filename));
	
			int a = 0; 
			byte[] temp = new byte[1024]; 
			while((a = in.read(temp))>0){ 
			int b = 0; 
			b+=a; 
			fos.write(temp,0,b); 
			}
		}
		map.put(zlcode,picname);
		if(fos!=null){
			fos.flush();
			fos.close();
		}
		if(in!=null){
			in.close();
		}
	}
	
	if(rs!=null)
		rs.close();
	conn.close();

	List<SubTempBean> mediaList = BuinessDao.getMediaList(relPath,pkvalue,tablename);
%> 
<html>
<head>
<title></title>
<script language="javascript">
function viewThePic(url,divid){
	parent.document.getElementById("PicServerUrl").value = url;
	var newPreview = document.getElementById(divid); 
	newPreview.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = url; 
	newPreview.style.width = "100px"; 
	newPreview.style.height = "60px"; 
}
</script>
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
		for(SubTempBean dbean:sublist){ 
			String filename="";
			if("MPG".equals(dbean.getWJGS().trim())){
		%>
			<td>
			<table>
				<tr><td><a href="#" title="点击进行修改" onclick="document.parentWindow.parent.pre_updateThePic('<%=dbean.getZLBM() %>','1','<%=tablename %>','/images/pink-system-28.png');return false;"><img src="/images/pink-system-28.png?temp=<%=System.currentTimeMillis()%>" style="width=60;height=60;border:0" /></a></td></tr>
				<tr><td align="center" style='FONT-SIZE: 12px;'><a href="#" title="点击进行修改" onclick="document.parentWindow.parent.pre_updateThePic('<%=dbean.getZLBM() %>','1','<%=tablename %>','/images/pink-system-28.png');"><%=dbean.getTITLE() %></a></td></tr>
			</table>
			</td>
		<%
				}else{
			%>
	<td>
	<table>
		<tr><td><a href="#" title="点击进行修改" onclick="document.parentWindow.parent.pre_updateThePic('<%=dbean.getZLBM() %>','1','<%=tablename %>','/common/pic/<%=map.get(dbean.getZLBM()) %>');return false;"><img src="/common/pic/<%=map.get(dbean.getZLBM()) %>?temp=<%=System.currentTimeMillis()%>" style="width=100;height=60;border:0" /></a></td></tr>
		<tr><td align="center" style='FONT-SIZE: 12px;'><a href="#" title="点击进行修改" onclick="document.parentWindow.parent.pre_updateThePic('<%=dbean.getZLBM() %>','1','<%=tablename %>','/common/pic/<%=map.get(dbean.getZLBM()) %>');return false;"><%=dbean.getTITLE() %></a></td></tr>
	</table>
	</td>
	<%}}} %>
	<%if(mediaList!=null && mediaList.size()>0){
		for(SubTempBean dbean2:mediaList){ 
		String filename="";
		if("MPG".equals(dbean2.getWJGS().trim())){
	%>
		<td>
		<table>
			<tr><td><a href="#" title="点击进行修改" onclick="document.parentWindow.parent.pre_updateThePic('<%=dbean2.getZLBM() %>','2','<%=tablename %>','/images/pink-system-28.png');return false;"><img src="/images/pink-system-28.png?temp=<%=System.currentTimeMillis()%>" style="width=60;height=60;border:0" /></a></td></tr>
			<tr><td align="center" style='FONT-SIZE: 12px;'><a href="#" title="点击进行修改" onclick="document.parentWindow.parent.pre_updateThePic('<%=dbean2.getZLBM() %>','2','<%=tablename %>','/images/pink-system-28.png');"><%=dbean2.getTITLE() %></a></td></tr>
		</table>
		</td>
	<%
			}else{
		%>
	<td>
	<table>
		<tr><td><div id="Div<%=dbean2.getZLBM()%>"></div>
		<script>
		viewThePic('<%=(dbean2.getLXZP()).replaceAll("\\\\","\\\\\\\\")%>','Div<%=dbean2.getZLBM()%>');
		</script>
		</td></tr>
		<tr><td align="center" style='FONT-SIZE: 12px;'><a href="#" title="点击进行修改" onclick="document.parentWindow.parent.pre_updateThePic('<%=dbean2.getZLBM() %>','2','<%=tablename %>','<%=(dbean2.getLXZP()).replaceAll("\\\\","\\\\\\\\")%>');return false;"><%=dbean2.getTITLE() %></a></td></tr>
	</table>
	</td>
	<%}}}%>
	</tr>
</table>
</BODY> </html>	

