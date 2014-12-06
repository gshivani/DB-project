package edu.neu.cs5200.flight;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;


@Entity
@NamedQueries({	@NamedQuery(name="FrequentFlierMiles.findFfmByUsername", query="select f from FrequentFlierMiles f where f.username = :username"),
	@NamedQuery(name="FrequentFlierMiles.findAll", query="select f from FrequentFlierMiles f")})
public class FrequentFlierMiles {

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private int ffmId;
		private String username;
		private int points;
		
		public int getFfmId() {
			return ffmId;
		}
		public void setFfmId(int ffmId) {
			this.ffmId = ffmId;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public int getPoints() {
			return points;
		}
		public void setPoints(int points) {
			this.points = points;
		}
		public FrequentFlierMiles(int points, String username) {
			super();
			this.username = username;
			this.points = points;
		}
		public FrequentFlierMiles() {
			super();
		}
		public FrequentFlierMiles(int ffmId, String username, int points) {
			super();
			this.ffmId = ffmId;
			this.username = username;
			this.points = points;
		}
		
	

}
