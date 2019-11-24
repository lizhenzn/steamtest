package utils;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;

public class DatabaseManager  {
private static String  URL="jdbc:mysql://localhost:3306/steam";
private static String  USER="root";
private static String  PSW="010233";
private  static Connection connection=null;
/*
public  static ResultSet show(String table) throws ClassNotFoundException, SQLException
{
	Statement stmt=null;
	stmt=connection.createStatement();
	String sql="SELECT * FROM "+table;
	ResultSet rest=stmt.executeQuery(sql);
	while(rest.next())
	{
		System.out.println( rest.getString(1)+"   "+rest.getString(2)+"     "+rest.getString(3)+"\n");
	}
	return rest;
}
*/
public  static void refresh(String sql) throws SQLException
{
		Statement stmt=null;
			stmt=connection.createStatement();
		stmt.executeUpdate(sql);
}
public  static void add(String sql) throws SQLException
{
	refresh(sql);
}
public static void delete(String sql) throws SQLException
{
	refresh(sql);
}
public static void update(String sql) throws SQLException
{
	refresh(sql);
}
public static ResultSet search(String sql) throws ClassNotFoundException, SQLException
{
	   Connection connection=null;
		Statement stmt=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection=DriverManager.getConnection(URL, USER, PSW);
			stmt=connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	//	String sql="SELECT * FROM "+table;
		ResultSet rest=null;
		if(stmt==null)
			return null;
		if(stmt.executeQuery(sql) != null)
	         rest=stmt.executeQuery(sql);
	return rest;
}

public Connection  getConnection()
{
	if(connection!=null)
	return connection;
	else
		return null;
}

public void closeConnection()
{
	try {
		connection.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

}
/*
set character_set_client=gbk;
set character_set_connection=utf8;
set character_set_results=gbk;
*/
