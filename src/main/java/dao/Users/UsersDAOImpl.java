package dao.Users;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entities.Users;

public class UsersDAOImpl implements IUsersDAO {

	@PersistenceContext
	private EntityManager eManager;

	@Override
	public List<Users> listsUsers() {
		Query req=eManager.createQuery("SELECT u from Users u");
		return req.getResultList();
		
	}

	@Override
	public void addUser(Users u) {
		eManager.persist(u);
		
	}

	@Override
	public void updateUser(Users u) {
	  eManager.merge(u);
		
	}

	@Override
	public int addUsers(Users u) {
		eManager.persist(u);
		return u.getCodeUser();
	}

	@Override
	public Users getUser(int codeUser) {
		
		return eManager.find(Users.class, codeUser);
	}

	@Override
	public void deleteUser(int codeUser) {
		Users user = getUser(codeUser);
		eManager.remove(user);
	
		
	}

	@Override
	public Users getUserBYlogin(String login) {
		  Query req = eManager.createQuery("SELECT u FROM Users u WHERE u.login = :login");
		    req.setParameter("login", login);
		    List<Users> users = req.getResultList();
		    if (users.isEmpty()) {
		        return null;
		    }
		    return users.get(0);
		}
	}

	
	  
	

