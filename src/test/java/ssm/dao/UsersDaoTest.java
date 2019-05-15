package ssm.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.*;
import ssm.dao.UsersDao;
import ssm.entity.Users;
import static org.testng.Assert.*;
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml" })
public class UsersDaoTest extends AbstractTestNGSpringContextTests {
    @Autowired
    private UsersDao usersDao;
    private int uid;
    private String userName;
    private String passWord ;
    private String passWord1;
    private String telphone ;
    @BeforeMethod
    @Parameters({"uid","userName","passWord","passWord1","telphone"})
    public void setUp(int uid,String userName,String passWord,String passWord1,String telphone) {
        this.uid = uid;
        this.userName = userName;
        this.telphone = telphone;
        this.passWord = passWord;
        this.passWord1 = passWord1;
    }
    /*@Test
    public void registerUser() {
        int res = usersDao.registerUser(userName,passWord,telphone);
        Assert.assertEquals(res,1);
    }*/
    @Test
    public void getUserByTelphone() {
        try {
            Users users = usersDao.getUserByTelphone(telphone);
            System.out.println(users.toString());
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }

    @Test
    public void checkLogin() {
        Users users = usersDao.checkLogin(telphone,passWord);
        System.out.println(users.toString());
    }

    @Test
    public void updatePassword() {
        int res = usersDao.updatePassword(telphone,passWord1);
        Assert.assertEquals(res,1);
        System.out.println(res);
        usersDao.updatePassword(telphone,passWord);
    }

    @Test
    public void editUserMessage() {
        String realname="hahazhang";
        String userQQ="1621997090";
        String sex="男";
        String email ="1621997090@qq.com";
        String userwechat="zzt13016464668";
        String birthday="19970522";
        int res = usersDao.editUserMessage(telphone,userName,realname,sex,userQQ,email,userwechat,birthday);
        Assert.assertEquals(1,res);
        System.out.println(res);
    }
    @Test
    public  void getUserByUID()
    {
        try {
            Users users = usersDao.getUserByUID(uid);
            System.out.println(users.toString());
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }

    }
}