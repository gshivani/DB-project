package edu.neu.cs5200.Daos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.flight.Passenger;

public class PassengerDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public PassengerDao() {
		em = factory.createEntityManager();
	}
	
	public Passenger createPassenger(Passenger passenger)
	{
		em.getTransaction().begin();
		em.persist(passenger);
		em.getTransaction().commit();
		return passenger;
	}
	
	public List<Passenger> findAllPassenger(int bookingId){
		
		List<Passenger> passenger = new ArrayList<Passenger>();
		em.getTransaction().begin();
		Query q = em.createQuery("select p from Passenger p where p.bookingId = :bookingId");
		q.setParameter("bookingId",bookingId);
		passenger = (List<Passenger>)q.getResultList();
	    if(passenger!=null)
		{
	    	em.getTransaction().commit();
			return passenger;
		}
	    em.getTransaction().commit();
		return null;
		
	}

}
