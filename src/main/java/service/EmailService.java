package service;

import org.springframework.stereotype.Service;

import entities.ArticlesStock;
import entities.Users;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;


@Service
public class EmailService {
	
    private final String username = ""; // replace with your email address
    private final String password = ""; // replace with your email password

    public void sendWelcomeEmail( Users user) throws MessagingException {
        String subject = "Welcome to RayBan";
        String body =  user.getLogin() + " Welcome To RayBan,\n\nThank you for signing Up to our Application ";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); // replace with your email provider's SMTP server
        props.put("mail.smtp.port", "587"); // replace with the appropriate port

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
        message.setSubject(subject);
        message.setText(body);

        Transport.send(message);
    }
    
    
    public void sendBannedUserEmail( Users user) throws MessagingException {
    	 String subject = "Account Deletion Notification for : " + user.getLogin();
    	 String body = "Dear User,\n\nWe regret to inform you that your account has been deleted from our application. If you have any questions or concerns, please contact our support team.\n\nThank you.";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); // replace with your email provider's SMTP server
        props.put("mail.smtp.port", "587"); // replace with the appropriate port

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
        message.setSubject(subject);
        message.setText(body);

        Transport.send(message);
    }
    
    public void sendcancelCommandEmail( Users user , ArticlesStock art) throws MessagingException {
    	  String subject = "Command for : " + art.getNomArt() +  " Cancellation and Refund Notification";
    	  String body = "Dear User,\n\nWe regret to inform you that your command has been canceled due to a shipment problem. We apologize for the inconvenience caused. Your payment will be refunded in the next few business days.\n\nIf you have any questions or concerns, please contact our support team. Thank you for your understanding.";

       Properties props = new Properties();
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.starttls.enable", "true");
       props.put("mail.smtp.host", "smtp.gmail.com"); // replace with your email provider's SMTP server
       props.put("mail.smtp.port", "587"); // replace with the appropriate port

       Session session = Session.getInstance(props, new Authenticator() {
           protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
           }
       });

       Message message = new MimeMessage(session);
       message.setFrom(new InternetAddress(username));
       message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
       message.setSubject(subject);
       message.setText(body);

       Transport.send(message);
   }
    
    public void sendconfirmCommandEmail( Users user , ArticlesStock art) throws MessagingException {
    	  String subject = "Command Confirmation for " + art.getNomArt();
    	    String body = "Dear User,\n\nWe are pleased to inform you that your command has been confirmed and is being processed. You can expect the shipment to arrive at the provided address within the estimated delivery timeframe.\n\nIf you have any questions or need further assistance, please don't hesitate to contact our support team. Thank you for choosing our services.";

     Properties props = new Properties();
     props.put("mail.smtp.auth", "true");
     props.put("mail.smtp.starttls.enable", "true");
     props.put("mail.smtp.host", "smtp.gmail.com"); // replace with your email provider's SMTP server
     props.put("mail.smtp.port", "587"); // replace with the appropriate port

     Session session = Session.getInstance(props, new Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
             return new PasswordAuthentication(username, password);
         }
     });

     Message message = new MimeMessage(session);
     message.setFrom(new InternetAddress(username));
     message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
     message.setSubject(subject);
     message.setText(body);

     Transport.send(message);
 }
}
