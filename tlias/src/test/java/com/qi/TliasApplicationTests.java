package com.qi;

import com.qi.mapper.ClazzMapper;
import com.qi.mapper.DeptMapper;
import com.qi.mapper.EmpMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@SpringBootTest
class TliasApplicationTests {
@Autowired
private DeptMapper deptMapper;
@Autowired
private EmpMapper empMapper;
@Autowired
private ClazzMapper clazzMapper;
    @Test
    public void deleteById(){
      deptMapper.delete(1);
    }
    @Test
    public void test(){
    // empMapper.findAll().forEach(System.out::println);
        System.out.println(clazzMapper.getStudentCount(1));

    }

}
