package service.Users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.Users.IUsersDAO;
import entities.Users;

@Service
@Transactional
public class UsersServiceImpl implements IUsersService{
	
	@Autowired
	private IUsersDAO userdao;
	

	public void setUserdao(IUsersDAO userdao) {
		this.userdao = userdao;
	}

	

	@Override
	public List<Users> listsUsers() {
		
		return userdao.listsUsers();
	}

	@Override
	public void addUser(Users u) {
		userdao.addUser(u);
		
	}

	@Override
	public void updateUser(Users u) {
		userdao.updateUser(u);
		
	}

	@Override
	public int addUsers(Users u) {
		
		return userdao.addUsers(u);
	}

	@Override
	public Users getUser(int codeUser) {
		
		return userdao.getUser(codeUser);
	}

	@Override
	public void deleteUser(int codeUser) {
		userdao.deleteUser(codeUser);
		
	}



	@Override
	public Users getUserBYlogin(String login) {
		return userdao.getUserBYlogin(login);
	}



	@Override
	public Users getUserByEmail(String email) {
		
		return userdao.getUserByEmail(email);
	}

}
