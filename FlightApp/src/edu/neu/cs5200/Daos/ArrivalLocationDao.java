package edu.neu.cs5200.Daos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.flight.ArrivalLocation;

public class ArrivalLocationDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public ArrivalLocationDao() {
		
		em = factory.createEntityManager();
	}
	
   public ArrivalLocation createArrivalLocation(ArrivalLocation arrivalLocation){
		
		em.getTransaction().begin();
		em.persist(arrivalLocation);
		em.getTransaction().commit();
		return arrivalLocation;
	}
   
   
   public List<ArrivalLocation> findByItineraryId(int itineraryId){
		
	    List<ArrivalLocation> itinerary = new ArrayList<ArrivalLocation>();
		em.getTransaction().begin();
		Query q = em.createQuery("select a from ArrivalLocation a where a.itineraryId = :itineraryId");
		q.setParameter("itineraryId",itineraryId);
		itinerary = (List<ArrivalLocation>)q.getResultList();
	    if(itinerary!=null)
		{
	    	em.getTransaction().commit();
			return itinerary;
		}
	    em.getTransaction().commit();
		return null;
	}


	public static void main(String[] args) {
		ArrivalLocationDao dao = new ArrivalLocationDao();
		ArrivalLocation a1 = new ArrivalLocation(1,"LAX");
		ArrivalLocation a2 = dao.createArrivalLocation(a1);
		

	}

}
