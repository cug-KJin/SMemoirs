package ssm.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ssm.entity.Users;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({ "classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml" })
public class UsersDaoTest {
    @Autowired
    private UsersDao usersDao;
    @Test
    public void registerUser() {
        System.out.println("Test register result:"+usersDao.registerUser("123","123456","13016464646"));
    }

    @Test
    public void getUserByTelphone() {
        System.out.println("getUserByTelphone:"+usersDao.getUserByTelphone("13016464646").toString());
    }

    @Test
    public void checkLogin() {
        //System.out.println("the false Login:"+usersDao.checkLogin("13016464655","123456").toString());
        System.out.println("the true Login:"+usersDao.checkLogin("13016464646","123456").toString());
    }

    @Test
    public void updatePassword() {
        System.out.println("updatePass:"+usersDao.updatePassword("13016464646","123123"));
    }

    @Test
    public void editUserMessage() {
    }
}