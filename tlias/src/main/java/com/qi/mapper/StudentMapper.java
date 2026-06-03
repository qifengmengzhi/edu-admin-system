package com.qi.mapper;

import com.qi.pojo.Student;
import com.qi.pojo.StudentQueryParam;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StudentMapper {
    List<Student> findAll(StudentQueryParam param);

    void save(Student student);

    Student findById(Integer id);

    void update(Student student);

    void delete(List<Integer> ids);

    void violation(Integer id, Integer score);
}
