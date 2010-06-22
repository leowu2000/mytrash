package com.basesoft.server;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.basesoft.core.Constants;

public class DbQuery {
	Connection DbConn = null;
	Connection cnTarget = null;
	String Database = "";
	String strInputMdbFileName = "";

	public void setMdbFileName(String paraStrInputMdbFileName) {
		strInputMdbFileName = paraStrInputMdbFileName;
	}

	// 初始化类时候需要指出入库文件的全路径名称
	// 默认是在当前路径下面
	public DbQuery(String paraStrInputMdbFileName) {
		try {
			// 这里的源驱动程序固定是Access的JDBC-ODBC驱动。
			String strDriverName = "sun.jdbc.odbc.JdbcOdbcDriver";
			Driver sourceDriver = (Driver) Class.forName(strDriverName)
					.newInstance();
			DriverManager.registerDriver(sourceDriver);
			// 获取后台数据库的驱动程序名称
			strDriverName = "com.kingbase.Driver";
			Driver targetDriver = (Driver) Class.forName(strDriverName)
					.newInstance();
			DriverManager.registerDriver(targetDriver);
		} catch (Exception e) {
			System.out.println("注册JDBC驱动程序失败!");
			e.printStackTrace();
		}
	}

	public Connection newConnection(String URL, String user, String password) {
		Connection con = null;
		try {
			if (user == null)
				con = DriverManager.getConnection(URL);
			else
				con = DriverManager.getConnection(URL, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	// 开始复制文件
	public boolean beginCopyData() {
		boolean executeResult = true;
		System.out.println("要处理的文件是：" + strInputMdbFileName);
		String sURL = "jdbc:odbc:driver={MicroSoft Access Driver (*.mdb)};DBQ=" + Constants.ROOTPATH+"\\upload\\"+strInputMdbFileName;
		Connection cnSource, cnTarget;
		Properties p = new Properties();
		try {
			p.load(this.getClass().getResourceAsStream("/jdbc.properties"));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		System.out.println(sURL);
		cnSource = newConnection(sURL, "admin", "");
		cnTarget = newConnection(p.getProperty("datasource.jdbcUrl"), p
				.getProperty("datasource.username"), p
				.getProperty("datasource.password"));

		if (cnSource == null || cnTarget == null) {
			System.out.println("连接失败。请检查连接的ODBC参数设置是否正确；文件是否存在。");
			return false;
		} else {
			System.out.println("连接成功...");
		}

		DataCopy myCopy = new DataCopy();
		// 以先后顺序复制指定的Access数据库中的记录
		if (myCopy.copyPJ(cnSource, cnTarget)
				&& myCopy.copyOtherTables(cnSource, cnTarget)
				&& myCopy.copyReportTables(cnSource, cnTarget)) {
			System.out.println("入库执行结果 => OK !");
		} else {
			System.out.println("入库执行结果不正确；继续DEBUG ：(");
			executeResult = false;
		}

		try {
			cnSource.close();
			cnTarget.close();
		} catch (SQLException e) {
			e.printStackTrace();
			executeResult = false;
		}
		return executeResult;
	}
}