package com.basesoft.modules.login;

import java.util.List;

import com.basesoft.core.CommonDAO;

public class LoginDAO extends CommonDAO {

	/**
	 * 判断是否具有管理权限
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean isAdmin(String username, String password){
		boolean isAdmin = false;
		
		String sql = "select * from TB_USER where NAME='" + username + "' and PASS='" + password + "' and AUTH='0'";
		List list = jdbcTemplate.queryForList(sql);
		
		if(list.size()>0){
			isAdmin = true;
		}
		
		return isAdmin;
	}
}
