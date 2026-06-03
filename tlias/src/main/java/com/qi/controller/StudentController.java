package com.qi.controller;

import com.qi.anno.Log;
import com.qi.pojo.Result;
import com.qi.pojo.Student;
import com.qi.pojo.StudentQueryParam;
import com.qi.service.StudentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/students")
public class StudentController {
    @Autowired
    StudentService studentService;

    //条件分页查询
    @GetMapping
    public Result page(StudentQueryParam param) {
        log.info("查询参数： {}", param);
        return Result.success(studentService.page(param));
    }

    //添加学生
    @PostMapping
    @Log
    public Result save(@RequestBody Student student) {
        log.info("添加学生{}", student);
        studentService.save(student);
        return Result.success();
    }

    //根据id查询回显
    @GetMapping("/{id}")
    public Result findById(@PathVariable Integer id) {
        log.info("查询id为{}的学生", id);
        return Result.success(studentService.findById(id));
    }

    //修改学生
    @PutMapping
    @Log
    public Result update(@RequestBody Student student) {
        log.info("修改学生{}", student);
        studentService.update(student);
        return Result.success();
    }

    //删除学生
    @DeleteMapping("/{ids}")
    @Log
    public Result delete(@PathVariable List<Integer> ids) {
        log.info("删除学生{}", ids);
        studentService.delete(ids);
        return Result.success();
    }
    //违纪处理
    @PutMapping("/violation/{id}/{score}")
    public Result violation(@PathVariable Integer id,@PathVariable Integer score) {
        log.info("处理学生{}的违纪，扣{}分", id, score);
        studentService.violation(id, score);
        return Result.success();
    }

}
