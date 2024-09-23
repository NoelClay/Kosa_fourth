package com.baseleap.controller.hyeondongController;

import com.baseleap.model.hyeondongModel.FollowDTO;
import com.baseleap.model.hyeondongModel.UserDTO;
import com.baseleap.model.hyeondongModel.UserFollowStatus;
import com.baseleap.service.hyeondongService.AlarmService;
import com.baseleap.service.hyeondongService.MyPageService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping(value = "/baseleap/my-page")
public class MyPageController {
    @Autowired
    private MyPageService myPageService;

    @GetMapping("/info")
    public String myPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        String stringUserId = (String) session.getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        UserDTO userInfo = myPageService.getUserInfoById(userId);
        model.addAttribute("userInfo", userInfo);
        return "my-page/info";
    }

    @GetMapping("/new-messages")
    public String newMessages() {
        return "redirect:/baseleap/message/new-messages";
    }

    @GetMapping("/all-messages")
    public String allMessages() {
        return "redirect:/baseleap/message/all-messages";
    }
}
