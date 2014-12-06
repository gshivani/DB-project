package edu.neu.cs5200.flight;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Airline implements Serializable{
    
	@Id
	private String airLineCode;

	public String getAirLineCode() {
		return airLineCode;
	}

	public void setAirLineCode(String airLineCode) {
		this.airLineCode = airLineCode;
	}

	public Airline(String airLineCode) {
		super();
		this.airLineCode = airLineCode;
	}

	public Airline() {
		super();
	}
	
}
