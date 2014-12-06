package edu.neu.cs5200.flight;

import java.io.Serializable;

public class RatingPk implements Serializable{

	private String username;
	private String airlineCode;
	public RatingPk() {
		super();
	}
		
	@Override
	public boolean equals(Object obj){
		if(obj instanceof RatingPk){
			RatingPk ratingpk = (RatingPk)obj;
			
			if(!ratingpk.getUsername().equals(username)){
				return false;
			}
			
			if(!ratingpk.getAirlineCode().equals(airlineCode)){
				return false;
			}
			return true;
		}
		
		return false;
	}
	
	@Override
	public int hashCode(){
		return username.hashCode() + airlineCode.hashCode();
	}
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
	
	

}
