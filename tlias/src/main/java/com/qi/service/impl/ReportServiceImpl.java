package com.qi.service.impl;

import com.qi.mapper.ReportMapper;
import com.qi.pojo.ClazzDate;
import com.qi.pojo.JobOption;
import com.qi.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportMapper reportMapper;
    @Override
    public JobOption getEmpJobData() {
        List<Map<String, Object>> list = reportMapper.getEmpJobData();
        List<Object> jobList = list.stream().map(dataMap ->
            dataMap.get("pos")
        ).toList();
        List<Object> dataList = list.stream().map(dataMap ->
            dataMap.get("num")
        ).toList();
        return new JobOption(jobList, dataList);

    }

    @Override
    public List<Map<String, Object>> getEmpSexData() {
        return reportMapper.getEmpSexData();
    }

    @Override
    //班级学生数量统计
    public ClazzDate getStudentCountData() {
        List<Map<String, Object>> list = reportMapper.getStudentCountData();
        List<Object> classList = list.stream().map(dataMap ->
            dataMap.get("className")
        ).toList();
        List<Object> dateList = list.stream().map(dataMap ->
                dataMap.get("num")  ).toList();
        return new ClazzDate(classList, dateList);
    }

    @Override
    //学生学历统计
    public List<Map<String, Object>> getStudentDegreeData() {
        return reportMapper.getStudentDegreeData();
    }
}
