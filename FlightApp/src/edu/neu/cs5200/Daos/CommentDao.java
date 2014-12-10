package edu.neu.cs5200.Daos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.flight.Comment;
import edu.neu.cs5200.flight.CommentPk;

public class CommentDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("FlightApp");
	EntityManager em = null;
	
	public CommentDao() {
		em = factory.createEntityManager();
	}

	
    public Comment createComment(Comment comment){
		
		em.getTransaction().begin();
		em.persist(comment);
		em.getTransaction().commit();
		return comment;
	}
    
    public List<Comment> findByAirlineCode(String airlineCode){
    	
    	List<Comment> comment = new ArrayList<Comment>();
		em.getTransaction().begin();
		Query q = em.createNamedQuery("Comment.findByAirineCode");
		q.setParameter("airlineCode",airlineCode);
		comment = (List<Comment>)q.getResultList();
		if(comment!=null)
		{
	    	em.getTransaction().commit();
			return comment;
		}
	    em.getTransaction().commit();
		return null;
    }
    
    public Comment updateComment(String username, String airlineCode, String newcomment){
		
		
		CommentPk commentpk = new CommentPk();
		commentpk.setUsername(username);
		commentpk.setAirlineCode(airlineCode);
		Comment comment = em.find(Comment.class, commentpk);
		em.getTransaction().begin();
		comment.setComment(newcomment);
		em.merge(comment);
		em.getTransaction().commit();
		return comment;	
	}
    
    public Comment findByUsernameAndAirlineCode(String username,String airlineCode){
		
    	CommentPk commentpk = new CommentPk();
    	commentpk.setUsername(username);
    	commentpk.setAirlineCode(airlineCode);

    		em.getTransaction().begin();
    		Comment comment = em.find(Comment.class, commentpk);
    		em.getTransaction().commit();
    		return comment;
    		
    	}
	public static void main(String[] args) {
		CommentDao dao = new CommentDao();
		Comment c = new Comment("joy", "AA", "Good Airlines");
		dao.createComment(c);

	}

}
