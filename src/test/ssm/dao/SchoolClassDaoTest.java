package ssm.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ssm.entity.SchoolClass;
import ssm.entity.Users;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({ "classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml" })
public class SchoolClassDaoTest {
    @Autowired
    private SchoolClassDao schoolClassDao;
    @Test
    public void createClass() {
        SchoolClass schoolClass = new SchoolClass("湖北省武汉市洪山区鲁磨路中国地质大学",2017,"111171",1000000003,"2016161","16级软件工程一班");
        System.out.println("create SchoolClasscount:"+schoolClassDao.createClass(schoolClass));
        System.out.println(schoolClass.toString());
    }

    @Test
    public void getClassByClassname() {
        List<SchoolClass> list = schoolClassDao.getClassByAddress("鲁磨路");
        System.out.println(1);
        SchoolClass schoolClass = schoolClassDao.getClassBySID(1000001234);
        System.out.println(schoolClass.toString());
    }
}