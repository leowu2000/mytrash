package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.buiness.dao.BuinessDao;
import com.buiness.dao.UploadSqlFactory;
import com.core.ConnectionPool;

public class UploadDB {

	/**
	 * 用户数据上传的类 上传步骤说明：<来源：vbs> SELECT PJNM as title, WTDPDT,'" & constRunStatus
	 * &"' as FENLEI,WTDPCD,GCFLDM,PJRNO as num, 'TB_PJRCN' as TbName FROM TB_PJRCN  UNION"
	 * & _ SELECT DNCNM as title, WTDPDT, '" & constDangerReport &"' as FENLEI,WTDPCD,XQFLDM,DNCNO as num,'TB_STDNC' as TbName FROM TB_STDNC   UNION "
	 * & _ SELECT WTTT as title, WTDT as wtdpdt,'" & constGuardAction &"' as FENLEI,WTDPCD,NULL,RPJINCD as num,'TB_FPACTI' as TbName FROM TB_FPACTI UNION "
	 * & _ SELECT WTTT as title, WTDT as wtdpdt,'" & constDisasterReport &
	 * "' as FENLEI,WTDPCD, NULL,RPJINCD as num,'TB_SD' as TbName FROM TB_SD UNION "
	 * & _ SELECT WTTT as title, WTDT as wtdpdt,'" & constDry &
	 * "' as FENLEI,WTDPCD,NULL,RPJINCD as num, 'TB_QT' as TbName FROM TB_QT UNION "
	 * & _ SELECT '第' + trim(cstr(issue)) + '期' as title, WTDT as wtdpdt,'" &
	 * constBriefing &
	 * "' as FENLEI,WTDPCD, NULL, Issue as num, 'TB_FXJB' as TbName FROM TB_FXJB  "
	 * rsPickRec.Open "select distinct num from tb_pickrec where trim(fenlei)='"
	 * _ constRunStatus & "' and zlbm = -1", _ HpjdbAccessConnection,
	 * adOpenStatic, adLockBatchOptimistic
	 * 
	 */
	/**
	 * @param args
	 */
	public static void getLocalRecords(String path) {
		Connection conn = null;
		try {
			conn = ConnectionPool.getConnection(path);
			Statement stmt = conn.createStatement();
			// 查询本的数据库中的有效记录＝所有记录运行表、险情表、防汛行动、旱情、灾情、简报
			String sql = " select * from (SELECT PJNM  as title, WTDPDT,'TB_PJR_M' as FENLEI,WTDPCD,GCFLDM,PJRNO as num, 'TB_PJRCN' as TbName,'运行状态' as TbCname FROM TB_PJRCN  UNION"
					+ " SELECT DNCNM as title, WTDPDT, 'TB_STDNC_M' as FENLEI,WTDPCD,XQFLDM,DNCNO as num,'TB_STDNC' as TbName,'险情' as TbCname  FROM TB_STDNC   UNION "
					+ " SELECT WTTT  as title, WTDT as wtdpdt,'TB_FPACTI_M' as FENLEI,WTDPCD,NULL,RPJINCD as num,'TB_FPACTI' as TbName,'防汛行动' as TbCname  FROM TB_FPACTI UNION "
					+ " SELECT WTTT  as title, WTDT as wtdpdt,'TB_SD_M' as FENLEI,WTDPCD, NULL,RPJINCD as num,'TB_SD' as TbName,'灾情' as TbCname  FROM TB_SD UNION "
					+ " SELECT WTTT  as title, WTDT as wtdpdt,'TB_QT_M' as FENLEI,WTDPCD,NULL,RPJINCD as num, 'TB_QT' as TbName,'旱情' as TbCname  FROM TB_QT UNION "
					+ " SELECT '第' + trim(cstr(issue)) + '期'  as title, WTDT as wtdpdt,'TB_FXJB_M' as FENLEI,WTDPCD, NULL, Issue as num, 'TB_FXJB' as TbName,'防汛简报' as TbCname  FROM TB_FXJB ) "
					+ " order by wtdpdt desc";
			ResultSet rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				
				UploadBean bean = new UploadBean();
				bean.setTitle(rs.getString(1));
				bean.setWTDPDT(rs.getString(2));
				bean.setFENLEI(rs.getString(3));
				bean.setWTDPCD(rs.getString(4));
				bean.setGCFLDM(rs.getString(5));
				bean.setNum(String.valueOf(rs.getInt(6)));
				bean.setTbcname(rs.getString(8));
				bean.setTbName(rs.getString(7));
				BuinessDao.insertTempResult(path,bean);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				ConnectionPool.freeConnection(conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
	}
	public static List<UploadBean> getAllRecords(String path,String iswhere) {
		List<UploadBean> list = new ArrayList<UploadBean>();
		if("".trim().equals(iswhere))iswhere="1=1";
		Connection conn = null;
		try {
			conn = ConnectionPool.getConnection(path);
			Statement stmt = conn.createStatement();
			String sql = "select * from temp_result";
			ResultSet rs = stmt.executeQuery(sql);
			if(!rs.next()){
				getLocalRecords(path);
			}
			String allSQL = "select * from temp_result where upload='0' and "+iswhere 
					+" order by wtdpdt desc";
			ResultSet rs2 = stmt.executeQuery(allSQL);
			while(rs2.next()){
				UploadBean bean = new UploadBean();
				bean.setTitle(rs2.getString(1));
				bean.setWTDPDT(rs2.getString(2));
				bean.setFENLEI(rs2.getString(3));
				bean.setWTDPCD(rs2.getString(4));
				bean.setGCFLDM(rs2.getString(5));
				bean.setNum(String.valueOf(rs2.getInt(6)));
				bean.setTbcname(rs2.getString(7));
				bean.setTbName(rs2.getString(8));
				bean.setID(String.valueOf(rs2.getInt(10)));
				list.add(bean);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				ConnectionPool.freeConnection(conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return list;
	}
	public static List<UploadBean> getUploadRecords(String path) {
		List<UploadBean> list = new ArrayList<UploadBean>();
		Connection conn = null;
		try {
			conn = ConnectionPool.getConnection(path);
			Statement stmt = conn.createStatement();
			String allSQL = "select * from temp_result where upload='1' order by wtdpdt desc";
			ResultSet rs2 = stmt.executeQuery(allSQL);
			while(rs2.next()){
				UploadBean bean = new UploadBean();
				bean.setTitle(rs2.getString(1));
				bean.setWTDPDT(rs2.getString(2));
				bean.setFENLEI(rs2.getString(3));
				bean.setWTDPCD(rs2.getString(4));
				bean.setGCFLDM(rs2.getString(5));
				bean.setNum(String.valueOf(rs2.getInt(6)));
				bean.setTbcname(rs2.getString(7));
				bean.setTbName(rs2.getString(8));
				bean.setID(String.valueOf(rs2.getInt(10)));
				list.add(bean);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				ConnectionPool.freeConnection(conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return list;
	}
	/**
	 * "上次上传数据文件的过程没有完成，是否需要重新上传？" '如果用户不需要续传则删除该文件 '将要传送信息拷贝到上传数据库upload.mdb中
	 * Dim IntProPJNO As Integer '工程编号变量 Dim IntPJRNO As Integer '工程运行编号变量 Dim
	 * IntDNCNO As Integer '工程险情编号变量 Dim StrGCFLDM As String '工程分类代码变量 Dim
	 * StrXQFLDM As String '工程险情代码变量 Dim StrGCorXQFLTb As String
	 * '工程分类详情表或险情详情表名变量 Dim IntSTTPCD As Integer '建筑物（出险部位）流水号变量 Dim
	 * StrUploadName As String '上传数据库所在路径及名称
	 * 
	 **/
	/**
	 * 清空上传数据库
	 */
	public static void DAO_MODE_ZAP(String path) {
		Connection conn = null;
		try {
			conn = ConnectionPool.getUploadConnection(path);
			String sSQL = "SELECT name from MSysObjects where type=1 and name like 'TB_%'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sSQL);
			while(rs.next()){
				String delSQL = "delete from "+rs.getString(1);
				Statement stmt2 = conn.createStatement();
				stmt2.executeUpdate(delSQL);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				ConnectionPool.freeConnection(conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
	}
	/**
	 * 拷备险情数据
	 * @param path
	 * @param num
	 * @return
	 */
	public static boolean CopyDangerData(String path,String num){
		boolean flg = true;
		Connection local_Conn = null;//本的数据库
		Connection upload_Conn = null;//上传数据库
		Connection dbname_conn = null;//工程分类代码对应表名称
		try {
			local_Conn = ConnectionPool.getConnection(path);//打开将要被传送的信息所在的数据库中的工程表
			upload_Conn = ConnectionPool.getUploadConnection(path);//'打开上传数据库（upload.mdb）中的工程表
			dbname_conn = ConnectionPool.getDbNameConnection(path);//工程分类代码对应表名称
			Statement local_stmt = local_Conn.createStatement();
			String sSQL = "SELECT * from tb_pj where pjno=(select PJNO from tb_stdnc where DNCNO="+num+")";
	        //将传送的工程信息拷贝到上传数据库upload.mdb中工程表
			copyDataFromRs("tb_pj",sSQL,local_Conn,upload_Conn);
			String localSQL = "select * from tb_stdnc where DNCNO ="+num;
			
			ResultSet local_rs = local_stmt.executeQuery(localSQL);
			while(local_rs.next()){
				//将主表tb_stdnc信息拷备到upload.mdb中
				String xqfldm = local_rs.getString("XQFLDM");
				String sql = UploadSqlFactory.uploadSQL_STDNCBean(local_rs,xqfldm);
				BuinessDao.insertUploadDB(sql, upload_Conn);
				//取得险情分类代码
				
				Statement dbname_stmt = dbname_conn.createStatement();
				String dbnameSQL = "select name from xianqing where fldm='"+xqfldm+"'";
				ResultSet dbname_rs = dbname_stmt.executeQuery(dbnameSQL);
				while(dbname_rs.next()){
					//拷备险情分类表
					String tablename = dbname_rs.getString("name").trim();
					localSQL = "select * from "+tablename+" where DNCNO="+num;
					copyDataFromRs(tablename,localSQL,local_Conn,upload_Conn);
				}
				//拷备多媒体表
				localSQL = "select * from tb_stdnc_m where DNCNO="+num;
					copyData(path,"tb_stdnc_m","DNCNO",localSQL,local_Conn,upload_Conn);
			}
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}finally {
			try {
				ConnectionPool.freeConnection(upload_Conn);
				ConnectionPool.freeConnection(local_Conn);
				ConnectionPool.freeConnection(dbname_conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return flg;
	}
	/**
	 * 拷备运行信息到upload.mdb
	 * @return
	 */
	public static boolean CopyRunData(String path,String pjno){
		boolean flg = true;
		Connection local_Conn = null;//本的数据库
		Connection upload_Conn = null;//上传数据库
		try {
			local_Conn = ConnectionPool.getConnection(path);//打开将要被传送的信息所在的数据库中的工程表
			upload_Conn = ConnectionPool.getUploadConnection(path);//'打开上传数据库（upload.mdb）中的工程表
			String sSQL = "SELECT * from tb_pj where pjno=(select PJNO from tb_pjrcn where PJRNO="+pjno+")";
			Statement local_Stmt = local_Conn.createStatement();
			
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			copyDataFromRs("tb_pj",sSQL,local_Conn,upload_Conn);
	        //将传送的工程信息拷贝到上传数据库upload.mdb中工程表
			//打开保存传送工程运行信息的工程运行表
			sSQL = "select * from tb_pjrcn where pjrno="+pjno;
			
			local_Rs = local_Stmt.executeQuery(sSQL);
			while(local_Rs.next()){
				//拷备工程运行信息
				copyDataFromRs("tb_pjrcn",sSQL,local_Conn,upload_Conn);
				//拷备运行表
				String detailsql = "select * from TB_RSR WHERE pjrno="+local_Rs.getInt("PJNO");
				copyDataFromRs("TB_RSR",detailsql,local_Conn,upload_Conn);
				//拷备多媒体表
				detailsql = "select * from tb_pjr_m WHERE pjrno="+local_Rs.getInt("PJNO");
					copyData(path,"tb_pjr_m","PJRNO",detailsql,local_Conn,upload_Conn);	
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
			flg = false;
		} finally {
			try {
				ConnectionPool.freeConnection(upload_Conn);
				ConnectionPool.freeConnection(local_Conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return flg;
	}
	public static boolean copyFXJBData(String path,String num){//RPJINCD
		boolean flg = true;
		Connection local_Conn = null;//本的数据库
		Connection upload_Conn = null;//上传数据库
		try{
			local_Conn = ConnectionPool.getConnection(path);//打开将要被传送的信息所在的数据库中的工程表
			upload_Conn = ConnectionPool.getUploadConnection(path);//'打开上传数据库（upload.mdb）中的工程表
			String sSQL = "SELECT * from tb_fxjb where RPJINCD="+num;
			Statement local_Stmt = local_Conn.createStatement();
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			if(local_Rs.next()){
				copyDataFromRs("tb_fxjb",sSQL,local_Conn,upload_Conn);
				String detailSQL = "SELECT * from tb_fxjb_m where RPJINCD="+num;
					copyData(path,"tb_fxjb_m","RPJINCD",detailSQL,local_Conn,upload_Conn);	
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			flg = false;
		} finally {
			try {
				
				ConnectionPool.freeConnection(upload_Conn);
				ConnectionPool.freeConnection(local_Conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return flg;
	}
	public static boolean copyFPACTIData(String path,String num){
		boolean flg = true;
		Connection local_Conn = null;//本的数据库
		Connection upload_Conn = null;//上传数据库
		try{
			local_Conn = ConnectionPool.getConnection(path);//打开将要被传送的信息所在的数据库中的工程表
			upload_Conn = ConnectionPool.getUploadConnection(path);//'打开上传数据库（upload.mdb）中的工程表
			String sSQL = "SELECT * from TB_FPACTI where RPJINCD="+num;
			Statement local_Stmt = local_Conn.createStatement();
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			if(local_Rs.next()){
				copyDataFromRs("TB_FPACTI",sSQL,local_Conn,upload_Conn);
				String detailSQL = "SELECT * from TB_FPACTI_M where RPJINCD="+num;
					copyData(path,"TB_FPACTI_M","RPJINCD",detailSQL,local_Conn,upload_Conn);	
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			flg = false;
		} finally {
			try {
				ConnectionPool.freeConnection(upload_Conn);
				ConnectionPool.freeConnection(local_Conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return flg;
	}
	public static boolean copyQTData(String path,String num){
		boolean flg = true;
		Connection local_Conn = null;//本的数据库
		Connection upload_Conn = null;//上传数据库
		try{
			local_Conn = ConnectionPool.getConnection(path);//打开将要被传送的信息所在的数据库中的工程表
			upload_Conn = ConnectionPool.getUploadConnection(path);//'打开上传数据库（upload.mdb）中的工程表
			String sSQL = "SELECT * from TB_QT where RPJINCD="+num;
			Statement local_Stmt = local_Conn.createStatement();
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			while(local_Rs.next()){
				copyDataFromRs("TB_QT",sSQL,local_Conn,upload_Conn);
				String detailSQL = "SELECT * from TB_QT_M where RPJINCD="+num;
					copyData(path,"TB_QT_M","RPJINCD",detailSQL,local_Conn,upload_Conn);	
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			flg = false;
		} finally {
			try {
				ConnectionPool.freeConnection(upload_Conn);
				ConnectionPool.freeConnection(local_Conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return flg;
	}
	public static boolean copySDData(String path,String num){
		boolean flg = true;
		Connection local_Conn = null;//本的数据库
		Connection upload_Conn = null;//上传数据库
		try{
			local_Conn = ConnectionPool.getConnection(path);//打开将要被传送的信息所在的数据库中的工程表
			upload_Conn = ConnectionPool.getUploadConnection(path);//'打开上传数据库（upload.mdb）中的工程表
			String sSQL = "SELECT * from TB_SD where RPJINCD="+num;
			Statement local_Stmt = local_Conn.createStatement();
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			while(local_Rs.next()){
				copyDataFromRs("TB_SD",sSQL,local_Conn,upload_Conn);
				String detailSQL = "SELECT * from TB_SD_M where RPJINCD="+num;
					copyData(path,"TB_SD_M","RPJINCD",detailSQL,local_Conn,upload_Conn);	
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			flg = false;
		} finally {
			try {
				ConnectionPool.freeConnection(upload_Conn);
				ConnectionPool.freeConnection(local_Conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return flg;
	}
	//此函数是将要传送的信息拷贝到上传数据库upload.mdb中。
	//函数返回true表示拷贝成功，返回false表示拷贝失败。
	public static boolean copySendDataToUploadDatabase(String path){
		boolean flg = true;
		String sSQL = "select * from TB_PICKREC";
		Connection local_Conn = null;//本的数据库
		try{
			local_Conn = ConnectionPool.getConnection(path);
			Statement local_Stmt = local_Conn.createStatement();
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			while(local_Rs.next()){
				String num = String.valueOf(local_Rs.getInt("NUM"));
				String fenli = local_Rs.getString("FENLEI").trim();
				if("灾情".trim().equals(fenli)){
					copySDData(path,num);
				}
				if("旱情".trim().equals(fenli)){
					copyQTData(path,num);
				}
				if("防汛简报".trim().equals(fenli)){
					copyFXJBData(path,num);
				}
				if("运行".trim().equals(fenli)){
					CopyRunData(path,num);
				}
				if("险情".trim().equals(fenli)){
					CopyDangerData(path,num);
				}
				if("防汛行动".trim().equals(fenli)){
					copyFPACTIData(path,num);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			flg = false;
		} finally {
			try {
				ConnectionPool.freeConnection(local_Conn);
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return flg;
	}
	public static void copyData (String path,String tablename,String pkfiled,String searchSql,Connection localconn,Connection conn){
		String sql="";
		try{
			Statement stmt = localconn.createStatement();
			ResultSet rs = stmt.executeQuery(searchSql);
			InputStream in = null;
			FileOutputStream fos = null;
			while(rs.next()){
				sql = "INSERT INTO "+tablename+" (ZLBM,"+pkfiled+",TITLE,WJGS,DTCDT,NRMS,LXZP)VALUES(?,?,?,?,?,?,?)";
				PreparedStatement pStat = conn.prepareStatement(sql);
				String filegs = rs.getString("WJGS");
				fos = new FileOutputStream(new File(path+"demo."+filegs));
				in = (InputStream)rs.getBinaryStream("LXZP");
				int a = 0; 
				
				byte[] temp = new byte[1024]; 
				while((a = in.read(temp))>0){ 
				int b = 0; 
				b+=a; 
				fos.write(temp,0,b); 
				}
				File f = new File(path+"\\demo."+filegs);
				FileInputStream fis = new FileInputStream(f);
				pStat.setString(1, String.valueOf(rs.getInt("ZLBM")));
				pStat.setString(2, rs.getString(pkfiled));
				pStat.setString(3, rs.getString("TITLE"));
				pStat.setString(4, filegs);
				pStat.setString(5, rs.getString("DTCDT"));
				pStat.setString(6, rs.getString("NRMS"));
				pStat.setBinaryStream(7, fis, (int) f.length());
				pStat.execute();
			}
		}catch(Exception ex){ex.printStackTrace();}
	}
	
	public static void copyDataFromRs (String tablename,
			String searchSql,Connection localconn,Connection conn){
		try{
			Statement stmt = localconn.createStatement();
			ResultSet rs = stmt.executeQuery(searchSql);
			 ResultSetMetaData meta = rs.getMetaData();
			 int cols = meta.getColumnCount();
			 String fields="";
			 String params = "";
			 Object obj[] = new Object[cols];
			 while(rs.next()){
				 for (int i = 0; i < cols; i++) {
                     fields += meta.getColumnName(i + 1) + ",";
                     params += "?,";
                     obj[i]= rs.getObject(i+1);
                 }
				 String insertSQL = "INSERT INTO "+tablename+" (" 
							 + fields.substring(0, fields.length() - 1) 
							 + ") values (" + params.substring(0, params.length() - 1) + ")";
				 PreparedStatement pStat = conn.prepareStatement(insertSQL);
				 for (int i = 0; i < obj.length; i++) {
                     if (obj[i] instanceof Blob) {
                         pStat.setObject(i+1, ((Blob) obj[i]).getBytes(1, 100000000));//100mb
                     } else {
                         pStat.setObject(i+1, obj[i]=obj[i]==null?"":obj[i]);
                     }
                 }
                 pStat.execute();
			 }
			
		}catch(Exception ex){ex.printStackTrace();}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
