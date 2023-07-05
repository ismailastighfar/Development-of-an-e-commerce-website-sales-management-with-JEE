package service.Users;

import java.util.List;

import entities.Users;

public interface IUsersService {

	public List<Users> listsUsers();
	public void addUser(Users u);
	public void updateUser(Users u);
	public int addUsers(Users u);
	public Users getUser (int codeUser);
	public Users getUserBYlogin (String login);
	public void deleteUser(int codeUser);
	

}
