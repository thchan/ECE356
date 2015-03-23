package ece356_project;

import java.sql.Date;

public class Patient{
    public String user_alias;
    public String p_alias;
    public String home_address_province;
    public String home_address_city;
    public String email;
    public int number_of_reviews;
    public Date last_review_date;
	
	public Patient(String user_alias, String p_alias, String home_address_province, String home_address_city, String email, int number_of_reviews, Date last_review_date){
            this.user_alias = user_alias;
            this.p_alias = p_alias;
            this.home_address_province = home_address_province;
            this.home_address_city = home_address_city;
            this.email = email;
            this.number_of_reviews = number_of_reviews;
            this.last_review_date = last_review_date;
	}
}
