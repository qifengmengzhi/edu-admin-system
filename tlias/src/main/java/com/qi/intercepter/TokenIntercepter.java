package com.qi.intercepter;

import com.qi.utils.JwtUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
@Slf4j
@Component
public class TokenIntercepter implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1.获取请求路径
        String requestURI = request.getRequestURI();
        //2.判断请求路径是否是登录路径 如果是登录路径，则放行
        if (requestURI.contains("/login")) {
            log.info("登录请求,放行");

            return  true;
        }


        //3.获取请求头中的token
        String token = request.getHeader("token");
        //4.判断token是否存在 如果不存在，则返回错误信息（响应401状态码）
        if (token == null||token.isEmpty()) {
            log.info("令牌为空");
            response.setStatus(401);
            return  false;
        }


        //5.解析token，如果解析失败，则返回错误信息（响应401状态码）
        try {
            JwtUtils.parseJWT(token);
        } catch (Exception e) {
            log.info("令牌非法");
            response.setStatus(401);
            return  false;
        }
        //6.如果解析成功，则放行
        log.info("解析成功，放行");
       return true;
    }
}
