package com.baseleap.controller;


import com.baseleap.model.UserModel;
import com.baseleap.service.LoginService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller

@RequestMapping("/login")
public class LoginController {


    @Autowired
    private LoginService loginService;

    // ==================================================
    // 로그인
    // =================================================

    //로그인 폼으로 이동한다
    @PostMapping(value = "/loginForm")
    public String loginForm() {
        log.info("loginForm()");
        // 세션이 있으면 그냥 바로 메인으로 가고 없으면 로그인 폼으로 이동
        return "loginForm";
    }

    // 로그인을 처리한다
    @PostMapping(value = "/login")
    public String login(
            @ModelAttribute UserModel userModel,
            HttpSession session,
            HttpServletRequest request
    ) {
        // 요청
        log.info("login() :: email = {} | password = {}", userModel.getEmail(), userModel.getPassword());

        // 요청 처리
        UserModel returnUserModel = loginService.login(userModel);


        // 세션 처리
        if (returnUserModel != null) {
            log.info("login() :: returnUserModel = {}",returnUserModel.toString());
            session.invalidate();
            session = request.getSession();
            session.setAttribute("loginUser", returnUserModel);
        }


        // 리턴
        if (returnUserModel != null) {
            return "redirect:/login/loginSuccess";
        } else {
            return "redirect:/login/loginFail";
        }
    }

    // 로그인 성공시 이동한다
    @GetMapping(value = "/loginSuccess")
    public String loginSuccess() {
        log.info("loginSuccess()");

        return "loginSuccess";
    }

    // 로그인 실패시 이동한다
    @GetMapping(value = "/loginFail")
    public String loginFail() {
        log.info("loginFail()");

        return "loginFail";
    }

    // ==================================================
    // 로그 아웃
    // =================================================

    // 로그 아웃을 처리 한다
    @PostMapping(value = "/loginOut")
    public String loginOut(HttpSession session) {
        // 요청
        UserModel userModel = (UserModel) session.getAttribute("loginUser");
        if (userModel != null) {
            log.info("loginOut() :: loginUser ={}", userModel);
        } else {
            log.info("loginOut() :: loginUser ={}", userModel);
        }
        // 요청 처리
        // - 세션 삭제한다
        session.invalidate();

        return "demo";
    }

}
