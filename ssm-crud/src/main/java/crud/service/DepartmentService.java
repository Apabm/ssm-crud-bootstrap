package crud.service;

import crud.bean.Department;
import crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Zhy
 * @create 2021-11-23 14:03
 */

@Service
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;


    public List<Department> getDepts() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }

    public Department getDeptById(Integer id) {
        Department department = departmentMapper.selectByPrimaryKey(id);
        return department;
    }
}
