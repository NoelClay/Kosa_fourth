package com.baseleap.service;

import com.baseleap.model.UserDTO;
import com.baseleap.mapper.MyPageMapper;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class MyPageServiceImpl implements MyPageService {
    @Autowired
    private MyPageMapper myPageMapper;

    public UserDTO getUserInfoById(int id) {
        return myPageMapper.getUserInfoById(id);
    }
}
