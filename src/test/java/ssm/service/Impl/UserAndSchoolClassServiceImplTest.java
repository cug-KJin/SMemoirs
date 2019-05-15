package ssm.service.Impl;

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
public class UserAndSchoolClassServiceImplTest extends AbstractTestNGSpringContextTests {

    @Autowired
    private UserAndSchoolClassServiceImpl userAndSchoolClassService;
    private int sid;
    private int sid1;
    private int uid;
    private int uid1;
    private int status1;
    private int status2;
    private String password;
    private String password1;
    @BeforeMethod
    @Parameters({"sid","sid1","uid","uid1","status1","status2","password","password1"})
    public void setUp(int sid,int sid1,int uid,int uid1,int status1,int status2,String password,String password1)
    {
        this.sid = sid;
        this.sid1 = sid1;
        this.uid = uid;
        this.uid1 = uid1;
        this.status1 = status1;
        this.status2 = status2;
        this.password = password;
        this.password1 = password1;
    }
    @Test(priority = 0)
    public void testAddClassUser() {
        //正确操作
        int res = userAndSchoolClassService.addClassUser(uid,sid,status1,password);
        Assert.assertEquals(res,1);
        System.out.println(res);
        //班级密码匹配错误
        res = userAndSchoolClassService.addClassUser(uid,sid,status1,password1);
        Assert.assertEquals(res,-1);
        System.out.println(res);
        //该账号已创建该班级
        res = userAndSchoolClassService.addClassUser(uid,sid1,status2,password);
        Assert.assertEquals(res,-2);
        System.out.println(res);
        //添加一个无关sid，为了避免后面删除所有属于sid的班级为null
        userAndSchoolClassService.addClassUser(uid1,sid,status1,password);
    }
    @Test
    public void testGetClassIDByUserID() {
        try {
            List<UserAndSchoolClass> list = userAndSchoolClassService.getClassIDByUserID(uid);
            for (UserAndSchoolClass userAndSchoolClass : list) {
                System.out.println(userAndSchoolClass);
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }
    @Test
    public void testGetUserIDByClassID() {
        try {
            List<UserAndSchoolClass> list = userAndSchoolClassService.getUserIDByClassID(sid);
            for (UserAndSchoolClass userAndSchoolClass : list) {
                System.out.println(userAndSchoolClass);
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }
    @Test
    public void testGetBySidAndUid() {
        try {
            UserAndSchoolClass userAndSchoolClass = userAndSchoolClassService.getBySidAndUid(uid, sid);
            System.out.println(userAndSchoolClass.toString());
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }

    @Test(priority = 4)
    public void testDeleteClassUser() {
        int res = userAndSchoolClassService.deleteClassUser(uid,sid);
        Assert.assertEquals(res,1);
    }

    @Test(priority = 5)
    public void testDeleteClassAllUser() {
        int res = userAndSchoolClassService.deleteClassAllUser(sid);
        System.out.println(res);
    }
}