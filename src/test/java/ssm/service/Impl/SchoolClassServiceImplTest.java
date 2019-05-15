package ssm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.*;
import ssm.entity.SchoolClass;
import java.util.List;
import static org.testng.Assert.*;
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml" })
public class SchoolClassServiceImplTest extends AbstractTestNGSpringContextTests {
    @Autowired
    private SchoolClassServiceImpl schoolClassService;
    private int sid;
    private int sid1;
   // private int sid2;
    private String address;
    private int year;
    private String classname;
    private int uid;
    private String password;
    private String description;
    private String message1;
    private String message2;
    private String message3;
    private String message4;
    private String message5;
    @BeforeMethod
    @Parameters({"sid","sid1","address","year","classname","uid","password","description","message1","message2","message3","message4","message5"})
    public void setUp(int sid,int sid1,String address,int year,String classname,int uid,String password,String description,String message1,String message2,String message3,String message4,String message5)
    {
        this.sid = sid;
        this.sid1 = sid1;
        this.address=address;
        this.year=year;
        this.classname=classname;
        this.uid=uid;
        this.password=password;
        this.description=description;
        this.message1 = message1;
        this.message2 = message2;
        this.message3 = message3;
        this.message4 = message4;
        this.message5 = message5;
    }
      @Test(priority = 0)
      public void testCreateClass() {
          int res = schoolClassService.createClass(address,year,classname,uid,password,description);
          //sid2=res;
          if(res==0)
          {
              System.out.println("创建班级失败");
          }
          else {
              System.out.println(res);
          }
      }

    @Test
    public void testGetClass() {
        List<SchoolClass> list = schoolClassService.getClass(message1);
        if(list.size()==0)
        {
            System.out.println("查询不到");
        }
        else {
            for(SchoolClass schoolClass : list)
            {
                System.out.println(schoolClass.toString());
            }
        }
        list = schoolClassService.getClass(message2);
        if(list.size()==0)
        {
            System.out.println("查询不到");
        }
        else {
            for(SchoolClass schoolClass : list)
            {
                System.out.println(schoolClass.toString());
            }
        }
        list = schoolClassService.getClass(message3);
        if(list.size()==0)
        {
            System.out.println("查询不到");
        }
        else {
            for(SchoolClass schoolClass : list)
            {
                System.out.println(schoolClass.toString());
            }
        }
        list = schoolClassService.getClass(message4);
        if(list.size()==0)
        {
            System.out.println("查询不到");
        }
        else {
            for(SchoolClass schoolClass : list)
            {
                System.out.println(schoolClass.toString());
            }
        }
        list = schoolClassService.getClass(message5);
        if(list.size()==0)
        {
            System.out.println("查询不到");
        }
        else {
            for(SchoolClass schoolClass : list)
            {
                System.out.println(schoolClass.toString());
            }
        }
    }

    @Test
    public void testEditClass() {
        int res = schoolClassService.editClass(sid,address,year,classname,password,description);
        if(res==0){
            System.out.println("该数据不存在");
        }else {
            Assert.assertEquals(res,1);
            System.out.println(res);
        }
    }
    @Test
    public void testGetClassBySID() {
        SchoolClass list = schoolClassService.getClassBySID(sid1);
        if(list==null){
            System.out.println("数据库中不存在sid");
        }
        System.out.println(list.toString());
    }
    @AfterTest
    public void testDeleteClass() {
       try {
           int res = schoolClassService.deleteClass(sid1);
           System.out.println(res);
           Assert.assertEquals(res, 1);
       }catch (Exception e){
           System.out.println("删除失败");
           System.out.println(e.toString());
       }

    }

}