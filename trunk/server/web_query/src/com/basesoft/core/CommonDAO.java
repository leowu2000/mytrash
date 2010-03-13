package com.basesoft.core;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

public class CommonDAO {

	public JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate = jdbcTemplate;
	}
	
	/**
	 * 获取险情分类对应的数据库表
	 * @param xqfldm 险情分类代码
	 * @return
	 */
	public String getXqflTable(String xqfldm){
		String tablename = "";
		String sql = "select * from TB_XQFL where XQFLDM='" + xqfldm + "'";
		
		List list = jdbcTemplate.queryForList(sql);
		
		if(list.size()>0){
			Map map = (Map)list.get(0);
			tablename = map.get("TBNAME")==null?"":map.get("TBNAME").toString();
		}
		
		return tablename;
	}
}
