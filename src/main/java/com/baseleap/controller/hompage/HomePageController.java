package com.baseleap.controller.hompage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseleap.model.guestbook.GuestBook;
import com.baseleap.model.music.MusicModel;
import com.baseleap.service.guestbook.IGuestBookService;
import com.baseleap.service.homepage.IHomePageService;
import com.baseleap.service.music.IMusicService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/home")
public class HomePageController {

    @Autowired
    private IMusicService musicService;

    @Autowired
    private IGuestBookService guestBookService;

    @Autowired
    private IHomePageService homeService;

    // @Autowired
    // private IThemeService themeService;
    
    
    //일단 처음에 홈페이지 띄우는것 부터
    
    @GetMapping("/page")
    public String loadHomePage(@RequestParam("userId") Long userId, HttpSession session, Model model) {
        //null을 비교하고 싶어서 저장
        model.addAttribute("nullObj", null);

        // 세션에서 로그인한 사용자 pk 가져오기
        Integer temp = (Integer) session.getAttribute("loginUserId");
        Long loginUserId = temp.longValue();

        //페이지 이동 측에서 가져온 오너 아이디로 세션 페이지 아이디 수정 최초엔 로그인 아이디로 전달 요망
        session.setAttribute("homePageId", userId);

        // // 해당 유저의 활성화된 테마를 jsp 스타일 태그에 넣어주기
        // List<String> themeInfo = themeservice.getStringListMusicByOwnerID(userId);
        // if (musicInfo != null && musicInfo.size() > 1) {
        //     model.addAttribute("musicPath", musicInfo.get(1));
        // } else {
        //     // 기본값 또는 null 처리
        //     model.addAttribute("musicPath", "");  // 또는 예외 처리
        // }

        // 해당 유저의 배경 음악 불러오기 0. 음악명 1. 음악 패스 그런데 사실상 패스만 뿌릴거
        List<String> musicInfo = musicService.getStringListMusicByOwnerID(userId);
        if (musicInfo != null && musicInfo.size() > 1) {
            model.addAttribute("musicPath", musicInfo.get(1));
        } else {
            // 기본값 또는 null 처리
            model.addAttribute("musicPath", "");  // 또는 예외 처리
        }

        // 해당 유저의 방명록 리스트 불러오기
        List<GuestBook> guestbookEntries = guestBookService.getGuestBookListByOwnerId(userId);
        model.addAttribute("guestbookEntries", guestbookEntries);

        // 로그인한 사용자 ID와 페이지 사용자 ID를 비교하여 버튼을 설정할거라 전달
        model.addAttribute("loginUserId", loginUserId);
        model.addAttribute("pageUserId", userId);

        // 유저페이지의 유저 키값으로 유저 받아와서 그 유저의 닉네임을 페이지에 전달
        String userNickname = homeService.getUserNicknameByUserId(userId);
        model.addAttribute("userNickname", userNickname);

        // 유저의 음악 리스트 (활성화 모달에 사용될 데이터)
        List<MusicModel> musicList = musicService.getMusicModelByOwnerID(userId);
        model.addAttribute("musicList", musicList); // 음악 리스트 추가

        return "/homepage/homepage"; // JSP 파일로 이동
    }

}
