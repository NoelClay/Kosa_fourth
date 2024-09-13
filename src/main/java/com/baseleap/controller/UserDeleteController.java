package com.baseleap.controller;


import com.baseleap.model.UserModel;
import com.baseleap.service.UserDeleteService;
import com.baseleap.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/delete")
public class UserDeleteController {


    @Autowired
    private UserService userService;

    @Autowired
    private UserDeleteService userDelete;

    // 정보수정 폼으로 이동
    @GetMapping(value = "/deleteForm")
    public String userDeleteForm(HttpSession session) {
        // 요청
        String loginEmail =  (String) session.getAttribute("loginEmail");

        // 요청 처리
        // 로그인 여부 확인
        if (loginEmail != null) {
            log.info("userDeleteForm() :: loginEmail ={}", loginEmail);
            return "userDeleteForm";
        } else {
            log.info("userDeleteForm() :: loginEmail ={}", loginEmail);
            return "redirect:/login/loginForm";
        }
    }



    // 정보수정 처리
    @PostMapping(value = "/delete")
    public String deleteUser(HttpSession session , @ModelAttribute UserModel userModel) {
        //요청
        String loginEmail =  (String) session.getAttribute("loginEmail");

        //요청 처리
        //  데이터 베이스에서 사용자 정보를 얻는다
        UserModel returnUserModel = userService.getUser(loginEmail);
        log.info("userDeleteForm() :: returnUserModel ={}", returnUserModel);
       
        //요청 처리
        // - 회원 정보를 삭제
        int returnCnt =  userDelete.deleteUser(returnUserModel);
        log.info("deleteUser() :: returnCnt = {} ",returnCnt);


        // 리턴
        // returnCnt = 0; // 태스트용
        if (returnCnt == 1){
            return "redirect:/login/loginForm";
        }else {
            return "demo";
        }
    }
}
