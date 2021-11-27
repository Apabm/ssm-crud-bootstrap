package crud.test;


import crud.bean.Department;
import crud.bean.Employee;
import crud.dao.DepartmentMapper;
import crud.dao.EmployeeMapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * 测试Dao层
 *
 * @author Zhy
 * @create 2021-11-21 20:15
 * 导入SpringTest模块
 * @ContextConfiguration指定Spring配置文件的位置
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;


    @Test
    public void testCRUD() {
        System.out.println(departmentMapper);
        /*departmentMapper.insert(new Department(null,"开发部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));*/

        //employeeMapper.insert(new Employee(null,"Jerry","M","Jerry@gmail",1));

        /*for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0,5) + i;
            employeeMapper.insert(new Employee(null,uid,"M",uid +"@gmail",1));
        }*/
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        for(Employee e:employees){
            System.out.println(e);
        }
    }

}
