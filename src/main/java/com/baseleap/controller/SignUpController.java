package com.baseleap.controller;

import com.baseleap.model.UserModel;

import com.baseleap.model.hyeondongModel.UserDTO;
import com.baseleap.service.SignUpService;
import com.baseleap.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Slf4j
@RequestMapping("/signup")
public class SignUpController {

    @Autowired
    private SignUpService signUpService;

    @Autowired
    private UserService userService;

    // 회원 가입 폼으로 이동
    @GetMapping(value = "/signUpForm")
    public String signUpForm() {
        log.info("signUpForm()");

        return "signUpFormPage";
    }

    //회원 가입을 처리 한다
    @PostMapping(value = "/signup")
    public String signup( @ModelAttribute UserModel userModel ) {
        // 요청
        log.info("signup() :: userModel.getCreatedTime = {} ",userModel.toString());

        // 요청 처리
        // - 회원 정보를 저장
        // 중복 이메일 예외처리 해야함
        UserModel returnUserEmail = signUpService.getUserByEmail(userModel.getEmail());
        log.info("signup() :: userModel.returnUserModel = {} ",returnUserEmail);
        if (returnUserEmail == null) {
            int returnCnt = signUpService.signUp(userModel);
            log.info("signup() :: returnCnt = {} ",returnCnt);
            return "redirect:/signup/signUpSuccess";
        }else {
            return "redirect:/signup/signUpFail";
        }

    }

    // 회원 가입 성공(메인 화면)화면으로 이동
    @GetMapping(value = "/signUpSuccess")
    public String loginSuccess() {
        log.info("signUpSuccess()");

        return "demo";
    }

    // 회원 가입 실패 화면으로 이동
    @GetMapping(value = "/signUpFail")
    public String signUpFail(){
        log.info("signUpFail()");

        return  "signUpFail";
    }
}
