package com.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.core.ConnectionPool;

/**
 * Servlet implementation class CheckSpecification
 */
public class CheckSpecification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckSpecification() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getSession().getServletContext().getRealPath("/");
		String type = request.getParameter("type");
		if("prg".trim().equals(type)){
			//生成工程代码
			/**工程类别编号
			 * ＋Mid(工程所在河流的代码,2,6)
			 * ＋Mid(工程所在地区的行政区划代码,1,2)
			 */
			String result="false";
			String gcnm=new String(request.getParameter("gcnm").getBytes("ISO-8859-1"),"GBK");
			String gclb=request.getParameter("gclb");
			String cntcd=request.getParameter("cntcd");
			String hldm=request.getParameter("hldm");
			String gcdm = gclb+hldm.substring(1, 7)+cntcd.substring(0, 1);
			String sql ="select * from tb_pj where pjnm='"+gcnm+"' and pjnmcd='"+gcdm+"' and cntcd='"+cntcd+"'";
			Connection conn = null;
			try{
				conn = ConnectionPool.getConnection(path);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next())
					result="true";
			}catch(Exception ex){ex.printStackTrace();}
			response.setContentType("text/xml");
			response.setHeader("Charset", "gb2312");
			response.addHeader("Cache-Control", "no-cache");
			response.getWriter().write(new String(result.getBytes("utf-8"), "iso-8859-1"));
		}
		
	}

}
