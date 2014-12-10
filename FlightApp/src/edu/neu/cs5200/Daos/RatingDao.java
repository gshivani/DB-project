package edu.neu.cs5200.Daos;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.flight.Rating;
import edu.neu.cs5200.flight.RatingPk;

public class RatingDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public RatingDao() {
		
		em = factory.createEntityManager();
	}
	
	public Rating createRating(Rating rating){
		
		em.getTransaction().begin();
		em.persist(rating);
		em.getTransaction().commit();
		return rating;
	}
	
	public double findAvgByAirlineCode(String airlineCode){
		
		double avgrating = 0.0;
		em.getTransaction().begin();
		Query q = em.createNamedQuery("Rating.findAvgByAirlineCode");
		q.setParameter("airlineCode",airlineCode);
		if(q.getSingleResult()==null)
		{	
			em.getTransaction().commit();
			return 0.0;
		}
		else
		{
		avgrating = (double) q.getSingleResult();
		em.getTransaction().commit();
		return avgrating;
		}
		
	}
	
	public Rating updateRating(String username, String airlineCode, String newrating){
		
		
		RatingPk ratingpk = new RatingPk();
		ratingpk.setUsername(username);
		ratingpk.setAirlineCode(airlineCode);
		Rating rating = em.find(Rating.class, ratingpk);
		em.getTransaction().begin();
		rating.setRating(newrating);
		em.merge(rating);
		em.getTransaction().commit();
		return rating;	
	}
	
public Rating findByUsernameAndAirlineCode(String username,String airlineCode){
		
	RatingPk ratingpk = new RatingPk();
	ratingpk.setUsername(username);
	ratingpk.setAirlineCode(airlineCode);

		em.getTransaction().begin();
		Rating rating = em.find(Rating.class, ratingpk);
		em.getTransaction().commit();
		return rating;
		
	}
	

	public static void main(String[] args) {
		
	//	RatingDao dao = new RatingDao();
	//	Rating r = new Rating("joy", "AA", "4");
	//	dao.createRating(r);
		
			
		

	}

}
