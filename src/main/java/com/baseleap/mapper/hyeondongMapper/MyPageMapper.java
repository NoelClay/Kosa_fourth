package com.baseleap.mapper.hyeondongMapper;

import com.baseleap.model.hyeondongModel.FollowDTO;
import com.baseleap.model.hyeondongModel.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageMapper {
    UserDTO getUserInfoById(int id);
    List<UserDTO> getSearchingUserList(String keyword);
    void following(int userId, int targetId);
    List<UserDTO> getMyFollowers(int userId);
    List<UserDTO> getMeFollowings(int userId);
    FollowDTO isFollowing(int userId, int targetId);
    void unfollow(int userId, int targetId);
}
