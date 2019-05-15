package ssm.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
import ssm.entity.SchoolClass;
import java.util.List;
import static org.testng.Assert.*;
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml" })
public class SchoolClassDaoTest extends AbstractTestNGSpringContextTests {
    @Autowired
    SchoolClassDao schoolClassDao ;
    int sid;
    int sid1;
    String address;
    int year;
    String classname;
    int uid;
    String password;
    String description;
    @BeforeMethod
    @Parameters({"sid","sid1","address","year","classname","uid","password","description"})
    public void setUp(int sid,int sid1,String address,int year,String classname,int uid,String password,String description) {
        this.sid = sid;
        this.sid1 = sid1;
        this.address = address;
        this.year = year;
        this.classname = classname;
        this.uid = uid;
        this.password = password;
        this.description = description;
    }
     @Test(priority = 0)
     public void createClassTest()
     {
         SchoolClass schoolClass = new SchoolClass(address,year,classname,uid,password,description);
         int res = schoolClassDao.createClass(schoolClass);
         Assert.assertEquals(res,1);
     }
    @Test
    public void getClassByAddressTest()
    {
        try {
            List<SchoolClass> list = schoolClassDao.getClassByAddress(address);
            for (SchoolClass s : list) {
                System.out.println(s.toString());
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }
    @Test
    public void getClassByClassnameTest()
    {
        try {
            List<SchoolClass> list = schoolClassDao.getClassByClassname(classname);
            for (SchoolClass s : list) {
                System.out.println(s.toString());
            }
        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
    }
    @Test
    public void getClassBySIDTest()
    {
        try {
            SchoolClass schoolClass = schoolClassDao.getClassBySID(sid1);
            System.out.println(schoolClass.toString());
        }catch (NullPointerException e)
        {
            System.out.println(e.toString());
        }
    }
    @Test
    public void EditClassTest()
    {
        int res = schoolClassDao.EditClass(sid1,address,year,classname,password,description);
        Assert.assertEquals(res,1);
    }
    @Test(priority = 5)
    public void deleteClassBySidTest()
    {
        try {
            int res = schoolClassDao.DeleteClassBySID(sid);
            System.out.println(res);
        }catch (Exception e){
            System.out.println("删除失败");
            System.out.println(e.toString());
        }

    }
}