package com.basesoft.modules.search;

import org.springframework.jdbc.core.JdbcTemplate;

public class SearchDAO {

	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate = jdbcTemplate;
	}
	
	/**
	 * 根据所选信息类型确定检索的表及select语句的头
	 * @param sortinfo 信息类型
	 * @return
	 */
	public String getSortinfosql(String sortinfo){
		String sql = "";
		
		if("yxzt".equals(sortinfo)){//运行状态
			sql = "select p.* from tb_pjrcn p,tb_pj pj where p.pjno = pj.pjno ";
		}
		
		return sql;
	}
}
