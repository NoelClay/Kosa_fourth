package com.baseleap.service.hyeondongService;

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

    public void followUser(int userId, int targetId) {
        myPageMapper.followUser(userId, targetId);
    }
}
