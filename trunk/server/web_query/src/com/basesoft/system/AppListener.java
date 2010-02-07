package com.basesoft.system;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.basesoft.server.MainThread;

public class AppListener implements ServletContextListener {
	protected static Log logger = LogFactory.getLog(AppListener.class);

	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("系统根目录：" + sce.getServletContext().getRealPath(""));

		// WebApplicationContext context =
		// WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		// DBUpgrade dbUpgrade = (DBUpgrade) context.getBean("dbUpgrade");
		// dbUpgrade.upgrade(Consts.ROOTPATH + "/WEB-INF/dbupgrade/");

		Thread s = new MainThread();
		s.setDaemon(true);// 设置线程为后台线程，使tomcat重启的时候自动退出。
		s.start();
	}

	public void contextDestroyed(ServletContextEvent sce) {
	}
}
