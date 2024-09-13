package com.baseleap.service;

import com.baseleap.mapper.UserMapper;
import com.baseleap.model.UserModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserModel login(UserModel userModel) {
        log.info("login() :: userModel = {} ",userModel.toString());
        return userMapper.login(userModel);
    }


    @Override
    public UserModel getUser(String email) {
        log.info("getUser() :: email = {} ",email);
        return userMapper.getUser(email);
    }

    @Override
    public int userUpdateLastLoginTime(String email) {
        log.info("userUpdateLastLoginTime() :: email = {} ",email);

        return userMapper.userUpdateLastLoginTime(email);
    }


}
