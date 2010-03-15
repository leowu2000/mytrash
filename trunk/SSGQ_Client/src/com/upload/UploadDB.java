package com.upload;

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
import com.util.OutputLog;
import com.util.UtilDateTime;

public class UploadDB {

	/**
	 * @param args
	 */
	public static void getLocalRecords(String path) {
		Connection conn = null;
		try {
			conn = ConnectionPool.getConnection(path);
			Statement stmt = conn.createStatement();
			// ��ѯ�������ݿ��е���Ч��¼�����м�¼���б������������Ѵ�ж������顢���顢��
			String sql = " select * from (SELECT PJNM  as title, WTDPDT,'TB_PJR_M' as FENLEI,WTDPCD,GCFLDM,PJRNO as num, 'TB_PJRCN' as TbName,'����״̬' as TbCname FROM TB_PJRCN  UNION"
					+ " SELECT DNCNM as title, WTDPDT, 'TB_STDNC_M' as FENLEI,WTDPCD,XQFLDM,DNCNO as num,'TB_STDNC' as TbName,'����' as TbCname  FROM TB_STDNC   UNION "
					+ " SELECT WTTT  as title, WTDT as wtdpdt,'TB_FPACTI_M' as FENLEI,WTDPCD,NULL,RPJINCD as num,'TB_FPACTI' as TbName,'��Ѵ�ж�' as TbCname  FROM TB_FPACTI UNION "
					+ " SELECT WTTT  as title, WTDT as wtdpdt,'TB_SD_M' as FENLEI,WTDPCD, NULL,RPJINCD as num,'TB_SD' as TbName,'����' as TbCname  FROM TB_SD UNION "
					+ " SELECT WTTT  as title, WTDT as wtdpdt,'TB_QT_M' as FENLEI,WTDPCD,NULL,RPJINCD as num, 'TB_QT' as TbName,'����' as TbCname  FROM TB_QT UNION "
					+ " SELECT '��' + trim(cstr(issue)) + '��'  as title, WTDT as wtdpdt,'TB_FXJB_M' as FENLEI,WTDPCD, NULL, Issue as num, 'TB_FXJB' as TbName,'��Ѵ��' as TbCname  FROM TB_FXJB ) "
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
			conn.commit();
			stmt.executeQuery("select * from TEMP_RESULT");
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

			String allSQL = "select * from temp_result where upload='0' and "+iswhere 
					+" order by wtdpdt desc";
			ResultSet rs2 = stmt.executeQuery(allSQL);
			while(rs2.next()){
				UploadBean bean = new UploadBean();
				bean.setTitle(rs2.getString("Title"));
				bean.setWTDPDT(rs2.getString("WTDPDT"));
				bean.setFENLEI(rs2.getString("FENLEI"));
				bean.setWTDPCD(rs2.getString("WTDPCD"));
				bean.setGCFLDM(rs2.getString("GCFLDM"));
				bean.setNum(String.valueOf(rs2.getInt("Num")));
				bean.setTbcname(rs2.getString("Tbcname"));
				bean.setTbName(rs2.getString("TbName"));
				bean.setID(String.valueOf(rs2.getInt("ID")));
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
				bean.setTitle(rs2.getString("Title"));
				bean.setWTDPDT(rs2.getString("WTDPDT"));
				bean.setFENLEI(rs2.getString("FENLEI"));
				bean.setWTDPCD(rs2.getString("WTDPCD"));
				bean.setGCFLDM(rs2.getString("GCFLDM"));
				bean.setNum(String.valueOf(rs2.getInt("Num")));
				bean.setTbcname(rs2.getString("Tbcname"));
				bean.setTbName(rs2.getString("TbName"));
				bean.setID(String.valueOf(rs2.getInt("ID")));
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
	 * ����ϴ����ݿ�
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
	 * ������������
	 * @param path
	 * @param num
	 * @return
	 */
	public static boolean CopyDangerData(String path,String num){
		boolean flg = true;
		Connection local_Conn = null;//�������ݿ�
		Connection upload_Conn = null;//�ϴ����ݿ�
		Connection dbname_conn = null;//���̷�������Ӧ������
		try {
			local_Conn = ConnectionPool.getConnection(path);//�򿪽�Ҫ�����͵���Ϣ���ڵ����ݿ��еĹ��̱�
			upload_Conn = ConnectionPool.getUploadConnection(path);//'���ϴ����ݿ⣨upload.mdb���еĹ��̱�
			dbname_conn = ConnectionPool.getDbNameConnection(path);//���̷�������Ӧ������
			Statement local_stmt = local_Conn.createStatement();
			String sSQL = "SELECT * from tb_pj where pjno=(select PJNO from tb_stdnc where DNCNO="+num+")";
	        //�����͵Ĺ�����Ϣ�������ϴ����ݿ�upload.mdb�й��̱�
			copyDataFromRs("tb_pj",sSQL,local_Conn,upload_Conn);
			OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t������ع������ݳɹ�...");
			String localSQL = "select * from tb_stdnc where DNCNO ="+num;
			
			ResultSet local_rs = local_stmt.executeQuery(localSQL);
			while(local_rs.next()){
				//������tb_stdnc��Ϣ������upload.mdb��
				String xqfldm = local_rs.getString("XQFLDM");
				String sql = UploadSqlFactory.uploadSQL_STDNCBean(local_rs,xqfldm);
				BuinessDao.insertUploadDB(sql, upload_Conn);
				OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t����\t���ݳɹ�...");
				
				//ȡ������������
				
				Statement dbname_stmt = dbname_conn.createStatement();
				String dbnameSQL = "select name from xianqing where fldm='"+xqfldm+"'";
				ResultSet dbname_rs = dbname_stmt.executeQuery(dbnameSQL);
				while(dbname_rs.next()){
					//������������
					String tablename = dbname_rs.getString("name").trim();
					localSQL = "select * from "+tablename+" where DNCNO="+num;
					copyDataFromRs(tablename,localSQL,local_Conn,upload_Conn);
					OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t����\t�����������ݳɹ�...");
				}
				//������ý���
				localSQL = "select * from tb_stdnc_m where DNCNO="+num;
					copyData(path,"tb_stdnc_m","DNCNO",localSQL,local_Conn,upload_Conn);
					OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t����\t��ý�����ݳɹ�...");
			}
			OutputLog.outputLog(path, "---------------------------------------------------------------------");
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
	 * ����������Ϣ��upload.mdb
	 * @return
	 */
	public static boolean CopyRunData(String path,String pjno){
		boolean flg = true;
		Connection local_Conn = null;//�������ݿ�
		Connection upload_Conn = null;//�ϴ����ݿ�
		try {
			local_Conn = ConnectionPool.getConnection(path);//�򿪽�Ҫ�����͵���Ϣ���ڵ����ݿ��еĹ��̱�
			upload_Conn = ConnectionPool.getUploadConnection(path);//'���ϴ����ݿ⣨upload.mdb���еĹ��̱�
			String sSQL = "SELECT * from tb_pj where pjno=(select PJNO from tb_pjrcn where PJRNO="+pjno+")";
			Statement local_Stmt = local_Conn.createStatement();
			
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			copyDataFromRs("tb_pj",sSQL,local_Conn,upload_Conn);
			OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t������ع����������ݳɹ�...");
	        //�����͵Ĺ�����Ϣ�������ϴ����ݿ�upload.mdb�й��̱�
			//�򿪱��洫�͹���������Ϣ�Ĺ������б�
			sSQL = "select * from tb_pjrcn where pjrno="+pjno;
			
			local_Rs = local_Stmt.executeQuery(sSQL);
			while(local_Rs.next()){
				//��������������Ϣ
				copyDataFromRs("tb_pjrcn",sSQL,local_Conn,upload_Conn);
				OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t��������\t���ݳɹ�...");
				//�������б�
				String GCFLDM = local_Rs.getString("GCFLDM");
				int PJRNO = local_Rs.getInt("PJRNO");
				String detabletablename = BuinessDao.getTabNameFromGcfldm(GCFLDM);
				String detailsql = "select * from "+detabletablename+" WHERE PJRNO="+PJRNO;
				copyDataFromRs(detabletablename,detailsql,local_Conn,upload_Conn);
				//������ý���
				detailsql = "select * from tb_pjr_m WHERE pjrno="+PJRNO;
					copyData(path,"tb_pjr_m","PJRNO",detailsql,local_Conn,upload_Conn);	
					OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t��������\t��ý�����ݳɹ�...");
			}
			OutputLog.outputLog(path, "---------------------------------------------------------------------");
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
		Connection local_Conn = null;//�������ݿ�
		Connection upload_Conn = null;//�ϴ����ݿ�
		try{
			local_Conn = ConnectionPool.getConnection(path);//�򿪽�Ҫ�����͵���Ϣ���ڵ����ݿ��еĹ��̱�
			upload_Conn = ConnectionPool.getUploadConnection(path);//'���ϴ����ݿ⣨upload.mdb���еĹ��̱�
			String sSQL = "SELECT * from tb_fxjb where RPJINCD="+num;
			Statement local_Stmt = local_Conn.createStatement();
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			if(local_Rs.next()){
				copyDataFromRs("tb_fxjb",sSQL,local_Conn,upload_Conn);
				OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t��Ѵ��\t���ݳɹ�...");
				String detailSQL = "SELECT * from tb_fxjb_m where RPJINCD="+num;
					copyData(path,"tb_fxjb_m","RPJINCD",detailSQL,local_Conn,upload_Conn);
					OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t��Ѵ��\t��ý�����ݳɹ�...");
			}
			OutputLog.outputLog(path, "---------------------------------------------------------------------");
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
		Connection local_Conn = null;//�������ݿ�
		Connection upload_Conn = null;//�ϴ����ݿ�
		try{
			local_Conn = ConnectionPool.getConnection(path);//�򿪽�Ҫ�����͵���Ϣ���ڵ����ݿ��еĹ��̱�
			upload_Conn = ConnectionPool.getUploadConnection(path);//'���ϴ����ݿ⣨upload.mdb���еĹ��̱�
			String sSQL = "SELECT * from TB_FPACTI where RPJINCD="+num;
			Statement local_Stmt = local_Conn.createStatement();
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			if(local_Rs.next()){
				copyDataFromRs("TB_FPACTI",sSQL,local_Conn,upload_Conn);
				OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t��Ѵ�ж�\t���ݳɹ�...");
				String detailSQL = "SELECT * from TB_FPACTI_M where RPJINCD="+num;
					copyData(path,"TB_FPACTI_M","RPJINCD",detailSQL,local_Conn,upload_Conn);
					OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t��Ѵ�ж�\t��ý�����ݳɹ�...");
			}
			OutputLog.outputLog(path, "---------------------------------------------------------------------");
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
		Connection local_Conn = null;//�������ݿ�
		Connection upload_Conn = null;//�ϴ����ݿ�
		try{
			local_Conn = ConnectionPool.getConnection(path);//�򿪽�Ҫ�����͵���Ϣ���ڵ����ݿ��еĹ��̱�
			upload_Conn = ConnectionPool.getUploadConnection(path);//'���ϴ����ݿ⣨upload.mdb���еĹ��̱�
			String sSQL = "SELECT * from TB_QT where RPJINCD="+num;
			Statement local_Stmt = local_Conn.createStatement();
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			while(local_Rs.next()){
				copyDataFromRs("TB_QT",sSQL,local_Conn,upload_Conn);
				OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t����\t���ݳɹ�...");
				String detailSQL = "SELECT * from TB_QT_M where RPJINCD="+num;
					copyData(path,"TB_QT_M","RPJINCD",detailSQL,local_Conn,upload_Conn);	
					OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t����\t��ý�����ݳɹ�...");
			}
			OutputLog.outputLog(path, "---------------------------------------------------------------------");
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
		Connection local_Conn = null;//�������ݿ�
		Connection upload_Conn = null;//�ϴ����ݿ�
		try{
			local_Conn = ConnectionPool.getConnection(path);//�򿪽�Ҫ�����͵���Ϣ���ڵ����ݿ��еĹ��̱�
			upload_Conn = ConnectionPool.getUploadConnection(path);//'���ϴ����ݿ⣨upload.mdb���еĹ��̱�
			String sSQL = "SELECT * from TB_SD where RPJINCD="+num;
			Statement local_Stmt = local_Conn.createStatement();
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			while(local_Rs.next()){
				copyDataFromRs("TB_SD",sSQL,local_Conn,upload_Conn);
				OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t����\t���ݳɹ�...");
				String detailSQL = "SELECT * from TB_SD_M where RPJINCD="+num;
					copyData(path,"TB_SD_M","RPJINCD",detailSQL,local_Conn,upload_Conn);
					OutputLog.outputLog(path, UtilDateTime.nowDateStringCN()+"\t����\t����\t��ý�����ݳɹ�...");
			}
			OutputLog.outputLog(path, "---------------------------------------------------------------------");
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
	//�˺����ǽ�Ҫ���͵���Ϣ�������ϴ����ݿ�upload.mdb�С�
	//��������true��ʾ�����ɹ�������false��ʾ����ʧ�ܡ�
	public static boolean copySendDataToUploadDatabase(String path){
		boolean flg = true;
		String sSQL = "select * from TB_PICKREC";
		Connection local_Conn = null;//�������ݿ�
		Connection upload_conn = null;
		try{
			local_Conn = ConnectionPool.getConnection(path);
			upload_conn = ConnectionPool.getUploadConnection(path);
			Statement local_Stmt = local_Conn.createStatement();
			ResultSet local_Rs = local_Stmt.executeQuery(sSQL);
			//���������������뵽upload.mdb
			copyDataFromRs ("TB_ST","SELECT * FROM TB_ST",local_Conn,upload_conn);
			ConnectionPool.freeConnection(upload_conn);
			while(local_Rs.next()){
				String num = String.valueOf(local_Rs.getInt("NUM"));
				String fenli = local_Rs.getString("FENLEI").trim();
				if("����".trim().equals(fenli)){
					copySDData(path,num);
				}
				if("����".trim().equals(fenli)){
					copyQTData(path,num);
				}
				if("��Ѵ��".trim().equals(fenli)){
					copyFXJBData(path,num);
				}
				if("����״̬".trim().equals(fenli)){
					CopyRunData(path,num);
				}
				if("����".trim().equals(fenli)){
					CopyDangerData(path,num);
				}
				if("��Ѵ�ж�".trim().equals(fenli)){
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