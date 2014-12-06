package edu.neu.cs5200.flight;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Passenger {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int passengerId;
	private int bookingId;
	private String firstName;
	private String lastName;
	private String passport;
	private String gender;
	private String age;
	
	public int getPassengerId() {
		return passengerId;
	}
	public void setPassengerId(int passengerId) {
		this.passengerId = passengerId;
	}
	public int getBookingId() {
		return bookingId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPassport() {
		return passport;
	}
	public void setPassport(String passport) {
		this.passport = passport;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Passenger(int bookingId, String firstName, String lastName,
			String passport, String gender,String age) {
		super();
		this.bookingId = bookingId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.passport = passport;
		this.gender = gender;
		this.age = age;
	}
	public Passenger() {
		super();
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	

}
