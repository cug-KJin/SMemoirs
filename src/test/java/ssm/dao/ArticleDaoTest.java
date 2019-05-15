package ssm.dao;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
import ssm.dao.ArticleDao;
import ssm.entity.Article;
import java.util.List;
import static org.junit.Assert.*;
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml" })
public class ArticleDaoTest extends AbstractTestNGSpringContextTests {
    @Autowired
    private ArticleDao articleDao;
    private int aid;
    private int uid;
    private String userName;  //uid
    private int sid;
    private String description;
    private String description1;
    @BeforeMethod
    @Parameters({"aid","uid","userName","sid","description","description1"})
    public void setUp(int aid,int uid,String userName,int sid,String description,String description1)
    {
        this.aid=aid;
        this.uid = uid;
        this.userName = userName;
        this.sid =sid;
        this.description = description;
        this.description1 = description1;
    }
    @Test(priority = 0)
    public void createArticle() {
        Article article = new Article(uid,userName,sid,description);
        int res = articleDao.createarticle(article);
        Assert.assertEquals(res,1);
        System.out.println(res);
        article = new Article(uid,userName,sid,description1);
        res += articleDao.createarticle(article);
        Assert.assertEquals(res,2);
        System.out.println(res);
    }

    @Test
    public void getArticleByUid() {
        List<Article> list = articleDao.getArticleByUid(uid);
        if(list==null){
            System.out.println("数据库中不存在该sid");
        }else {
            for (Article a : list) {
                System.out.println(a.toString());
            }
        }
    }
    @Test
    public void getArcticleBySid()
    {
        List<Article> list = articleDao.getArticleBySid(sid);
        if(list==null){
            System.out.println("数据库中不存在该sid");
        }else
        {
            for(Article article : list)
            {
                System.out.println(article.toString());
            }
        }
    }
    @Test
    public void getArticleBySidAndUid()
    {
        List<Article> list = articleDao.getArticleBySidAndUid(sid,uid);
        if(list==null){
            System.out.println("数据库中不存在该sid");
        }else {
            for (Article article : list) {
                System.out.println(article.toString());
            }
        }
    }
    @Test(priority = 4)
    public void deleteArticle() {
        System.out.println("删除文章的aid："+aid);
        int res = articleDao.deleteArticle(aid);
        if(res==0){
            System.out.println("数据库中不存在该文章");
        }else {
            Assert.assertEquals(res,1);

        }
        System.out.println(res);
    }
}