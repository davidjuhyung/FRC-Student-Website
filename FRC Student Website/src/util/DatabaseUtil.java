package util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DatabaseUtil {
	
	public static Connection getConnection() {

		try {
			
			String dbURL = "jdbc:mariadb://localhost:3306/courseevaluation";
		//	String dbURL = "jdbc:mariadb://localhost:3306/frcstud3_courseev";
			String dbID = "root";
		//	String dbID = "frcstud3_david";
			String dbPassword = "davidkim";
			
			Class.forName("org.mariadb.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}	

}
