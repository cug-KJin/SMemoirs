import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;

/**
 * 配置spring和testNG整合，junit启动时加载springIOC容器 spring-test,TestNG
 */
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml" })
public class BaseTest extends AbstractTestNGSpringContextTests {
}
