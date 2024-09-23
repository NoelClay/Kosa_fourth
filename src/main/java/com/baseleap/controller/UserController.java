package com.baseleap.controller;


import com.baseleap.model.LoginResponseDto;
import com.baseleap.model.UserModel;
import com.baseleap.model.hyeondongModel.UserDTO;
import com.baseleap.service.UserService;
import com.baseleap.service.hyeondongService.HDUserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baseleap.service.hyeondongService.HDUserService;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/loginMain")
public class UserController {

    @Autowired
    private HDUserService HDUserService; // 현동 추가

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

    // map
    // 로그인을 처리한다
    @PostMapping(value = "/login")
    @ResponseBody
    public Map<String,Integer> login(
            @RequestBody UserModel userModel,
            HttpSession session,
            HttpServletRequest request
    ) {
        // 요청
        log.info("login() :: email = {} | password = {}", userModel.getEmail(), userModel.getPassword());

        // 요청 처리
        Map<String, Integer> loginMap = new HashMap<>();
        UserModel returnUserModel = userService.login(userModel);
        UserDTO userDTO = HDUserService.getUserByEmail(userModel.getEmail()); // 현동 추가.
        try {
            // 세션 처리
            // -세션에서 id(pk) 가져오기
            if (returnUserModel != null) {
                loginMap.put("success",1);
                log.info("login() :: returnUserModel = {}", returnUserModel.toString());
                session.invalidate();
                session = request.getSession();
                session.setAttribute("loginEmail", returnUserModel.getEmail());
                session.setAttribute("loginUserId", returnUserModel.getId());
                session.setAttribute("userId", userDTO.getId()); // 현동 추가.
                session.setAttribute("homePageId", returnUserModel.getId());
                session.setAttribute("nickName", returnUserModel.getNickName());
                userService.userUpdateLastLoginTime(returnUserModel.getEmail());
                return loginMap;
            } else {
                loginMap.put("success",0);
                log.info("login() :: loginFaild");
                return loginMap;
            }
        }catch (Exception e) {
            return loginMap;
        }

//        // 리턴
//        if (returnUserModel != null) {
//
//            return "redirect:/login/loginSuccess";
//        } else {
//            return "redirect:/login/loginFail";
//        }
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

//      return "redirect:/demo";
        return "redirect:/intro";
    }

}
