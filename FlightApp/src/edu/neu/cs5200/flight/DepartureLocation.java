package edu.neu.cs5200.flight;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DepartureLocation implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int departureLocationId;
	private int itineraryId;
	@Column(name="location")
	private String departureLocation;
	public int getDepartureLocationId() {
		return departureLocationId;
	}
	public void setDepartureLocationId(int departureLocationId) {
		this.departureLocationId = departureLocationId;
	}
	public int getItineraryId() {
		return itineraryId;
	}
	public void setItineraryId(int itineraryId) {
		this.itineraryId = itineraryId;
	}
	public String getDepartureLocation() {
		return departureLocation;
	}
	public void setDepartureLocation(String departureLocation) {
		this.departureLocation = departureLocation;
	}
	public DepartureLocation() {
		super();
	}
	public DepartureLocation(int departureLocationId, int itineraryId,
			String departureLocation) {
		super();
		this.departureLocationId = departureLocationId;
		this.itineraryId = itineraryId;
		this.departureLocation = departureLocation;
	}
	public DepartureLocation(int itineraryId, String departureLocation) {
		super();
		this.itineraryId = itineraryId;
		this.departureLocation = departureLocation;
	}
	
	
	
	

}
