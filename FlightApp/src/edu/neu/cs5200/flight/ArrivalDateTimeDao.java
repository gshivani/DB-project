package edu.neu.cs5200.flight;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

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

public static void main(String[] args) {
}

}
