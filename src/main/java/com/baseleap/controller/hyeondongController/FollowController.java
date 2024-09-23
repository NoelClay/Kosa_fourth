package com.baseleap.controller.hyeondongController;

import com.baseleap.model.hyeondongModel.FollowDTO;
import com.baseleap.model.hyeondongModel.UserDTO;
import com.baseleap.model.hyeondongModel.UserFollowStatus;
import com.baseleap.service.hyeondongService.AlarmService;
import com.baseleap.service.hyeondongService.MyPageService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/my-page")
public class FollowController {
    @Autowired
    private MyPageService myPageService;

    @Autowired
    private AlarmService alarmService;

    // 팔로잉.
    @ResponseBody
    @PostMapping("/following")
    public Map<String, String> following(
            HttpServletRequest request,
            @RequestBody HashMap<String, Integer> requestBody) {
        String stringUserId = (String) request.getSession().getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        int targetId = requestBody.get("targetId");
        // 팔로우 여부를 알아내기 위한 팔로우DTO.
        FollowDTO followDTO = myPageService.isFollowing(userId, targetId);
        Map<String, String> responseBody = new HashMap<>();
        if (followDTO != null) {
            responseBody.put("status", "failure");
            responseBody.put("error", "이미 팔로우 중입니다.");
            return responseBody;
        };
        myPageService.following(userId, targetId);

        // 알림 만들기.
        String alarmContent = "님이 팔로우하기 시작했습니다!";
        alarmService.createNewAlarm(userId, targetId, alarmContent);

        responseBody.put("status", "success");
        responseBody.put("message", "팔로잉 성공!!!");
        return responseBody;
    }

    // 언팔로우.
    @ResponseBody
    @DeleteMapping("/unfollow")
    public Map<String, String> unfollow(
            HttpServletRequest request,
            @RequestBody HashMap<String, Integer> requestBody) {
        String stringUserId = (String) request.getSession().getAttribute("userId");
        int userId = Integer.parseInt(stringUserId);
        int targetId = requestBody.get("targetId");
        // 팔로우 여부를 알아내기 위한 팔로우DTO.
        FollowDTO followDTO = myPageService.isFollowing(userId, targetId);
        Map<String, String> responseBody = new HashMap<>();
        if (followDTO == null) {
            responseBody.put("status", "failure");
            responseBody.put("message", "팔로우 하고 있지 않습니다.");
            return responseBody;
        };
        myPageService.unfollow(userId, targetId);

        responseBody.put("status", "success");
        responseBody.put("message", "언팔 성공!!!");
        return responseBody;
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
        int myId = Integer.parseInt(stringUserId);
        List<UserDTO> userDTOList = myPageService.getMyFollowers(myId); // 나의 팔로워들.
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
        int myId = Integer.parseInt(stringUserId);
        List<UserDTO> followingTargetsDTOList = myPageService.getMeFollowings(myId);
        System.out.println(followingTargetsDTOList.toString());
        // 유저들마다 팔로우 여부를 알아내고, 유저 객체와 팔로우 객체를 합쳐서 포장된 객체를 만들어야 함.
        List<UserFollowStatus> userFollowStatusList = followingTargetsDTOList
                .stream()
                .map(target -> {
                    UserFollowStatus ufs = new UserFollowStatus();
                    FollowDTO followDTO = myPageService.isFollowing(myId, Integer.parseInt(target.getId())); // target을 내가 팔로우하고 있는지 어떤지를 확인...쿼리 결과값이 없으면 followDTO는 null.
                    ufs.setUserDTO(target);
                    ufs.setFollow(followDTO != null);
                    // 결과적으로 ufs 객체는 UserDTO와, 내가 그 UserDTO를 팔로우하는지 여부(T/F)를 가짐.
                    return ufs;
                })
                .toList();
        // 아래의 모델을 테이블로 펼쳐줄 것임.
        model.addAttribute("userFollowStatusList", userFollowStatusList);
        return "my-page/following-list";
    }
}
