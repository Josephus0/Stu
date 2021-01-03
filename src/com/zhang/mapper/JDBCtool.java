package com.zhang.mapper;
/*
 * JDBC的工具类

 * 获取connection
 * 释放C、S、R
 */

import java.sql.*;

public class JDBCtool {

	/*
	 *获取数据库Connection连接
	 */
	public static Connection getconnection() {
		Connection conn = null;
		try {
			//加载驱动
			Class.forName("com.mysql.cj.jdbc.Driver");
			//建立和数据库的连接
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/java_test?serverTimezone=GMT", "root", "1635552844");
			//conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	//释放PreparedStatement、Connection、ResultSet
	public static void close(PreparedStatement sta,Connection conn,ResultSet res) {
		if(res!=null) {
			try {
				res.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(sta!=null) {
			try {
				sta.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
	}

}

