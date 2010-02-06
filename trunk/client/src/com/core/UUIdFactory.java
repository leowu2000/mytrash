package com.core;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class UUIdFactory {
	/**
	 * 生成ID流水号
	 * @param path
	 * @param tablename
	 * @return
	 */
	public static int getMaxId(String path,String tablename,String fileid){
		int id=1;
		Connection conn = null;
		String sql = "select max("+fileid+") from "+tablename;
		try{
			conn = ConnectionPool.getConnection(path);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				id = rs.getInt(1)+1;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return id;
	}
}
