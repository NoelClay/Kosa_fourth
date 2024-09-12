package com.baseleap.controller;


import com.baseleap.model.UserModel;
import com.baseleap.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequestMapping("/login")
public class UserController {


    @Autowired
    private UserService userService;

    // ==================================================
    // 로그인
    // =================================================

    //로그인 폼으로 이동한다
    @GetMapping(value = "/loginForm")
    public String loginForm() {

        log.info("loginForm()");
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
        UserModel returnUserModel = userService.login(userModel);

        // 세션 처리
        // -세션에서 id(pk) 가져오기
        if (returnUserModel != null) {
            log.info("login() :: returnUserModel = {}",returnUserModel.toString());
            session.invalidate();
            session = request.getSession();
            session.setAttribute("loginEmail", returnUserModel.getEmail());
            session.setAttribute("loginUserId", returnUserModel.getId());
            session.setAttribute("homePageId", returnUserModel.getId());
            userService.userUpdateLastLoginTime(returnUserModel.getEmail());

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
    @GetMapping(value = "/loginOut")
    public String loginOut(HttpSession session) {
        // 요청
        String loginEmail = (String) session.getAttribute("loginEmail");
        log.info("loginOut() :: loginEmail ={}", loginEmail);

        // 요청 처리
        // - 세션 삭제한다
        session.invalidate();

        return "demo";
    }

}
