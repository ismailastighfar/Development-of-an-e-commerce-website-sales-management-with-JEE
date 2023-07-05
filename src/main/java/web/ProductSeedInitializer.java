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
        ArticlesStock articlesStock = new ArticlesStock(1, 5, "Ray-Ban RB2132", "Classic Wayfarer sunglasses", 150);
        articlesService.addArticle(articlesStock);
        
        ArticlesStock articlesStock1 = new ArticlesStock(2, 10, "Ray-Ban RB3025", "Aviator sunglasses", 200);
        articlesService.addArticle(articlesStock1);

        ArticlesStock articlesStock2 = new ArticlesStock(2, 7, "Ray-Ban RB4165", "Justin Classic sunglasses", 180);
        articlesService.addArticle(articlesStock1);

        // Add more products as needed

        System.out.println("Product data initialized.");
    }
}
