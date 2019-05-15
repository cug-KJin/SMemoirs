package ssm.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
import ssm.entity.UserAndSchoolClass;

import java.util.List;

import static org.testng.Assert.*;
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml" })
public class UserAndSchoolClassDaoTest extends AbstractTestNGSpringContextTests {
    @Autowired
    UserAndSchoolClassDao userAndSchoolClassDao;
    int uid;
    int uid1;
    int sid;
    int status1;
    int status2;
    @BeforeMethod
    @Parameters({"uid","uid1","sid","status1","status2"})
    public void setUp(int uid,int uid1,int sid,int status1,int status2)
    {
        this.uid = uid;
        this.uid1 = uid1;
        this.sid=sid;
        this.status1=status1;
        this.status2=status2;
    }
    @Test(priority = 0)
    public void addClassUser()
    {
        int res = userAndSchoolClassDao.addClassUser(uid,sid,status1);
        Assert.assertEquals(res,1);
        System.out.println(res);
        res = userAndSchoolClassDao.addClassUser(uid1,sid,status2);
        Assert.assertEquals(res,1);
        System.out.println(res);
    }
     @Test(priority = 4)
     public void deleteClassUserTest()
     {
         int res = userAndSchoolClassDao.deleteClassUser(uid,sid);
         Assert.assertEquals(res,1);
         System.out.println(res);
     }
     @Test(priority = 5)
     public void deleteClassAllUser()
     {
         int res = userAndSchoolClassDao.deleteClassAllUser(sid);
         Assert.assertEquals(res,1);
         System.out.println(res);
     }
    @Test
    public void getClassIDByUserIDTest()
    {
        try {
            List<UserAndSchoolClass> list = userAndSchoolClassDao.getClassIDByUserID(uid);
            for(UserAndSchoolClass userAndSchoolClass :list)
            {
                System.out.println(userAndSchoolClass.toString());
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }

    }
    @Test
    public void getClassIDBySidTest()
    {
        try {
            List<UserAndSchoolClass> list = userAndSchoolClassDao.getUserIDByClassID(sid);
            for (UserAndSchoolClass userAndSchoolClass : list) {
                System.out.println(userAndSchoolClass.toString());
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }
    @Test
    public void getBySidAndUidTest()
    {
        try {
            UserAndSchoolClass userAndSchoolClass = userAndSchoolClassDao.getBySidAndUid(uid, sid);
            System.out.println(userAndSchoolClass.toString());
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }
}