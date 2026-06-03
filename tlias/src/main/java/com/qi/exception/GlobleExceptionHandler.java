package com.qi.exception;

import com.qi.pojo.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

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
        log.error("服务器发生异常: {}", e);
        int i = e.getMessage().indexOf("Duplicate entry");

        return Result.error( e.getMessage().substring(i).split(" ")[2]+"已存在");
    }
    @ExceptionHandler
    public Result handle(DeleteException e){
        log.error("删除异常：{}", e);
        return Result.error(e.getMessage());
    }
}
