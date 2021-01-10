package com.er.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	
	private static final String DRIVER = "org.mariadb.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/project";
	
	private static final String USER = "root";
	private static final String PASSWORD = "123456";
	
	@Test
	public void testConnection() throws Exception {
		
		Class.forName(DRIVER);
		
		try(Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
			
			System.out.println(conn);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
	
	
}
