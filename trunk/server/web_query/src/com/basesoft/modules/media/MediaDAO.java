package com.basesoft.modules.media;

import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;

import com.basesoft.core.CommonDAO;

public class MediaDAO extends CommonDAO {

	/**
	 * 取得BLOB信息
	 * @param tablename 表名
	 * @param pId 编号
	 * @return
	 */
	public Map getBlob(String tablename, String pId){
		String sql = "select lxzp from " + tablename + " where zlbm ='" + pId + "'";
		Map map = (Map) jdbcTemplate.execute(sql, new CallableStatementCallback() {   
			public Object doInCallableStatement(CallableStatement stmt)throws SQLException,DataAccessException {   
				ResultSet rs = stmt.executeQuery();   
				Map map = new HashMap();   
				InputStream inputStream = null;   
				String name = "";   
				
				rs.next();
				inputStream = rs.getBinaryStream("lxzp");// 读取blob   
				byte[] b = new byte[7500000];
				try{
					inputStream.read(b);
					inputStream.close();
				}catch(IOException e){
					System.out.println(e);
				}
				map.put("lxzp", b);
				
				rs.close();
				
				return map;  
			}   
				  
		});   
		return map; 
	}
	
	/**
	 * 获取多媒体信息
	 * @param tablename 表名
	 * @param media_id 多媒体id
	 * @return
	 */
	public Map getMedia(String tablename, String media_id){
		Map map = new HashMap();
		
		List list = jdbcTemplate.queryForList("select * from " + tablename + " where zlbm ='" + media_id + "'");
		if(list.size()>0){
			map = (Map)list.get(0);
		}
		
		return map;
	}
}
