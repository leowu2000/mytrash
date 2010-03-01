package com.buiness.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.buiness.form.ConfigBean;
import com.buiness.form.DetailBean;
import com.buiness.form.FPACTIBean;
import com.buiness.form.FXJBBean;
import com.buiness.form.HQBean;
import com.buiness.form.PJRCNBean;
import com.buiness.form.PrjBean;
import com.buiness.form.RSRBean;
import com.buiness.form.SDBean;
import com.buiness.form.STDNCBean;
import com.buiness.form.SubTempBean;
import com.core.ConnectionPool;
import com.core.UUIdFactory;
import com.util.UploadBean;

public class BuinessDao {
	/**
	 * 新增
	 * 生成工程 编号规则
	 * 工程类别编号＋Mid(工程所在河流的代码,2,6)＋Mid(工程所在地区的行政区划代码,1,2)
	 * 如果已对该工程采集过运行信息，则不允许修改该工程类型
	 * 工程表：TB_PJ
	 * 	detail：TB_PJRCN
	 * 
	 * 从工程表中获取最大流水号 ：select max(pjno) as MaxValue from tb_pj
	 * 找出工程的类型：select gcflmc from tb_gclb where gcfldm='" & Mid(RstProject!pjnmcd, 1, 1) 
	 * 找出工程所在的地区：select provnm from tb_cnt where cntcd='
	 * 找出工程所在的流域：select ctnm from tb_lysx1 where ctcd='A" & Mid(RstProject!pjnmcd, 2, 1) & "000000'
	 * 找出工程所在的水系：select ctnm from tb_lysx1 where ctcd='A" & Mid(RstProject!pjnmcd, 2, 2) & "00000'
	 * 找出工程所在的一级支流：select ctnm from tb_lysx where ctcd like 'A" & Mid(RstProject!pjnmcd, 2, 4) & "00%'
	 * 找出工程所在的二级支流：select ctnm from tb_lysx where ctcd like 'A" & Mid(RstProject!pjnmcd, 2, 6) & "%'
	 */
	/**
	 * 修改
	 * 检查本地区本河流上是否有相同名称工程：
	 * select * from tb_pj where pjno<>" & IntPJNO & " and pjnm='" & StrProName & "' and pjnmcd='" & StrPjnmcd & "' and cntcd='" & StrProDistrictCNTCD & "'
	 * 修改工程表中工程代码、工程名称、行政区划代码、防汛责任人、防汛责任人电话等字段
	 * 修改工程运行表中该工程的名称：
	 * update tb_pjrcn set pjnm='" & StrProName & _"' where pjno=" & IntPJNO
	 * 修改工程详情表中该工程的名称
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
	
	public static List<Map<Object,Object>> getSelectListInt(String tablename, String[] columns,
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
				hamap.put("id", rs.getInt(columns[0]));
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
	public static void insertUploadDB(String SQL,Connection conn){
		try{
			Statement stmt = conn.createStatement();
			stmt.execute(SQL);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	public static void updateDB(String SQL,String PATH){
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(SQL);
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
	public static List<PrjBean> getAllList(String PATH ,String isWhere){
		List<PrjBean> list = new ArrayList<PrjBean>();
		if("".trim().equals(isWhere))
			isWhere = "1=1";
		String sSQL = "select * from TB_PJ where "+isWhere;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				PrjBean bean = new PrjBean();
				bean = PrjBean.getPrjBeanFromRs(rs);
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
	public static String idToNameChange(String PATH,String tablename, String columns,
            String where){
		String value="";
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			String sSQL = "select "+columns+" from "+tablename+" where "+where;

			ResultSet rs = stmt.executeQuery(sSQL);
			if(rs.next()){
				value=rs.getString(1);
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
		return value;
	}
	
	public static String getIdFromNameChange(String PATH,String tablename, String columns,
            String where){
		String value="";
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			String sSQL = "select "+columns+" from "+tablename+" where "+where;
			ResultSet rs = stmt.executeQuery(sSQL);
			if(rs.next()){
				value=String.valueOf(rs.getInt(1));
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
		return value;
	}
	public static List<PJRCNBean> getAllPjrcnList(String PATH,String isWhere){
		if("".trim().equals(isWhere))
			isWhere = "1=1";
		List<PJRCNBean> list = new ArrayList<PJRCNBean>();
		String sSQL = "select * from TB_PJRCN where "+isWhere;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				PJRCNBean bean = new PJRCNBean();
				bean = PJRCNBean.getPJRCNBeanFromRs(rs);
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
	
	public static PJRCNBean findPjrcnById(String PATH,String pjrno){
		PJRCNBean bean = new PJRCNBean();
		String sSQL = "select * from TB_PJRCN WHERE PJRNO="+pjrno;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				bean = PJRCNBean.getPJRCNBeanFromRs(rs);
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
		return bean;
	}
	public static RSRBean findRsrById(String PATH,String pjrno){
		RSRBean bean = new RSRBean();
		String sSQL = "select * from TB_RSR WHERE PJRNO="+pjrno;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				bean = RSRBean.getPJRCNBeanFromRs(rs);
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
		return bean;
	}
	
	public static ConfigBean findConfigBean(String PATH){
		ConfigBean bean = new ConfigBean();
		String sSQL = "select * from TB_CONFIG";
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			if(rs.next()){
				bean = ConfigBean.getConfigBeanFromRs(rs);
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
		return bean;
	}
	public static List<STDNCBean> getAllStdncList(String PATH,String isWhere){
		List<STDNCBean> list = new ArrayList<STDNCBean>();
		if("".trim().equals(isWhere))
			isWhere = "1=1";
		String sSQL = "select * from TB_STDNC where "+isWhere;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				STDNCBean bean = new STDNCBean();
				bean = STDNCBean.getSTDNCBeanFromRs(rs);
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
	public static STDNCBean findStdncById(String PATH,String DNCNO){
		STDNCBean bean = new STDNCBean();
		String sSQL = "select * from TB_STDNC WHERE DNCNO="+DNCNO;
		System.out.println(sSQL);
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				bean = STDNCBean.getSTDNCBeanFromRs(rs);
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
		return bean;
	}
	public static List<FXJBBean> getAllFxjbcList(String PATH,String isWhere){
		List<FXJBBean> list = new ArrayList<FXJBBean>();
		if("".trim().equals(isWhere))
			isWhere = "1=1";
		String sSQL = "select * from TB_FXJB where "+isWhere;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				FXJBBean bean = new FXJBBean();
				bean = FXJBBean.getFXJBBeanFromRs(rs);
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
	
	public static FXJBBean findFxjbcByID(String PATH,String RPJINCD){
		FXJBBean bean = new FXJBBean();
		String sSQL = "select * from TB_FXJB where RPJINCD="+RPJINCD;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				bean = FXJBBean.getFXJBBeanFromRs(rs);
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
		return bean;
	}
	public static FPACTIBean findFpactiByID(String PATH,String RPJINCD){
		FPACTIBean bean = new FPACTIBean();
		String sSQL = "select * from TB_FPACTI where RPJINCD="+RPJINCD;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				bean = FPACTIBean.getFPACTIBeanFromRs(rs);
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
		return bean;
	}
	public static SDBean findSDByID(String PATH,String RPJINCD){
		SDBean bean = new SDBean();
		String sSQL = "select * from TB_SD where RPJINCD="+RPJINCD;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				bean = SDBean.getSDBeanFromRs(rs);
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
		return bean;
	}
	public static HQBean findHQByID(String PATH,String RPJINCD){
		HQBean bean = new HQBean();
		String sSQL = "select * from TB_QT where RPJINCD="+RPJINCD;
		System.out.println(sSQL);
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				bean = HQBean.getHQBeanFromRs(rs);
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
		return bean;
	}
	public static List<HQBean> getAllHqList(String PATH,String isWhere){
		List<HQBean> list = new ArrayList<HQBean>();
		if("".trim().equals(isWhere))
			isWhere = "1=1";
		String sSQL = "select * from TB_QT where "+isWhere;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				HQBean bean = new HQBean();
				bean = HQBean.getHQBeanFromRs(rs);
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
	public static List<FPACTIBean> getAllFpactiList(String PATH,String isWhere){
		List<FPACTIBean> list = new ArrayList<FPACTIBean>();
		if("".trim().equals(isWhere))
			isWhere = "1=1";
		String sSQL = "select * from TB_FPACTI where "+isWhere;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				FPACTIBean bean = new FPACTIBean();
				bean = FPACTIBean.getFPACTIBeanFromRs(rs);
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
	public static List<SDBean> getAllSdList(String PATH,String isWhere){
		List<SDBean> list = new ArrayList<SDBean>();
		if("".trim().equals(isWhere))
			isWhere="1=1";
		String sSQL = "select * from TB_SD where "+isWhere;
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(PATH);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				SDBean bean = new SDBean();
				bean = SDBean.getSDBeanFromRs(rs);
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
	/**
	 * SaveDangerData()======保存险情信息
	 * StrXQFLDM = Right(Trim(CboDangerClass.Text), 4)
     * 根据工程险情分类代码找出险情分类表名
     * SqlString = "select name from xianqing where fldm='" & StrXQFLDM & "'"
	 * SqlString = "select * from tb_stdnc where dncno=" & pintDNCNO
	 * SqlString = "select * from " & pStrDangerClassTb & " where dncno=" & pintDNCNO
	 * 初始化出险部位显示框
	 * SqlString = "select * from tb_st where pjno=" & IntPJNO & " order by sttpcd"
	 * 险情信息
	 * SqlString = "select * from tb_stdnc where dncno=" & mIntCurrentProDNCNO
	 * SqlString = "select * from tb_st where sttpcd=" & IntSTTPCD
	 * 
	 * If Run Then
     *    '如果是工程运行信息
     *    '从工程运行媒体表中得到相关信息
     *   SqlString = "select * from tb_pjr_m where pjrno=" & NO & " order by zlbm"
     * Else
     *    '如果是工程险情信息
     *     '从工程险情媒体表中得到相关信息
     *   SqlString = "select * from tb_stdnc_m where dncno=" & NO & " order by zlbm"
     * End If
     * If OptProRunSituation.Value Then
     *   '在工程运行信息状态下
     *  '从工程运行媒体表中得到工程运行信息流水号
     *  SqlString = "select * from tb_pjr_m where zlbm=" & MSGList.TextMatrix(MSGList.Row, 0)
     *  RstRequre.Open SqlString, GetDataADOConn, adOpenStatic, adLockOptimistic
     *  NO = RstRequre!PJRNO
     *	ElseIf OptProDanger.Value Then
     *  '在工程险情信息状态下
     *  '从工程险情媒体表中得到工程险情信息流水号
     *  SqlString = "select * from tb_stdnc_m where zlbm=" & MSGList.TextMatrix(MSGList.Row, 0)
     *  RstRequre.Open SqlString, GetDataADOConn, adOpenStatic, adLockOptimistic
     *  NO = RstRequre!DNCNO
     *  End If
     * 
	 */
	public static void deleteTempMedia(String path){
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			Statement stmt = conn.createStatement();
			String sSQL = "delete from tb_sub_temp";
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
	public static List<SubTempBean> getMediaList(String path,String parentno,String tbid){
		List<SubTempBean> beanList = new ArrayList<SubTempBean>();
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			Statement stmt = conn.createStatement();
			String sSQL = "select * from tb_sub_temp where RARENTNO="+parentno+" and tbno='"+tbid+"'";
			System.out.println(sSQL);
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				SubTempBean bean = SubTempBean.getSubTempBeanFromRs(rs);
				beanList.add(bean);
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
		return beanList;
	}
	public static void insertTempMedia(String path,
			String parentno,String datetime,
			String title,String wjgs,String nrms,
			String fieldir,String tbid){
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			Statement stmt = conn.createStatement();
			String sSQL = "INSERT INTO TB_SUB_TEMP(ZLBM,RARENTNO,DTCDT,TITLE,WJGS,NRMS,LXZP,TBNO) "
						+"values("+UUIdFactory.getMaxId(path, "TB_SUB_TEMP","ZLBM")
						+","+parentno
						+",#"+datetime
						+"#,'"+title
						+"','"+wjgs
						+"','"+nrms
						+"','"+fieldir
						+"','"+tbid+"')";
			System.out.println(sSQL);
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
	
	public static void toInsertDbList(String path,
			String tbid,String mainSql,String subsql,
			List<SubTempBean> beanlist){
		String parentName="";
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			Statement stmt = conn.createStatement();
			stmt.execute(mainSql);
			if(!"".trim().equals(subsql))
				stmt.execute(subsql);
			if(beanlist!=null && beanlist.size()>0)
				if("TB_FPACTI_M".trim().equals(tbid)
						||"TB_QT_M".trim().equals(tbid)
						||"TB_SD_M".trim().equals(tbid))
					parentName="RPJINCD";
				if("TB_PJR_M".trim().equals(tbid))
					parentName="PJRNO";
				if("TB_STDNC_M".trim().equals(tbid.trim()))
					parentName="DNCNO";
				
				for(int i=0;i<beanlist.size();i++){
					SubTempBean bean = (SubTempBean)beanlist.get(i);
					String subSql = "INSERT INTO "+tbid+" (ZLBM,"+parentName+",DTCDT,TITLE,WJGS,NRMS,LXZP) values(?,?,?,?,?,?,?)";
					PreparedStatement pstmt = conn.prepareStatement(subSql);
					File f = new File(bean.getLXZP());
					FileInputStream fis = new FileInputStream(f);
					pstmt.setInt(1, UUIdFactory.getMaxId(path, tbid,"ZLBM"));
					pstmt.setString(2, bean.getRARENTNO());
					pstmt.setString(3, bean.getDTCDT());
					pstmt.setString(4, bean.getTITLE());
					pstmt.setString(5, bean.getWJGS());
					pstmt.setString(6, bean.getNRMS());
					pstmt.setBinaryStream(7, fis, (int) f.length());
					pstmt.executeUpdate();
					pstmt.close();
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
	}
	
	public static DetailBean getDetailBean(String path,String pjno,
			String dncno,String XQFLDM){
		DetailBean bean = new DetailBean();
		Connection conn = null;
		Connection DBNAME_conn = null;
		String tabname=BuinessDao.getXqFlTabname(path,XQFLDM);
//		//D001	决口				TB_BURDSC	
//		if("D001".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_BURDSC";
//		//D002	漫溢				TB_OVFLDSC
//		if("D002".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_OVFLDSC";
//		//D003	漏洞				TB_LKDSC
//		if("D003".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_LKDSC";
//		//D004	管涌				TB_PPDSC
//		if("D004".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_PPDSC";
//		//D005	陷坑				TB_PITDSC
//		if("D005".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_PITDSC";
//		//D006	滑坡 			TB_SLDSC
//		if("D006".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_SLDSC";
//		//D007	淘刷				TB_UNDSC
//		if("D007".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_UNDSC";
//		//D008	裂缝				TB_CRDSC
//		if("D008".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_CRDSC";
//		//D009	崩岸				TB_CVDSC
//		if("D009".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_CVDSC";
//		//D010	渗水				TB_SPDSC
//		if("D010".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_SPDSC";
//		//D011	 浪坎 			TB_BLBADSC
//		if("D011".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_BLBADSC";
//		//D012	滑动				TB_SLUDSC
//		if("D012".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_SLUDSC";
//		//D013	启闭失灵			TB_HOMLFDSC
//		if("D013".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_HOMLFDSC";
//		//D014	闸门破坏			TB_GTWRDSC
//		if("D014".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_GTWRDSC";
//		//D015	溃坝				TB_BRDMDSC
//		if("D015".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_BRDMDSC";
//		//D016	倾覆				TB_OVTUDSC
//		if("D016".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_OVTUDSC";
//		//D017	应力过大			TB_STREXDSC
//		if("D017".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_STREXDSC";
//		//D018	坍塌				TB_SLIDSC
//		if("D018".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_SLIDSC";
//		//D019	堵塞				TB_PLUDSC
//		if("D019".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_PLUDSC";
//		//D020	基础破坏			TB_BSWRDSC
//		if("D020".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_BSWRDSC";
//		//D021	消能工破坏		TB_EDDWRDSC
//		if("D021".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_EDDWRDSC";
//		//D022	基础排水失效		TB_BSWPLPDS
//		if("D022".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_BSWPLPDS";
//		//D023	洞身破坏 			TB_HBWRDSC
//		if("D023".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_HBWRDSC";
//		//D024	控导工程局部破坏	TB_CLPJPRWR
//		if("D024".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_CLPJPRWR";
//		//D025	控导工程冲毁		TB_CLPJSCDN
//		if("D025".trim().equals(XQFLDM.toUpperCase()))tabname = "TB_CLPJSCDN";
		try{

			conn = ConnectionPool.getConnection(path);
			String sSQL = "SELECT * FROM "+tabname+" WHERE PJNO="+pjno+" AND DNCNO="+dncno;
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next())
				bean = DetailBean.getDetailBeanFromRs(rs, XQFLDM);
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

	public static String getXqFlTabname(String path ,String fldm){
		String name = "";
		Connection conn = null;
		try{
			String sql = "select name from xianqing where fldm='"+fldm+"'";
			conn = ConnectionPool.getDbNameConnection(path);
			Statement DBNAME_stmt = conn.createStatement();
			ResultSet DBNAME_rs = DBNAME_stmt.executeQuery(sql);
			if(DBNAME_rs.next()){
				name = DBNAME_rs.getString("name");
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
		return name;
	}
	public static void insertTempResult(String path,UploadBean bean ){
		Connection conn = null;
		try{
			int id= UUIdFactory.getMaxId(path, "TEMP_RESULT", "ID");
			conn = ConnectionPool.getConnection(path);
			String sSQL = "INSERT INTO TEMP_RESULT (TITLE,WTDPDT,FENLEI," +
					"WTDPCD,GCFLDM,NUM,TBCNAME,TBNAME,UPLOAD,ID)VALUES(" +
					"'"+bean.getTitle()+"',#"+bean.getWTDPDT()+"#,'"+bean.getFENLEI()+"'" +
					",'"+bean.getWTDPCD()+"','"+bean.getGCFLDM()+"',"+bean.getNum()+
					",'"+bean.getTbcname()+"','"+bean.getTbName()+"','0',"+id+")";
			Statement stmt = conn.createStatement();
			stmt.execute(sSQL);
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
	public static void updateTempResult(String path,String id ){
		Connection conn = null;
		try{
			conn = ConnectionPool.getConnection(path);
			String sSQL = "update TEMP_RESULT set upload='1' where ID="+id;
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
}
