package edu.neu.cs5200.flight;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class User implements Serializable{
	
	@Id
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String dob;
	private String email;
	private String status;
	private int frequentfliermiles;
	
	public String getUsername() {
		return username;
	}

	public User(String username, String password, String firstname,
			String lastname, String dob, String email, String status,
			int frequentfliermiles) {
		super();
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.email = email;
		this.status = status;
		this.frequentfliermiles = frequentfliermiles;
	}

	public User() {
		super();
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getFrequentfliermiles() {
		return frequentfliermiles;
	}

	public void setFrequentfliermiles(int frequentfliermiles) {
		this.frequentfliermiles = frequentfliermiles;
	}

	
}
