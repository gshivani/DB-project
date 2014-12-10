package edu.neu.cs5200.flight;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ArrivalDateTimeDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public ArrivalDateTimeDao() {
		
		em = factory.createEntityManager();
	}
	
public ArrivalDateTime createArrivalDateTime(ArrivalDateTime arrivalDateTime){
		
		em.getTransaction().begin();
		em.persist(arrivalDateTime);
		em.getTransaction().commit();
		return arrivalDateTime;
	}

public List<ArrivalDateTime> findByItineraryId(int itineraryId){
	
    List<ArrivalDateTime> itinerary = new ArrayList<ArrivalDateTime>();
	em.getTransaction().begin();
	Query q = em.createQuery("select a from ArrivalDateTime a where a.itineraryId = :itineraryId");
	q.setParameter("itineraryId",itineraryId);
	itinerary = (List<ArrivalDateTime>)q.getResultList();
    if(itinerary!=null)
	{
    	em.getTransaction().commit();
		return itinerary;
	}
    em.getTransaction().commit();
	return null;
}


public static void main(String[] args) {
}

}
