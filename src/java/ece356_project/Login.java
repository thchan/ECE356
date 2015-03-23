
package ece356_project;


public class Login{
    public String user_alias;
    public String other_alias;
    public String password;
    public String salt;
    public boolean is_Patient;
    
    public Login(String user_alias, String other_alias, String password, String salt, boolean is_Patient)
    {
	this.user_alias = user_alias;
        this.other_alias = other_alias;
        this.salt = salt;
        this.password = password;
        this.is_Patient = is_Patient;
    }
}
