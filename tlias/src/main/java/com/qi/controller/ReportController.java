package com.qi.controller;

import com.qi.pojo.Result;
import com.qi.service.ReportService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/report")
public class ReportController {
    @Autowired
    private ReportService reportService;
    @GetMapping("/empJobData")
    public Result getEmpJobData(){
        log.info("统计各个职位的员工人数");
        return Result.success( reportService.getEmpJobData());
    }
    @GetMapping("/empGenderData")
    public Result getEmpSexData(){
        log.info("统计各个性别的员工人数");
        return Result.success( reportService.getEmpSexData());
    }
    //班级学生数量统计
    @GetMapping("/studentCountData")
    public Result getStudentCountData(){
        log.info("统计各个班级的学生人数");
        return Result.success( reportService.getStudentCountData());
    }
    //学生学历统计
    @GetMapping("/studentDegreeData")
    public Result getStudentDegreeData(){
        log.info("统计各个学历的学生人数");
        return Result.success( reportService.getStudentDegreeData());
    }
}
