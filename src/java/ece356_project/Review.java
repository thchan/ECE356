package ece356_project;

public class Review {
    int review_id;
	String p_alias;
	String d_alias;
	int rating;
	Date date;
	String comments;
	
	public Review(int review_id, String p_alias, String d_alias, int rating, Date date, String comments)
	{
		this.review_id = review_id;
		this.p_alias = p_alias;
		this.d_alias = d_alias;
		this.rating = rating;
		this.date = date;
		this.comments = comments;
	}
	
	
}
