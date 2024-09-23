package com.baseleap.controller.hompage;

import java.util.ArrayList;
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
@RequestMapping("/baseleap/home")
public class HomePageController {

    @Autowired
    private IMusicService musicService;

    @Autowired
    private IGuestBookService guestBookService;

    @Autowired
    private IHomePageService homeService;

    @GetMapping("/page")
    public String loadHomePage(@RequestParam("userId") Long pageUserId, HttpSession session, Model model) {
        // 세션에서 로그인한 사용자 pk 가져오기
        Object temp = session.getAttribute("loginUserId");

        // loginUserId가 Long 타입일 수도 있으므로 instanceof로 타입을 체크한 후 캐스팅
        Long loginUserId = null;

        if (temp instanceof Integer) {
            loginUserId = ((Integer) temp).longValue();
        } else if (temp instanceof Long) {
            loginUserId = (Long) temp;
        }

        if (loginUserId == null) {
            // loginUserId가 null인 경우, 예외 처리나 기본값 설정이 필요할 수 있습니다.
            throw new IllegalStateException("로그인된 사용자 ID가 세션에 없습니다.");
        }

        // 페이지 사용자 ID를 세션에 저장하지 않고, 모델에만 전달 (세션에는 로그인한 사용자만 저장)
        session.setAttribute("loginUserId", loginUserId);
        model.addAttribute("loginUserId", loginUserId);
        model.addAttribute("pageUserId", pageUserId);  // 페이지 오너의 userId

        // 해당 유저의 배경 음악 불러오기 0. 음악명 1. 음악 패스 그런데 사실상 패스만 뿌릴거
        List<String> musicInfo = musicService.getStringListMusicByOwnerID(pageUserId);
        if (musicInfo != null && musicInfo.size() > 1) {
            model.addAttribute("musicPath", musicInfo.get(1));
        } else {
            // 기본값 또는 null 처리
            model.addAttribute("musicPath", "");  // 또는 예외 처리
        }

        // 해당 유저의 방명록 리스트 불러오기
        List<GuestBook> guestbooks = guestBookService.getGuestBookListByOwnerId(pageUserId);
        List<String> usernames = new ArrayList<>();
        List<String> commentList = new ArrayList<>();

        log.info("guestbooklist show start");
        for (GuestBook gbi : guestbooks) {
            String nick = homeService.getUserNicknameByUserId(gbi.getWriterId());
            log.info("comment : " + gbi.getComment());
            log.info("userNickname" + nick);

            commentList.add(gbi.getComment());
            usernames.add(nick);
        }
        model.addAttribute("usernames", usernames);
        model.addAttribute("comments", commentList);

        // 유저페이지의 유저 키값으로 유저 받아와서 그 유저의 닉네임을 페이지에 전달
        String userNickname = homeService.getUserNicknameByUserId(pageUserId);
        model.addAttribute("userNickname", userNickname);

        // 유저의 음악 리스트 (활성화 모달에 사용될 데이터)
        List<MusicModel> musicList = musicService.getMusicModelByOwnerID(pageUserId);
        model.addAttribute("musicList", musicList); // 음악 리스트 추가

        //내가 다른 유저에게 쓴 게스트북이 있나요????? 모달창에 미리 들어갈 녀석석
        GuestBook gb = guestBookService.getGuestBookByWriterAndOwner(pageUserId, loginUserId);
        if (gb == null) {
            model.addAttribute("myCommentWrote", null);
        } else {
            model.addAttribute("myCommentWrote", gb);
        }

        // 지금 현재 페이지의 프사 가져오기
        String profileImgPath = homeService.getUserProfileImgPath(pageUserId);
        model.addAttribute("profileImgPath", profileImgPath);

        //지금 현재 페이지의 자기 소개 가져오기
        String userIntroduce = homeService.getUserProfileSelfInfo(pageUserId);
        model.addAttribute("userIntroduce", userIntroduce);

        return "/homepage/homepage"; // JSP 파일로 이동
    }

}
