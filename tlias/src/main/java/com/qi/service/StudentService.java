package com.qi.service;

import com.qi.pojo.PageResult;
import com.qi.pojo.Student;
import com.qi.pojo.StudentQueryParam;

import java.util.List;

public interface StudentService {
    PageResult<Student> page(StudentQueryParam param);

    void save(Student student);

    Student findById(Integer id);

    void update(Student student);

    void delete(List<Integer> ids);

    void violation(Integer id, Integer score);
}
