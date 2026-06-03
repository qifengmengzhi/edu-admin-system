package com.qi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qi.exception.DeleteException;
import com.qi.mapper.ClazzMapper;
import com.qi.pojo.Clazz;
import com.qi.pojo.ClazzQueryParam;
import com.qi.pojo.PageResult;
import com.qi.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class ClazzServiceImpl implements ClazzService {
    @Autowired
    ClazzMapper ClazzMapper;

    public PageResult<Clazz> page(ClazzQueryParam param) {
        //设置分页参数
        PageHelper.startPage(param.getPage(), param.getPageSize());
        //获取所有班级列表
        List<Clazz> list = ClazzMapper.findAll(param);
        //设置班级状态

        list.forEach(clazz -> {
            String status;
            LocalDate now = LocalDate.now();
            if (now.isBefore(clazz.getBeginDate()))
                status = "未开班";
            else if (now.isAfter(clazz.getEndDate()))
                status = "已结课";
            else
                status = "在读";
            clazz.setStatus(status);
        });
        Page<Clazz> p = (Page<Clazz>) list;

        return new PageResult<>(p.getTotal(), p.getResult());
    }

    @Override
    public void insert(Clazz clazz) {
        //设置创建时间和修改时间
        clazz.setCreateTime(LocalDateTime.now());
        clazz.setUpdateTime(LocalDateTime.now());
        ClazzMapper.insert(clazz);
    }

    @Override
    public Clazz findById(Integer id) {
        return ClazzMapper.findById(id);
    }

    @Override
    public void update(Clazz clazz) {

        ClazzMapper.update(clazz);
    }

    @Override
    public void delete(Integer id) {
        // 1.查看该id对应的班级中有没有学生
        if (ClazzMapper.getStudentCount(id) != 0) {
            // 2.有 抛异常
            throw new DeleteException("对不起, 该班级下有学生, 不能直接删除");

        } else {
            //3. 无  删除班级
            ClazzMapper.delete(id);
        }


    }

    //获取所有班级
    @Override
    public List<Clazz> findAll() {
        return ClazzMapper.findAll(new ClazzQueryParam());
    }
}
