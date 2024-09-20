package com.baseleap.controller.hyeondongController;

import com.baseleap.model.hyeondongModel.FollowDTO;
import com.baseleap.model.hyeondongModel.UserDTO;
import com.baseleap.model.hyeondongModel.UserFollowStatus;
import com.baseleap.service.hyeondongService.AlarmService;
import com.baseleap.service.hyeondongService.MyPageService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = "/my-page")
public class MyPageController {
    @Autowired
    private MyPageService myPageService;

    @Autowired
    private AlarmService alarmService;

    @GetMapping("/info")
    public String myPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        String stringUserId = (String) session.getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        UserDTO userInfo = myPageService.getUserInfoById(userId);
        model.addAttribute("userInfo", userInfo);
        return "my-page/info";
    }

    // 팔로잉.
    @PostMapping("/following")
    public String following(
            HttpServletRequest request) {
        String stringUserId = (String) request.getSession().getAttribute("userId");
        String stringTargetId = request.getParameter("targetId");
        int userId = Integer.parseInt(stringUserId);
        int targetId = Integer.parseInt(stringTargetId);
        // 팔로우 여부를 알아내기 위한 팔로우DTO.
        FollowDTO followDTO = myPageService.isFollowing(userId, targetId);
        if (followDTO != null) {
            request.setAttribute("error", "이미 팔로우 중입니다.");
            return "my-page/follow-error";
        };
        myPageService.following(userId, targetId);

        // 알림 만들기.
        String alarmContent = "새 팔로워";
        alarmService.createNewAlarm(userId, targetId, alarmContent);

        return "redirect:/my-page/search";
    }

    // 언팔로우.
    @PostMapping("/unfollow")
    public String unfollow(
            HttpServletRequest request) {
        String stringUserId = (String) request.getSession().getAttribute("userId");
        String stringTargetId = request.getParameter("targetId");
        int userId = Integer.parseInt(stringUserId);
        int targetId = Integer.parseInt(stringTargetId);
        // 팔로우 여부를 알아내기 위한 팔로우DTO.
        FollowDTO followDTO = myPageService.isFollowing(userId, targetId);
        if (followDTO == null) {
            request.setAttribute("error", "팔로우 하고 있지 않습니다.");
            return "my-page/follow-error";
        };
        myPageService.unfollow(userId, targetId);

        return "redirect:/my-page/search";
    }

    // 팔로우 에러.
    @GetMapping("/follow-error")
    public String followError() {
        return "my-page/follow-error";
    }

    // 팔로워들.
    @GetMapping("/follower-list")
    public String followerList(
            HttpServletRequest request,
            Model model
    ) {
        String stringUserId = (String) request.getSession().getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        List<UserDTO> userDTOList = myPageService.getMyFollowers(userId);
        model.addAttribute("userDTOList", userDTOList);
        return "my-page/follower-list";
    }
    
    // 내가 팔로잉 중인 사람들.
    @GetMapping("/following-list")
    public String followingList(
            HttpServletRequest request,
            Model model
    ) {
        String stringUserId = (String) request.getSession().getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        List<UserDTO> userDTOList = myPageService.getMeFollowings(userId);
        model.addAttribute("userDTOList", userDTOList);
        return "my-page/following-list";
    }

    // 유저 검색 페이지 진입.
    @GetMapping("/search")
    public String userSearch() {
        return "my-page/search";
    }

    // 유저 검색 결과.
    // 이메일 아이디와 닉네임으로 검색함.
    @PostMapping("/search-result")
    public String userSearchResult(
            HttpServletRequest request,
            Model model) {
        String stringUserId = (String) request.getSession().getAttribute("userId");
        int myId = Integer.parseInt(stringUserId);
        String keyword = request.getParameter("keyword");
        List<UserDTO> userDTOList = myPageService.getSearchingUserList(keyword);
        // 검색된 유저들마다 팔로우 여부를 알아내고, 유저 객체와 팔로우 객체를 합쳐서 포장된 객체를 만들어야 함.
        List<UserFollowStatus> userFollowStatusList = userDTOList
                .stream()
                .map(target -> {
                    UserFollowStatus ufs = new UserFollowStatus();
                    FollowDTO followDTO = myPageService.isFollowing(myId, Integer.parseInt(target.getId()));
                    ufs.setUserDTO(target);
                    ufs.setFollow(followDTO != null);
                    return ufs;
                })
                .toList();
        // 아래의 모델을 테이블로 펼쳐줄 것임.
        model.addAttribute("userFollowStatusList", userFollowStatusList);
        return "my-page/search";
    }

    @GetMapping("/new-messages")
    public String newMessages() {
        return "redirect:/message/new-messages";
    }

    @GetMapping("/all-messages")
    public String allMessages() {
        return "redirect:/message/all-messages";
    }
}
