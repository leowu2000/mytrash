package com.basesoft.server;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

public class DB {
	JdbcTemplate jt;
	public DB(String driver,String url,String username,String password) {
		this.jt = new JdbcTemplate(new SingleConnectionDataSource(driver,url,username,password,false));
	}
	
	public String[] getTables() {
//		try {
//			DatabaseMetaData dbmd = jt.getDataSource().getConnection().getMetaData();
//			ResultSet rsTables = dbmd.getTables("%", "%", "%", new String[]{"TABLE"});
//			while(rsTables.next()){
//					System.out.println(rsTables.getString(3));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		return Consts.TABLES;
	}
	
	public int getCount(String table) {
		return jt.queryForInt("select count(*) from "+table);
	}

	public static void main(String[] args) {
//		DB db = new DB("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:MS Access Database;DBQ=Z:/xxcj/hpjdb.mdb","","");
		DB db = new DB("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:MS Access Database;DBQ=U:/myworkspace/ssgq/141030356.mdb","","");
//		DB db = new DB("sun.jdbc.odbc.JdbcOdbcDriver","jdbc:odbc:SQL_CPJDB","kingbase","1");
		String[] tables = db.getTables();
		for (String table : tables) {
			if(db.getCount(table)>0)
			System.out.println(table+":\t"+db.getCount(table));
		}
	}
}
