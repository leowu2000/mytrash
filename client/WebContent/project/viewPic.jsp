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
	// ������뽫���������һ��jsp�У�������img��ǩ���ñ�jsp
	// <img src="pic.jsp?from=file&type=jpeg&src=c:\img\test.jpg">

	// ͼƬ��Դ, ���ļ�(file)�����ݿ�(database)
	String from = request.getParameter("from") == null ? "" : request
			.getParameter("from").toString();
	String ID = request.getParameter("zlbm");
	// ͼƬ����, jpeg/gif/bmp
	String type = request.getParameter("type") == null ? "" : request
			.getParameter("type").toString();
	response.reset();
	response.setContentType("image/" + type);

	java.io.InputStream in = null;

	// ��ʽ1: ������ʽ��ȡͼƬ�ļ�. pic.jsp?from=file&type=jpeg&file=c:\img\test.jpg
	if (from.equals("") || from.equals("file")) {
		in = new java.io.FileInputStream(request.getParameter("src")
				.toString());
	} else // ��ʽ2: �����ݿ��ж�ȡ��. pic.jsp?from=database&type=jpeg&src=168
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
