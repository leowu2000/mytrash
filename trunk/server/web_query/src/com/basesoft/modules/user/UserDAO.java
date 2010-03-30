package com.basesoft.modules.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.basesoft.core.CommonDAO;
import com.basesoft.core.PageInfo;
import com.basesoft.core.PageList;

public class UserDAO extends CommonDAO {

	/**
	 * 获取全部用户信息
	 * @param page 页码
	 * @return
	 */
	public PageList findAll(int page){
		String sql = "select * from TB_USER";
		int pagesize = 10;
		int start = pagesize*(page - 1) + 1;
		int end = pagesize*page;
		
		String sqlData = "select * from( select A.*, ROWNUM RN from (" + sql + ") A where ROWNUM<=" + end + ") WHERE RN>=" + start;
		String sqlCount = "select count(*) from (" + sql + ")" + "";
		
		List<?> listData = jdbcTemplate.queryForList(sqlData);
		int count = jdbcTemplate.queryForInt(sqlCount);
		
		PageList pageList = new PageList();
		PageInfo pageInfo = new PageInfo(page, count);
		pageList.setList(listData);
		pageList.setPageInfo(pageInfo);
		
		return pageList;
	}
	
	/**
	 * 根据id获取实例
	 * @param id
	 * @return
	 */
	public User findById(String id){
		User user = new User();
		
		List list = jdbcTemplate.queryForList("select * from TB_USER where NAME='" + id + "'");
		if(list.size()>0){
			Map map = (Map)list.get(0);
			user.setName(map.get("NAME")==null?"":map.get("NAME").toString().trim());
			user.setPass(map.get("PASS")==null?"":map.get("PASS").toString().trim());
			user.setAuth(map.get("AUTH")==null?"":map.get("AUTH").toString());
			user.setNt(map.get("NT")==null?"":map.get("NT").toString().trim());
		}
		
		return user;
	}
}
