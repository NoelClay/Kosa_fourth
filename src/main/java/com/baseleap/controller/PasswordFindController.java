package com.baseleap.controller;


import com.baseleap.model.UserModel;
import com.baseleap.service.PasswordFindService;
import com.baseleap.service.UserUpdateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@Slf4j
@RequestMapping("/find")
public class PasswordFindController {


    @Autowired
    private PasswordFindService passwordFindService;

    @Autowired
    private UserUpdateService userUpdateService;

    // 비밀번호 찾기 폼으로 이동
    @GetMapping(value = "/passwordFindForm")
    public String passwordFindForm() {
        log.info("passwordFindForm()");

        return "passwordFindFormPage";
    }


    // 비밀번호 찾기 처리
    @ResponseBody
    @PostMapping(value = "/passwordFind")
    public Map<String,Integer> passwordFind(@RequestBody UserModel userModel , Model model) {
        //요청
        log.info("passwordFind() :: userModel = {}",userModel);

        //요청 처리
        // - 받은 정보로 유저 검색
        Map<String, Integer> findMap = new HashMap<>();
        UserModel returnCnt = passwordFindService.findUserPassword(userModel.getEmail(),userModel.getValidationQuizQuestion(),userModel.getValidationQuizAnswer());
        log.info("passwordFind() :: returnCnt = {} ",returnCnt);
        model.addAttribute("userFind",returnCnt);
        
        // 리턴
        if(returnCnt != null){
            findMap.put("success",1);
            return findMap;
        } else {
            findMap.put("success",0);
            return findMap;
        }

    }

    // 비밀번호 변경 페이지로 이동

    // 비밀번호 변경 처리
    @PostMapping(value = "/passwordFindResult")
    public String passwordFindResult(@ModelAttribute UserModel userModel , Model model) {
        //요청
        log.info("passwordFindResult() :: userModel = {}",userModel);

        //요청 처리
        // - 회원 정보를 업데이트
        int returnCnt = userUpdateService.userUpdatePassword(userModel);
        log.info("passwordFindResult() :: returnCnt = {} ",returnCnt);

        // 리턴
        return "redirect:/login/loginForm";
    }
}
