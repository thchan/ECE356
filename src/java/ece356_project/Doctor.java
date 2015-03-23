
package ece356_project;

import java.util.Calendar;

public class Doctor{
    public String user_alias;
    public String d_alias;
    public String first_name;
    public String last_name;
    public String email_address;
    public String gender;
    public int license_year;
    public int average_rating;
    public int number_of_reviews;
    
    public Doctor(String user_alias, String d_alias, String first_name, String last_name, String email_address, String gender, int license_year, int average_rating, int number_of_reviews)
    {
	this.user_alias = user_alias;
        this.d_alias = d_alias;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email_address = email_address;
	this.gender = gender;
	this.license_year = Calendar.getInstance().get(Calendar.YEAR) - license_year;
        this.average_rating = average_rating;
        this.number_of_reviews = number_of_reviews;
    }
}
