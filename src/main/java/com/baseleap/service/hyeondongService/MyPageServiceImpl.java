package com.baseleap.service.hyeondongService;

import com.baseleap.model.hyeondongModel.FollowDTO;
import com.baseleap.model.hyeondongModel.UserDTO;
import com.baseleap.mapper.hyeondongMapper.MyPageMapper;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class MyPageServiceImpl implements MyPageService {
    @Autowired
    private MyPageMapper myPageMapper;

    public UserDTO getUserInfoById(int id) {
        return myPageMapper.getUserInfoById(id);
    }

    public List<UserDTO> getSearchingUserList(String keyword) {
        return myPageMapper.getSearchingUserList(keyword);
    }

    // 팔로우중인지 확인.
    public FollowDTO isFollowing(int userId, int targetId) {
        return myPageMapper.isFollowing(userId, targetId);
    }

    // 팔로우하기.
    public void following(int userId, int targetId) {
        myPageMapper.following(userId, targetId);
    }

    // 팔로워들 리스트로 가져오기.
    public List<UserDTO> getMyFollowers(int userId) {
        return myPageMapper.getMyFollowers(userId);
    }

    // 팔로잉중인 사람들 리스트로 가져오기.
    public List<UserDTO> getMeFollowings(int userId) {
        return myPageMapper.getMeFollowings(userId);
    }

    // 언팔로우.
    public void unfollow(int userId, int targetId) {
        myPageMapper.unfollow(userId, targetId);
    }
}
