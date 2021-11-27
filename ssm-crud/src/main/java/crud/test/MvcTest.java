package crud.test;

import com.github.pagehelper.PageInfo;
import crud.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.DefaultMockMvcBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @author Zhy
 * @create 2021-11-22 15:06
 */
/*可以把WEB的IOC容器给传进来*/
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springMVC.xml"})
public class MvcTest {

    /*传入SpringMvc的IOC容器*/
    @Autowired
    WebApplicationContext webApplicationContext;

    MockMvc mockMvc;

    /*每次调用之前都需要初始化*/
    @Before
    public void initMockMvc(){
        mockMvc  = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    public void testPage() throws Exception {
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","1")).andReturn();
        PageInfo pageInfo = (PageInfo) mvcResult.getRequest().getAttribute("pageInfo");
        List<Employee> list = pageInfo.getList();
        for(Employee e:list){
            System.out.println(e.getEmpName());
        }
    }
}
