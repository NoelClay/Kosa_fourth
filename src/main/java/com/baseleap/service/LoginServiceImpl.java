package com.baseleap.service;

import com.baseleap.mapper.LoginMapper;
import com.baseleap.model.UserModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    private static final Logger log = LoggerFactory.getLogger(LoginServiceImpl.class);

    @Autowired
    private LoginMapper loginMapper;

    @Override
    public UserModel login(UserModel userModel) {

        log.info("login() :: userModel = {} ",userModel.toString());
        return loginMapper.login(userModel);
    }
}
