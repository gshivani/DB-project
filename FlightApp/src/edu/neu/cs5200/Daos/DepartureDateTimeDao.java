package edu.neu.cs5200.Daos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.flight.DepartureDateTime;

public class DepartureDateTimeDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public DepartureDateTimeDao() {
		
		em = factory.createEntityManager();
	}
	
public DepartureDateTime createDepartureDateTime(DepartureDateTime departureDateTime){
		
		em.getTransaction().begin();
		em.persist(departureDateTime);
		em.getTransaction().commit();
		return departureDateTime;
	}

public List<DepartureDateTime> findByItineraryId(int itineraryId){
	
    List<DepartureDateTime> itinerary = new ArrayList<DepartureDateTime>();
	em.getTransaction().begin();
	Query q = em.createQuery("select d from DepartureDateTime d where d.itineraryId = :itineraryId");
	q.setParameter("itineraryId",itineraryId);
	itinerary = (List<DepartureDateTime>)q.getResultList();
    if(itinerary!=null)
	{
    	em.getTransaction().commit();
		return itinerary;
	}
    em.getTransaction().commit();
	return null;
}


	public static void main(String[] args) {
		DepartureDateTimeDao dao = new DepartureDateTimeDao();
		DepartureDateTime dt1 = new DepartureDateTime(1,"2014-12-06T07:00:00");
		DepartureDateTime dt2 = dao.createDepartureDateTime(dt1);
		

	}

}
