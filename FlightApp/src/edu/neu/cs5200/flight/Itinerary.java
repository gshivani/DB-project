package edu.neu.cs5200.flight;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Inheritance(strategy=InheritanceType.JOINED)
public class Itinerary implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int itineraryId;
	private String airlineCode;
	private String airlineClass;
	
	public Itinerary(String airlineCode, String airlineClass) {
		super();
		this.airlineCode = airlineCode;
		this.airlineClass = airlineClass;
	}

	public Itinerary() {
		super();
	}

	public int getItineraryId() {
		return itineraryId;
	}

	public void setItineraryId(int itineraryId) {
		this.itineraryId = itineraryId;
	}

	public String getAirlineCode() {
		return airlineCode;
	}

	public void setAirlineCode(String airlineCode) {
		this.airlineCode = airlineCode;
	}

	public String getAirlineClass() {
		return airlineClass;
	}

	public void setAirlineClass(String airlineClass) {
		this.airlineClass = airlineClass;
	}
	
	

	
}
