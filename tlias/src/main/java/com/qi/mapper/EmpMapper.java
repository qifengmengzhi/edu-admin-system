package com.qi.mapper;

import com.qi.pojo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import java.util.List;

@Mapper
public interface EmpMapper {
    //分页条件查询
    List<Emp> findAll(EmpQueryParam param);

    @Options(useGeneratedKeys = true, keyProperty = "id")
    void save(Emp emp);

    void delete(Integer[] ids);

    //查询回显
    Emp getInfo(Integer id);

    void update(Emp emp);

    //登录
    LoginInfo login(LoginDTO loginDTO);

    void updatePassword(Integer empId, String newPassword);
}
