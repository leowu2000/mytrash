package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.core.ConnectionPool;

public class BaseUtil {
	/**
	 * È¡ÊÐÏØ
	 * @param path
	 * @param parentCode
	 * @return
	 */
	public static List<TbcntBean> getAllSXList(String path){
		List<TbcntBean> sxList = new ArrayList<TbcntBean>();
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			String sql = "select * from TB_CNT where Mid(cntcd,3,6)='0000'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				TbcntBean bean = TbcntBean.getTbcntBeanFromRs(rs);
				sxList.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return sxList;
	}
	
	public static List<TbcntBean> getAllSHList(String path,String parentCode){
		List<TbcntBean> sxList = new ArrayList<TbcntBean>();
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			String sql = "select * from TB_CNT where  Mid(cntcd,5,6)='00' and Mid(cntcd,1,2)=Mid('"+parentCode+"',1,2) and cntcd<>'"+parentCode+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				TbcntBean bean = TbcntBean.getTbcntBeanFromRs(rs);
				sxList.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return sxList;
	}
	
	public static List<TbcntBean> getAllXList(String path,String parentCode){
		List<TbcntBean> sxList = new ArrayList<TbcntBean>();
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			String sql = "select * from TB_CNT where Mid(cntcd,1,4)=Mid('"+parentCode+"',1,4) and cntcd<>'"+parentCode+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				TbcntBean bean = TbcntBean.getTbcntBeanFromRs(rs);
				sxList.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return sxList;
	}
	
	public static List<GclbBean> getGclbList(String path){
		List<GclbBean> sxList = new ArrayList<GclbBean>();
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			String sql = "select * from tb_gclb ";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				GclbBean bean = GclbBean.getTbcntBeanFromRs(rs);
				sxList.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return sxList;
	}
	
	
	public static List<LysxBean> getLysxList_one(String path){
		List<LysxBean> sxList = new ArrayList<LysxBean>();
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			String sql = "select * from tb_lysx1 where Mid(CTCD,3,8)='000000'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				LysxBean bean = LysxBean.getTbcntBeanFromRs(rs);
				sxList.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return sxList;
	}
	
	public static List<LysxBean> getLysxList_two(String path,String parentcode){
		List<LysxBean> sxList = new ArrayList<LysxBean>();
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			String sql = "select * from tb_lysx1 where Mid(CTCD,1,2)=MID('"+parentcode+"',1,2) and Mid(CTCD,1,5)<>MID('"+parentcode+"',1,5)";
			System.out.println(sql);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				LysxBean bean = LysxBean.getTbcntBeanFromRs(rs);
				sxList.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return sxList;
	}
	
	public static List<LysxBean> getZliuList_one(String path,String parentcode){
		List<LysxBean> sxList = new ArrayList<LysxBean>();
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			String sql = "select * from tb_lysx where Mid(CTCD,1,3)=MID('"+parentcode+"',1,3) and Mid(ctcd,6,2)='00'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				LysxBean bean = LysxBean.getTbcntBeanFromRs(rs);
				sxList.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return sxList;
	}
	
	public static List<LysxBean> getZliuList_two(String path,String parentcode){
		List<LysxBean> sxList = new ArrayList<LysxBean>();
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			String sql = "select * from tb_lysx where Mid(CTCD,1,5)=MID('"+parentcode+"',1,5)";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				LysxBean bean = LysxBean.getTbcntBeanFromRs(rs);
				sxList.add(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return sxList;
	}
}
