package edu.neu.cs5200.Daos;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.flight.FrequentFlierMiles;

public class FrequentFlierMilesDao {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
		EntityManager em = null;
		
		public FrequentFlierMilesDao() {
			em = factory.createEntityManager();
		}

		public FrequentFlierMiles createFFM(FrequentFlierMiles ffm)
		{
			em.getTransaction().begin();
			em.persist(ffm);
			em.getTransaction().commit();
			return ffm;
		}
		
		public FrequentFlierMiles findByUsername(String username)
		{
			FrequentFlierMiles ffm = null;
			em.getTransaction().begin();
			Query q = em.createNamedQuery("FrequentFlierMiles.findFfmByUsername");
			q.setParameter("username",username);
			ffm = (FrequentFlierMiles)q.getSingleResult();
		    if(ffm!=null)
			{
		    	em.getTransaction().commit();
				return ffm;
			}
		    em.getTransaction().commit();
			return null;
		}
		
		public FrequentFlierMiles updateFFM (int ffmId, int points)
		{
			FrequentFlierMiles ffm = null;
			ffm = em.find(FrequentFlierMiles.class, ffmId);
			em.getTransaction().begin();
			ffm.setPoints(points);
			em.merge(ffm);
			em.getTransaction().commit();
			return ffm;			
			
		}
		
		public void deleteFfm  (String username){
						
			em.getTransaction().begin();
			Query q = em.createNamedQuery("FrequentFlierMiles.findFfmByUsername");
			q.setParameter("username", username);
			FrequentFlierMiles ffm = (FrequentFlierMiles) q.getSingleResult();			
			em.remove(ffm);
			em.getTransaction().commit();
		}
		
		
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
