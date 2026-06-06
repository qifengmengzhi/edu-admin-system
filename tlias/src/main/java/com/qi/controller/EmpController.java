package com.qi.controller;

import com.qi.anno.Log;
import com.qi.pojo.Emp;
import com.qi.pojo.EmpExpr;
import com.qi.pojo.EmpQueryParam;
import com.qi.pojo.Result;
import com.qi.service.EmpService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.validation.annotation.Validated;
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
    public Result page(@Validated EmpQueryParam param) {
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
    public Result insert(@Valid @RequestBody Emp emp) throws Exception {
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
    public Result update(@Valid @RequestBody Emp emp){
        log.info("修改员工{}", emp);
        empService.update(emp);
        return Result.success();

    }
    //修改员工密码
    @PostMapping("updatePassword")
    public Result updatePassword(
            @NotBlank(message = "旧密码不能为空")
            @RequestParam String oldPassword,
            @NotBlank(message = "新密码不能为空")
            @Size(min = 6,max = 16,message = "新密码长度6~16位")
            @RequestParam String newPassword){
        log.info("修改密码");
      empService.updatePassword(oldPassword,newPassword);

     return Result.success();
    }

}
