package com.qi.filter;

import com.qi.utils.CurrentHolder;
import com.qi.utils.JwtUtils;
import io.jsonwebtoken.Claims;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
@WebFilter(urlPatterns = "/*")
@Slf4j
public class TokenFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //1.获取请求路径
        String requestURI = request.getRequestURI();
        //2.判断请求路径是否是登录路径 如果是登录路径，则放行
        if (requestURI.contains("/login")) {
            log.info("登录请求,放行");
            filterChain.doFilter(request, response);
            return;
        }


        //3.获取请求头中的token
        String token = request.getHeader("token");
        //4.判断token是否存在 如果bu存在，则返回错误信息（响应401状态码）
        if (token == null||token.isEmpty()) {
            log.info("令牌为空");
            response.setStatus(401);
            return;
        }


        //5.解析token，如果解析失败，则返回错误信息（响应401状态码）
        try {
            Claims claims = JwtUtils.parseJWT(token);
            Integer empId = Integer.valueOf(claims.get("id").toString());
            CurrentHolder.setCurrentId(empId);
            log.info("当前登录员工id:{}", empId);

        } catch (Exception e) {
            log.info("令牌非法");
            response.setStatus(401);
            return;
        }
        //6.如果解析成功，则放行
        log.info("解析成功，放行");
        filterChain.doFilter(request, response);

        //7.删除ThreadLocal中的数据
        CurrentHolder.remove();
    }


}



