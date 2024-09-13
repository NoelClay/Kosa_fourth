package com.baseleap.common.config;


import com.baseleap.interceptor.UserIdCheckInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(userIdCheckInterceptor())
                .addPathPatterns("/my-page/**");
    }

    @Bean
    public UserIdCheckInterceptor userIdCheckInterceptor() {
        return new UserIdCheckInterceptor();
    }
}
