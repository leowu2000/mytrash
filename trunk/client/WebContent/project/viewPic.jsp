<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*"%>
<%@ page import="com.core.*"%>
<%@ page import="com.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%
	String PATH = request.getRealPath("/");
	// 如果你想将输出包含在一个jsp中，可以用img标签调用本jsp
	// <img src="pic.jsp?from=file&type=jpeg&src=c:\img\test.jpg">

	// 图片来源, 从文件(file)或数据库(database)
	String from = request.getParameter("from") == null ? "" : request
			.getParameter("from").toString();
	String ID = request.getParameter("zlbm");
	// 图片类型, jpeg/gif/bmp
	String type = request.getParameter("type") == null ? "" : request
			.getParameter("type").toString();
	response.reset();
	response.setContentType("image/" + type);

	java.io.InputStream in = null;

	// 方式1: 以流方式读取图片文件. pic.jsp?from=file&type=jpeg&file=c:\img\test.jpg
	if (from.equals("") || from.equals("file")) {
		in = new java.io.FileInputStream(request.getParameter("src")
				.toString());
	} else // 方式2: 从数据库中读取流. pic.jsp?from=database&type=jpeg&src=168
	{
		Connection conn = ConnectionPool.getConnection(PATH);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select LXZP from TB_PJR_M WHERE ZLBM="+ID);
		if (rs.next()) {
			in = (InputStream)rs.getBinaryStream("LXZP");
		}
	}
	OutputStream fos = new FileOutputStream(new File(PATH.replaceAll("\\\\","\\\\\\\\")+"demo.jpg")); 
	int a = 0; 
	byte[] temp = new byte[1024]; 
	while((a = in.read(temp))>0){ 
	int b = 0; 
	b+=a; 
	fos.write(temp,0,b); 
	} 
	fos.flush(); 
	in.close(); 
	fos.close(); 

	//if (in != null) {
	//	byte[] b = new byte[1024];
	//	int len;
	//	while ((len = in.read(b)) != -1) {
	//		response.getOutputStream().write("",0,b);
	//	}
	//	in.close();
	//}
%>
