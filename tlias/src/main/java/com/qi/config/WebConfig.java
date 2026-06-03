package com.qi.config;

import com.qi.intercepter.DemoIntercepter;
import com.qi.intercepter.TokenIntercepter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private DemoIntercepter demoIntercepter;
    @Autowired
    private TokenIntercepter tokenIntercepter;
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(demoIntercepter).addPathPatterns("/**");
//    }
}
