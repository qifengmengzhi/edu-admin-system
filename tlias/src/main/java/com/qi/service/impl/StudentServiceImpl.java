package com.qi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qi.mapper.StudentMapper;
import com.qi.pojo.PageResult;
import com.qi.pojo.Student;
import com.qi.pojo.StudentQueryParam;
import com.qi.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentMapper studentMapper;

    @Override
    // 分页查询
    public PageResult<Student> page(StudentQueryParam param) {
        // 设置分页参数
        PageHelper.startPage(param.getPage(), param.getPageSize());
        List<Student> list = studentMapper.findAll(param);
        Page<Student> p = (Page<Student>) list;
        return new PageResult<>(p.getTotal(), p.getResult());

    }

    //添加 学生
    @Override
    public void save(Student student) {
        //设置创建时间和修改时间
        student.setCreateTime(LocalDateTime.now());
        student.setUpdateTime(LocalDateTime.now());
        studentMapper.save(student);

    }

    @Override
    public Student findById(Integer id) {
        return studentMapper.findById(id);
    }

    @Override
    public void update(Student student) {


        studentMapper.update(student);
    }

    @Override
    // 删除
    public void delete(List<Integer> ids) {
        studentMapper.delete(ids);
    }

    @Override
    public void violation(Integer id, Integer score) {
        //增加一次违纪次数
        //叠加违纪扣分
        studentMapper.violation(id, score);
    }
}
