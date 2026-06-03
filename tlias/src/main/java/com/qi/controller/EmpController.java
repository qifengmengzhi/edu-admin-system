package com.qi.controller;

import com.qi.anno.Log;
import com.qi.pojo.Emp;
import com.qi.pojo.EmpExpr;
import com.qi.pojo.EmpQueryParam;
import com.qi.pojo.Result;
import com.qi.service.EmpService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.regex.Pattern;

@Slf4j
@RequestMapping("/emps")
@RestController
public class EmpController {
    @Autowired
    private EmpService empService;

    //分页条件查询
    @GetMapping
    public Result page(EmpQueryParam param) {
        log.info("查询请求参数： {}", param);
        return Result.success(empService.page(param));
    }
    @GetMapping("/list")
    //查询所有员工信息
    public Result findAll(){
        log.info("查询所有员工信息");
        return Result.success(empService.findAll());
    }
    //添加员工
    @PostMapping
    @Log
    public Result insert(@RequestBody Emp emp) throws Exception {
        log.info("添加员工{}", emp);

        empService.insert(emp);
        return Result.success();
    }

    //删除员工
    @DeleteMapping
    @Log
    public Result delete(Integer[] ids) {
        log.info("删除员工{}", ids);
        empService.delete(ids);
        return Result.success();
    }

    //查询回显
    @GetMapping("/{id}")
    public Result findById(@PathVariable Integer id) {
        log.info("查询id为{}的员工", id);
        return Result.success(empService.getInfo(id));
    }
    //修改员工
    @PutMapping
    @Log
    public Result update(@RequestBody Emp emp){
        log.info("修改员工{}", emp);
        empService.update(emp);
        return Result.success();

    }

}
