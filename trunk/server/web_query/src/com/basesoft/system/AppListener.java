package com.basesoft.system;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.basesoft.server.Server;

public class AppListener implements ServletContextListener {
	protected static Log logger = LogFactory.getLog(AppListener.class);

	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("系统根目录：" + sce.getServletContext().getRealPath(""));

//		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
//		DBUpgrade dbUpgrade = (DBUpgrade) context.getBean("dbUpgrade");
//		dbUpgrade.upgrade(Consts.ROOTPATH + "/WEB-INF/dbupgrade/");

		// String dataDir = Consts.ROOTPATH + "/WEB-INF/data/";
		// String dbName = "app";
		// int port = 9001;
		//
		// logger.error("启动数据库...");
		// Server server = new Server();
		// server.setDatabaseName(0, dbName);
		// server.setDatabasePath(0, dataDir + dbName);
		// server.setPort(port);
		// server.setSilent(true);
		// server.start();
		// logger.error("数据库启动完毕...");
		// try {
		// Thread.sleep(800);
		// } catch (InterruptedException e) {
		// }
		//
		// /*
		// * try {
		// *
		// Runtime.getRuntime().exec("V:/kingbase-4.1.5.0428-release-windows-i686/bin/kingbase.exe
		// * -Z -D V:/kingbase-4.1.5.0428-release-windows-i686/data"); } catch
		// * (IOException e) { logger.error("启动Kingbase失败...");
		// * e.printStackTrace(); }
		// */
		new Server(); 
	}

	public void contextDestroyed(ServletContextEvent sce) {
	}
}
