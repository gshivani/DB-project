package edu.neu.cs5200.flight;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ItineraryDao {

	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public ItineraryDao() {
		
		em = factory.createEntityManager();
	}

	public Itinerary createItinerary(Itinerary itinerary)
	{
		em.getTransaction().begin();
		em.persist(itinerary);
		em.getTransaction().commit();
		return itinerary;
	}
	
	public Itinerary findByBookingId(int itineraryId)
	{
		Itinerary itinerary = null;
		em.getTransaction().begin();
		itinerary= em.find(Itinerary.class, itineraryId);
		if(itinerary!=null)
		{
			em.getTransaction().commit();
			return itinerary;
			
		}
		em.getTransaction().commit();
		return null;
		
	}
	
	
	public void removeItineraryById(int itineraryId) {
		em.getTransaction().begin();
		Itinerary itinerary = em.find(Itinerary.class, itineraryId);
		em.remove(itinerary);
		em.getTransaction().commit();
	}
	
	
	public static void main(String[] args) {
		
		//ItineraryDao dao = new ItineraryDao();
		//Itinerary i = new Itinerary("AA", "First Class", "BOS");
		//dao.createItinerary(i);
		

	}

}
