package edu.neu.cs5200.flight;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class BookingDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public BookingDao() {
		em = factory.createEntityManager();
	}
	
	public Booking createBooking(Booking booking)
	{
		em.getTransaction().begin();
		em.persist(booking);
		em.getTransaction().commit();
		return booking;
	}

	public Booking findByBookingId(int bookingId)
	{
		Booking booking = null;
		em.getTransaction().begin();
	    booking= em.find(Booking.class, bookingId);
		if(booking!=null)
		{
			em.getTransaction().commit();
			return booking;
			
		}
		em.getTransaction().commit();
		return null;
		
	}
	
	public List<Booking> findByAirlineCodeUsername(String username)
	{
		List<Booking> booking = new ArrayList<Booking>();
		em.getTransaction().begin();
		Query q = em.createQuery("select distinct b from Booking b where b.username = :username");
		q.setParameter("username",username);
		booking = (List<Booking>)q.getResultList();
	    if(booking!=null)
		{
	    	em.getTransaction().commit();
			return booking;
		}
	    em.getTransaction().commit();
		return null;
	}
	
	public List<Booking> findByUsername(String username){
		
		List<Booking> booking = new ArrayList<Booking>();
		em.getTransaction().begin();
		Query q = em.createNamedQuery("Booking.findByUsername");
		q.setParameter("username",username);
		booking = (List<Booking>)q.getResultList();
	    if(booking!=null)
		{
	    	em.getTransaction().commit();
			return booking;
		}
	    em.getTransaction().commit();
		return null;
	}
	
	public void removeBookingById(int bookingId) {
		em.getTransaction().begin();
		Booking booking = em.find(Booking.class, bookingId);
		em.remove(booking);
		em.getTransaction().commit();
	}
	
	
	
	public static void main(String args[])
	{
		BookingDao bDao = new BookingDao();
		List<Booking> bookingList = bDao.findByAirlineCodeUsername("joy");
		for(Booking b: bookingList)
		{
			System.out.println(b.getAirLineCode());
		}
	}
	
}
