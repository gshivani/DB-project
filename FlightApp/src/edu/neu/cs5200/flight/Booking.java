package edu.neu.cs5200.flight;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({	@NamedQuery(name="Booking.findByUsername", query="select b from Booking b where b.username = :username"),
	@NamedQuery(name="Booking.findAll", query="select b from Booking b")})
public class Booking {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int bookingId;
	private String username;
	private int numberOfTickets;
	private String bookingdate;
	private double totalprice;
	private String ffmstatus;
	private int itineraryId;
	private String airLineCode;
	private String airLineclass;
	
	public Booking() {
		super();
	}

	public Booking(String username, int numberOfTickets, String bookingdate,
			double totalprice,String ffmstatus, int itineraryId,
			String airLineCode, String airLineclass) {
		super();
		this.username = username;
		this.numberOfTickets = numberOfTickets;
		this.bookingdate = bookingdate;
		this.totalprice = totalprice;
		this.ffmstatus = ffmstatus;
		this.itineraryId = itineraryId;
		this.airLineCode = airLineCode;
		this.airLineclass = airLineclass;
	}

	public int getBookingId() {
		return bookingId;
	}


	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public int getNumberOfTickets() {
		return numberOfTickets;
	}


	public void setNumberOfTickets(int numberOfTickets) {
		this.numberOfTickets = numberOfTickets;
	}


	public String getBookingdate() {
		return bookingdate;
	}


	public void setBookingdate(String bookingdate) {
		this.bookingdate = bookingdate;
	}


	public double getTotalprice() {
		return totalprice;
	}


	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}


	public String getFfmstatus() {
		return ffmstatus;
	}


	public void setFfmstatus(String ffmstatus) {
		this.ffmstatus = ffmstatus;
	}


	public String getAirLineCode() {
		return airLineCode;
	}


	public void setAirLineCode(String airLineCode) {
		this.airLineCode = airLineCode;
	}


	public String getAirLineclass() {
		return airLineclass;
	}


	public void setAirLineclass(String airLineclass) {
		this.airLineclass = airLineclass;
	}

	public int getItineraryId() {
		return itineraryId;
	}

	public void setItineraryId(int itineraryId) {
		this.itineraryId = itineraryId;
	}


	



}
