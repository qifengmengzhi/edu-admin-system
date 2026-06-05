package com.qi.controller;

import com.qi.anno.Log;
import com.qi.pojo.Dept;
import com.qi.pojo.Result;
import com.qi.service.DeptService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
@Slf4j
@RequestMapping("/depts")
@RestController
public class DeptController {

    @Autowired
    private DeptService deptService;
    //查询所有部门
    @GetMapping
    public Result findAll(){
        log.info("查询所有部门");
        return Result.success(deptService.findAll());
    }
    //删除部门
    @DeleteMapping
    @Log
    public Result delete( Integer id){
        if (id == null) {
            return Result.error("部门ID不能为空");
        }
        log.info("删除id为{}的部门", id);
      deptService.delete(id);
        return Result.success();

    }
    //添加部门
    @PostMapping
    @Log
    public Result insert(@RequestBody @Valid Dept dept){
        log.info("添加部门{}", dept);
        deptService.insert(dept);
        return Result.success();
    }
    //查询回显
    @GetMapping("/{id}")
    public Result findById(@PathVariable  Integer id){
        log.info("查询id为{}的部门", id);
        return Result.success(deptService.findById(id));
    }
    //修改部门
    @PutMapping
    @Log
    public Result update(@RequestBody @Valid Dept dept){
        log.info("修改部门{}", dept);
        deptService.updateById(dept);
        return Result.success();
    }
}
