package edu.neu.cs5200.flight;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({	@NamedQuery(name="Comment.findByAirineCode", query="select c from Comment c where c.airlineCode = :airlineCode")})
@IdClass(value=CommentPk.class)
public class Comment implements Serializable{
  
	@Id
	private String username;
	@Id
	private String airlineCode;
	private String comment;
	
	public Comment() {
		super();
	}

	public Comment(String username, String airlineCode, String comment) {
		super();
		this.username = username;
		this.airlineCode = airlineCode;
		this.comment = comment;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAirlineCode() {
		return airlineCode;
	}

	public void setAirlineCode(String airlineCode) {
		this.airlineCode = airlineCode;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
