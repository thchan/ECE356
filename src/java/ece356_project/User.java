package ece356_project;

public class User {
    String user_alias;
    String first_name;
    String last_name;
    String email_address;
    String password_hash;
    String password_salt;
	
    public User (String user_alias, String first_name, String last_name, String email_address, String password_hash, String password_salt)
    {
        this.user_alias = user_alias;
	this.first_name = first_name;
	this.last_name = last_name;
	this.email_address = email_address;
	this.password_hash = password_hash;
	this.password_salt = password_salt;
    }
}
