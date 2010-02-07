package com.basesoft.server;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

public class DBUtil {
	Connection cnSource, cnTarget;
	JdbcTemplate jt1, jt2;

	public DBUtil(Connection cnSource, Connection cnTarget) {
		this.cnSource = cnSource;
		this.cnTarget = cnTarget;
		this.jt1 = new JdbcTemplate(new SingleConnectionDataSource(cnSource, false));
		this.jt2 = new JdbcTemplate(new SingleConnectionDataSource(cnTarget, false));
	}

	public boolean copyTable(final String table, final int pkIndex) {
		jt1.query("select * from " + table, new RowMapper() {
			public Object mapRow(final ResultSet rs, int rowNum) throws SQLException {
				ResultSetMetaData meta = rs.getMetaData();
				final int cols = meta.getColumnCount();
				String fields = "";
				String params = "";
				for (int i = 0; i < cols; i++) {
					fields += meta.getColumnName(i + 1) + ",";
					params += "?,";
				}
				String sql = "insert into " + table + " (" + fields.substring(0, fields.length() - 1) + ") values ("
						+ params.substring(0, params.length() - 1) + ")";
				jt2.execute(sql, new PreparedStatementCallback() {

					public Object doInPreparedStatement(PreparedStatement pStat) throws SQLException,
							DataAccessException {
						for (int i = 1; i <= cols; i++) {
							pStat.setObject(i, rs.getObject(i));
						}
						if (pkIndex > 0)
							pStat.setObject(pkIndex, getSequence(table));
						pStat.execute();
						return null;
					}
				});
				return null;
			}
		});

		return true;
	}

	private Object getSequence(String table) {
		Integer cur = jt2.queryForInt("select max(nextvalue) from tb_sequence where tablename='" + table + "'");
		if (cur == null || cur < 1) {
			jt2.execute("insert into tb_sequence values('" + table + "',1001)");
			return 1001;
		} else
			jt2.execute("update tb_sequence set nextvalue=" + (cur + 1) + " where tablename='" + table + "'");
		return cur + 1;
	}

	public int copyTableDataAll(String fromTable, String toTable, String[] field, String[] fieldType, String key,
			int keyBeginValue) throws Exception {
		// 参数：来自表 复制到表 字段名数组 字段类型数组 关键字(不在字段名数组) 关键字起始值
		Statement sta1 = cnSource.createStatement();
		Statement sta2 = cnTarget.createStatement();
		ResultSet resultFrom = null;
		int sum = 0;
		String tempKey = "id"; // 自动主键
		String createTableSQL = null;
		if (key == null)
			createTableSQL = "CREATE TABLE " + toTable + " ( " + tempKey + " bigint primary key"; // 创建表sql语句
		else
			createTableSQL = "CREATE TABLE " + toTable + " ( " + key + " bigint primary key";
		String selectFromTable = null; // 读取表sql语句
		String insertToSQL = "INSERT INTO " + toTable + "(";
		String insertToSQLHead = null;

		if (field == null || fieldType == null) {
			resultFrom = sta2.executeQuery("SELECT * FROM " + fromTable);
			ResultSetMetaData meta = resultFrom.getMetaData();
			int sumField = meta.getColumnCount();
			field = new String[sumField];
			for (int k = 0; k < sumField; k++) {
				createTableSQL = createTableSQL + "," + meta.getColumnName(k) + " " + meta.getColumnType(k);
				insertToSQL = insertToSQL + "," + meta.getColumnName(k);
				field[k] = meta.getColumnName(k);
			}
		} else {
			selectFromTable = "SELECT " + field[0]; // 读取表sql语句

			for (int j = 1; j < field.length; j++)
				selectFromTable = selectFromTable + "," + field[j];
			if (key != null)
				selectFromTable = selectFromTable + "," + key + " FROM " + fromTable;
			resultFrom = sta2.executeQuery(selectFromTable);

			for (int i = 0; i < field.length; i++) {
				createTableSQL = createTableSQL + "," + field[i] + " " + fieldType[i];
				insertToSQL = insertToSQL + field[i] + ",";
			}

		}
		createTableSQL = createTableSQL + ")";
		if (key == null)
			insertToSQL = insertToSQL + tempKey + ") ";
		else
			insertToSQL = insertToSQL + key + ") ";

		if (sta1.execute(createTableSQL))
			System.out.println("创建表失败，请检查字段:" + createTableSQL);
		insertToSQLHead = insertToSQL;
		while (resultFrom.next()) {
			insertToSQL = insertToSQLHead + " VALUES(";
			for (int x = 0; x < field.length; x++) {
				insertToSQL = insertToSQL + "'" + resultFrom.getString(field[x]) + "',";
			}
			if (key == null)
				insertToSQL = insertToSQL + (keyBeginValue++) + ")";
			else
				insertToSQL = insertToSQL + resultFrom.getString(key) + ")";
			if (sta1.executeUpdate(insertToSQL) != 0)
				sum++;
			insertToSQL = null;
		}
		cnTarget.commit();
		cnSource.commit();
		sta1.close();
		sta2.close();
		return sum;
	}

}
