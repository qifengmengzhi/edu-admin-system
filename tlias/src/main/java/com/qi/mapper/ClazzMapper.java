package com.qi.mapper;

import com.qi.pojo.Clazz;
import com.qi.pojo.ClazzQueryParam;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClazzMapper {
    List<Clazz> findAll(ClazzQueryParam param);

    void insert(Clazz clazz);

    Clazz findById(Integer id);

    void update(Clazz clazz);

    void delete(Integer id);

    int getStudentCount(Integer id);
}
