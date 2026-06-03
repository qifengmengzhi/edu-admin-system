package com.qi.mapper;

import com.qi.pojo.Dept;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DeptMapper {
    // 查询所有部门

    @Select("select id, name, create_time, update_time from dept order by update_time")
    public List<Dept> findAll();

    // 删除部门
    @Delete("delete from dept where id=#{id}")
    void delete(Integer id);

    // 添加部门
    @Insert("insert into dept(name,create_time,update_time) values(#{name},#{createTime},#{updateTime})")
    void insert(Dept dept);

    // 通过id查询部门
    @Select("select id, name, create_time, update_time from dept where id=#{id}")
    Dept findById(Integer id);

    // 更新部门
    @Update("update dept set name=#{name},update_time=#{updateTime} where id=#{id}")
    void updateById(Dept dept);

    @Select("select count(*) from emp where dept_id=#{id}")
    int getEmpCount(Integer id);
}
