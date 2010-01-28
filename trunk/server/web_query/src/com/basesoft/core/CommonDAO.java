package com.basesoft.core;

import org.springframework.jdbc.core.JdbcTemplate;

public class CommonDAO {

	public JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate = jdbcTemplate;
	}
}
