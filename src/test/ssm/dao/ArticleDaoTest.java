package ssm.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ssm.entity.Article;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration("classpath:spring/spring-dao.xml")

public class ArticleDaoTest {
    @Autowired
    private ArticleDao articleDao;
    @Test
    public void createarticle() {
        Article article1 = new Article(1000000003,"123",1000001236,"1");
        Article article2 = new Article(1000000003,"123",1000001236,"2");
        Article article3 = new Article(1000000003,"123",1000001236,"3");
        articleDao.createarticle(article1);
        articleDao.createarticle(article2);
        articleDao.createarticle(article3);
        System.out.println(article1.toString());
        System.out.println("aid:"+article2.getAid());
        System.out.println("aid:"+article3.getAid());
    }

    @Test
    public void getArticleByUid() {
        List<Article> list = articleDao.getArticleByUid(1000000003);
        for (Article a:list) {
            System.out.println(a.toString());
        }
    }

    @Test
    public void deleteArticle() {
    }
}