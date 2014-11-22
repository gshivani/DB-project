package edu.neu.cs5200.flight;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class FlightDao {

	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	
	public FlightDao() {
		em = factory.createEntityManager();
	}

	
	public Flight createFlight(Flight flight)
	{
		em.getTransaction().begin();
		em.persist(flight);
		em.getTransaction().commit();
		return flight;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
