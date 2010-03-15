<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.core.*" %>
<%@ page import="com.buiness.dao.*" %>
<%@ page import="com.buiness.form.*" %>
<%@ page import="com.fredck.FCKeditor.FCKeditor"%>
<%@ page import="com.core.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<%
	String path = request.getSession().getServletContext().getRealPath("/");
	String picpath = request.getSession().getServletContext().getRealPath("/").replaceAll("\\\\","\\\\\\\\\\\\\\\\");
	String zlbm= request.getParameter("zlbm");
	String pkname= request.getParameter("pkname");
	String tablename = request.getParameter("tbname");
	Connection conn = ConnectionPool.getConnection(path);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select ZLBM,LXZP from "+tablename+" where zlbm="+zlbm);
	System.out.println("select ZLBM,LXZP from "+tablename+" where "+pkname+"="+zlbm);
	java.io.InputStream in = null;
	OutputStream fos = null;
	String medianame = "";
	if (rs.next()) {
		long current = System.currentTimeMillis();
		String zlcode =String.valueOf(rs.getInt("ZLBM"));
		String filename = picpath+"\\\\common\\\\pic\\\\"+zlcode+"_"+current+".mpg";
		File thfile = new File(filename);

		medianame = zlcode+"_"+current+".mpg";

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
	if(fos!=null){
		fos.flush();
		fos.close();
	}
	if(in!=null)
		in.close();
	if(rs!=null)
		rs.close();
	conn.close();
	
%>
<!-- wmv£¬avi£¬mpg,mpeg -->
<html>
<head>
<title></title>
<body >
<div style="margin-top:0; margin-left:0;width:500; height:400;backgorund-color:red;">
<object classid="clsid:05589FA1-C356-11CE-BF01-00AA0055595A" id="ActiveMovie1" width="500" height="400">
<param name="Appearance" value="0" />
<param name="AutoStart" value="-1" />
<param name="AllowChangeDisplayMode" value="-1" />
<param name="AllowHideDisplay" value="0" />
<param name="AllowHideControls" value="-1" />
<param name="AutoRewind" value="-1" />
<param name="Balance" value="0" />
<param name="CurrentPosition" value="0" />
<param name="DisplayBackColor" value="0" />
<param name="DisplayForeColor" value="16777215" />
<param name="DisplayMode" value="0" />
<param name="Enabled" value="-1" />
<param name="EnableContextMenu" value="-1" />
<param name="EnablePositionControls" value="-1" />
<param name="EnableSelectionControls" value="0" />
<param name="EnableTracker" value="-1" />
<param name="Filename" value="/common/pic/<%=medianame %>" valuetype="ref" />
<param name="FullScreenMode" value="0" />
<param name="MovieWindowSize" value="0" />
<param name="PlayCount" value="1" />
<param name="Rate" value="1" />
<param name="SelectionStart" value="-1" />
<param name="SelectionEnd" value="-1" />
<param name="ShowControls" value="-1" />
<param name="ShowDisplay" value="0" />
<param name="ShowPositionControls" value="0" />
<param name="ShowTracker" value="-1" />
<param name="Volume" value="-480" />
</div>
</object>
</body></html>
