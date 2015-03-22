package ece356_project;

public class Patient extends User{
    String p_alias;
	String home_address_province;
	String home_address_city;
	
	public Patient(String user_alias, String first_name, String last_name, String email_address, String password_hash, String password_salt, String p_alias, String home_address_province, String home_address_city)
	{
		super(user_alias ,first_name, last_name, email_address, password_hash, password_salt);
		this.p_alias = p_alias;
		this.home_address_province = home_address_province;
		this.home_address_city = home_address_city;
	}
}
