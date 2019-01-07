package edu.spring.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DBTest {

	@Test
	public void test() throws Exception {
		Connection conn = DriverManager.getConnection("jdbc:mysql://54.180.90.44:3306/project", "scott", "tiger");
		System.out.println(conn);
	}
}
