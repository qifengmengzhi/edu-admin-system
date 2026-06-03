package com.qi.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
//@WebFilter("/*")
@Slf4j
public class DemoFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
     log.info("初始化过滤器");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        log.info("拦截到了请求");
        //放行
        filterChain.doFilter(servletRequest,servletResponse);
        log.info("放行了请求");
    }

    @Override
    public void destroy() {
        log.info("销毁过滤器");
    }
}
