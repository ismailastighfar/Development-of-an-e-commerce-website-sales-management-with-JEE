package web;

import com.opensymphony.xwork2.ActionSupport;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import service.Users.IUsersService;
import entities.Users;


public class AuthAction extends ActionSupport {

	
	   
	    public Users user = new Users();

	    @Autowired
	    private IUsersService usersService;
	    
	   
	    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    
	  
	    public String login() {
	        Users userlogin = usersService.getUserBYlogin(user.getLogin());
	        
	     // Check if the user exists
	        if (userlogin == null) {
	            addActionError("Invalid username");
	            return ERROR;
	        }
	        
	        
	    	String hashedPasswordFromDB = userlogin.getPass();
        	// Compare the hashed password from the database with the input password
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	        if (userlogin != null && passwordEncoder.matches(user.getPass(), hashedPasswordFromDB)) {
	            HttpSession session = ServletActionContext.getRequest().getSession();
	            session.setAttribute("loggedInUser", userlogin);
	                return SUCCESS;
	        }
	         else {
	        	 addActionError("Invalid username or password ");
		            return ERROR;
	         }
	    }

	 
	    public String register() {
	        Users userExist = usersService.getUserBYlogin(user.getLogin());

	        if (userExist != null) {
	            addActionError("Username already taken!");
	            return ERROR;
	        } else {
	            String password = user.getPass();

	            // Validate password boundaries
	            if (!validatePassword(password)) {
	                addActionError("Invalid password! Password must have a minimum of 8 characters, " +
	                               "at least one uppercase letter, one symbol, and one digit.");
	                return ERROR;
	            }

	            // Hash the password
	            String hashedPassword = passwordEncoder.encode(password);
	            user.setPass(hashedPassword);

	            // Save the user
	            usersService.addUser(user);

	            return SUCCESS;
	        }
	    }


	    public String updateUserInfo() {
	        HttpSession session = ServletActionContext.getRequest().getSession();
	        Users loggedInUser = (Users) session.getAttribute("loggedInUser");

	        if (loggedInUser != null) {
	        
	            // Check if the password is provided and update it if not empty
	            if (user.getPass() != null && !user.getPass().isEmpty()) {
	            	
	            	  // Validate password boundaries
		            if (!validatePassword(user.getPass())) {
		                addActionError("Invalid password! Password must have a minimum of 8 characters, " +
		                               "at least one uppercase letter, one symbol, and one digit.");
		                return ERROR;
		            }
	                String hashedPassword = passwordEncoder.encode(user.getPass());
	                loggedInUser.setPass(hashedPassword);
	                loggedInUser.setLogin(user.getLogin());
	            }
	            usersService.updateUser(loggedInUser);
	            addActionMessage("User information updated successfully");
	            return SUCCESS;
	        } else {
	            addActionError("User not logged in.");
	            return ERROR;
	        }
	    }
	    
	    public String logout() {
	        HttpSession session = ServletActionContext.getRequest().getSession(false);
	        if (session != null) {
	            session.invalidate();
	        }

	        return "logout";
	    }
	    
	    
	    public boolean validatePassword(String password) {
	        // Minimum 8 characters
	        if (password.length() < 8) {
	            return false;
	        }

	        // At least one uppercase letter
	        if (!password.matches(".*[A-Z].*")) {
	            return false;
	        }

	        // At least one symbol (non-alphanumeric character)
	        if (!password.matches(".*[^a-zA-Z0-9].*")) {
	            return false;
	        }

	        // At least one digit
	        if (!password.matches(".*\\d.*")) {
	            return false;
	        }

	        return true;
	    }


	    
	    




}
