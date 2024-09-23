package com.baseleap.controller;


import com.baseleap.model.UserModel;
import com.baseleap.service.UserSignOutService;
import com.baseleap.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("/signOut")
public class UserSignOutController {


    @Autowired
    private UserService userService;

    @Autowired
    private UserSignOutService UserSignOut;

    // 회원 탈퇴 확인 페이지로 이동
    @GetMapping(value = "/signOutForm")
    public String userSignOutForm(HttpSession session) {
        // 요청
        String loginEmail =  (String) session.getAttribute("loginEmail");

        // 요청 처리
        // 로그인 여부 확인
        if (loginEmail != null) {
            log.info("userSignOutForm() :: loginEmail ={}", loginEmail);
            return "signOutPage";
        } else {
            log.info("userSignOutForm() :: loginEmail ={}", loginEmail);
            return "redirect:/login/loginForm";
        }
    }


    // 회원 탈퇴 처리
    @ResponseBody
    @PostMapping(value = "/signOut")
    public  Map<String, Integer> signOutUser(HttpSession session , @RequestBody UserModel userModel) {
        //요청
        String loginEmail =  (String) session.getAttribute("loginEmail");
        Map<String, Integer> signOutMap = new HashMap<>();
        //요청 처리
        //  데이터 베이스에서 사용자 정보를 얻는다
        UserModel returnUserModel = userService.getUser(loginEmail);
        log.info("UserSignOutForm() :: returnUserModel ={}", returnUserModel);
       
        //요청 처리
        // - 회원 정보를 삭제
        int returnCnt =  UserSignOut.signOutUser(returnUserModel);
        log.info("signOutUser() :: returnCnt = {} ",returnCnt);
        session.invalidate();

        // 리턴
        // returnCnt = 0; // 태스트용
        if (returnCnt == 1){
            signOutMap.put("success", 1);
            return signOutMap;
        }else {
            signOutMap.put("success", 0);
            return signOutMap;
        }
    }
}
