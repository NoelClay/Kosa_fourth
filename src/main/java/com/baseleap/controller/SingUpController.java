package com.baseleap.controller;

import com.baseleap.model.UserModel;

import com.baseleap.service.SignUpService;
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
public class SingUpController {

    @Autowired
    private SignUpService signUpService;

    // 회원 가입 폼으로 이동
    @GetMapping(value = "/signUpForm")
    public String signUpForm() {
        log.info("signUpForm()");

        return "singUpForm";
    }

    //회원 가입을 처리 한다
    @PostMapping(value = "/signup")
    public String signup( @ModelAttribute UserModel userModel ) {
        // 요청
        log.info("signup() :: userModel.getCreatedTime = {} ",userModel.toString());
        
        // 요청 처리
        // - 회원 정보를 저장
        int returnCnt = signUpService.signUp(userModel);
        log.info("signup() :: returnCnt = {} ",returnCnt);

        // 리턴
        // returnCnt = 0; // 태스트용
        if (returnCnt == 1){
            return "demo";
        }else {
            return "singUpFail";
        }

    }

    // 회원 가입 성공(메인 화면)화면으로 건더

    // 회원 가입 실패 화면으로 간다
    @GetMapping(value = "/singUpFail")
    public String singUpFail(){
        log.info("singUpFail()");

        return  "singUpFail";
    }
}
