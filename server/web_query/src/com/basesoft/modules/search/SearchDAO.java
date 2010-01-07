package com.basesoft.modules.search;

import org.springframework.jdbc.core.JdbcTemplate;

import com.basesoft.core.PageList;

public class SearchDAO {

	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate = jdbcTemplate;
	}
	
	/**
	 * 综合查询，根据条件生成sql给出结果
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
	 * @return 
	 */
	public PageList getResult(String select_sortinfo, String select_sort, String xzqh, String lysx, String date_start, String date_end, String text_fill, String check_projectname, String check_unit, String check_title, int page){
		String sql = "";
		
		if ("yxzt".equals(select_sortinfo)){//堤防运行
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
			if(!"".equals(lysx)){
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
			sql = sql + " and  (p.WTDPDT >= '" + tempstr1 + "' and  p.WTDPDT <= '" + tempstr2 + "') and ";
			sql = sql + " 1 = 1 order by p.WTDPDT desc ";
			//set rs = conn.Execute (UCASE(sql))
			
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			
//=================================================================================================	
			
		}else if ("xqxx".equals(select_sortinfo)){//查询险情信息类型
			//把险情表同工程表相互关联
			sql = "select st.*,pj.pjnm from tb_stdnc st,tb_pj pj where st.pjno = pj.pjno ";
			//按照区域条件组合查询
			//除运行状态、险情、建筑物表之外的其他表都不考虑与行政区域表的关系
			if("".equals(xzqh)){//全部区域
				if("000000".equals(xzqh)){
					
				}else if("0000".equals(xzqh.substring(2,4))){//如果后四为为0000则全部省级单位
					sql = sql + " and left(pj.cntcd,2) = '" +  xzqh.substring(0,2) + "' ";
				}else{
					sql = sql + " and pj.cntcd = '" + xzqh + "' ";
				}						
			}
			
			//按照河流水系条件组合查询
			if("".equals(lysx)){
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
			sql = sql + " and (st.WTDPDT >= '" + tempstr1 + "' and  st.WTDPDT <= '" + tempstr2 + "')  and ";
			sql = sql + " 1 = 1  order by st.WTDPDT desc ";
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
				sql = sql + ") ";
			}					
			
			//按日期区间查询
			String tempstr1 = date_start;
			String tempstr2 = date_end;
			if(temp_flage == true){
				sql = sql + " and (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}else{
				sql = sql + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}	
			sql = sql + " and 1 = 1 order by WTDT desc ";
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
				sql = sql + ") ";
			}
			
			//按日期区间查询
			String tempstr1 = date_start;
			String tempstr2 = date_end;
			if(temp_flage2 == true){
				sql = sql + " and  (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}else{
				sql = sql + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "')";
			}
			sql = sql + " and 1 = 1 order by WTDT desc";
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
				sql = sql + ") ";
			}

			//按日期区间查询
			String tempstr1 = date_start;
			String tempstr2 = date_end;
			if(temp_flage3 == true){
				sql = sql + " and  (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}else{
				sql = sql + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "')";
			}
			sql = sql + " and 1 = 1 order by WTDT desc";
			//set rs = conn.Execute (UCASE(sql))
					
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
//=================================================================================================	

		}else if("zqbg".equals(select_sortinfo)){//查询旱情报告
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
				sql = sql + ") ";
			}

			//按日期区间查询
			String tempstr1 = date_start;
			String tempstr2 = date_end;
			if(temp_flage4 == true){
				sql = sql + " and  (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}else{
				sql = sql + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}
			sql = sql + " and 1 = 1 order by WTDT desc";
			//set rs = conn.Execute (UCASE(sql))

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
//=================================================================================================	

		}else if("qbxx".equals(select_sortinfo)){//查询全部信息
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
			if(!"".equals(lysx)){
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
			sql1 = sql1 + " and (st.WTDPDT >= '" + tempstr1 + "' and  st.WTDPDT <= '" + tempstr2 + "')  and ";
			sql1 = sql1 + " 1 = 1 order by st.WTDPDT desc";
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
			if(!"".equals(lysx)){
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
				sql2 = sql2 + " and 1 = 2 ";
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
			
			sql2 = sql2 + " and (st.WTDPDT >= '" + tempstr1 + "' and  st.WTDPDT <= '" + tempstr2 + "')  and ";
			sql2 = sql2 + " 1 = 1  order by st.WTDPDT desc";
				
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
				sql3 = sql3 + ") ";
			}
			
			//按日期区间查询
			if(atemp_flage == true){
				sql3 = sql3 + " and (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}else{
				sql3 = sql3 + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}
			sql3 = sql3 + " and 1 = 1 order by WTDT desc";
				
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
				sql4 = sql4 + ") ";
			}
			//按日期区间查询
			if(atemp_flage2 == true){
				sql4 = sql4 + " and  (WTDT >= '" + tempstr1 + "'  and  WTDT <= '" + tempstr2 + "') ";
			}else{
				sql4 = sql4 + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "')";
			}
			sql4 = sql4 + " and 1 = 1 order by WTDT desc";
				
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
				sql5 = sql5 + ") ";
			}
			//按日期区间查询
			if(atemp_flage3 == true){
				sql5 = sql5 + " and  (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}else{
				sql5 = sql5 + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "')";
			}
			sql5 = sql5 + " and 1 = 1 order by WTDT desc";
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
				sql6 = sql6 + ") ";
			}
			//按日期区间查询
			if(atemp_flage4 == true){
				sql6 = sql6 + " and  (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}else{
				sql6 = sql6 + " (WTDT >= '" + tempstr1 + "' and  WTDT <= '" + tempstr2 + "') ";
			}
			sql6 = sql6 + " and 1 = 1 order by WTDT desc";
			
			
//				set rs1 = conn.Execute (UCASE(sql1))
//					
//					Set Conn2 = Server.CreateObject("ADODB.Connection")
//					conn2.Open Application("Conn_cpj_ConnectionString")
//
//					TIME2=NOW()
//					timeport=timeport + "第2个连接conn2用了："+cstr(cdbl((TIME2-TIME1)*24*60*60))+"秒<br>"
//						
//					set rs2 = conn2.Execute (UCASE(sql2))
//
//					TIME2=NOW()
//					timeport=timeport + "第2个结果集RS2用了："+cstr(cdbl((TIME2-TIME1)*24*60*60))+"秒<br>"
//
//					
//					Set Conn3 = Server.CreateObject("ADODB.Connection")
//					conn3.Open Application("Conn_cpj_ConnectionString")		
//
//					TIME2=NOW()
//					timeport=timeport + "第3个连接conn3用了："+cstr(cdbl((TIME2-TIME1)*24*60*60))+"秒<br>"
//
//					set rs3 = conn3.Execute (UCASE(sql3))
//					
//					TIME2=NOW()
//					timeport=timeport + "第3个结果集RS3用了："+cstr(cdbl((TIME2-TIME1)*24*60*60))+"秒<br>"			
//					
//					'Response.Write sql4
//					'sql4 = "select * from tb_fpacti "
//					Set Conn4 = Server.CreateObject("ADODB.Connection")
//					conn4.Open Application("Conn_cpj_ConnectionString")
//					
//					TIME2=NOW()
//					timeport=timeport + "第4个连接conn4用了："+cstr(cdbl((TIME2-TIME1)*24*60*60))+"秒<br>"			
//							
//					set rs4 = conn4.Execute (UCASE(sql4))
//
//					TIME4=NOW()
//					timeport=timeport + "第二个结果集RS4用了："+cstr(cdbl((TIME2-TIME1)*24*60*60))+"秒<br>"
//
//					
//					Set Conn5 = Server.CreateObject("ADODB.Connection")
//					conn5.Open Application("Conn_cpj_ConnectionString")
//
//					TIME2=NOW()
//					timeport=timeport + "第5个连接conn5用了："+cstr(cdbl((TIME2-TIME1)*24*60*60))+"秒<br>"
//							
//					set rs5 = conn5.Execute (UCASE(sql5))
//
//					TIME2=NOW()
//					timeport=timeport + "第5个结果集RS5用了："+cstr(cdbl((TIME2-TIME1)*24*60*60))+"秒<br>"
//					
//					Set Conn6 = Server.CreateObject("ADODB.Connection")
//					conn6.Open Application("Conn_cpj_ConnectionString")		
//
//					TIME2=NOW()
//					timeport=timeport + "第6个连接conn6用了："+cstr(cdbl((TIME2-TIME1)*24*60*60))+"秒<br>"
//
//					set rs6 = conn6.Execute (UCASE(sql6))
//					
//					TIME2=NOW()
//					timeport=timeport + "第6个结果集RS6用了："+cstr(cdbl((TIME2-TIME1)*24*60*60))+"秒<br>"			
//					
//
//					'Response.Write ("sql1 is : " + sql1)
//					'Response.Write ("sql2 is : " + sql2)
//					'Response.Write ("sql3 is : " + sql3)
//					'Response.Write ("sql4 is : " + sql4)
//					'Response.Write ("sql5 is : " + sql5)
//					'Response.Write ("sql6 is : " + sql6)
//
//		'		'''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			
//				'else
//				'	'没取到select_sortinfo信息
//				'	sql = "select * from tb_fpacti"
//				'	sql = sql + " where datepart(dayofyear,getdate())-datepart(dayofyear,wtdt)<= 3 and datepart(year,getdate()) > datepart(year,wtdt) order by wtdt desc"
//				'	set rs = conn.Execute (UCASE(sql))
		}
		return null;
	}
}
