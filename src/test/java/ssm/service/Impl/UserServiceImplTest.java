package ssm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
import ssm.entity.Users;
import static org.testng.Assert.*;
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml" })
public class UserServiceImplTest extends AbstractTestNGSpringContextTests {
    @Autowired
    UserServiceImpl userService;
    private int uid;
    String username;
    String telphone;
    String telphone1;
    String password;
    String password1;
    String realname;
    String sex;
    String userQQ;
    String email;
    String userwechat;
    String birthday;
    @BeforeMethod
    @Parameters({"uid","username","telphone","telphone1","password","password1","realname","sex","userQQ","email","userwechat","birthday"})
    public void setUp(int uid,String username,String telphone,String telphone1,String password,String password1, String realname, String sex, String userQQ, String email, String userwechat, String birthday)
    {
        this.uid = uid;
        this.username=username;
        this.telphone = telphone;
        this.telphone1=telphone1;
        this.password = password;
        this.password1=password1;
        this.realname=realname;
        this.sex=sex;
        this.userQQ=userQQ;
        this.email=email;
        this.userwechat=userwechat;
        this.birthday=birthday;
    }
    @Test
    public void testRegister() {
        /*int res = userService.register(username,telphone,password);
        Assert.assertEquals(res,1);*/
        int res = userService.register(username,"13016464668",password);
        Assert.assertEquals(res,-1);

    }

    @Test
    public void testLogin() {
        //手机号、密码正确
        boolean res = userService.login(telphone,password);
        Assert.assertEquals(res,true);
        //密码错误
        res = userService.login(telphone,password1);
        Assert.assertEquals(res,false);
        //密码为空
        res = userService.login(telphone,"");
        Assert.assertEquals(res,false);
        //手机号不存在
        res = userService.login(telphone1,password);
        Assert.assertEquals(res,false);
        //手机号为空
        res = userService.login("",password);
        Assert.assertEquals(res,false);
    }

    @Test
    public void testGetUserByTelphone() {
        Users users = userService.getUserByTelphone(telphone);
        System.out.println(users.toString());
        //手机号不存在
        users = userService.getUserByTelphone(telphone1);
        Assert.assertEquals(users,null);
        //手机号为空
        users = userService.getUserByTelphone("");
        Assert.assertEquals(users,null);
    }

    @Test
    public void testEditUserMessage() {
        //正常测试
        int res= userService.editUserMessage(telphone,username,realname,sex,userQQ,email,userwechat,birthday);
        Assert.assertEquals(res,1);
        //手机号不存在
        res = userService.editUserMessage(telphone1,username,realname,sex,userQQ,email,userwechat,birthday);
        Assert.assertEquals(res,0);
        //手机号为空
        res = userService.editUserMessage("",username,realname,sex,userQQ,email,userwechat,birthday);
        Assert.assertEquals(res,0);
        //数据为空
        res = userService.editUserMessage(telphone,"",realname,sex,"",email,userwechat,birthday);
        Assert.assertEquals(res,1);
    }

    @Test
    public void testUpdatePassword() {
        int res = userService.updatePassword(telphone,password1);
        Assert.assertEquals(res,1);
        System.out.println(res);
        //手机号不存在
        res = userService.updatePassword(telphone1,password);
        Assert.assertEquals(res,0);
        //手机号为空
        res = userService.updatePassword("",password);
        Assert.assertEquals(res,0);

        res = userService.updatePassword(telphone,password);
        Assert.assertEquals(res,1);
    }

    @Test
    public void testSaveUserimage() {

    }
    @Test
    public void testGetUserByUID()
    {
        try {
            Users users = userService.getUserByUID(uid);
            System.out.println(users.toString());
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }
}