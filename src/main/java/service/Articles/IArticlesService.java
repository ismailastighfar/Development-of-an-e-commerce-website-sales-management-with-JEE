package service.Articles;

import java.util.List;

import entities.ArticlesStock;

public interface IArticlesService {
	
	public void addArticle(ArticlesStock Art);
	public List<ArticlesStock> listsArticles();	
	public ArticlesStock getArticle (int codeArt);
	public void deleteArticle(int codeArt);
	public void updateArticle(ArticlesStock Art);

}
