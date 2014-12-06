package edu.neu.cs5200.flight;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

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
   
   


	public static void main(String[] args) {
		ArrivalLocationDao dao = new ArrivalLocationDao();
		ArrivalLocation a1 = new ArrivalLocation(1,"LAX");
		ArrivalLocation a2 = dao.createArrivalLocation(a1);
		

	}

}
