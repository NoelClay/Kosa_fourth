package com.baseleap.interceptor;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

// 유저 아이디가 세션에 있는지 없는지 확인하는 인터셉터.
// 유저 아이디가 세션에 있어야 마이페이지로 들어갈 수 있습니다.
@Slf4j
public class UserIdCheckInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler
    ) throws Exception {
        HttpSession session = request.getSession(false);
        if (session != null) {
            String userId = (String) session.getAttribute("userId");
            if (userId != null) {
                // 세션이 있으면서, 유저 아이디도 포함 되어 있으면 성공.
                return true;
            }
            System.out.println(userId);
        }
        response.sendRedirect(request.getContextPath() + "/intro");
        return false;
    }
}
