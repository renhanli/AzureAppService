package JavaDatabase.SQLserverConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class App {
	public static void main(String[] args) {
		if(args.length < 4) {
			System.out.println("Missing input arguments. Please provide your database connection URL, username, password and database name");
		}else {
			String url = args[0];
			String username = args[1];
			String password = args[2];
			String db = args[3];
			
			String connectionUrl = url + ";database="+db+";"+ "user="+username+";" + "password="+password+";"
	                        + "encrypt=true;"
	                        + "trustServerCertificate=false;"
	                        + "loginTimeout=30;";
			
			System.out.println("Going to use the following connection string test the connection to SQL server:");
			System.out.println(connectionUrl);
			
			try{
				Connection connection = DriverManager.getConnection(connectionUrl);
	        	System.out.println("Successfully connected to database.");
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
	}

}
