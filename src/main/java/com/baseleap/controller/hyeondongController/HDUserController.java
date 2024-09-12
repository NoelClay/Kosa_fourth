package com.baseleap.controller.hyeondongController;

import com.baseleap.model.hyeondongModel.UserDTO;
import com.baseleap.service.hyeondongService.HDUserService;
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

import java.util.HashMap;

@Slf4j
@Controller
@RequestMapping(value = "/user")
public class HDUserController {
    @Autowired
    private HDUserService HDUserService;

    @GetMapping("/test-login")
    public String testLogin() {
        return "user/test-login";
    }

    @PostMapping("/test-login")
    public String testLogin(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpServletRequest request,
            Model model
    ) {
        UserDTO userDTO = HDUserService.getUserByEmail(email);
        if (userDTO == null || !userDTO.getPassword().equals(password)) {
            model.addAttribute("error", "Wrong password");
            return "user/test-login";
        }
        HttpSession session = request.getSession();
        session.setAttribute("userId", userDTO.getId());
        return "redirect:/my-page/info";
    }

    @GetMapping("/test-signup")
    public String testSignup() {
        return "user/test-signup";
    }

    @PostMapping("/test-signup")
    public String testSignup(@RequestParam HashMap<String, String> paramMap) {
        HDUserService.createUser(paramMap);
        return "redirect:/user/test-login";
    }
}
