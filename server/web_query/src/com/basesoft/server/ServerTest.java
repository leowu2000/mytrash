package com.basesoft.server;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class ServerTest {
	Connection cnSource, cnTarget;
	DbQuery dbq;
	DataCopy copy;
	DBUtil dbu;

	@Before
	public void setUp() throws Exception {
		dbq = new DbQuery("U:/myworkspace/ssgq/141030356.mdb");
		copy = new DataCopy();
		dbq.setMdbFileName("U:/myworkspace/ssgq/141030356.mdb");
		// cnSource用于连接初始化参数指出的Access文件；
		// cnTarget用于连接后台数据库
		cnSource = dbq
				.newConnection(
						"jdbc:odbc:MS Access Database;DBQ=U:/myworkspace/ssgq/141030356.mdb",
						"", "");
		cnTarget = dbq.newConnection(DefaultSetting.getUrl(), DefaultSetting
				.getUserName(), DefaultSetting.getPassword());

		dbu = new DBUtil(cnSource, cnTarget);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testConnection() {
		assertNotNull(cnSource);
		assertNotNull(cnTarget);
	}

	@Test
	public void testCopyPJ() {
		assertTrue(copy.copyPJ(cnSource, cnTarget));
		assertTrue(copy.copyOtherTables(cnSource, cnTarget));
		assertTrue(copy.copyReportTables(cnSource, cnTarget));
	}

//	@Test
	public void dataCount(){
//		for(int i=0;i<Consts.TABLES.length;i++){
//			System.out.println(Consts.TABLES[i]+":\t"+dbu.getCount(Consts.TABLES[i], false));
//		}

		for(int i=0;i<Consts.XQFL.length;i++){
			System.out.println("insert into TB_XQFL values('"+Consts.XQFL[i][0]+"','"+Consts.XQFL[i][1]+"','"+Consts.XQFL[i][2]+"');");
		}
	}
	
}
