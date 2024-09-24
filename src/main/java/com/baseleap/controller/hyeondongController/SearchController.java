package com.baseleap.controller.hyeondongController;

import com.baseleap.model.hyeondongModel.FollowDTO;
import com.baseleap.model.hyeondongModel.UserDTO;
import com.baseleap.model.hyeondongModel.UserFollowStatus;
import com.baseleap.service.hyeondongService.MyPageService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/baseleap/my-page")
public class SearchController {
    @Autowired
    private MyPageService myPageService;

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
                    // target을 내가 팔로우하고 있는지 어떤지를 확인...쿼리 결과값이 없으면 followDTO는 null.
                    FollowDTO followDTO = myPageService.isFollowing(myId, Integer.parseInt(target.getId()));
                    ufs.setUserDTO(target);
                    ufs.setFollow(followDTO != null);
                    // 결과적으로 ufs 객체는 UserDTO와, 내가 그 UserDTO를 팔로우하는지 여부(T/F)를 가짐.
                    return ufs;
                })
                .toList();
        // 아래의 모델을 테이블로 펼쳐줄 것임.
        model.addAttribute("userFollowStatusList", userFollowStatusList);
        return "my-page/search";
    }
}
