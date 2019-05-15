package ssm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
import ssm.entity.Article;
import ssm.service.ArticleService;

import java.util.List;

import static org.testng.Assert.*;
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml" })
public class ArticleServiceImplTest extends AbstractTestNGSpringContextTests {
    @Autowired
    private ArticleServiceImpl articleService;
    private int aid;
    private int aid1;
    private int uid;
    private int uid1;
    private String userName;
    private String userName1;
    private int sid;
    private int sid1;
    private String description;
    private String description1;
    private String description2;
    @BeforeMethod
    @Parameters({"aid","aid1","uid","uid1","userName","userName1",
                  "sid","sid1","description","description1","description2"})
    public void setUp(int aid,int aid1,int uid,int uid1,String userName,String userName1,int sid,int sid1,String description,String description1,String description2) {
        this.aid = aid;
        this.aid1 = aid1;
        this.uid = uid;
        this.uid1 = uid1;
        this.userName = userName;
        this.userName1 = userName1;
        this.sid = sid;
        this.sid1 = sid1;
        this.description = description;
        this.description1 = description1;
        this.description2 = description2;
    }
    @Test(priority = 0)
    public void testCreateArctice() {
        //发布一篇文章
        int res = articleService.createArctice(sid,userName,uid,description);
        System.out.println(res);
        //同一账号发布不同文章
        res = articleService.createArctice(sid,userName,uid,description1);
        System.out.println(res);
        //同一账号不同时间发布相同文章
        res = articleService.createArctice(sid,userName,uid,description1);
        System.out.println(res);
        //不同账号在相同班级发布文章
        res = articleService.createArctice(sid,userName1,uid1,description2);
        System.out.println(res);
    }

    @Test
    public void testGetArticleBySid() {
        try {
            List<Article> list = articleService.getArticleBySid(sid);
            for (Article article : list) {
                System.out.println(article.toString());
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }

    @Test
    public void testGetArticleByUid() {
        try {
            List<Article> list = articleService.getArticleByUid(uid);
            for (Article article : list) {
                System.out.println(article.toString());
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }

    @Test
    public void testGetArticleBySidAndUid() {
        try {
            List<Article> list = articleService.getArticleBySidAndUid(sid, uid);
            for (Article article : list) {
                System.out.println(article.toString());
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }

    @Test(priority = 4)
    public void testDeleteArticle() {
       //与图片表无关联，可以成功
        int res = articleService.deleteArticle(aid);
        System.out.println(res);
        try
        {
            //关联图片表，无法删除
             res = articleService.deleteArticle(aid1);
            System.out.println(res);
        }catch (Exception e)
        {
            System.out.println("因为与其他表存在关联，无法删除");
            System.out.println(e.toString());
        }

    }
}