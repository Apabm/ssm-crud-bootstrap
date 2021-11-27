package crud.controller;

import crud.bean.Department;
import crud.bean.Msg;
import crud.service.DepartmentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Zhy
 * @create 2021-11-23 14:01
 */

@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;


    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> list = departmentService.getDepts();
        Msg depts = Msg.success().add("depts", list);
        return depts;
    }

    @RequestMapping(value = "/depts/{dId}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getDeptById(@PathVariable Integer dId){
        Department dept = departmentService.getDeptById(dId);
        Msg msg = Msg.success().add("dept", dept);
        return msg;
    }
}
