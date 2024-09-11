package com.baseleap.controller;

import com.baseleap.model.UserDTO;
import com.baseleap.service.MyPageService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping(value = "/my-page")
public class MyPageController {
    @Autowired
    private MyPageService myPageService;

    @GetMapping("/info")
    public String myPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return "redirect:/intro";
        }
        log.info("session id: {}", session.getId());
        String stringUserId = (String) session.getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        UserDTO userInfo = myPageService.getUserInfoById(userId);
        model.addAttribute("userInfo", userInfo);
        log.info("user info: {}", userInfo);
        return "my-page/info";
    }
}
