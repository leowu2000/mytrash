<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.buiness.dao.*"%>
<%@ page import="com.buiness.form.*"%>
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
	String PATH = request.getSession().getServletContext().getRealPath("/");
	String tbid = request.getParameter("tbid");
	String pkvalue = request.getParameter("pkvalue");
	String pkname = request.getParameter("pkname");

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
	List<SubTempBean> arrList=new ArrayList<SubTempBean>();
	Connection conn = ConnectionPool.getConnection(PATH);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select ZLBM,DTCDT,TITLE,WJGS,LXZP,NRMS from "+tbid +" where "+pkname+"="+pkvalue);
	System.out.println("select ZLBM,DTCDT,TITLE,WJGS,LXZP,NRMS from "+tbid +" where "+pkname+"="+pkvalue);
	String str_head="[";
	String str_body="";
	String str_detail="]";
	int i=1;
	java.io.InputStream in = null;
	OutputStream fos = null;
	while (rs.next()) {
		String zlcode =String.valueOf(rs.getInt("zlbm"));
		String filename = rs.getString("TITLE");
		String filegs = rs.getString("WJGS").toLowerCase();
		String filedate = rs.getString("DTCDT");
		in = (InputStream)rs.getBinaryStream("LXZP");
		String nrms = rs.getString("NRMS");
		fos = new FileOutputStream(new File(PATH.replaceAll("\\\\","\\\\\\\\")+"\\\\common\\\\pic\\\\"+zlcode+"_demo."+filegs));
		
		int a = 0; 
		byte[] temp = new byte[1024]; 
		while((a = in.read(temp))>0){ 
		int b = 0; 
		b+=a; 
		fos.write(temp,0,b); 
		} 
		
		if("".trim().equals(str_body))
			str_body="["+i+",'"+filename+"',"+zlcode+",'"+nrms+"','"+filedate+"','"+filegs+"','/common/pic/"+zlcode+"_demo."+filegs+"']";
		else
			str_body+=",["+i+",'"+filename+"',"+zlcode+",'"+nrms+"','"+filedate+"','"+filegs+"','/common/pic/"+zlcode+"_demo."+filegs+"']";
		
		fos.flush(); 
		
		i++;
		
	}
	
	in.close(); 
	fos.close(); 
	rs.close();
	conn.close();
	response.setContentType("text/html;charset=GBK");
	System.out.println(str_head+str_body+str_detail);
	response.getWriter().print(str_head+str_body+str_detail);
	
%>

