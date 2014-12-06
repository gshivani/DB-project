package edu.neu.cs5200.flight;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

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

	public static void main(String[] args) {
		DepartureDateTimeDao dao = new DepartureDateTimeDao();
		DepartureDateTime dt1 = new DepartureDateTime(1,"2014-12-06T07:00:00");
		DepartureDateTime dt2 = dao.createDepartureDateTime(dt1);
		

	}

}
