package web;

import javax.annotation.PostConstruct;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import entities.ArticlesStock;
import service.Articles.IArticlesService;

@Component
public class ProductSeedInitializer {

    @Autowired
    private IArticlesService articlesService;

    @PostConstruct
    public void initializeProducts() {
        // Create and save sample products
        ArticlesStock articlesStock = new ArticlesStock(1, 5, "pc", "pc1", 1000);
        articlesService.addArticle(articlesStock);
        
        ArticlesStock articlesStock1 = new ArticlesStock(2, 3, "micro", "micro1", 1500);
        articlesService.addArticle(articlesStock1);

        // Add more products as needed

        System.out.println("Product data initialized.");
    }
}
