package rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import com.sun.jersey.spi.container.ParamQualifier;

import edu.neu.cs5200.Daos.UserDao;
import edu.neu.cs5200.flight.*;
// /rest/user
@Path("/user")
public class UserWebService {
	
	UserDao dao = new UserDao();
	
	// /rest/user
	@GET
	@Produces("application/json")
	@Path("/")
	public List<User> getAllUsers() {
		return dao.findAllUsers();
	}
	@GET
	@Produces("application/json")
	@Path("/{username}")
	public User getUserForUsername(@PathParam("username") String username) {
		return dao.findOnlyByUsername(username);
	}
	@DELETE
	@Path("/{username}")
	public void deleteUser(@PathParam("username") String username) {
		dao.deleteUser(username);
	}
	@POST
	@Path("/")
	@Consumes("application/json")
	public void createUser(User newUser) {
		dao.createUser(newUser);
	}
	@PUT
	@Path("/{username}")
	@Consumes("application/json")
	public void updateUser(@PathParam("username") String username, User newUser) {
		dao.updateUser(username, newUser);
	}
}
