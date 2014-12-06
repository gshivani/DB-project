package edu.neu.cs5200.flight;

import java.util.List;

public class DisplayFlight {

	 List<String> departureLocationCode = null;
	 List<String> arrivalLocationCode = null;
	 List<String> departureDateTime = null;
	 List<String> arrivalDateTime = null;
	 List<Integer> flightNumber;
	 List<String> airlineCode = null;
	 double amount;
	 
	 public DisplayFlight(List<String> departureLocationCode,
			List<String> arrivalLocationCode, List<String> departureDateTime,
			List<String> arrivalDateTime, List<Integer> flightNumber,
			List<String> airlineCode, double amount) {
		super();
		this.departureLocationCode = departureLocationCode;
		this.arrivalLocationCode = arrivalLocationCode;
		this.departureDateTime = departureDateTime;
		this.arrivalDateTime = arrivalDateTime;
		this.flightNumber = flightNumber;
		this.airlineCode = airlineCode;
		this.amount = amount;
	}

	public DisplayFlight() {
		super();
	}

	public List<String> getDepartureLocationCode() {
		return departureLocationCode;
	}

	public void setDepartureLocationCode(List<String> departureLocationCode) {
		this.departureLocationCode = departureLocationCode;
	}

	public List<String> getArrivalLocationCode() {
		return arrivalLocationCode;
	}

	public void setArrivalLocationCode(List<String> arrivalLocationCode) {
		this.arrivalLocationCode = arrivalLocationCode;
	}

	public List<String> getDepartureDateTime() {
		return departureDateTime;
	}

	public void setDepartureDateTime(List<String> departureDateTime) {
		this.departureDateTime = departureDateTime;
	}

	public List<String> getArrivalDateTime() {
		return arrivalDateTime;
	}

	public void setArrivalDateTime(List<String> arrivalDateTime) {
		this.arrivalDateTime = arrivalDateTime;
	}

	public List<Integer> getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(List<Integer> flightNumber) {
		this.flightNumber = flightNumber;
	}

	public List<String> getAirlineCode() {
		return airlineCode;
	}

	public void setAirlineCode(List<String> airlineCode) {
		this.airlineCode = airlineCode;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}


		
}
