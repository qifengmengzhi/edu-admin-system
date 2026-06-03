package com.qi.service;

import com.qi.pojo.Dept;

import java.util.List;

public interface DeptService {
  public List<Dept> findAll();

  void delete(Integer id);

  void insert(Dept dept);

  Dept findById(Integer id);

  void updateById(Dept dept);
}
