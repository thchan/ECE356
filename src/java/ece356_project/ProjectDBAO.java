package ece356_project;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.*;
import javax.sql.DataSource;

public class ProjectDBAO {

    public static final String url = "jdbc:mysql://eceweb.uwaterloo.ca:3306/";
    public static final String user = "user_stmaraj";
    public static final String pwd = "user_stmaraj";
    
	public static Connection getConnection()
		throws ClassNotFoundException, SQLException{
                
                Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pwd);
        Statement stmt = null;
        try {
            con.createStatement();
            stmt = con.createStatement();
            stmt.execute("USE ece356db_stmaraj;");
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
        return con;
	}
	

	public static ArrayList<Patient> searchPatients(String user_alias, String province, String city)
            throws ClassNotFoundException, SQLException{
		
            Connection con = null;
            PreparedStatement pstmt = null;
            ArrayList<Patient> ret = null;
            
            try{
                con = getConnection();
                
                /* Build SQL query */
                String query = "SELECT user_alias,PatientData.p_alias, home_address_province, home_address_city, email_address , count(distinct review_id), max(date) ";
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
                     ret.add(e);
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
        
        
        public static ArrayList<Doctor> searchDoctors(String first_name, String last_name, String address, String gender, int licence_year, String comments, int rating)
            throws ClassNotFoundException, SQLException{
		
            Connection con = null;
            PreparedStatement pstmt = null;
            ArrayList<Doctor> ret = null;
            
            try{
                con = getConnection();
                
                /* Build SQL query */
                String query = "SELECT user_alias,d_alias, first_name ,last_name, gender, AVG(rating) , COUNT(distinct review_id), (YEAR(curdate()) - license_year) AS number_of_years_licensed, ";
                query += "(CASE  WHEN d_alias IN\n" +
                         "(SELECT d_alias FROM\n" +
                         "((SELECT d_alias\n" +
                         "FROM Review\n" +
                         "WHERE p_alias IN (\n" +
                         "    (SELECT p_alias_a\n" +
                         "    FROM Friend INNER JOIN PatientData\n" +
                         "    ON (PatientData.p_alias = Friend.p_alias_a ) \n" +
                         "    WHERE Friend.p_alias_b = \"?(current_user_alias)\" AND flag = TRUE)\n" +
                         "))\n" +
                         "UNION  \n" +
                         "(SELECT d_alias\n" +
                         "FROM Review\n" +
                         "WHERE p_alias IN (\n" +
                         "    (SELECT p_alias_b\n" +
                         "    FROM Friend INNER JOIN PatientData\n" +
                         "    ON (PatientData.p_alias = Friend.p_alias_b ) \n" +
                         "    WHERE Friend.p_alias_a = \"?(current_user_alias)\" AND flag = TRUE)\n" +
                         "))) AS temp)\n" +
                         "         THEN TRUE ELSE FALSE END \n" +
                         ") AS friend_reviewed";
                query += " FROM DoctorData NATURAL JOIN Review";
                query += " WHERE TRUE ";
                
                if (first_name.length() != 0){
                    query += " AND first_name like %?%";
                }
                
                if (last_name.length() != 0){
                    query += " AND last_name like %?%";
                }
                
                if (gender.length() != 0){
                    query += " AND gender = ?";
                }
                
                if (licence_year != -1){
                    query += " AND (YEAR(curdate()) - license_year) > ?";
                }
                
                if (comments.length() != 0){
                    query += " AND LCASE(comments) like LCASE('%?%')";
                }
                
                query += " GROUP BY (d_alias)";
                
                if (rating != -1){
                    query += " HAVING (AVG(rating) > ?";
                }
                
                pstmt = con.prepareStatement(query);
                
                int num = 0;
                if (first_name.length() != 0){
                    pstmt.setString(++num, first_name);
                }
                
                if (last_name.length() != 0){
                    pstmt.setString(++num, last_name);
                }
                
                if (gender.length() != 0){
                    pstmt.setString(++num, gender);
                }
                
                if (licence_year != -1){
                    pstmt.setInt(++num, licence_year);
                }
                
                if (comments.length() != 0){
                    pstmt.setString(++num, comments);
                }
                
                query += " GROUP BY (d_alias)";
                
                if (rating != -1){
                    pstmt.setInt(++num, rating);
                }
                
                 ResultSet resultSet;
                 resultSet = pstmt.executeQuery();
                 
                 ret = new ArrayList<Doctor>();
                 while (resultSet.next()){
                     Doctor e = new Doctor(
                             resultSet.getString("user_alias"),
                             resultSet.getString("DoctorData.d_alias"),
                             resultSet.getString("first_name"),
                             resultSet.getString("last_name"),
                             resultSet.getString("gender"),
                             resultSet.getString("email_address"),
                             resultSet.getInt("AVG(rating)"),
                             resultSet.getInt("COUNT(distinct review_id)"),
                             resultSet.getInt("number_of_years_licensed"),
                             resultSet.getBoolean("friend_reviewed"));
                     ret.add(e);
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
        
        
        public static Doctor getDoctorProfile(String d_alias)
            throws ClassNotFoundException, SQLException{
		
            Connection con = null;
            PreparedStatement pstmt = null;
            Doctor ret = null;
            
            try{
                con = getConnection();
                
                /* Build SQL query */
                String query = "SELECT user_alias, first_name ,last_name, email_address, gender, AVG(rating) , COUNT(distinct review_id), (YEAR(curdate()) - license_year) AS number_of_years_licensed ";
                query += " FROM DoctorData NATURAL JOIN Review";
                query += " WHERE d_alias = ? ";
                
                pstmt = con.prepareStatement(query);
                
                pstmt.setString(1, d_alias);
                
                 ResultSet resultSet;
                 resultSet = pstmt.executeQuery();
                 
                ret =  new Doctor(
                             resultSet.getString("user_alias"),
                             d_alias,
                             resultSet.getString("first_name"),
                             resultSet.getString("last_name"),
                             resultSet.getString("gender"),
                             resultSet.getString("email_address"),
                             resultSet.getInt("AVG(rating)"),
                             resultSet.getInt("COUNT(distinct review_id)"),
                             resultSet.getInt("number_of_years_licensed"),
                             false);
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
        
        public static ArrayList<Specialization> getSpecializations(String d_alias)
            throws ClassNotFoundException, SQLException {
		
            Connection con = null;
            PreparedStatement pstmt = null;
            ArrayList<Specialization> ret = null;
            
            try{
                con = getConnection();
                
                /* Build SQL query */
                String query = "SELECT spec_id,spec_name ";
                query += " FROM Specialization";
                query += " WHERE spec_id in (SELECT spec_id FROM SpecializesIn WHERE d_alias = ?) ";
                
                pstmt = con.prepareStatement(query);
                
                pstmt.setString(1, d_alias);
                
                 ResultSet resultSet;
                 resultSet = pstmt.executeQuery();
                 
                 ret = new ArrayList<Specialization>();
                 while (resultSet.next()){
                     Specialization e = new Specialization(
                             resultSet.getInt("spec_id"),
                             resultSet.getString("spec_name"));
;
                     ret.add(e);
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
		
	

