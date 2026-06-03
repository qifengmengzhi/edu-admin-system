package com.qi.service;

import com.qi.pojo.ClazzDate;
import com.qi.pojo.JobOption;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface ReportService {
    JobOption getEmpJobData();

    List<Map<String,Object>> getEmpSexData();

    ClazzDate getStudentCountData();

    List<Map<String,Object>> getStudentDegreeData();
}
