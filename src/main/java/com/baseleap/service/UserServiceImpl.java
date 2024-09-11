package com.baseleap.service;

import com.baseleap.mapper.UserMapper;
import com.baseleap.model.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public void createUser(HashMap<String, String> paramMap) {
        userMapper.createUser(paramMap);
    };

    public UserDTO getUserByEmail(String email) {
        return userMapper.getUserByEmail(email);
    };
}
