package com.qi.service.impl;

import com.qi.exception.DeleteException;
import com.qi.mapper.DeptMapper;
import com.qi.pojo.Dept;
import com.qi.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptMapper deptMapper;
    @Override
    public List<Dept> findAll() {
        return deptMapper.findAll() ;
    }

    @Override
    public void delete(Integer id) {
        //查看该部门下是否有员工
        if (deptMapper.getEmpCount(id) != 0) {
            throw new DeleteException("对不起, 该部门下有员工, 不能直接删除");
        }else
        {
            deptMapper.delete(id);
        }



    }

    @Override
    public void insert(Dept dept) {
        //补全基础属性
        dept.setCreateTime(LocalDateTime.now());
        dept.setUpdateTime(LocalDateTime.now());
        deptMapper.insert(dept);
    }

    @Override
    public Dept findById(Integer id) {
        return deptMapper.findById(id);
    }

    @Override
    public void updateById(Dept dept) {
        //设置修改时间
        dept.setUpdateTime(LocalDateTime.now());
        deptMapper.updateById(dept);
    }
}
