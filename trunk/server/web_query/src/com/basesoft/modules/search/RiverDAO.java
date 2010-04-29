package com.basesoft.modules.search;

import java.util.List;
import java.util.Map;

import com.basesoft.core.CommonDAO;

public class RiverDAO extends CommonDAO {

	/**
	 * 获取流域
	 * @return
	 */
	public List<?> getLy(){
		String sql = "select * from TB_LYSX1 where SUBSTRING(CTCD,3,8)='000000'";
		return jdbcTemplate.queryForList(sql);
	}
	
	/**
	 * 获取水系
	 * @param ly 流域CODE
	 * @return
	 */
	public List<?> getSx(String ly){
		String sql = "select * from TB_LYSX1 where SUBSTRING(CTCD,1,2)=SUBSTRING('" + ly + "',1,2) and SUBSTRING(CTCD,1,5)<>SUBSTRING('" + ly + "',1,5)";
		return jdbcTemplate.queryForList(sql);
	}
	
	/**
	 * 获取一级支流
	 * @param sx
	 * @return
	 */
	public List<?> getZl1(String sx){
		String sql = "select * from TB_LYSX where SUBSTRING(CTCD,1,3)=SUBSTRING('" + sx + "',1,3) and SUBSTRING(ctcd,6,2)='00'";
		return jdbcTemplate.queryForList(sql);
	}
	
	/**
	 * 获取二级支流
	 * @param zl1
	 * @return
	 */
	public List<?> getZl2(String zl1){
		String sql = "select * from tb_lysx where SUBSTRING(CTCD,1,5)=SUBSTRING('" + zl1 + "',1,5)";
		return jdbcTemplate.queryForList(sql);
	}
}
