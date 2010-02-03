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
	
	/**
	 * 获取防汛行动信息
	 * @param id
	 * @return
	 */
	public Map getFxxd(String id){
		return jdbcTemplate.queryForMap("SELECT * FROM TB_FPACTI WHERE RPJINCD = '" + id + "'");
	}
	
	/**
	 * 获取防汛行动多媒体信息
	 * @param id
	 * @return
	 */
	public List<?> getFxxd_m(String id){
		return jdbcTemplate.queryForList("SELECT * FROM TB_FPACTI_M WHERE RPJINCD = '" + id + "'");
	}
	
	/**
	 * 获取旱情信息
	 * @param id
	 * @return
	 */
	public Map getHq(String id){
		return jdbcTemplate.queryForMap("SELECT * FROM TB_QT WHERE RPJINCD = '" + id + "'");
	}
	
	/**
	 * 获取旱情多媒体信息
	 * @param id
	 * @return
	 */
	public List<?> getHq_m(String id){
		return jdbcTemplate.queryForList("SELECT * FROM TB_QT_M WHERE RPJINCD = '" + id + "'");
	}
	
	/**
	 * 获取险情信息
	 * @param id
	 * @return
	 */
	public Map getXq(String id){
		return jdbcTemplate.queryForMap("select * from tb_stdnc std,tb_pj pj,tb_xqfl xq where xq.xqfldm = std.xqfldm and pj.pjno = std.pjno and  dncno = '" + id + "'");
	}
	
	/**
	 * 获取险情多媒体信息
	 * @param id
	 * @return
	 */
	public List<?> getXq_m(String id){
		return jdbcTemplate.queryForList("SELECT * FROM TB_STDNC_M WHERE RPJINCD = '" + id + "'");
	}
	
	/**
	 * 获取险情建筑物信息
	 * @param id
	 * @return
	 */
	public Map getXq_s(String id){
		return jdbcTemplate.queryForMap("select * from tb_stdnc sc,tb_st st where sc.sttpcd = st.sttpcd  and sc.dncno = '" + id + "'");
	}
}
