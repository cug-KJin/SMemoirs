package ssm.service.Impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
import ssm.entity.Articleimage;
import java.util.List;
import static org.testng.Assert.*;
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml" })
public class ArticleimageServiceImplTest extends AbstractTestNGSpringContextTests {
    @Autowired
    ArticleimageServiceImpl articleimageService;
    private int aid;
    private int aid1;
    private String articleimage;
    private String articleimage1;
    @BeforeMethod
    @Parameters({"aid","aid1","articleimage","articleimage1"})
    public void setUp(int aid,int aid1,String articleimage,String articleimage1)
    {
        this.aid = aid;
        this.aid1 = aid1;
        this.articleimage = articleimage;
        this.articleimage1 = articleimage1;
    }
    @Test(priority = 0)
    public void testAddimage() {
        int res = articleimageService.addimage(aid,articleimage);
        Assert.assertEquals(res,1);
        res += articleimageService.addimage(aid,articleimage1);
        Assert.assertEquals(res,2);
        res = articleimageService.addimage(aid1,articleimage1);
        Assert.assertEquals(res,1);
    }

    @Test(priority = 2)
    public void testDeleteimage() {
        int res = articleimageService.deleteimage(aid);
        System.out.println(res);
    }

    @Test(priority = 1)
    public void testGetImageByAid() {
        try{
            List<Articleimage> list = articleimageService.getImageByAid(aid);
        }catch (NullPointerException e){
            e.toString();
        }
    }
}