package com.baseleap.service;


import com.baseleap.mapper.SignUpMapper;
import com.baseleap.mapper.UserUpdateMapper;
import com.baseleap.model.UserModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class UserUpdateServiceImpl implements UserUpdateService{

    @Autowired
    private UserUpdateMapper userUpdateMapper;

    @Override
    public int userUpdate(UserModel userModel) {
        log.info("userUpdate() :: userModel = {} ",userModel.toString());
        return userUpdateMapper.userUpdate(userModel);
    }

    @Override
    public int userUpdatePassword(UserModel userModel) {
        log.info("userUpdatePassword() :: userModel = {} ",userModel.toString());
        return userUpdateMapper.userUpdatePassword(userModel);
    }


}
