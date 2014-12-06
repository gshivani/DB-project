package edu.neu.cs5200.flight;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

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

	public static void main(String[] args) {

	//	DepartureLocationDao dao = new DepartureLocationDao();
	//	DepartureLocation d1 = new DepartureLocation(1,"BOS");
	//	DepartureLocation d2 = dao.createDepartureLocation(d1);
		

	}

}
