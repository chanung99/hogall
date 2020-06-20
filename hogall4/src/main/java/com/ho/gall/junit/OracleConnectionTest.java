package com.ho.gall.junit;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class OracleConnectionTest {
	private static final Logger Logger = LoggerFactory.getLogger(OracleConnectionTest.class);
	private static final String DRIVER = "org.mariadb.jdbc.Driver";
	private static final String URL = "jdbc:mariadb://localhost:3360/test";/*"jdbc:mariadb://localhost/ckrgksejdro";*/
	private static final String USER = "root";
	private static final String PW = "maria";
	/*private static final String USER = "ckrgksejdro";
	private static final String PW = "z!1535542z";*/
	@Test //JUnit이 테스트하는 코드
	public void testConnection() throws Exception {
	        Class.forName("org.mariadb.jdbc.Driver");
	        try(Connection conn= DriverManager.getConnection("jdbc:mariadb://localhost:3360/test", "root", "maria")) {
//	                Logger.info("오라클에 연결되었습니다.");
	        }catch(Exception e) {
	                e.printStackTrace();
	        }
	}
}
