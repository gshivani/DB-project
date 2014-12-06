package edu.neu.cs5200.flight;

import java.io.Serializable;

import javax.persistence.Id;

public class CommentPk implements Serializable{

	private String username;
	private String airlineCode;
	
	public CommentPk() {
		super();
	}
	
	@Override
	public boolean equals(Object obj){
		if(obj instanceof CommentPk){
			CommentPk commentpk = (CommentPk)obj;
			
			if(!commentpk.getUsername().equals(username)){
				return false;
			}
			
			if(!commentpk.getAirlineCode().equals(airlineCode)){
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
