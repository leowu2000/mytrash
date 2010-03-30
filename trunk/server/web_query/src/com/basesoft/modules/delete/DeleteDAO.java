package com.basesoft.modules.delete;

import java.util.Map;

public class DeleteDAO extends com.basesoft.core.CommonDAO {

	/**
	 * 删除防汛简报
	 * @param id
	 */
	public void deleteFxjb(String id){
		String delSql = "DELETE FROM TB_FXJB where RPJINCD = '" + id + "'";
		String delSql_m = "DELETE FROM TB_FXJB_M WHERE RPJINCD = '" + id + "'";
		
		jdbcTemplate.execute(delSql_m);
		jdbcTemplate.execute(delSql);
	}
	
	/**
	 * 删除防汛行动
	 * @param id
	 */
	public void deleteFxxd(String id){
		String delSql = "DELETE FROM TB_FPACTI where RPJINCD = '" + id + "'";
		String delSql_m = "DELETE FROM TB_FPACTI_M WHERE RPJINCD = '" + id + "'";
		
		jdbcTemplate.execute(delSql_m);
		jdbcTemplate.execute(delSql);
	}
	
	/**
	 * 删除旱情信息
	 * @param id
	 */
	public void deleteHq(String id){
		String delSql = "DELETE FROM TB_QT where RPJINCD = '" + id + "'";
		String delSql_m = "DELETE FROM TB_QT_M WHERE RPJINCD = '" + id + "'";
		
		jdbcTemplate.execute(delSql_m);
		jdbcTemplate.execute(delSql);
	}
	
	/**
	 * 删除险情信息
	 * @param id
	 */
	public void deleteXq(String id){
		String tablename = "";
		Map mapTable = jdbcTemplate.queryForMap("SELECT TBNAME from TB_XQFL where XQFLDM=(SELECT XQFLDM from TB_STDNC where DNCNO='" + id + "')");
		tablename = mapTable.get("TBNAME")==null?"":mapTable.get("TBNAME").toString();
		
		String delSql = "DELETE FROM TB_STDNC where DNCNO = '" + id + "'";
		String delSql_m = "DELETE FROM TB_STDNC_M WHERE DNCNO = '" + id + "'";
		String delSql_xqfl = "DELETE FROM " + tablename + " WHERE DNCNO='" + id + "'";
		
		jdbcTemplate.execute(delSql_xqfl);
		jdbcTemplate.execute(delSql_m);
		jdbcTemplate.execute(delSql);
	}
	
	/**
	 * 删除运行状态信息
	 * @param id
	 */
	public void deleteYxzt(String id){
		String tablename = "";
		Map mapTable = jdbcTemplate.queryForMap("SELECT TBNAME from TB_GCLB where GCFLDM=(SELECT GCFLDM from TB_PJRCN where PJRNO='" + id + "')");
		tablename = mapTable.get("TBNAME")==null?"":mapTable.get("TBNAME").toString();
		
		String delSql = "DELETE FROM TB_PJRCN where PJRNO = '" + id + "'";
		String delSql_m = "DELETE FROM TB_PJR_M WHERE PJRNO = '" + id + "'";
		String delSql_gcfl = "DELETE FROM " + tablename + " where PJRNO='" + id + "'";
		
		jdbcTemplate.execute(delSql_gcfl);
		jdbcTemplate.execute(delSql_m);
		jdbcTemplate.execute(delSql);
	}
	
	/**
	 * 删除灾情信息
	 * @param id
	 */
	public void deleteZq(String id){
		String delSql = "DELETE FROM TB_SD where RPJINCD = '" + id + "'";
		String delSql_m = "DELETE FROM TB_SD_M WHERE RPJINCD = '" + id + "'";
		
		jdbcTemplate.execute(delSql_m);
		jdbcTemplate.execute(delSql);
	}
}
