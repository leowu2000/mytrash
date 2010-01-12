package com.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionPool {
	
	public static void main(String args[]) throws Exception {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String dburl = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ=f:\\cpjdb.mdb";
		Connection conn = DriverManager.getConnection(dburl);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from tb_lysx1 where Mid(CTCD,1,2)=MID('AC000000',1,2) and Mid(CTCD,1,5)<>MID('AC000000',1,5)");
		System.out.println("行政区划名称\t省市县名称");
		while (rs.next()) {
			System.out.println(rs.getString(1) + "\t" + new String(rs.getString(2).getBytes(),"GB2312"));
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
	public static void freeConnection(Connection conn){
		try{
			conn.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
