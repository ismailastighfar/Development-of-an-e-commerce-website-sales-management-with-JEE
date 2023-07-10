package web;

import com.opensymphony.xwork2.ActionSupport;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import service.EmailService;
import service.Users.IUsersService;
import entities.Users;


public class AuthAction extends ActionSupport {
	
	
	private EmailService emailService;

    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
    }
	
	
	    public Users user = new Users();

	    @Autowired
	    private IUsersService usersService;
	    
	   
	    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    
	  
	    public String login() {
	    	
	    	
	    	if (user.getLogin().equals("admin") && user.getPass().equals("admin")) {
	    		return "admin";
			}
	    	
	    	
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

	 
	    public String register() throws IOException {
	        Users userExist = usersService.getUserBYlogin(user.getLogin());
	        Users userEmail = usersService.getUserByEmail(user.getEmail());
	        
	        if (userEmail != null) {
	        	 addActionError("Email already taken!");
		         return ERROR;
			}
	        
	        // Validate email format
	        if (!validateEmail(user.getEmail())) {
	            addActionError("Invalid email address!");
	            return ERROR;
	        }

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
	            
	            try {
	                emailService.sendWelcomeEmail(user);
	            } catch (MessagingException e) {
	                // Handle email sending error
	                addActionError("Failed to send the welcome email , your Email is not correct !!");
	                return ERROR;
	            }
	           
	            
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
	               
	                Users userExist = usersService.getUserBYlogin(user.getLogin());
	                
	                if (userExist != null && !userExist.getLogin().equals(loggedInUser.getLogin())) {
	                    addActionError("Username already taken!");
	                    return ERROR;
	                }
	                
	                // Validate email format
	    	        if (!validateEmail(user.getEmail())) {
	    	            addActionError("Invalid email address!");
	    	            return ERROR;
	    	        }
	                
	                Users userEmail = usersService.getUserByEmail(user.getEmail());
	                if (userEmail != null && !userEmail.getEmail().equals(loggedInUser.getEmail())) {
	                    addActionError("Email already taken!");
	                    return ERROR;
	                }
	                
	                
	    	        
	    	        String hashedPassword = passwordEncoder.encode(user.getPass());
	                loggedInUser.setPass(hashedPassword);
	    	        loggedInUser.setLogin(user.getLogin());
	    	        loggedInUser.setEmail(user.getEmail());
	    	        
	               
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
	    
	    private boolean validateEmail(String email) {
	        // Advanced email format validation using a regular expression
	        String emailRegex = "^[A-Za-z0-9+_.-]+@(?:[A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$";
	        return email.matches(emailRegex);
	    }

	    
	  

	    
	    




}
