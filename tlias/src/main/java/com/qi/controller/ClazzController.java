package com.qi.controller;

import com.qi.anno.Log;
import com.qi.pojo.Clazz;
import com.qi.pojo.ClazzQueryParam;
import com.qi.pojo.Result;
import com.qi.service.ClazzService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RequestMapping("/clazzs")
@RestController
public class ClazzController {
    @Autowired
    private ClazzService clazzService;
    //查询所有班级
    @GetMapping("/list")
    public Result findAll(){
        log.info("查询所有班级");
        return Result.success(clazzService.findAll());
    }
    //条件分页查询班级列表
    @GetMapping
    public Result page(@Validated ClazzQueryParam  param){
       log.info("查询班级： {}", param);
        return Result.success(clazzService.page( param));
    }
    //添加班级
    @PostMapping
    @Log
    public Result insert(@Valid @RequestBody Clazz clazz){
        log.info("添加班级{}", clazz);
        clazzService.insert(clazz);
        return Result.success();
    }
    //根据id查询回显
    @GetMapping("/{id}")
    public Result findById(@PathVariable Integer id){
        log.info("查询id为{}的班级", id);
        return Result.success(clazzService.findById(id));
    }
    //修改班级
    @PutMapping
    @Log
    public Result update(@Valid @RequestBody Clazz clazz){
        log.info("修改班级{}", clazz);
        clazzService.update(clazz);
        return Result.success();
    }
    //删除班级

    @DeleteMapping("/{id}")
    @Log    public Result delete(@PathVariable Integer id){
        log.info("删除班级{}", id);
        clazzService.delete(id);
        return Result.success();

    }
}
