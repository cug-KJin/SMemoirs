package ssm.service.Impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ssm.entity.SchoolClass;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({ "classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml" })

public class SchoolClassServiceImplTest {
    @Autowired
    private SchoolClassServiceImpl schoolClassService;
    @Test
    public void createClass() {
        //int a = schoolClassService.createClass("湖北省武汉市洪山区鲁磨路中国地质大学",2016,"111161",1000000003,"2016161","16级软件工程一班");
        List<SchoolClass> list1 = schoolClassService.getClass("湖北");
        List<SchoolClass> list2 = schoolClassService.getClass("111161");
        List<SchoolClass> list3 = schoolClassService.getClass("1000001234");
        SchoolClass schoolClass = schoolClassService.getClassBySID(1000001234);
        System.out.println(schoolClass.toString());
    }

    @Test
    public void editClass() {
    }

    @Test
    public void deleteClass() {
    }
}