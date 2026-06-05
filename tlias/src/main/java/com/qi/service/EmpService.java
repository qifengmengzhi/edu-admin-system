package com.qi.service;

import com.qi.pojo.*;

import java.util.List;

public interface EmpService {
    PageResult<Emp> page(EmpQueryParam  param);


    void insert(Emp emp) throws Exception;

    void delete(Integer[] ids);

    Emp getInfo(Integer id);

    void update(Emp emp);

    List<Emp> findAll();

    LoginInfo login(LoginDTO loginDTO);
}
