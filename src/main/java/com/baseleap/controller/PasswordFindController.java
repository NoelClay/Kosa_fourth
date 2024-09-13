package com.baseleap.controller;


import com.baseleap.model.UserModel;
import com.baseleap.service.PasswordFindService;
import com.baseleap.service.UserUpdateService;
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
@RequestMapping("/find")
public class PasswordFindController {

    /*
    * 1. 비밀번호 찾기 선택 후 비밀번호 찾는 폼으로 이동
    * 2. 거기서 비밀번호 찾는 정보를 입력
    * 3. 디비에 입력한 정보를 토대로 유저가 있으면
    * 4. 비밀번호를 알려줌(비밀번호 수정 가능) // 여기 까지 완료
    * 5. 3에 정보가 없으면
    * 6. 다시 비밀번호 찾는 폼으로 이동
    * */

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
    @PostMapping(value = "/passwordFind")
    public String passwordFind(@ModelAttribute UserModel userModel , Model model) {
        //요청
        log.info("passwordFind() :: userModel = {}",userModel);

        //요청 처리
        // - 받은 정보로 유저 검색
        UserModel returnCnt = passwordFindService.findUserPassword(userModel.getEmail(),userModel.getValidationQuizQuestion(),userModel.getValidationQuizAnswer());
        log.info("passwordFind() :: returnCnt = {} ",returnCnt);
        model.addAttribute("userFind",returnCnt);
        
        // 리턴
        if(returnCnt != null){
            return "passwordFindResultPage";
        } else {
            return "demo";
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
