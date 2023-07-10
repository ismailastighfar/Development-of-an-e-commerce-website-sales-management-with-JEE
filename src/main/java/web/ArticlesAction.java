package web;

import com.opensymphony.xwork2.ActionSupport;
import entities.ArticlesStock;
import entities.Commandes;
import entities.Users;

import org.springframework.beans.factory.annotation.Autowired;

import service.EmailService;
import service.Articles.IArticlesService;
import service.Commandes.ICommandesService;
import service.Users.IUsersService;

import java.util.*;


import java.util.List;

import javax.mail.MessagingException;

public class ArticlesAction extends ActionSupport {

    public List<ArticlesStock> articlesList;
    public List<Commandes> commandesList;
    public ArticlesStock article = new ArticlesStock();
    public Commandes commandes = new Commandes();
    public int code;
    

    private EmailService emailService;

    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
        
    }
    
    
    @Autowired
    private IArticlesService articlesService;

    @Autowired
    private ICommandesService commandesService;
    
    @Autowired
    private IUsersService usersService;

    public String displayArticles() {
        articlesList = articlesService.listsArticles();
        return SUCCESS;
    }
    
    
    public String addCmd() {
		article = 	articlesService.getArticle(code);
    	articlesList = articlesService.listsArticles();
    	return SUCCESS;
    }
    
    public String confirmCmd() throws MessagingException {
    	
    	article = articlesService.getArticle(commandes.getCodeArt());
    	
  		int newQte = article.getQteArt() -  commandes.getQteCmd();
  		
  		article.setQteArt(newQte);
  		articlesService.updateArticle(article);
  		
  		Date date = new Date();
  		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
  		commandes.setDateCmd(sqlDate);
		Users usr = usersService.getUserBYlogin(commandes.getClient());
		emailService.sendconfirmCommandEmail(usr,article);
      	commandesService.addCommande(commandes);
      	return SUCCESS;
      }
    
    
    
   
    
}
