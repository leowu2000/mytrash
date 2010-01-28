package com.basesoft.modules.detail;

import java.util.List;
import java.util.Map;

import com.basesoft.core.CommonDAO;

public class DetailDAO extends CommonDAO {

	/**
	 * 获取防汛简报信息
	 * @param id
	 * @return
	 */
	public Map getFxjb(String id){
		return jdbcTemplate.queryForMap("SELECT * FROM TB_FXJB WHERE RPJINCD = '" + id + "'");
	}
	
	/**
	 * 获取防汛简报多媒体信息
	 * @param id
	 * @return
	 */
	public List<?> getFxjb_m(String id){
		return jdbcTemplate.queryForList("SELECT * FROM TB_FXJB_M WHERE RPJINCD = '" + id + "'");
	}
}
