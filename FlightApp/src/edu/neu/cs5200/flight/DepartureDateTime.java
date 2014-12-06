package edu.neu.cs5200.flight;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DepartureDateTime {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int departureDateTimeId;
	private int itineraryId;
	private String DateTime;
	
	
	public DepartureDateTime() {
		super();
	}


	public DepartureDateTime(int itineraryId, String dateTime) {
		super();
		this.itineraryId = itineraryId;
		DateTime = dateTime;
	}


	public int getDepartureDateTimeId() {
		return departureDateTimeId;
	}


	public void setDepartureDateTimeId(int departureDateTimeId) {
		this.departureDateTimeId = departureDateTimeId;
	}


	public int getItineraryId() {
		return itineraryId;
	}


	public void setItineraryId(int itineraryId) {
		this.itineraryId = itineraryId;
	}


	public String getDateTime() {
		return DateTime;
	}


	public void setDateTime(String dateTime) {
		DateTime = dateTime;
	}


	

}
