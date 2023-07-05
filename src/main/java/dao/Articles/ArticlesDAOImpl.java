package dao.Articles;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entities.ArticlesStock;

public class ArticlesDAOImpl implements IArticlesDAO {
	
	@PersistenceContext
	private EntityManager eManager;

	@Override
	public void addArticle(ArticlesStock Art) {
		
		eManager.persist(Art);
	}

	@Override
	public List<ArticlesStock> listsArticles() {
		Query req=eManager.createQuery("SELECT Art from ArticlesStock Art");
		return req.getResultList();
	}

	@Override
	public ArticlesStock getArticle(int codeArt) {
	  
		return eManager.find(ArticlesStock.class, codeArt);
	}

	@Override
	public void deleteArticle(int codeArt) {
		
		ArticlesStock art = getArticle(codeArt);
		eManager.remove(art);
	}

	@Override
	public void updateArticle(ArticlesStock Art) {
	  
		eManager.merge(Art);
	}

}
