package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Users {

	@Id 
	@GeneratedValue
	private int codeUser;
	private  String login;
	private  String pass;
	private String email;
	
	public Users() {
		super();
	}
	public Users(int codeUser, String login, String pass,String email) {
		super();
		this.codeUser = codeUser;
		this.login = login;
		this.pass = pass;
		this.email = email;
	}
	public int getCodeUser() {
		return codeUser;
	}
	public void setCodeUser(int codeUser) {
		this.codeUser = codeUser;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
