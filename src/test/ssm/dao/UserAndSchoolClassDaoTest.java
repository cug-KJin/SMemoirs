package ssm.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ssm.entity.UserAndSchoolClass;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({ "classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml" })

public class UserAndSchoolClassDaoTest {
    @Autowired
    private UserAndSchoolClassDao userAndSchoolClassDao;
    @Test
    public void addClassUser() {
        userAndSchoolClassDao.addClassUser(1000000003,1000001236,1);
    }

    @Test
    public void deleteClassUser() {
        userAndSchoolClassDao.deleteClassUser(1000000002,1000001234);
    }

    @Test
    public void getBySidAndUid(){
        UserAndSchoolClass userAndSchoolClass = userAndSchoolClassDao.getBySidAndUid(1000000002,1000001241);
        System.out.println(userAndSchoolClass.toString());
    }
}