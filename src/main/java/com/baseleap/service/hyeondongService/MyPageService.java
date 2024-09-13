package com.baseleap.service.hyeondongService;

import com.baseleap.model.hyeondongModel.FollowDTO;
import com.baseleap.model.hyeondongModel.UserDTO;

import java.util.List;

public interface MyPageService {
    UserDTO getUserInfoById(int id);
    List<UserDTO> getSearchingUserList(String keyword);
    void following(int userId, int targetId);
    List<UserDTO> getMyFollowers(int userId);
    List<UserDTO> getMeFollowings(int userId);
    FollowDTO isFollowing(int userId, int targetId);
    void unfollow(int userId, int targetId);
}
