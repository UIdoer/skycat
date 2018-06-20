package com.skycat.db;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.skycat.base.BaseTest;

public class TestDB extends BaseTest {//mirror v1.1
	@Autowired
	DataSource dataSource;

	@Test
	public void test() {
		try {
			System.out.println(dataSource.getConnection());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
