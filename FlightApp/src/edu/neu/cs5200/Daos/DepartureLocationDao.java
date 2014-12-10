package edu.neu.cs5200.Daos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.flight.DepartureLocation;

public class DepartureLocationDao {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public DepartureLocationDao() {
		
		
		em = factory.createEntityManager();
	}
	
	public DepartureLocation createDepartureLocation(DepartureLocation departureLocation){
		
		em.getTransaction().begin();
		em.persist(departureLocation);
		em.getTransaction().commit();
		return departureLocation;
	}
	
public List<DepartureLocation> findByItineraryId(int itineraryId){
		
	    List<DepartureLocation> itinerary = new ArrayList<DepartureLocation>();
		em.getTransaction().begin();
		Query q = em.createQuery("select d from DepartureLocation d where d.itineraryId = :itineraryId");
		q.setParameter("itineraryId",itineraryId);
		itinerary = (List<DepartureLocation>)q.getResultList();
	    if(itinerary!=null)
		{
	    	em.getTransaction().commit();
			return itinerary;
		}
	    em.getTransaction().commit();
		return null;
	}
	

	public static void main(String[] args) {

	//	DepartureLocationDao dao = new DepartureLocationDao();
	//	DepartureLocation d1 = new DepartureLocation(1,"BOS");
	//	DepartureLocation d2 = dao.createDepartureLocation(d1);
		

	}

}
