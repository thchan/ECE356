package ece356_project;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.*;
import javax.sql.DataSource;

public class ProjectDBAO {

	public static Connection getConnection()
		throws ClassNotFoundException, SQLException, NamingException {
                
                Connection con = null;
            
                try {
                    InitialContext cxt = new InitialContext();
                
                    if (cxt == null){
			throw new RuntimeException("Unable to create naming context!");
                    }	
                   
                    Context dbContext = (Context)cxt.lookup("java:comp/env");
                    DataSource ds = (DataSource)dbContext.lookup("jdbc/myDatasource");
		
                    if (ds == null){
                      throw new RuntimeException("Data source not found");
                    }
                    
                    con = ds.getConnection();
        
                } finally {}
                
            return con;
	}
	

	public static ArrayList<Patient> searchPatients(String user_alias, String province, String city)
            throws ClassNotFoundException, SQLException, NamingException {
		
            Connection con = null;
            PreparedStatement pstmt = null;
            ArrayList<Patient> ret = null;
            
            try{
                con = getConnection();
                
                /* Build SQL query */
                String query = "SELECT user_alias,PatientData.p_alias, home_address, home_address_city, email_address , count(distinct review_id), max(date) ";
                query += "FROM PatientData LEFT OUTER JOIN Review ";
                query += "ON (PatientData.p_alias = Review.p_alias) ";
                query += "WHERE TRUE ";
                
                if (user_alias.length() != 0){
                    query += " AND user_alias = ?";
                }
                
                if (province.length() != 0){
                    query += " AND home_address_province = ?";
                }
                
                 if (city.length() != 0){
                    query += " AND home_address_city = ?";
                }
                
                query += " GROUP BY (p_alias)";
                
                pstmt = con.prepareStatement(query);
                
                int num = 0;
                if (user_alias.length() != 0){
                    pstmt.setString(++num, user_alias);
                }
                
                if (province.length() != 0){
                    pstmt.setString(++num, province);
                }
                
                 if (city.length() != 0){
                    pstmt.setString(++num, city);
                }
                
                 ResultSet resultSet;
                 resultSet = pstmt.executeQuery();
                 
                 ret = new ArrayList<Patient>();
                 while (resultSet.next()){
                     Patient e = new Patient(
                             resultSet.getString("user_alias"),
                             resultSet.getString("PatientData.p_alias"),
                             resultSet.getString("home_address_province"),
                             resultSet.getString("home_address_city"),
                             resultSet.getString("email_address"),
                             resultSet.getInt("count(distinct review_id)"),
                             resultSet.getDate("max(date)"));
                }
                 
                return ret;
            } finally {
                if (pstmt != null) {
                    pstmt.close();
                }
                    
                if (con != null) {
                    con.close();
                }
            }
        }
}
		
	

