package com.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionPool {
	
	public static void main(String args[]) throws Exception {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String dburl = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ=f:\\hpjdb.mdb";
		Connection conn = DriverManager.getConnection(dburl);
		Statement stmt = conn.createStatement();
//		ResultSet rs = stmt.executeQuery("select Mid('AAA00001',2,6) ,ctcd from tb_lysx1");
		ResultSet rs = stmt.executeQuery("SELECT * from tb_pj where pjno=(select PJNO from tb_stdnc where DNCNO=2)");
//		System.out.println("������������\tʡ��������");
		while (rs.next()) {
//			String aa = rs.getString(3);
//			if(aa==null)
//				aa="";
//			if(!"".trim().equals(aa))
//				aa = new String(aa.getBytes(),"GB2312");
//			System.out.println("insert into TB_LYSX1(CTCD,CTNM,NT)VALUES('"+rs.getString(1) + "','" + new String(rs.getString(2).getBytes(),"GB2312").trim()+"','"+aa+"');");
			System.out.println(rs.getString(1));
		}
		rs.close();
		stmt.close();
		conn.close();
	}
	
	public static Connection getConnection(String applicationPath){
		Connection conn = null;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String dburl = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+applicationPath+"\\hpjdb.mdb";
			conn = DriverManager.getConnection(dburl);
		}catch(Exception ex){ex.printStackTrace();}
		return conn;
	}
	public static Connection getDbNameConnection(String applicationPath){
		Connection conn = null;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String dburl = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+applicationPath+"\\dbname.mdb";
			conn = DriverManager.getConnection(dburl);
		}catch(Exception ex){ex.printStackTrace();}
		return conn;
	}
	public static Connection getUploadConnection(String applicationPath){
		Connection conn = null;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String dburl = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+applicationPath+"\\upload.mdb";
			conn = DriverManager.getConnection(dburl);
		}catch(Exception ex){ex.printStackTrace();}
		return conn;
	}
	public static Connection getLinshiConnection(String applicationPath){
		Connection conn = null;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String dburl = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+applicationPath+"\\linshi.mdb";
			conn = DriverManager.getConnection(dburl);
		}catch(Exception ex){ex.printStackTrace();}
		return conn;
	}
	public static void freeConnection(Connection conn){
		try{
			conn.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

}