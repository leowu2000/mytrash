package com.basesoft.modules.detail;

import java.util.HashMap;
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
	 * 获取险情信息
	 * @param id
	 * @return
	 */
	public Map getXq1(String id){
		return jdbcTemplate.queryForMap("select * from tb_stdnc std,tb_pj pj,tb_xqfl xq where xq.xqfldm = std.xqfldm and pj.pjno = std.pjno and  dncno = '" + id + "'");
	}
	
	/**
	 * 获取险情多媒体信息
	 * @param id
	 * @return
	 */
	public List<?> getXq_m(String id){
		return jdbcTemplate.queryForList("SELECT * FROM TB_STDNC_M WHERE dncno = '" + id + "'");
	}
	
	/**
	 * 获取险情建筑物信息
	 * @param id
	 * @return
	 */
	public Map getXq_s(String id){
		return jdbcTemplate.queryForMap("select * from tb_stdnc sc,tb_st st where sc.sttpcd = st.sttpcd  and sc.dncno = '" + id + "'");
	}
	
	/**
	 * 获取险情分类信息
	 * @param tablename 险情分类数据表
	 * @param dncno 险情id
	 * @return
	 */
	public Map getXqflxx(String tablename, String dncno){
		List list = jdbcTemplate.queryForList("select * from " + tablename + " where DNCNO='" + dncno + "'");
		
		if(list.size()>0){
			return (Map)list.get(0);
		}else {
			return new HashMap();
		}
	}
	
	/**
	 * 获取运行状态
	 * @param id
	 * @return
	 */
	public Map getYxzt(String id){
		return jdbcTemplate.queryForMap("select * from tb_pjrcn pjr,tb_pj pj,tb_gclb gc,tb_cnt cnt where cnt.cntcd =pj.cntcd and pj.pjno = pjr.pjno and pjr.gcfldm = gc.gcfldm and pjrno = '" + id + "'");
	}
	
	/**
	 * 获取运行状态多媒体信息
	 * @param id
	 * @return
	 */
	public List<?> getYxzt_m(String id){
		return jdbcTemplate.queryForList("SELECT * FROM TB_PJR_M WHERE PJRNO = '" + id + "'");
	}
	
	/**
	 * 获取灾情信息
	 * @param id
	 * @return
	 */
	public Map getZq(String id){
		return jdbcTemplate.queryForMap("SELECT * FROM TB_SD WHERE RPJINCD = '" + id + "'");
	}
	
	/**
	 * 获取灾情状态多媒体信息
	 * @param id
	 * @return
	 */
	public List<?> getZq_m(String id){
		return jdbcTemplate.queryForList("SELECT * FROM TB_SD_M WHERE RPJINCD = '" + id + "'");
	}
}
