package edu.neu.cs5200.flight;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Query;

@Entity
public class ArrivalLocation {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int arrivalLocationId;
	private int itineraryId;
	@Column(name="location")
	private String arrivalLocation;
	
	public ArrivalLocation() {
		super();
	}

	public ArrivalLocation(int itineraryId, String arrivalLocation) {
		super();
		this.itineraryId = itineraryId;
		this.arrivalLocation = arrivalLocation;
	}


	public int getArrivalLocationId() {
		return arrivalLocationId;
	}

	public void setArrivalLocationId(int arrivalLocationId) {
		this.arrivalLocationId = arrivalLocationId;
	}

	public int getItineraryId() {
		return itineraryId;
	}

	public void setItineraryId(int itineraryId) {
		this.itineraryId = itineraryId;
	}

	public String getArrivalLocation() {
		return arrivalLocation;
	}

	public void setArrivalLocation(String arrivalLocation) {
		this.arrivalLocation = arrivalLocation;
	}
	
	
}
