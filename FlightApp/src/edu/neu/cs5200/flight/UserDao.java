package edu.neu.cs5200.flight;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

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
		if(user!=null && user.getUsername()!=null)
		{
			em.getTransaction().commit();
			return user;
		}
		em.getTransaction().commit();
		return null;
		
	}
	
	public User findOnlyByUsername(String username)
	{
		User user = null;
		em.getTransaction().begin();
		user= em.find(User.class, username);
		if(user!=null && user.getUsername()!=null)
		{
			em.getTransaction().commit();
			return user;
		}
		em.getTransaction().commit();
		return null;
		
	}
	
	
	public List<User> findAllUsers() { 
		
		em.getTransaction().begin();
		Query query = em.createQuery("select u from User u");
		List<User> users = (List<User>)query.getResultList();
		em.getTransaction().commit();
		return users;
	}
	
	
	public void deleteUser(String username) {
		em.getTransaction().begin();
		User user = em.find(User.class, username);
		em.remove(user);
		em.getTransaction().commit();
	}
	
	public void updateUser(String username, User user) {
		em.getTransaction().begin();
		User u = em.find(User.class, username);
		u.setEmail(user.getEmail());
		em.merge(u);
		em.getTransaction().commit();
	}
	
	public static void main(String[] args) {
		UserDao dao = new UserDao();
		User u1 = new User("alicewonderland","alice123","alice","wonderland","1990-12-03","alice@wonderland","online");
		User u2 = dao.createUser(u1);
		System.out.println(u2.getUsername());

	}

}
