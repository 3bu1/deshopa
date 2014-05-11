package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBase {
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/";
	String dbname= "deshoppa";
	String driver ="com.mysql.jdbc.Driver";
	String Username="root";
	String Password ="";
	public Connection getConnection(){
		try {
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url+dbname,Username,Password);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return con;
	}
}
