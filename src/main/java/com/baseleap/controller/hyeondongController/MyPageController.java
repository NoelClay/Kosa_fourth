package com.baseleap.controller.hyeondongController;

import com.baseleap.model.hyeondongModel.UserDTO;
import com.baseleap.service.hyeondongService.MyPageService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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

    @GetMapping("/follow")
    public String follow(
            HttpServletRequest request,
            Model model) {
        String stringUserId = (String) request.getSession().getAttribute("userId");
        String stringTargetId = request.getParameter("targetId");
        int userId = Integer.parseInt(stringUserId);
        int targetId = Integer.parseInt(stringTargetId);
        myPageService.followUser(userId, targetId);
        return "my-page/follow-managing";
    }

    @GetMapping("/follow-managing")
    public String followManaging(Model model) {
        model.addAttribute("userDTOList", null);
        return "my-page/follow-managing";
    }

    @PostMapping("/follow-managing/searching")
    public String userSearching(
            @RequestParam("keyword") String keyword,
            Model model) {
        log.info("keyword: {}", keyword);
        List<UserDTO> userDTOList = myPageService.getSearchingUserList(keyword);
        log.info("user list: {}", userDTOList);
        model.addAttribute("userDTOList", userDTOList);
        return "my-page/follow-managing";
    }
}
