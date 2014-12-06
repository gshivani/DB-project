package edu.neu.cs5200.flight;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;


@Entity
@IdClass(value=RatingPk.class)
@NamedQueries({	@NamedQuery(name="Rating.findAvgByAirlineCode", query="select AVG(r.rating) from Rating r where r.airlineCode = :airlineCode")})
public class Rating {
	
	@Id
	private String username;
	@Id
	private String airlineCode;
	private String rating;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAirlineCode() {
		return airlineCode;
	}
	public void setAirlineCode(String airlineCode) {
		this.airlineCode = airlineCode;
	}
	
	
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public Rating(String username, String airlineCode, String rating) {
		super();
		this.username = username;
		this.airlineCode = airlineCode;
		this.rating = rating;
	}
	public Rating() {
		super();
	}
	

	

}
