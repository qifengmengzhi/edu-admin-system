package com.qi.mapper;

import com.qi.pojo.EmpExpr;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EmpExprMapper {

    void insert(List<EmpExpr> exprList);

    void delete(Integer[] ids);
}
