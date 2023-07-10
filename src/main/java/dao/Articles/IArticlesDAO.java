package dao.Articles;

import java.util.List;

import entities.ArticlesStock;

public interface IArticlesDAO {
	
	public void addArticle(ArticlesStock Art);
	public List<ArticlesStock> listsArticles();	
	public ArticlesStock getArticle (int codeArt);
	public ArticlesStock getArticleByName (String nomArt);
	public void deleteArticle(int codeArt);
	public void updateArticle(ArticlesStock Art);
}
