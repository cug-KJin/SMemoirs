package ssm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
import ssm.dao.ArticleimageDao;
import ssm.entity.Articleimage;
import java.util.List;

import static org.junit.Assert.*;
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml" })

public class ArticleImageDaoTest extends AbstractTestNGSpringContextTests {
    @Autowired
    private ArticleimageDao articleimageDao;
    private int aid;
    private int aid1;
    private String articleimage;
    @BeforeMethod
    @Parameters({"aid","aid1","articleimage"})
    public void setUp(int aid,int aid1,String articleimage)
    {
        this.aid = aid;
        this.aid1 = aid1;
        this.articleimage = articleimage;
    }
    @Test(priority = 0)
    public void addimage() {
        int res = articleimageDao.addimage(aid,articleimage);
        Assert.assertEquals(res,1);
        System.out.println(res);
    }
   /* @Test(priority = 2)
    public void deleteimage() {
        int res = articleimageDao.deleteimage(aid1);
        System.out.println(res);
    }*/

    @Test(priority = 1)
    public void getImageByAid() {
        try {
            List<Articleimage> list = articleimageDao.getImageByAid(aid);
            for (Articleimage a:list) {
                System.out.println(a.toString());
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }

    }
}