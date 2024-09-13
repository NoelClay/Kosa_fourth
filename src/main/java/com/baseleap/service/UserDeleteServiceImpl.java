package com.baseleap.service;


import com.baseleap.mapper.UserDeleteMapper;
import com.baseleap.mapper.UserMapper;
import com.baseleap.model.UserModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserDeleteServiceImpl implements UserDeleteService {

    @Autowired
    private UserDeleteMapper userDeleteMapper;

    @Override
    public int deleteUser(UserModel userModel) {
        log.info("email():: email == {}",userModel);
        return userDeleteMapper.deleteUser(userModel.getEmail());
    }
}
