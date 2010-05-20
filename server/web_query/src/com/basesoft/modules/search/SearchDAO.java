package com.basesoft.modules.search;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.basesoft.core.CommonDAO;
import com.basesoft.core.PageInfo;
import com.basesoft.core.PageList;

public class SearchDAO extends CommonDAO{

	/**
	 * 综合查询，根据条件生成结果
	 * @param select_sortinfo 信息类型
	 * @param select_sort 工程类别
	 * @param xzqh 行政区域
	 * @param lysx 河流水系
	 * @param date_start 上报起始时间
	 * @param date_end 上报截止时间
	 * @param text_fill 关键字
	 * @param check_projectname 工程名称
	 * @param check_unit 填报单位
	 * @param check_title 信息标题
	 * @param page 页码
	 * @return 
	 */
	public PageList getResult(String select_sortinfo, String select_sort, String xzqh, String lysx, String date_start, String date_end, String text_fill, String check_projectname, String check_unit, String check_title, int page){
		String sql = "";
		int pagesize = 10;
		int start = pagesize*(page - 1) + 1;
		int end = pagesize*page;
		
		PageList pageList = new PageList();
		
		if ("yxzt".equals(select_sortinfo)){//运行状态
			sql = "select p.* from tb_pjrcn p,tb_pj pj where p.pjno = pj.pjno ";
			//按照区域条件组合查询
			//除运行状态、险情、建筑物表之外的其他表都不考虑与行政区域表的关系
			if(!"".equals(xzqh)){//全部区域
				if("000000".equals(xzqh)){//null
					
				}else if("0000".equals(xzqh.substring(2,4))) {//如果后四为为0000则全部省级单位
					sql = sql + " and left(pj.cntcd,2) = '" + xzqh.substring(0,2) + "' ";
				}else{
					sql = sql + " and pj.cntcd = '" + xzqh + "' ";
				}
			}
			
			//按照河流水系条件组合查询
			/*if(!"".equals(lysx)){
				if(lysx.length() == 2){//流域级
					if("ZZ".equals(lysx)){//全国全部流域
							
					}else{
						sql = sql + " and left(pj.pjnmcd,2) = '" + lysx + "'";
					}
				}else if(lysx.length() == 3){//水系级
					if("0".equals(lysx.substring(lysx.length()-2,1))){//该水系所在流域的全部水系
						sql = sql + " and left(pj.pjnmcd,2) = '" + lysx.substring(0,2) + "'";
					}else {//某一水系
						sql = sql + " and left(pj.pjnmcd,3) = '" + lysx + "'";
					}
				}else{//河流级
					if("ZZZZZ".equals(lysx.substring(lysx.length()-6,5))){//该河流所在水系的全部河流
						sql = sql + " and left(pj.pjnmcd,3) = '" + lysx.substring(0,3) + "'";
					}else{//指定河流
						sql = sql + " and pj.pjnmcd = '" + lysx + "'";
					}
				}
			}*/
			
			if(!"".equals(lysx)){
				lysx = lysx.substring(1, 7);
				sql = sql + " and pj.pjnmcd like '%" + lysx + "%'";
			}
			
			//按照关键字组合条件
			boolean yxzt_flage = false;
			if("true".equals(check_projectname)&&!"".equals(text_fill)){//工程名称
				sql = sql + " and (p.pjnm like '%" + text_fill + "%'";
				yxzt_flage = true;
			}
			if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
				if(yxzt_flage == true){
					sql = sql + " or p.wtdpcd like '%" + text_fill + "%'";
				}else{
					sql = sql + " and (p.wtdpcd like '%" + text_fill + "%'";
					yxzt_flage = true;
				}
			}
			if("true".equals(check_title)){//信息标题
				
			}
			if(yxzt_flage == true){
				sql = sql + ") ";
			}
			if("0".equals(select_sort)){//工程类别

			}else{
				sql = sql + " and p.gcfldm = '" + select_sort + "'";
			}
			
			//按日期区间查询
			String tempstr1 = date_start;
			String tempstr2 = date_end;
			if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
				sql = sql + " and  (p.WTDPDT >= '" + tempstr1 + "' and  p.WTDPDT <= '" + tempstr2 + "') ";
			}
			sql = sql + " and 1=1 order by p.WTDPDT desc ";
			//set rs = conn.Execute (UCASE(sql))
			
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			
//=================================================================================================	
			
		}else if ("xqxx".equals(select_sortinfo)){//查询险情信息类型
			//把险情表同工程表相互关联
			sql = "select st.*,pj.pjnm from tb_stdnc st,tb_pj pj where st.pjno = pj.pjno ";
			//按照区域条件组合查询
			//除运行状态、险情、建筑物表之外的其他表都不考虑与行政区域表的关系
			if(!"".equals(xzqh)){//全部区域
				if("000000".equals(xzqh)){
					
				}else if("0000".equals(xzqh.substring(2,6))){//如果后四为为0000则全部省级单位
					sql = sql + " and left(pj.cntcd,2) = '" +  xzqh.substring(0,2) + "' ";
				}else{
					sql = sql + " and pj.cntcd = '" + xzqh + "' ";
				}						
			}
			
			//按照河流水系条件组合查询
			/*if(!"".equals(lysx)){
				if(lysx.length() == 2){//流域级
					if("ZZ".equals(lysx)){//全国全部流域
					
					}else{
						sql = sql + " and left(pj.pjnmcd,2) = '" + lysx + "'";
					}
				}else if(lysx.length() == 3){//水系级
					if("0".equals(lysx.substring(lysx.length()-2,1))){//该水系所在流域的全部水系
						sql = sql + " and left(pj.pjnmcd,2) = '" + lysx.substring(0,2) + "'";
					}else{//某一水系
						sql = sql + " and left(pj.pjnmcd,3) = '" + lysx + "'";
					}
				}else{//河流级
					if("ZZZZZ" .equals(lysx.substring(lysx.length()-6,5))){//该河流所在水系的全部河流
						sql = sql + " and left(pj.pjnmcd,3) = '" + lysx.substring(0,3) + "'";
					}else{//指定河流
						sql = sql + " and pj.pjnmcd = '" + lysx + "'";
					}							
				}			
			}*/
			
			if(!"".equals(lysx)){
				lysx = lysx.substring(1, 7);
				sql = sql + " and pj.pjnmcd like '%" + lysx + "%'";
			}
			
			//按照关键字组合条件
			boolean xqxx_flage = false;
			if("true".equals(check_projectname)&&!"".equals(text_fill)){//工程名称
				sql = sql + " and (pj.pjnm like '%" + text_fill + "%'";
				xqxx_flage = true;
			}
			if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
				if(xqxx_flage == true){
					sql = sql + " or st.wtdpcd like '%" + text_fill + "%'";
				}else{
					sql = sql + " and (st.wtdpcd like '%" + text_fill + "%'";
					xqxx_flage = true;
				}
			}
			if("true".equals(check_title)&&!"".equals(text_fill)){//信息标题							
				if(xqxx_flage == true){
					sql = sql + " or st.dncnm like '%" + text_fill + "%'";
				}else{
					sql = sql + " and (st.dncnm like '%" + text_fill + "%'";
					xqxx_flage = true;
				}
			}
			if(xqxx_flage == true){
				sql = sql + ") ";
			}					
			//工程类别
			if("0".equals(select_sort)){
				//do nothing
			}else{
				//do nothing
			}
			
			//按日期区间查询
			String tempstr1 = date_start;
			String tempstr2 = date_end;
			if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
				sql = sql + " and (st.WTDPDT >= '" + tempstr1 + "' and  st.WTDPDT <= '" + tempstr2 + "') ";
			}
			sql = sql + " and 1=1 order by st.WTDPDT desc ";
			//set rs = conn.Execute (UCASE(sql))
					
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			
//=================================================================================================		
		
		}else if("fxjb".equals(select_sortinfo)){//查询防汛简报
			sql = "select * from tb_fxjb where ";
			//防汛简报与行政区域、流域不相关
			
			boolean temp_flage = false;
			if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
				sql = sql + " (wtdpcd like '%" + text_fill + "%'";
				temp_flage = true;
			}
			if("true".equals(check_title)&&!"".equals(text_fill)){//信息标题
				if(temp_flage == true){
					sql = sql + " or wttt like '%" + text_fill + "%'";
				}else{
					sql = sql + " (wttt like '%" + text_fill + "%'";
					temp_flage = true;
				}
			}
			if(temp_flage == true){
				sql = sql + ") and ";
			}					
			
			//按日期区间查询
			String tempstr1 = date_start;
			String tempstr2 = date_end;
			if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
				sql = sql + "(WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') and ";
			}	
			
			sql = sql + " 1 = 1 order by WTDT desc ";
			//set rs = conn.Execute (UCASE(sql))
					
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
//=================================================================================================	
			
		}else if("fxxd".equals(select_sortinfo)){//查询防汛行动
			sql = "select * from tb_fpacti where ";
			//防汛行动与行政区域、流域不相关
			
			boolean temp_flage2 = false;
			if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
				sql = sql + " (wtdpcd like '%" + text_fill + "%'";
				temp_flage2 = true;
			}
			if("true".equals(check_title)&&!"".equals(text_fill)){//信息标题
				if(temp_flage2 == true){
					sql = sql + " or wttt like '%" + text_fill + "%'";
				}else{
					sql = sql + " (wttt like '%" + text_fill + "%'";
					temp_flage2 = true;
				}
			}
			if(temp_flage2 == true){
				sql = sql + ") and ";
			}
			
			//按日期区间查询
			String tempstr1 = date_start;
			String tempstr2 = date_end;
			if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
				sql = sql + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') and ";
			}
			
			sql = sql + " 1 = 1 order by WTDT desc";
			//set rs = conn.Execute (UCASE(sql))

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
//=================================================================================================	

		}else if("zqbg".equals(select_sortinfo)){//查询灾情报告
			sql = "select * from tb_sd where ";
			//防汛行动与行政区域、流域不相关
			
			//填报单位
			boolean temp_flage3 = false;

			if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
				sql = sql + "  (wtdpcd like '%" + text_fill + "%' ";
				temp_flage3 = true;
			}
			if("true".equals(check_title)&&!"".equals(text_fill)){//信息标题
				if(temp_flage3 == true){
					sql = sql + " or wttt like '%" + text_fill + "%' ";
				}else{
					sql = sql + " (wttt like '%" + text_fill + "%'";
					temp_flage3 = true;
				}
			}
			if(temp_flage3 == true){
				sql = sql + ") and ";
			}

			//按日期区间查询
			String tempstr1 = date_start;
			String tempstr2 = date_end;
			if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
				sql = sql + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') and ";
			}
			sql = sql + " 1 = 1 order by WTDT desc";
			//set rs = conn.Execute (UCASE(sql))
					
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
//=================================================================================================	

		}else if("hqbg".equals(select_sortinfo)){//查询旱情报告
			sql = "select * from tb_qt where ";
			boolean temp_flage4 = false;

			if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
				sql = sql + "  (wtdpcd like '%" + text_fill + "%'";
				temp_flage4 = true;
			}
			if("true".equals(check_title)&&!"".equals(text_fill)){//信息标题
				if(temp_flage4 == true){
					sql = sql + " or wttt like '%" + text_fill + "%'";
				}else{
					sql = sql + " (wttt like '%" + text_fill + "%'";
					temp_flage4 = true;
				}
			}
			if(temp_flage4 == true){
				sql = sql + ") and ";
			}

			//按日期区间查询
			String tempstr1 = date_start;
			String tempstr2 = date_end;
			if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
				sql = sql + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') and ";
			}
			sql = sql + " 1 = 1 order by WTDT desc";
			//set rs = conn.Execute (UCASE(sql))

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
//=================================================================================================	

		}
		
		//除了“查询全部信息”以外的查询sql
		String sqlData = "select * from( select A.*, ROWNUM RN from (" + sql + ") A where ROWNUM<=" + end + ") WHERE RN>=" + start;
		String sqlCount = "select count(*) from (" + sql + ")" + "";
		
		List list = jdbcTemplate.queryForList(sqlData);
		int count = jdbcTemplate.queryForInt(sqlCount);
		
		pageList.setList(list);
		PageInfo pageInfo = new PageInfo(page, count);
		pageList.setPageInfo(pageInfo);
		
		return pageList;
	}
	
	/**
	 * 综合查询，根据条件生成结果
	 * @param select_sort 工程类别
	 * @param xzqh 行政区域
	 * @param lysx 河流水系
	 * @param date_start 上报起始时间
	 * @param date_end 上报截止时间
	 * @param text_fill 关键字
	 * @param check_projectname 工程名称
	 * @param check_unit 填报单位
	 * @param check_title 信息标题
	 * @return 
	 */
	public Map getAllResults(String select_sort, String xzqh, String lysx, String date_start, String date_end, String text_fill, String check_projectname, String check_unit, String check_title){
		Map mapResult = new HashMap();
		
		//把险情表同工程表相互关联
		String sql1 = "select st.* from tb_stdnc st,tb_pj pj where st.pjno = pj.pjno ";
		//按照区域条件组合查询
		//除运行状态、险情、建筑物表之外的其他表都不考虑与行政区域表的关系
		if(!"".equals(xzqh)){//全部区域
			if("000000".equals(xzqh)){//如果后四为为0000则全部省级单位
				
			}else if("0000".equals(xzqh.substring(2,4))){
				sql1 = sql1 + " and left(pj.cntcd,2) = '" +  xzqh.substring(0,2) + "' ";
			}else{
				sql1 = sql1 + " and pj.cntcd = '" + xzqh + "' ";
			}						
		}
			//按照河流水系条件组合查询
		/*if(!"".equals(lysx)){
			if(lysx.length() == 2){//流域级
				if("ZZ".equals(lysx)){//全国全部流域
				
				}else{
					sql1 = sql1 + " and left(pj.pjnmcd,2) = '" + lysx + "'";
				}
			}else if(lysx.length() == 3){//水系级
				if("0".equals(lysx.substring(lysx.length()-2,1))){//该水系所在流域的全部水系
					sql1 = sql1 + " and left(pj.pjnmcd,2) = '" + lysx.substring(0, 2) + "'";
				}else{//某一水系
					sql1 = sql1 + " and left(pj.pjnmcd,3) = '" + lysx + "'";
				}
			}else{//河流级
				if("ZZZZZ".equals(lysx.substring(lysx.length()-6,5))){//该河流所在水系的全部河流
					sql1 = sql1 + " and left(pj.pjnmcd,3) = '" + lysx.substring(0, 3) + "'";
				}else{//指定河流
					sql1 = sql1 + " and pj.pjnmcd = '" + lysx + "'";
				}
			}
		}*/
		
		if(!"".equals(lysx)){
			lysx = lysx.substring(1, 7);
			sql1 = sql1 + " and pj.pjnmcd like '%" + lysx + "%'";
		}
		
		//按照关键字组合条件
		boolean zh_temp_flage1 = false;
			
		if("true".equals(check_projectname)&&!"".equals(text_fill)){//工程名称
			sql1 = sql1 + " and  (pj.pjnm like '%" + text_fill + "%'";
			zh_temp_flage1 = true;
		}
		if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
			if(zh_temp_flage1 == true){
				sql1 = sql1 + " or st.wtdpcd like '%" + text_fill + "%'";
			}else{
				sql1 = sql1 + " and (st.wtdpcd like '%" + text_fill + "%'";
				zh_temp_flage1 = true;
			}
		}
		if("true".equals(check_title)&&!"".equals(text_fill)){//信息标题
			if(zh_temp_flage1 == true){
				sql1 = sql1 + " or st.dncnm like '%" + text_fill + "%'";
			}else{
				sql1 = sql1 + " and  (st.dncnm like '%" + text_fill + "%'";
				zh_temp_flage1 = true;
			}
		}
		if(zh_temp_flage1 == true){
			sql1 = sql1 + ") ";
		}
			
		//工程类别
		if("0".equals(select_sort)){
			//do nothing
		}else{
			//do nothing
		}
		
		//按日期区间查询
		String tempstr1 = date_start;
		String tempstr2 = date_end;
		if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
			sql1 = sql1 + " and (st.WTDPDT >= '" + tempstr1 + "' and  st.WTDPDT <= '" + tempstr2 + "') ";
		}
		sql1 = sql1 + " order by st.WTDPDT desc";
//============================================================================================================
			//把工程运行表同工程表相互关联
		String sql2 = "select st.* from tb_pjrcn st,tb_pj pj where st.pjno = pj.pjno ";
			//按照区域条件组合查询
		//除运行状态、险情、建筑物表之外的其他表都不考虑与行政区域表的关系
		if(!"".equals(xzqh)){//全部区域
			if("000000".equals(xzqh)){//如果后四为为0000则全部省级单位
				
			}else if("0000".equals(xzqh.substring(2,4))){
				sql2 = sql2 + " and left(pj.cntcd,2) = '" +  xzqh.substring(0,2) + "' ";
			}else{
				sql2 = sql2 + " and pj.cntcd = '" + xzqh + "' ";
			}					
		}
		
		//按照河流水系条件组合查询
		/*if(!"".equals(lysx)){
			if(lysx.length() == 2){//流域级
				if("ZZ".equals(lysx)){//全国全部流域
				
				}else{
					sql2 = sql2 + " and left(pj.pjnmcd,2) = '" + lysx + "'";
				}
			}else if(lysx.length() == 3){//水系级
				if("0".equals(lysx.substring(lysx.length()-2,1))){//该水系所在流域的全部水系
					sql2 = sql2 + " and left(pj.pjnmcd,2) = '" + lysx.substring(0, 2) + "'";
				}else{//某一水系
					sql2 = sql2 + " and left(pj.pjnmcd,3) = '" + lysx + "'";
				}
			}else{//河流级
				if("ZZZZZ".equals(lysx.substring(lysx.length()-6,5))){//该河流所在水系的全部河流
					sql2 = sql2 + " and left(pj.pjnmcd,3) = '" + lysx.substring(0, 3) + "'";
				}else{//指定河流
					sql2 = sql2 + " and pj.pjnmcd = '" + lysx + "'";
				}
			}
		}*/
		
		if(!"".equals(lysx)){
			sql2 = sql2 + " and pj.pjnmcd like '%" + lysx + "%'";
		}
		
		//按照关键字组合条件
		boolean zh_temp_flage2 = false;
			if("true".equals(check_projectname)&&!"".equals(text_fill)){//工程名称
			sql2 = sql2 + " and (pj.pjnm like '%" + text_fill + "%'";
			zh_temp_flage2 = true;
		}
		if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
			if(zh_temp_flage2 == true){
				sql2 = sql2 + " or st.wtdpcd like '%" + text_fill + "%'";
			}else{
				sql2 = sql2 + " and (st.wtdpcd like '%" + text_fill + "%'";
				zh_temp_flage2 = true;
			}
		}
		if("true".equals(check_title)){//信息标题
			sql2 = sql2 + " and 1 = 1 ";
		}
		if(zh_temp_flage2 == true){
			sql2 = sql2 + ") ";
		}
		//工程类别
		if("0".equals(select_sort)){
			//do nothing
		}else{
			//do nothing
		}
		
		if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
			sql2 = sql2 + " and (st.WTDPDT >= '" + tempstr1 + "' and  st.WTDPDT <= '" + tempstr2 + "') ";
		}
		
		sql2 = sql2 + " order by st.WTDPDT desc";
			
//============================================================================================================
		
		//防汛简报
		String sql3 = "select * from tb_fxjb where ";
		//防汛简报与行政区域、流域不相关
		
		boolean atemp_flage = false;
			if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
			sql3 = sql3 + " (wtdpcd like '%" + text_fill + "%'";
			atemp_flage = true;
		}
		if("true".equals(check_title)&&!"".equals(text_fill)){//信息标题
			if(atemp_flage == true){
				sql3 = sql3 + " or wttt like '%" + text_fill + "%'";
			}else{
				sql3 = sql3 + " (wttt like '%" + text_fill + "%'";
				atemp_flage = true;
			}
		}
		if(atemp_flage == true){
			sql3 = sql3 + ") and ";
		}
		
		//按日期区间查询
		if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
			sql3 = sql3 + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') and ";
		}	
			
		sql3 = sql3 + " 1 = 1 order by WTDT desc";
			
//============================================================================================================
		//防汛行动
		String sql4 = "select * from tb_fpacti where ";
		//防汛行动与行政区域、流域不相关
		boolean atemp_flage2 = false;
			if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
			sql4 = sql4 + " (wtdpcd like '%" + text_fill + "%'";
			atemp_flage2 = true;
		}
		if("true".equals(check_title)&&!"".equals(text_fill)){//信息标题
			if(atemp_flage2 == true){
				sql4 = sql4 + " or wttt like '%" + text_fill + "%'";
			}else{
				sql4 = sql4 + " (wttt like '%" + text_fill + "%'";
				atemp_flage2 = true;
			}
		}
		if(atemp_flage2 == true){
			sql4 = sql4 + ") and ";
		}
		//按日期区间查询
		if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
			sql4 = sql4 + " (WTDT >= '" + tempstr1 + "'  and  WTDT <= '" + tempstr2 + "') and ";
		}
		
		sql4 = sql4 + " 1 = 1 order by WTDT desc";
			
//============================================================================================================
		//防汛行动
		String sql5 = "select * from tb_sd where ";
		//防汛行动与行政区域、流域不相关
		boolean atemp_flage3 = false;
			if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
			sql5 = sql5 + " (wtdpcd like '%" + text_fill + "%'";
			atemp_flage3 = true;
		}
		if("true".equals(check_title)&&!"".equals(text_fill)){//信息标题
			if(atemp_flage3 == true){
				sql5 = sql5 + " or wttt like '%" + text_fill + "%'";
			}else{
				sql5 = sql5 + " (wttt like '%" + text_fill + "%'";
				atemp_flage3 = true;
			}
		}
		if(atemp_flage3 == true){
			sql5 = sql5 + ") and ";
		}
		//按日期区间查询
		if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
			sql5 = sql5 + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') and ";
		}
		
		sql5 = sql5 + " 1 = 1 order by WTDT desc";
//============================================================================================================
		String sql6 = "select * from tb_qt where ";
		boolean atemp_flage4 = false;
			if("true".equals(check_unit)&&!"".equals(text_fill)){//填报单位
			sql6 = sql6 + " (wtdpcd like '%" + text_fill + "%'";
			atemp_flage4 = true;
		}
		if("true".equals(check_title)&&!"".equals(text_fill)){//信息标题
			if(atemp_flage4 == true){
				sql6 = sql6 + " or wttt like '%" + text_fill + "%'";
			}else{
				sql6 = sql6 + " (wttt like '%" + text_fill + "%'";
				atemp_flage4 = true;
			}
		}
		if(atemp_flage4 == true){
			sql6 = sql6 + ") and ";
		}
		//按日期区间查询
		if(!"".equals(tempstr1)&&!"".equals(tempstr2)){
			sql6 = sql6 + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') and ";
		}
		
		sql6 = sql6 + " 1 = 1 order by WTDT desc";
		
		//查询数据
		
		sql1 = "select * from( select A.*, ROWNUM RN from (" + sql1 + ") A where ROWNUM<=" + 500 + ") WHERE RN>=" + 0;
		sql2 = "select * from( select A.*, ROWNUM RN from (" + sql2 + ") A where ROWNUM<=" + 500 + ") WHERE RN>=" + 0;
		sql3 = "select * from( select A.*, ROWNUM RN from (" + sql3 + ") A where ROWNUM<=" + 500 + ") WHERE RN>=" + 0;
		sql4 = "select * from( select A.*, ROWNUM RN from (" + sql4 + ") A where ROWNUM<=" + 500 + ") WHERE RN>=" + 0;
		sql5 = "select * from( select A.*, ROWNUM RN from (" + sql5 + ") A where ROWNUM<=" + 500 + ") WHERE RN>=" + 0;
		sql6 = "select * from( select A.*, ROWNUM RN from (" + sql6 + ") A where ROWNUM<=" + 500 + ") WHERE RN>=" + 0;
		
		List list1 = jdbcTemplate.queryForList(sql1);
		List list2 = jdbcTemplate.queryForList(sql2);
		List list3 = jdbcTemplate.queryForList(sql3);
		List list4 = jdbcTemplate.queryForList(sql4);
		List list5 = jdbcTemplate.queryForList(sql5);
		List list6 = jdbcTemplate.queryForList(sql6);
		
		mapResult.put("listXq", list1);
		mapResult.put("listYxzt", list2);
		mapResult.put("listFxjb", list3);
		mapResult.put("listFxxd", list4);
		mapResult.put("listZq", list5);
		mapResult.put("listHq", list6);
		
		return mapResult;
	}
	
	/**
	 * 取得会商记录
	 * @return
	 */
	public List getHS(){
		String sql = "select * from tb_hs";
		return jdbcTemplate.queryForList(sql);
	}
	
	/**
	 * 获取险情信息
	 * @param text_title 险情标题
	 * @param text_fill 填报单位
	 * @param date_start 上报起始时间
	 * @param date_end 上报截止时间
	 * @param page 页码
	 * @return
	 */
	public PageList getXq(String text_title, String text_fill, String date_start, String date_end, String lysx, int page){
		String sql = "";
		int pagesize = 10;
		int start = pagesize*(page - 1) + 1;
		int end = pagesize*page;
		
		sql = "select * from tb_stdnc sc,tb_st st,tb_pj pj where sc.sttpcd = st.sttpcd and st.pjno=pj.pjno";
		if(!"".equals(text_title)){//按标题查询
			sql = sql + " and sc.dncnm like  '%" + text_title + "%' ";
		}
		if(!"".equals(text_fill)){//按填报单位查询
			sql = sql + " and sc.WTDPCD like '%" +  text_fill + "%' ";
		}
		if(!"".equals(date_start)&&!"".equals(date_end)){//按时间查询
			sql = sql + " and sc.WTDPDT >= '" + date_start + "' and  sc.WTDPDT <= '" + date_end + "' ";
		}
		
		if(!"".equals(lysx)){
			lysx = lysx.substring(1, 7);
			sql = sql + " and pj.pjnmcd like '%" + lysx + "%'";
		}
		
		sql = sql + " order by sc.wtdpdt desc";
		
		String sqlData = "select * from( select A.*, ROWNUM RN from (" + sql + ") A where ROWNUM<=" + end + ") WHERE RN>=" + start;
		String sqlCount = "select count(*) from (" + sql + ")" + "";
		
		List listData = jdbcTemplate.queryForList(sqlData);
		int count = jdbcTemplate.queryForInt(sqlCount);
		
		PageList pageList = new PageList();
		PageInfo pageInfo = new PageInfo(page, count);
		pageList.setList(listData);
		pageList.setPageInfo(pageInfo);
		
		return pageList;
	}
	
	/**
	 * 获取灾情信息
	 * @param text_title 标题
	 * @param text_fill 填报单位
	 * @param date_start 上报起始时间
	 * @param date_end 上报截止时间
	 * @param page 页码
	 * @return
	 */
	public PageList getZq(String text_title, String text_fill, String date_start, String date_end, int page){
		String sql = "";
		int pagesize = 10;
		int start = pagesize*(page - 1) + 1;
		int end = pagesize*page;
		
		sql = "select * from tb_sd where ";
		if(!"".equals(text_title)){//按标题查询
			sql = sql + " WTTT like  '%" +  text_title + "%' and ";
		}
		if(!"".equals(text_fill)){//按填报单位查询
			sql = sql + " WTDPCD like '%" +  text_fill + "%' and ";
		}
		if(!"".equals(date_start)&&!"".equals(date_end)){//按时间查询
			sql = sql + " WTDT >= '" + date_start + "' and  WTDT <= '" + date_end + "' and";
		}
		
		sql = sql + " 1 = 1  order by wtdt desc";
		
		String sqlData = "select * from( select A.*, ROWNUM RN from (" + sql + ") A where ROWNUM<=" + end + ") WHERE RN>=" + start;
		String sqlCount = "select count(*) from (" + sql + ")" + "";
		
		List listData = jdbcTemplate.queryForList(sqlData);
		int count = jdbcTemplate.queryForInt(sqlCount);
		
		PageList pageList = new PageList();
		PageInfo pageInfo = new PageInfo(page, count);
		pageList.setList(listData);
		pageList.setPageInfo(pageInfo);
		
		return pageList;
	}
	
	/**
	 * 获取旱情信息
	 * @param text_title 标题
	 * @param text_fill 填报单位
	 * @param date_start 上报起始时间
	 * @param date_end 上报截止时间
	 * @param page 页码
	 * @return
	 */
	public PageList getHq(String text_title, String text_fill, String date_start, String date_end, int page){
		String sql = "";
		int pagesize = 10;
		int start = pagesize*(page - 1) + 1;
		int end = pagesize*page;
		
		sql = "select * from tb_qt where ";
		//按标题查询
		if(!"".equals(text_title)){
			sql = sql + " WTTT like  '%" +  text_title + "%' and ";
		}
		//按填报单位查询
		if(!"".equals(text_fill)){
			sql = sql + " WTDPCD like '%" +  text_fill + "%' and ";
		}
		//按日期区间查询
		if(!"".equals(date_start)&&!"".equals(date_end)){//按时间查询
			sql = sql + " WTDT >= '" + date_start + "' and  WTDT <= '" + date_end + "' and";
		}
		sql = sql + " 1 = 1  order by wtdt desc";
		
		String sqlData = "select * from( select A.*, ROWNUM RN from (" + sql + ") A where ROWNUM<=" + end + ") WHERE RN>=" + start;
		String sqlCount = "select count(*) from (" + sql + ")" + "";
		
		List listData = jdbcTemplate.queryForList(sqlData);
		int count = jdbcTemplate.queryForInt(sqlCount);
		
		PageList pageList = new PageList();
		PageInfo pageInfo = new PageInfo(page, count);
		pageList.setList(listData);
		pageList.setPageInfo(pageInfo);
		
		return pageList;
	}
	
	/**
	 * 获取运行状态
	 * @param text_title 标题
	 * @param text_fill 填报单位
	 * @param date_start 上报起始时间
	 * @param date_end 上报截止时间
	 * @param page 页码
	 * @return
	 */
	public PageList getYxzt(String text_title, String text_fill, String date_start, String date_end, String lysx, int page){
		String sql = "";
		int pagesize = 10;
		int start = pagesize*(page - 1) + 1;
		int end = pagesize*page;
		
		sql = "select * from tb_pjrcn pj,tb_gclb gc,tb_pj proj where pj.gcfldm = gc.gcfldm and pj.pjno=proj.pjno and ";
		//按工程名查询
		if(!"".equals(text_title)){
			sql = sql + " pj.PJNM like  '%" +  text_title + "%' and ";
		}
		//按填报单位查询
		if(!"".equals(text_fill)){
			sql = sql + " pj.WTDPCD like '%" +  text_fill + "%' and ";
		}
		//按日期区间查询
		if(!"".equals(date_start)&&!"".equals(date_end)){//按时间查询
			sql = sql + " pj.WTDPDT >= '" + date_start + "' and  pj.WTDPDT <= '" + date_end + "' and";
		}
		if(!"".equals(lysx)){
			lysx = lysx.substring(1, 7);
			sql = sql + " proj.pjnmcd like '%" + lysx + "%' and ";
		}
		
		sql = sql + " 1=1 order by pj.wtdpdt desc";
		
		String sqlData = "select * from( select A.*, ROWNUM RN from (" + sql + ") A where ROWNUM<=" + end + ") WHERE RN>=" + start;
		String sqlCount = "select count(*) from (" + sql + ")" + "";
		
		List listData = jdbcTemplate.queryForList(sqlData);
		int count = jdbcTemplate.queryForInt(sqlCount);
		
		PageList pageList = new PageList();
		PageInfo pageInfo = new PageInfo(page, count);
		pageList.setList(listData);
		pageList.setPageInfo(pageInfo);
		
		return pageList;
	}
	
	/**
	 * 获取防汛行动
	 * @param text_title 标题
	 * @param text_fill 填报单位
	 * @param date_start 上报起始时间
	 * @param date_end 上报截止时间
	 * @param page 页码
	 * @return
	 */
	public PageList getFxxd(String text_title, String text_fill, String date_start, String date_end, int page){
		String sql = "";
		int pagesize = 10;
		int start = pagesize*(page - 1) + 1;
		int end = pagesize*page;
		
		sql = "select * from tb_fpacti where ";
		//按标题查询
		if(!"".equals(text_title)){
			sql = sql + " WTTT like  '%" +  text_title + "%' and ";
		}
		//按填报单位查询
		if(!"".equals(text_fill)){
			sql = sql + " WTDPCD like '%" +  text_fill + "%' and ";
		}
		//按日期区间查询
		if(!"".equals(date_start)&&!"".equals(date_end)){//按时间查询
			sql = sql + " WTDT >= '" + date_start + "' and  WTDT <= '" + date_end + "' and";
		}		
		sql = sql + " 1 = 1  order by wtdt desc";
		
		String sqlData = "select * from( select A.*, ROWNUM RN from (" + sql + ") A where ROWNUM<=" + end + ") WHERE RN>=" + start;
		String sqlCount = "select count(*) from (" + sql + ")" + "";
		
		List listData = jdbcTemplate.queryForList(sqlData);
		int count = jdbcTemplate.queryForInt(sqlCount);
		
		PageList pageList = new PageList();
		PageInfo pageInfo = new PageInfo(page, count);
		pageList.setList(listData);
		pageList.setPageInfo(pageInfo);
		
		return pageList;
	}
	
	/**
	 * 获取防汛简报
	 * @param text_title 标题
	 * @param text_fill 填报单位
	 * @param date_start 上报起始时间
	 * @param date_end 上报截止时间
	 * @param page 页码
	 * @return
	 */
	public PageList getFxjb(String text_title, String text_fill, String date_start, String date_end, int page){
		String sql = "";
		int pagesize = 10;
		int start = pagesize*(page - 1) + 1;
		int end = pagesize*page;
		
		sql = "select * from tb_fxjb where";
		//按标题查询
		if(!"".equals(text_title)){
			sql = sql + " WTTT like  '%" +  text_title + "%' and ";
		}
		//按填报单位查询
		if(!"".equals(text_title)){
			sql = sql + " WTDPCD like '%" +  text_fill + "%' and ";
		}
		//按日期区间查询
		if(!"".equals(date_start)&&!"".equals(date_end)){//按时间查询
			sql = sql + " WTDT >= '" + date_start + "' and  WTDT <= '" + date_end + "' and ";
		}	
		sql = sql + " 1=1 order by wtdt desc";
		
		String sqlData = "select * from( select A.*, ROWNUM RN from (" + sql + ") A where ROWNUM<=" + end + ") WHERE RN>=" + start;
		String sqlCount = "select count(*) from (" + sql + ")" + "";
		
		List listData = jdbcTemplate.queryForList(sqlData);
		int count = jdbcTemplate.queryForInt(sqlCount);
		
		PageList pageList = new PageList();
		PageInfo pageInfo = new PageInfo(page, count);
		pageList.setList(listData);
		pageList.setPageInfo(pageInfo);
		
		return pageList;
	}
	
	public PageList getMedia(String radiob_gclb, String radiob_gs, String text_title, String text_fill, String date_start, String date_end, int page){
		String sql = "";
		int pagesize = 10;
		int start = pagesize*(page - 1) + 1;
		int end = pagesize*page;
		
		if("xq".equals(radiob_gclb.trim())){//险情
			sql = "select * from tb_stdnc_m sm,tb_stdnc st where sm.dncno = st.dncno and ";
		}else if("yxzt".equals(radiob_gclb.trim())){//运行状态
			sql = "select * from tb_pjr_m pm,tb_pjrcn pj where pm.pjrno = pj.pjrno and ";
		}else if("zq".equals(radiob_gclb.trim())){//灾情
			sql = "select * from tb_sd_m sm,tb_sd sd where sm.rpjincd = sd.rpjincd and ";
		}else if("fxxd".equals(radiob_gclb.trim())){//防汛行动
			sql = "select * from tb_fpacti_m fm,tb_fpacti fp where fm.rpjincd = fp.rpjincd and ";
		}
		//按标题查询
		if(!"".equals(text_title)){
			sql = sql + " title like  '%" +  text_title + "%' and ";
		}
		//按内容描述查询
		if(!"".equals(text_title)){
			sql = sql + " nrms like '%" +  text_fill + "%' and ";
		}
		//图片格式
		if("tp".equals(radiob_gs.trim())){//图片
			sql = sql + " UPPER(wjgs) like '%JPG%' and ";
		}else if("lx".equals(radiob_gs.trim())){
			sql = sql + " UPPER(wjgs) not like '%JPG%' and ";
		}
		//按日期区间查询
		if(!"".equals(date_start)&&!"".equals(date_end)){//按时间查询
			if("yxzt".equals(radiob_gclb.trim())){
				sql = sql + " pm.DTCDT >= '" + date_start + "' and  pm.DTCDT <= '" + date_end + "' and ";
			}else {
				sql = sql + " DTCDT >= '" + date_start + "' and  DTCDT <= '" + date_end + "' and ";
			}
		}
		
		if("yxzt".equals(radiob_gclb.trim())){
			sql = sql + " 1 = 1 order by pm.dtcdt desc";
		}else {
			sql = sql + " 1 = 1 order by dtcdt desc";
		}
		
		String sqlData = "select * from( select A.*, ROWNUM RN from (" + sql + ") A where ROWNUM<=" + end + ") WHERE RN>=" + start;
		String sqlCount = "select count(*) from (" + sql + ")" + "";
		
		List listData = jdbcTemplate.queryForList(sqlData);
		int count = jdbcTemplate.queryForInt(sqlCount);
		
		PageList pageList = new PageList();
		PageInfo pageInfo = new PageInfo(page, count);
		pageList.setList(listData);
		pageList.setPageInfo(pageInfo);
		
		return pageList;
	}
	
	/**
	 * 获得会商运行状态
 	 * @return
	 */
	public List<?> getConsultYxzt(){
		return jdbcTemplate.queryForList("select * from tb_pjrcn pjr,tb_pj pj,tb_gclb gc,tb_cnt cnt where cnt.cntcd =pj.cntcd and pj.pjno = pjr.pjno and pjr.gcfldm = gc.gcfldm and pjrno in (select bh from tb_hs where type = 1) order by pjr.wtdpdt desc");
	}
	
	/**
	 * 获得会商险情
 	 * @return
	 */
	public List<?> getConsultXq(){
		return jdbcTemplate.queryForList("select * from tb_stdnc std,tb_pj pj,tb_xqfl xq where xq.xqfldm = std.xqfldm  and pj.pjno = std.pjno and dncno in (select bh from tb_hs where type = 2)");
	}

	/**
	 * 获得会商防汛行动
 	 * @return
	 */
	public List<?> getConsultFxxd(){
		return jdbcTemplate.queryForList("select * from tb_fpacti where rpjincd in (select bh from tb_hs where type = 3)");
	}
	
	/**
	 * 获得会商灾情
 	 * @return
	 */
	public List<?> getConsultZq(){
		return jdbcTemplate.queryForList("select * from tb_sd where rpjincd in (select bh from tb_hs where type = 4)");
	}
	
	/**
	 * 获取工程信息中的市县
	 * @return
	 */
	public List<?> getGcxxSx(){
		return jdbcTemplate.queryForList("select distinct SXBM, SXMC from TB_GCLJ order by SXBM");
	}
	
	/**
	 * 获取工程信息中的类别
	 * @param sxbm 市县编码
	 * @return
	 */
	public List<?> getGcxxLb(String sxbm){
		return jdbcTemplate.queryForList("select distinct LXBM, LXMC from TB_GCLJ where SXBM='" + sxbm + "' order by LXBM");
	}
	
	/**
	 * 获取工程信息
	 * @param sxbm 市县编码
	 * @param lxbm 类型编码
	 * @return
	 */
	public List<?> getGcxxGc(String sxbm, String lxbm){
		return jdbcTemplate.queryForList("select GCMC, GCLJ from TB_GCLJ where SXBM='" + sxbm + "' and LXBM='" + lxbm + "'");
	}
	
	/**
	 * 获取工程链接2
	 * @param gclj 工程链接
	 * @return
	 */
	public String getGcxxLj2(String gclj){
		String gclj2 = "";
		
		List list = jdbcTemplate.queryForList("select GCLJ2 from TB_GCLJ where GCLJ='" + gclj + "'");
		if(list.size()>0){
			Map map = (Map)list.get(0);
			gclj2 = map.get("GCLJ2").toString();
		}
		
		return gclj2;
	}
	
	/**
	 * 获取首页面列表,取最新的10条数据
	 * @return list
	 */
	public List<?> getIndex(){
		List list = new ArrayList();
		
		try{
			//生成临时表TEMP_TABLE  TB_FPACTI防汛行动
			jdbcTemplate.execute("select * into TEMP_TABLE from (select A.*, ROWNUM RN from (select RPJINCD as ID, WTTT as TITLE, WTDT as DT, 'TB_FPACTI' as TABLENAME from TB_FPACTI order by DT desc) A where ROWNUM<=10) WHERE RN>=1");
			//TB_FXJB防汛简报
			jdbcTemplate.execute("insert into TEMP_TABLE (select * from (select A.*, ROWNUM RN from (select RPJINCD as ID, WTTT as TITLE, WTDT as DT, 'TB_FXJB' as TABLENAME from TB_FXJB order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_PJRCN运行状态
			jdbcTemplate.execute("insert into TEMP_TABLE (select * from (select A.*, ROWNUM RN from (select PJRNO as ID, PJNM as TITLE, WTDPDT as DT, 'TB_PJRCN' as TABLENAME from TB_PJRCN order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_QT旱情
			jdbcTemplate.execute("insert into TEMP_TABLE (select * from (select A.*, ROWNUM RN from (select RPJINCD as ID, WTTT as TITLE, WTDT as DT, 'TB_QT' as TABLENAME from TB_QT order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_SD灾情
			jdbcTemplate.execute("insert into TEMP_TABLE (select * from (select A.*, ROWNUM RN from (select RPJINCD as ID, WTTT as TITLE, WTDT as DT, 'TB_SD' as TABLENAME from TB_SD order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_STDNC险情
			jdbcTemplate.execute("insert into TEMP_TABLE (select * from (select A.*, ROWNUM RN from (select DNCNO as ID, DNCNM as TITLE, WTDPDT as DT, 'TB_STDNC' as TABLENAME from TB_STDNC order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			
			list = jdbcTemplate.queryForList("select * from (select A.*, ROWNUM RN1 from (select * from TEMP_TABLE order by DT desc) A where ROWNUM<=10) WHERE RN1>=1");
			
			jdbcTemplate.execute("drop table TEMP_TABLE");
		}catch(Exception e){
			jdbcTemplate.execute("drop table TEMP_TABLE");
			
			//生成临时表TEMP_TABLE  TB_FPACTI防汛行动
			jdbcTemplate.execute("select * into TEMP_TABLE from (select A.*, ROWNUM RN from (select RPJINCD as ID, WTTT as TITLE, WTDT as DT, 'TB_FPACTI' as TABLENAME from TB_FPACTI order by DT desc) A where ROWNUM<=10) WHERE RN>=1");
			//TB_FXJB防汛简报
			jdbcTemplate.execute("insert into TEMP_TABLE (select * from (select A.*, ROWNUM RN from (select RPJINCD as ID, WTTT as TITLE, WTDT as DT, 'TB_FXJB' as TABLENAME from TB_FXJB order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_PJRCN运行状态
			jdbcTemplate.execute("insert into TEMP_TABLE (select * from (select A.*, ROWNUM RN from (select PJRNO as ID, PJNM as TITLE, WTDPDT as DT, 'TB_PJRCN' as TABLENAME from TB_PJRCN order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_QT旱情
			jdbcTemplate.execute("insert into TEMP_TABLE (select * from (select A.*, ROWNUM RN from (select RPJINCD as ID, WTTT as TITLE, WTDT as DT, 'TB_QT' as TABLENAME from TB_QT order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_SD灾情
			jdbcTemplate.execute("insert into TEMP_TABLE (select * from (select A.*, ROWNUM RN from (select RPJINCD as ID, WTTT as TITLE, WTDT as DT, 'TB_SD' as TABLENAME from TB_SD order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_STDNC险情
			jdbcTemplate.execute("insert into TEMP_TABLE (select * from (select A.*, ROWNUM RN from (select DNCNO as ID, DNCNM as TITLE, WTDPDT as DT, 'TB_STDNC' as TABLENAME from TB_STDNC order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			
			list = jdbcTemplate.queryForList("select * from (select A.*, ROWNUM RN1 from (select * from TEMP_TABLE order by DT desc) A where ROWNUM<=10) WHERE RN1>=1");
			
			jdbcTemplate.execute("drop table TEMP_TABLE");
		}
		
		return list;
	}
	
	/**
	 * 获取首页面图片列表，获取最新的十个图片
	 * @return
	 */
	public List<?> getIndexMedia(){
		List list = new ArrayList();
		
		try{
			//生成临时表TEMP_TABLE  TB_FPACTI防汛行动
			jdbcTemplate.execute("select * into TEMP_TABLE_MEDIA from (select A.*, ROWNUM RN from (select fp.RPJINCD as ID, fp.WTTT as TITLE, fp.WTDT as DT, fm.ZLBM as ZLBM, 'TB_FPACTI_M' as TABLENAME from TB_FPACTI fp,TB_FPACTI_M fm where fm.RPJINCD = fp.RPJINCD and UPPER(fm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1");
			//TB_FXJB防汛简报
			jdbcTemplate.execute("insert into TEMP_TABLE_MEDIA (select * from (select A.*, ROWNUM RN from (select jb.RPJINCD as ID, jb.WTTT as TITLE, jb.WTDT as DT, jm.ZLBM as ZLBM, 'TB_FXJB_M' as TABLENAME from TB_FXJB jb, TB_FXJB_M jm where jm.RPJINCD = jb.RPJINCD and UPPER(jm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_PJRCN运行状态
			jdbcTemplate.execute("insert into TEMP_TABLE_MEDIA (select * from (select A.*, ROWNUM RN from (select pj.PJRNO as ID, pj.PJNM as TITLE, pj.WTDPDT as DT, pm.ZLBM as ZLBM, 'TB_PJR_M' as TABLENAME from TB_PJRCN pj, TB_PJR_M pm where pm.PJRNO = pj.PJRNO and UPPER(pm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_QT旱情
			jdbcTemplate.execute("insert into TEMP_TABLE_MEDIA (select * from (select A.*, ROWNUM RN from (select qt.RPJINCD as ID, qt.WTTT as TITLE, qt.WTDT as DT, qm.ZLBM as ZLBM, 'TB_QT_M' as TABLENAME from TB_QT qt, TB_QT_M qm where qm.RPJINCD = qt.RPJINCD and UPPER(qm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_SD灾情
			jdbcTemplate.execute("insert into TEMP_TABLE_MEDIA (select * from (select A.*, ROWNUM RN from (select sd.RPJINCD as ID, sd.WTTT as TITLE, sd.WTDT as DT, sm.ZLBM as ZLBM, 'TB_SD_M' as TABLENAME from TB_SD sd, TB_SD_M sm where sm.RPJINCD = sd.RPJINCD and UPPER(sm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_STDNC险情
			jdbcTemplate.execute("insert into TEMP_TABLE_MEDIA (select * from (select A.*, ROWNUM RN from (select st.DNCNO as ID, st.DNCNM as TITLE, st.WTDPDT as DT, sm.ZLBM as ZLBM, 'TB_STDNC_M' as TABLENAME from TB_STDNC st, TB_STDNC_M sm where sm.DNCNO = st.DNCNO and UPPER(sm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			
			list = jdbcTemplate.queryForList("select * from (select A.*, ROWNUM RN1 from (select * from TEMP_TABLE_MEDIA order by DT desc) A where ROWNUM<=10) WHERE RN1>=1");
			
			jdbcTemplate.execute("drop table TEMP_TABLE_MEDIA");
		}catch(Exception e){
			e.printStackTrace();
			jdbcTemplate.execute("drop table TEMP_TABLE_MEDIA");
			
			//生成临时表TEMP_TABLE  TB_FPACTI防汛行动
			jdbcTemplate.execute("select * into TEMP_TABLE_MEDIA from (select A.*, ROWNUM RN from (select fp.RPJINCD as ID, fp.WTTT as TITLE, fp.WTDT as DT, fm.ZLBM as ZLBM, 'TB_FPACTI_M' as TABLENAME from TB_FPACTI fp,TB_FPACTI_M fm where fm.RPJINCD = fp.RPJINCD and UPPER(fm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1");
			//TB_FXJB防汛简报
			jdbcTemplate.execute("insert into TEMP_TABLE_MEDIA (select * from (select A.*, ROWNUM RN from (select jb.RPJINCD as ID, jb.WTTT as TITLE, jb.WTDT as DT, jm.ZLBM as ZLBM, 'TB_FXJB_M' as TABLENAME from TB_FXJB jb, TB_FXJB_M jm where jm.RPJINCD = jb.RPJINCD and UPPER(jm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_PJRCN运行状态
			jdbcTemplate.execute("insert into TEMP_TABLE_MEDIA (select * from (select A.*, ROWNUM RN from (select pj.PJRNO as ID, pj.PJNM as TITLE, pj.WTDPDT as DT, pm.ZLBM as ZLBM, 'TB_PJR_M' as TABLENAME from TB_PJRCN pj, TB_PJR_M pm where pm.PJRNO = pj.PJRNO and UPPER(pm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_QT旱情
			jdbcTemplate.execute("insert into TEMP_TABLE_MEDIA (select * from (select A.*, ROWNUM RN from (select qt.RPJINCD as ID, qt.WTTT as TITLE, qt.WTDT as DT, qm.ZLBM as ZLBM, 'TB_QT_M' as TABLENAME from TB_QT qt, TB_QT_M qm where qm.RPJINCD = qt.RPJINCD and UPPER(qm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_SD灾情
			jdbcTemplate.execute("insert into TEMP_TABLE_MEDIA (select * from (select A.*, ROWNUM RN from (select sd.RPJINCD as ID, sd.WTTT as TITLE, sd.WTDT as DT, sm.ZLBM as ZLBM, 'TB_SD_M' as TABLENAME from TB_SD sd, TB_SD_M sm where sm.RPJINCD = sd.RPJINCD and UPPER(sm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			//TB_STDNC险情
			jdbcTemplate.execute("insert into TEMP_TABLE_MEDIA (select * from (select A.*, ROWNUM RN from (select st.DNCNO as ID, st.DNCNM as TITLE, st.WTDPDT as DT, sm.ZLBM as ZLBM, 'TB_STDNC_M' as TABLENAME from TB_STDNC st, TB_STDNC_M sm where sm.DNCNO = st.DNCNO and UPPER(sm.WJGS) like '%JPG%' order by DT desc) A where ROWNUM<=10) WHERE RN>=1)");
			
			list = jdbcTemplate.queryForList("select * from (select A.*, ROWNUM RN1 from (select * from TEMP_TABLE_MEDIA order by DT desc) A where ROWNUM<=10) WHERE RN1>=1");
			jdbcTemplate.execute("drop table TEMP_TABLE_MEDIA");
		}
		
		return list;
	}
}
