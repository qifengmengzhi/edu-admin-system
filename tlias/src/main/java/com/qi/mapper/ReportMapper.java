package com.qi.mapper;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReportMapper {
    /**
     * 统计各个职位的员工人数
     */
    @MapKey("pos")
    List<Map<String, Object>> getEmpJobData();
    @MapKey("name")
    List<Map<String, Object>> getEmpSexData();
@MapKey("className")
    List<Map<String, Object>> getStudentCountData();
@MapKey("name")
    List<Map<String, Object>> getStudentDegreeData();
}
