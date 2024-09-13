package com.baseleap.service;


import com.baseleap.mapper.UserSignOutMapper;
import com.baseleap.mapper.UserMapper;
import com.baseleap.model.UserModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserSignOutServiceImpl implements UserSignOutService {

    @Autowired
    private UserSignOutMapper UserSignOutMapper;

    @Override
    public int signOutUser(UserModel userModel) {
        log.info("email():: email == {}",userModel);
        return UserSignOutMapper.signOutUser(userModel.getEmail());
    }
}
