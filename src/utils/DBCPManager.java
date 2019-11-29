package utils;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSourceFactory;

public class DBCPManager implements Serializable {
	private DBCPManager(){}
	static boolean IsInitialized=false;
	static private DataSource ds;
	static private void initialize() {
		Properties p=new Properties();
		try {
			p.load(DBCPManager.class.getClassLoader().getResourceAsStream("dbcp.properties"));
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
		try {
			ds=BasicDataSourceFactory.createDataSource(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	static public Connection getConn() {
		if(!IsInitialized) {initialize();IsInitialized=true;}
		try {
			if(ds==null)System.out.println("ds null!");
			return ds.getConnection();
		} catch (SQLException e) {
			System.out.println("get conn error\n");
			e.printStackTrace();
			return null;
		}
	}
	
}
