package web;

import com.opensymphony.xwork2.ActionSupport;
import entities.ArticlesStock;
import entities.Commandes;
import org.springframework.beans.factory.annotation.Autowired;
import service.Articles.IArticlesService;
import service.Commandes.ICommandesService;
import java.util.*;


import java.util.List;

public class ArticlesAction extends ActionSupport {

    public List<ArticlesStock> articlesList;
    public List<Commandes> commandesList;
    public ArticlesStock article = new ArticlesStock();
    public Commandes commandes = new Commandes();
    public int code;
    
    
    
    @Autowired
    private IArticlesService articlesService;

    @Autowired
    private ICommandesService commandesService;

    public String displayArticles() {
        articlesList = articlesService.listsArticles();
        return SUCCESS;
    }
    
    
    public String addCmd() {
		article = 	articlesService.getArticle(code);
    	articlesList = articlesService.listsArticles();
    	return SUCCESS;
    }
    
    public String confirmCmd() {
    	
  		article = articlesService.getArticle(article.getCodeArt());
  		int newQte = article.getQteArt() - commandes.getQteCmd();
  		article.setQteArt(newQte);
  		articlesService.updateArticle(article);
  		
  		Date date =commandes.getDateCmd();
  		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
  		commandes.setDateCmd(sqlDate);
      	commandesService.addCommande(commandes);
      	return SUCCESS;
      }
    
    
    
   
    
}
