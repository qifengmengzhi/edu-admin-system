package com.qi.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Slf4j
@Aspect
@Component
public class RecordTimeAspect {
    // @Around("execution(* com.qi.service.impl.DeptServiceImpl.*(..))")
    //@Around("@annotation(com.qi.anno.LogOperation)")
   /* @Around("execution(* com.qi.controller.*.save(..))"
            + "||execution(* com.qi.controller.*.update(..))||"
            + "execution(* com.qi.controller.*.delete(..))||"
            + "execution(* com.qi.controller.*.insert(..))")*/
    public Object recordTime(ProceedingJoinPoint pjp) throws Throwable {
        //记录方法执行开始时间
        long begin = System.currentTimeMillis();

        //执行原始方法
        Object result = pjp.proceed();

        //记录方法执行结束时间
        long end = System.currentTimeMillis();

        //计算方法执行耗时
        log.info("方法执行耗时: {}毫秒", end - begin);
        return result;
    }

}
