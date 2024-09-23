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
    // 왜 RequestParam 인지 모름

    public Map<String, Integer> passwordFind(
            @RequestBody UserModel userModel,
            Model model) {
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
    public Map<String, Integer> passwordFindResult(@RequestBody UserModel userModel) {
        log.info("passwordFindResult() :: userModel = {}", userModel);

        Map<String, Integer> passwordMao = new HashMap<>();
        int returnCnt = userUpdateService.userUpdatePassword(userModel);

        if (returnCnt > 0) {
            passwordMao.put("success", 1);

        } else {
            passwordMao.put("success", 0);

        }

        return passwordMao;
    }
}
