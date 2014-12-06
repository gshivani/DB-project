package edu.neu.cs5200.flight;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class AirlineDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	
	public AirlineDao() {
		em = factory.createEntityManager();
	}
	
	
	public Airline createFlight(Airline airline)
	{
		em.getTransaction().begin();
		em.persist(airline);
		em.getTransaction().commit();
		return airline;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
