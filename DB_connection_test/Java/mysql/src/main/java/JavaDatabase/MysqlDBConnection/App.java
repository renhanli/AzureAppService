package JavaDatabase.MysqlDBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Retrive information from mysql DB!
 *
 */
public class App 
{
	
	private static Statement stmt;
	private static ResultSet results;
	
	public static void main(String[] args) {		
		if(args.length < 3) {
			System.out.println("Missing input arguments. Please provide your database URL, username and password.");
		}else {
			String url = args[0];
			String username = args[1];
			String password = args[2];
			
			String sql_select = "show databases";
			try{
				Connection conn = conn = DriverManager.getConnection(url, username, password);
				
				stmt = conn.createStatement();
				results = stmt.executeQuery(sql_select);
				
				while (results.next()) {
					 
					while(results.next())
			        {
			        	System.out.println(results.getString(1));
			        }
				 }
				
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}

	}

}
