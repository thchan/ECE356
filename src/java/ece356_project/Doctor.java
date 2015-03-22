
package ece356_project;

public class Doctor extends User{
    String d_alias;
	String gender;
	int license_year;
	
	public Doctor(String user_alias, String first_name, String last_name, String email_address, String password_hash, String password_salt,String d_alias, String gender, int license_year)
	{
		super(user_alias, first_name, last_name, email_address, password_hash, password_salt);
		this.d_alias = d_alias;
		this.gender = gender;
		this.license_year = license_year;
	}
}
