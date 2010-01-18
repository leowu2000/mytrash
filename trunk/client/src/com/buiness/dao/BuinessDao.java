package com.buiness.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.buiness.form.PrjBean;
import com.core.ConnectionPool;

public class BuinessDao {
	/**
	 * ����
	 * ���ɹ��� ��Ź���
	 * ��������ţ�Mid(�������ں����Ĵ���,2,6)��Mid(�������ڵ�����������������,1,2)
	 * ����ѶԸù��̲ɼ���������Ϣ���������޸ĸù�������
	 * ���̱�TB_PJ
	 * 	detail��TB_PJRCN
	 * 
	 * �ӹ��̱��л�ȡ�����ˮ�� ��select max(pjno) as MaxValue from tb_pj
	 * �ҳ����̵����ͣ�select gcflmc from tb_gclb where gcfldm='" & Mid(RstProject!pjnmcd, 1, 1) 
	 * �ҳ��������ڵĵ�����select provnm from tb_cnt where cntcd='
	 * �ҳ��������ڵ�����select ctnm from tb_lysx1 where ctcd='A" & Mid(RstProject!pjnmcd, 2, 1) & "000000'
	 * �ҳ��������ڵ�ˮϵ��select ctnm from tb_lysx1 where ctcd='A" & Mid(RstProject!pjnmcd, 2, 2) & "00000'
	 * �ҳ��������ڵ�һ��֧����select ctnm from tb_lysx where ctcd like 'A" & Mid(RstProject!pjnmcd, 2, 4) & "00%'
	 * �ҳ��������ڵĶ���֧����select ctnm from tb_lysx where ctcd like 'A" & Mid(RstProject!pjnmcd, 2, 6) & "%'
	 */
	/**
	 * �޸�
	 * ��鱾�������������Ƿ�����ͬ���ƹ��̣�
	 * select * from tb_pj where pjno<>" & IntPJNO & " and pjnm='" & StrProName & "' and pjnmcd='" & StrPjnmcd & "' and cntcd='" & StrProDistrictCNTCD & "'
	 * �޸Ĺ��̱��й��̴��롢�������ơ������������롢��Ѵ�����ˡ���Ѵ�����˵绰���ֶ�
	 * �޸Ĺ������б��иù��̵����ƣ�
	 * update tb_pjrcn set pjnm='" & StrProName & _"' where pjno=" & IntPJNO
	 * �޸Ĺ���������иù��̵�����
	 * 
	 */
	public static List<Map<Object,Object>> getSelectList(String tablename, String[] columns,
            String PATH,String where){
		List<Map<Object,Object>> resultList = new ArrayList<Map<Object,Object>>();
		Connection conn = null;
		String sSQL = "";
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			for (int i = 0; i < columns.length; i++) {
		        if (i == 0) {
		          sSQL = "select " + columns[i];
		        }
		        else {
		          sSQL += "," + columns[i];
		        }
		      }
		      sSQL += " from " + tablename + " " + where;
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				Map<Object,Object> hamap = new HashMap<Object,Object>();
				hamap.put("id", rs.getString(columns[0]));
				hamap.put("value",  rs.getString(columns[1]));
				resultList.add(hamap);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return resultList;
	}
	public static void insertDB(String SQL,String PATH){
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			stmt.execute(SQL);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
	}
	public static void deleteDB(String sSQL,String PATH){
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sSQL);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
	}
	public static PrjBean findBySql(String SQL,String PATH){
		PrjBean bean = new PrjBean();
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			while(rs.next())
				bean = PrjBean.getPrjBeanFromRs(rs);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return bean;
	}
	public static List<PrjBean> getAllList(String PATH){
		List<PrjBean> list = new ArrayList<PrjBean>();
		String sSQL = "select * from TB_PJ ";
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				PrjBean bean = new PrjBean();
				bean = bean.getPrjBeanFromRs(rs);
				list.add(bean);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return list;
	}
	public static String getPrjLb(String prjncd,String PATH){
		String gclb="";
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			String sSQL = "select gcflmc from tb_gclb where gcfldm='"+prjncd.substring(0,1)+"'";
			ResultSet rs = stmt.executeQuery(sSQL);
			if(rs.next())
				gclb = rs.getString("gcflmc");
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return gclb;
	}
	
	public static String getPrjCntname(String prjncd,String PATH){
		String cntname="";
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			String sSQL = "select provnm from tb_cnt where cntcd='"+prjncd+"'";
			ResultSet rs = stmt.executeQuery(sSQL);
			if(rs.next())
				cntname = rs.getString("provnm");
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return cntname;
	}
	
	public static String getPrjLyxx(String prjncd,String PATH){
		String gclb="";
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			String sSQL = "select ctnm from tb_lysx1 where ctcd='A" +prjncd.substring(1,2)+ "000000'";
			ResultSet rs = stmt.executeQuery(sSQL);
			if(rs.next())
				gclb = rs.getString("ctnm");
			String sSQL2 = "select ctnm from tb_lysx1 where ctcd='A" +prjncd.substring(1,3)+ "00000'";
			ResultSet rs2 = stmt.executeQuery(sSQL2);
			if(rs2.next())
				gclb +="-" +rs2.getString("ctnm");
			String sSQL3 = "select ctnm from tb_lysx where ctcd like 'A" +prjncd.substring(1,5)+ "00%'";
			ResultSet rs3 = stmt.executeQuery(sSQL3);
			if(rs3.next())
				gclb +="-" +rs3.getString("ctnm");
			String sSQL4 = "select ctnm from tb_lysx where ctcd like 'A" +prjncd.substring(1,6)+ "%'";
			ResultSet rs4 = stmt.executeQuery(sSQL4);
			if(rs4.next())
				gclb +="-" +rs4.getString("ctnm");
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return gclb;
	}
	
	public static String getXzqhxx(String cntcd,String PATH){
		String xzqhxx="";
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			String sSQL = "select CNTCD,PROVNM from tb_cnt where CNTCD = '" +cntcd.substring(0,2)+ "0000'";
			ResultSet rs = stmt.executeQuery(sSQL);
			if(rs.next())
				xzqhxx = rs.getString("PROVNM");
			String sSQL2 = "select CNTCD,PROVNM  from tb_cnt where CNTCD = '" +cntcd.substring(0,4)+ "00'";
			ResultSet rs2 = stmt.executeQuery(sSQL2);
			if(rs2.next())
				xzqhxx +="-" +rs2.getString("PROVNM");
			String sSQL3 = "select CNTCD,PROVNM  from tb_cnt where CNTCD = '"+cntcd+"'";
			ResultSet rs3 = stmt.executeQuery(sSQL3);
			if(rs3.next())
				xzqhxx +="-" +rs3.getString("PROVNM");
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				ConnectionPool.freeConnection(conn);
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return xzqhxx;
	}
	
}
