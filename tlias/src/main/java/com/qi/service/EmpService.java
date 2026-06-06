package com.qi.service;

import com.qi.pojo.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import java.util.List;

public interface EmpService {
    PageResult<Emp> page(EmpQueryParam  param);


    void insert(Emp emp) throws Exception;

    void delete(Integer[] ids);

    Emp getInfo(Integer id);

    void update(Emp emp);

    List<Emp> findAll();

    LoginInfo login(LoginDTO loginDTO);

    void updatePassword(@NotBlank(message = "旧密码不能为空") String oldPassword, @NotBlank(message = "新密码不能为空") @Size(min = 6,max = 16,message = "新密码长度6~16位") String newPassword);
}
