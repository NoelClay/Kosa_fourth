package com.baseleap.service.hyeondongService;

import com.baseleap.model.hyeondongModel.UserDTO;

import java.util.List;

public interface MyPageService {
    UserDTO getUserInfoById(int id);
    List<UserDTO> getSearchingUserList(String keyword);
    void followUser(int userId, int targetId);
}
