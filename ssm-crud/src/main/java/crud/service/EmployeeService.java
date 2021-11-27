package crud.service;

import crud.bean.Employee;
import crud.bean.EmployeeExample;
import crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;

/**
 * @author Zhy
 * @create 2021-11-22 14:44
 */

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;


    public List<Employee> getAll() {
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        return employees;
    }

    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    /*检查用户名是否重复*/
    public boolean checkUser(String empName) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(employeeExample);
        if(count == 0){
            return true;
        }else{
            return false;
        }
    }

    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> split) {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(split);
        employeeMapper.deleteByExample(employeeExample);
    }
}
