package edu.neu.cs5200.flight;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ArrivalDateTime {

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int arrivalDateTimeId;
	private int itineraryId;
	private String DateTime;
	public int getArrivalDateTimeId() {
		return arrivalDateTimeId;
	}
	public void setArrivalDateTimeId(int arrivalDateTimeId) {
		this.arrivalDateTimeId = arrivalDateTimeId;
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
	public ArrivalDateTime() {
		super();
	}
	public ArrivalDateTime(int itineraryId, String dateTime) {
		super();
		this.itineraryId = itineraryId;
		DateTime = dateTime;
	}
	
	

}
