package com.baseleap.controller;


import com.baseleap.model.UserModel;
import com.baseleap.service.UserService;
import com.baseleap.service.UserUpdateService;
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
@RequestMapping("/update")
public class UserUpdateController {

    @Autowired
    private UserUpdateService userUpdateService;

    @Autowired
    private UserService userService;

    // 정보수정 폼으로 이동
    @GetMapping(value = "/updateForm")
    public String userUpdateForm(HttpSession session , Model model) {
        // 요청
        String loginEmail =  (String) session.getAttribute("loginEmail");
        if (loginEmail != null) {
            log.info("userUpdateForm() :: loginEmail ={}", loginEmail);

            // ------------------------------------------
            // 사용자 정보 조회
            //-------------------------------------------

            //  데이터 베이스에서 사용자 정보를 얻는다
            UserModel returnUserModel = userService.getUser(loginEmail);
            log.info("userUpdateForm() :: returnUserModel ={}", returnUserModel);
            model.addAttribute("user",returnUserModel);

            return "updateFormPage";
        } else {
            log.info("userUpdateForm() :: loginEmail ={}", loginEmail);
            return "redirect:/intro";
        }
    }

    // 정보수정 처리
    @PostMapping(value = "/update")
    public String userUpdate(@ModelAttribute UserModel userModel) {
        //요청
        log.info("userUpdate() :: userModel = {}",userModel);
        
        //요청 처리
        // - 회원 정보를 업데이트
        int returnCnt = userUpdateService.userUpdate(userModel);
        log.info("userUpdate() :: returnCnt = {} ",returnCnt);
        
        
        // 리턴
        // returnCnt = 0; // 태스트용
        if (returnCnt == 1){
            return "redirect:/my-page/info";
        }else {
            return "updateFail";
        }
    }
}
