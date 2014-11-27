package edu.neu.cs5200.flight;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import edu.neu.cs5200.flight.User;

public class UserDao {

	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public UserDao() {
		em = factory.createEntityManager();
	}
	
	public User createUser(User user)
	{
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
		return user;
	}
	
	public User findByUsername(String username,String password)
	{
		User user = null;
		em.getTransaction().begin();
		user= em.find(User.class, username);
		em.getTransaction().commit();
		return user;
	}
	
	public static void main(String[] args) {
		UserDao dao = new UserDao();
		User u1 = new User("alicewonderland","alice123","alice","wonderland","1990-12-03","alice@wonderland","online",100);
		User u2 = dao.createUser(u1);
		System.out.println(u2.getUsername());

	}

}
