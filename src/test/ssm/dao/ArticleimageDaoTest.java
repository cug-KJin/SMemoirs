package ssm.dao;

import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ssm.entity.Articleimage;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration("classpath:spring/spring-dao.xml")

public class ArticleimageDaoTest {
    @Autowired
    private ArticleimageDao articleimageDao;

    @Test
    public void addimage() {
        articleimageDao.addimage(100000003,"http://localhost:8080/upload/userUploadPhoto/1.jpg");
        articleimageDao.addimage(100000004,"http://localhost:8080/upload/userUploadPhoto/2.jpg");
        articleimageDao.addimage(100000005,"http://localhost:8080/upload/userUploadPhoto/3.jpg");
        articleimageDao.addimage(100000003,"http://localhost:8080/upload/userUploadPhoto/4.png");
        articleimageDao.addimage(100000004,"http://localhost:8080/upload/userUploadPhoto/5.jpg");
    }

    @Test
    public void deleteimage() {
        articleimageDao.deleteimage(100000004);
    }

    @Test
    public void getImageByAid() {
        try {
            List<Articleimage> list = articleimageDao.getImageByAid(100000004);
            for (Articleimage a:list) {
                System.out.println(a.toString());
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }

    }
}