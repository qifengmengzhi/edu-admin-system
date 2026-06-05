package com.qi.controller;

import com.qi.pojo.Emp;
import com.qi.pojo.LoginDTO;
import com.qi.pojo.LoginInfo;
import com.qi.pojo.Result;
import com.qi.service.EmpService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
@Slf4j
@RestController
public class LoginController {
    @Autowired
    private EmpService empService;
    //员工登录
    @PostMapping("/login")
    public Result login(@Valid @RequestBody LoginDTO loginDTO) {
        log.info("员工登录:{}", loginDTO);
        LoginInfo loginInfo= empService.login(loginDTO);
        if(loginInfo != null){
            log.info("登录成功:{}", loginInfo);
            return Result.success(loginInfo);
        }

        return Result.error("用户名或密码错误");
    }
}
