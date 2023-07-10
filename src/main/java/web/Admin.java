package web;

import java.util.List;

import javax.mail.MessagingException;

import org.apache.struts2.components.ActionError;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import entities.ArticlesStock;
import entities.Commandes;
import entities.Users;
import service.EmailService;
import service.Articles.IArticlesService;
import service.Commandes.ICommandesService;
import service.Users.IUsersService;

public class Admin extends ActionSupport {

	public Users users = new Users();
	public ArticlesStock article = new ArticlesStock();
	public List<Users> usersList;
	public List<Commandes> cmdList;
	public List<ArticlesStock> articlesList;
	public int codeuser;
	public int codecmd;
	public int codeart;
	
	
	@Autowired
	 private IUsersService usersService;
	
	@Autowired
	private ICommandesService commandesService;

    @Autowired
    private IArticlesService articlesService;


    private EmailService emailService;

    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
        
    }
	// Users 
	
	public String indexUser() {
		usersList = usersService.listsUsers();
		return SUCCESS;
	}
	
	public String deleteUser() throws MessagingException {
		Users delUser = usersService.getUser(codeuser);
		emailService.sendBannedUserEmail(delUser);
		usersService.deleteUser(codeuser);
		usersList = usersService.listsUsers();
		return SUCCESS;
	}
	
	
	// Command
	
	public String indexCmd() {
        cmdList = commandesService.listsCommandes();
		return SUCCESS;
	}
	
	public String deleteCmd() throws MessagingException {
		Commandes cmd =  commandesService.getCommande(codecmd);
		ArticlesStock art = articlesService.getArticle(cmd.getCodeArt());
		Users usr = usersService.getUserBYlogin(cmd.getClient());
		
		if (usr != null) {
		 emailService.sendcancelCommandEmail(usr,art);
		}
		
		commandesService.deleteCommande(codecmd);
		cmdList = commandesService.listsCommandes();
		return SUCCESS;
	}
	
	
	
	// Product 
	public String indexArt() {
        articlesList = articlesService.listsArticles();
		return SUCCESS;
	}
	
	
	public String deleteArt() {
		articlesService.deleteArticle(codeart);
		articlesList = articlesService.listsArticles();
		return SUCCESS;
	}
	

	public String edit() {
		article = articlesService.getArticle(codeart);
		return SUCCESS;
	}
	
	public String editArt() {
		ArticlesStock artExist = articlesService.getArticleByName(article.getNomArt());
		ArticlesStock oldArt = articlesService.getArticle(article.getCodeArt());
		if (artExist != null  && !artExist.getNomArt().equals(oldArt.getNomArt())) {
			 addActionError("Article already exists!");
	          return ERROR;
		}else {
			articlesService.updateArticle(article);
			articlesList = articlesService.listsArticles();
			return SUCCESS;
			 
		}
		
	}

	public String addArt() {
	ArticlesStock artExist = articlesService.getArticleByName(article.getNomArt());
	if (artExist != null) {
		addActionError("Article already exists!");
        return ERROR;
	}else {
		articlesService.addArticle(article);
		articlesList = articlesService.listsArticles();
		return SUCCESS;
		  
	}
		
	}
	
	
	
	
	
}
