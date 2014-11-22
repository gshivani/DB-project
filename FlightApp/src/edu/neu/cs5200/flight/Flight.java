package edu.neu.cs5200.flight;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Flight implements Serializable{
    
	@Id
	private int CarrierId;
	private String Name;
	
	public int getCarrierId() {
		return CarrierId;
	}

	public void setCarrierId(int carrierId) {
		CarrierId = carrierId;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public Flight(int carrierId, String name) {
		super();
		CarrierId = carrierId;
		Name = name;
	}

	public Flight() {
		super();
	}
	
	
}
