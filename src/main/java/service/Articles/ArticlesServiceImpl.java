package service.Articles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.Articles.IArticlesDAO;
import entities.ArticlesStock;

@Service
@Transactional
public class ArticlesServiceImpl implements IArticlesService {
	
	
	private IArticlesDAO dao;

	public void setDao(IArticlesDAO dao) {
		this.dao = dao;
	}

	@Override
	public void addArticle(ArticlesStock Art) {
		
		dao.addArticle(Art);
		
	}

	@Override
	public List<ArticlesStock> listsArticles() {
		
		return dao.listsArticles();
	}

	@Override
	public ArticlesStock getArticle(int codeArt) {
		
		return dao.getArticle(codeArt);
	}

	@Override
	public void deleteArticle(int codeArt) {
		dao.deleteArticle(codeArt);
		
	}

	@Override
	public void updateArticle(ArticlesStock Art) {
		dao.updateArticle(Art);
		
	}

	@Override
	public ArticlesStock getArticleByName(String nomArt) {
		
		return dao.getArticleByName(nomArt);
	}

}
