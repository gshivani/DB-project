package edu.neu.cs5200.Daos;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import edu.neu.cs5200.flight.UserAdmin;

public class UserAdminDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public UserAdminDao() {
		em = factory.createEntityManager();
	}
	
	public UserAdmin findByUsername(String username,String password)
	{
		UserAdmin user = null;
		em.getTransaction().begin();
		user= em.find(UserAdmin.class, username);
		if(user!=null && user.getUsername()!=null)
		{
			em.getTransaction().commit();
			return user;
		}
		em.getTransaction().commit();
		return null;
		
	}
}
