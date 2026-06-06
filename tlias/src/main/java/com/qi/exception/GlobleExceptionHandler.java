package com.qi.exception;

import com.qi.pojo.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.stream.Collectors;

/*
*  全局异常处理器
* */
@Slf4j
@RestControllerAdvice
public class GlobleExceptionHandler {
    @ExceptionHandler
    public Result handle(Exception e){
        log.error("服务器发生异常: {}", e);
        return Result.error("服务器发生异常");
    }
    @ExceptionHandler
    public Result handle(DuplicateKeyException e){
        log.error("数据重复: {}", e);
        int i = e.getMessage().indexOf("Duplicate entry");

        return Result.error( e.getMessage().substring(i).split(" ")[2]+"已存在");
    }
    @ExceptionHandler
    public Result handle(MethodArgumentNotValidException e){
        String message = e.getBindingResult().getFieldErrors()
                .stream()
                .map(FieldError::getDefaultMessage)
                .collect(Collectors.joining("；"));
        log.error("参数校验失败：{}", message);
        return Result.error(message);
    }
    @ExceptionHandler
    public Result handle(LoginException e){
        log.error("登录异常: {}", e.getMessage());
        return Result.error(e.getMessage());
    }
    @ExceptionHandler
    public Result handle(UpdatePwException e){
        log.error("修改密码异常：: {}", e.getMessage());
        return Result.error(e.getMessage());
    }
}
