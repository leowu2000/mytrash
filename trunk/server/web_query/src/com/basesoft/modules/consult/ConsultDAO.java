package com.basesoft.modules.consult;

import java.util.List;
import java.util.Map;

import javax.xml.ws.Response;

import com.basesoft.core.CommonDAO;

public class ConsultDAO extends CommonDAO {

	/**
	 * 将防汛行动加入会商
	 * @param id
	 */
	public String addConsultFxxd(String id){
		String message = "";
		
		//查找会商是否已经存在
		String countSql = "select count(*) from tb_hs where  type = '3' and bh = '" + id + "'";
		int haveHs = jdbcTemplate.queryForInt(countSql);
		
		if(haveHs == 0){
			//插入会商记录
			String insertSql = "insert into tb_hs values ('" + id + "',3,'tb_fpacti')";
			jdbcTemplate.execute(insertSql);
			
			//获取多媒体记录
			String mediaSql = "select zlbm from tb_fpacti_m where rpjincd = '" + id + "' ";
			List listMedia = jdbcTemplate.queryForList(mediaSql);
			
			for(int i=0;i<listMedia.size();i++){
				Map mapMedia = (Map)listMedia.get(i);
				insertSql = "insert into tb_hs_m values ('" + id + "',3,'" +  mapMedia.get("zlbm") + "')";
				jdbcTemplate.execute(insertSql);
			}
			
			message = "成功加入会商";
		}else{
			message = "会商里已经有该记录";
		}
		
		return message;
	}
	
	/**
	 * 将险情加入会商
	 * @param id
	 */
	public String addConsultXq(String id){
		String message = "";
		
		//查找会商是否已经存在
		String countSql = "select count(*) from tb_hs where  type = '2' and bh = '" + id + "'";
		int haveHs = jdbcTemplate.queryForInt(countSql);
		
		if(haveHs == 0){
			//插入会商记录
			String insertSql = "insert into tb_hs values ('" + id + "',2,'tb_stdnc')";
			jdbcTemplate.execute(insertSql);
			
			//获取多媒体记录
			String mediaSql = "select zlbm from tb_stdnc_m where dncno = '" + id + "' ";
			List listMedia = jdbcTemplate.queryForList(mediaSql);
			
			for(int i=0;i<listMedia.size();i++){
				Map mapMedia = (Map)listMedia.get(i);
				insertSql = "insert into tb_hs_m values ('" + id + "',2,'" +  mapMedia.get("zlbm") + "')";
				jdbcTemplate.execute(insertSql);
			}
			
			message = "成功加入会商";
		}else{
			message = "会商里已经有该记录";
		}
		
		return message;
	}
	
	/**
	 * 将运行状态加入会商
	 * @param id
	 */
	public String addConsultYxzt(String id){
		String message = "";
		
		//查找会商是否已经存在
		String countSql = "select count(*) from tb_hs where  type = '1' and bh = '" + id + "'";
		int haveHs = jdbcTemplate.queryForInt(countSql);
		
		if(haveHs == 0){
			//插入会商记录
			String insertSql = "insert into tb_hs values ('" + id + "',1,'tb_pjrcn')";
			jdbcTemplate.execute(insertSql);
			
			//获取多媒体记录
			String mediaSql = "select zlbm from tb_pjr_m where pjrno = '" + id + "' ";
			List listMedia = jdbcTemplate.queryForList(mediaSql);
			
			for(int i=0;i<listMedia.size();i++){
				Map mapMedia = (Map)listMedia.get(i);
				insertSql = "insert into tb_hs_m values ('" + id + "',1,'" +  mapMedia.get("zlbm") + "')";
				jdbcTemplate.execute(insertSql);
			}
			
			message = "成功加入会商";
		}else{
			message = "会商里已经有该记录";
		}
		
		return message;
	}
	
	/**
	 * 将灾情加入会商
	 * @param id
	 */
	public String addConsultZq(String id){
		String message = "";
		
		//查找会商是否已经存在
		String countSql = "select count(*) from tb_hs where  type = '4' and bh = '" + id + "'";
		int haveHs = jdbcTemplate.queryForInt(countSql);
		
		if(haveHs == 0){
			//插入会商记录
			String insertSql = "insert into tb_hs values ('" + id + "',4,'tb_sd')";
			jdbcTemplate.execute(insertSql);
			
			//获取多媒体记录
			String mediaSql = "select zlbm from tb_sd_m where rpjincd = '" + id + "' ";
			List listMedia = jdbcTemplate.queryForList(mediaSql);
			
			for(int i=0;i<listMedia.size();i++){
				Map mapMedia = (Map)listMedia.get(i);
				insertSql = "insert into tb_hs_m values ('" + id + "',4,'" +  mapMedia.get("zlbm") + "')";
				jdbcTemplate.execute(insertSql);
			}
			
			message = "成功加入会商";
		}else{
			message = "会商里已经有该记录";
		}
		
		return message;
	}
	
	/**
	 * 取得会商防汛行动列表
	 * @return
	 */
	public List<?> findConsultFxxd(){
		return jdbcTemplate.queryForList("select * from tb_fpacti where rpjincd in (select bh from tb_hs where type = 3)");
	}
	
	/**
	 * 取得会商险情列表
	 * @return
	 */
	public List<?> findConsultXq(){
		return jdbcTemplate.queryForList("select * from tb_stdnc std,tb_pj pj,tb_xqfl xq where xq.xqfldm = std.xqfldm and  pj.pjno = std.pjno and dncno in (select bh from tb_hs where type = 2)");
	}
	
	/**
	 * 取得会商运行状态列表
	 * @return
	 */
	public List<?> findConsultYxzt(){
		return jdbcTemplate.queryForList("select * from tb_pjrcn pjr,tb_pj pj,tb_gclb gc,tb_cnt cnt where cnt.cntcd =pj.cntcd and pj.pjno = pjr.pjno and pjr.gcfldm = gc.gcfldm and pjrno in (select bh from tb_hs where type = 1)");
	}
	
	/**
	 * 取得会商灾情列表
	 * @return
	 */
	public List<?> findConsultZq(){
		return jdbcTemplate.queryForList("select * from tb_sd where rpjincd in (select bh from tb_hs where type = 4)");
	}
	
	/**
	 * 删除会商记录
	 * @param id
	 * @param type
	 */
	public void deleteConsult(String id, String type){
		String sql = "delete from tb_hs where BH = '" + id + "' and type = '" + type + "'";
		String sql_m = "delete from tb_hs_m  where BH = '" + id + "' and type = '" + type + "'";
		
		jdbcTemplate.execute(sql);
		jdbcTemplate.execute(sql_m);
	}
}
