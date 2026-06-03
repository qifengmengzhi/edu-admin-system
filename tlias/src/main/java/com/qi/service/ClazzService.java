package com.qi.service;

import com.qi.pojo.Clazz;
import com.qi.pojo.ClazzQueryParam;
import com.qi.pojo.PageResult;

import java.util.List;

public interface ClazzService {
    PageResult<Clazz> page(ClazzQueryParam param);

    void insert(Clazz clazz);

    Clazz findById(Integer id);

    void update(Clazz clazz);

    void delete(Integer id);

    List<Clazz> findAll();
}

