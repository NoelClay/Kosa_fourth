package com.baseleap.service;

import com.baseleap.mapper.SignUpMapper;
import com.baseleap.model.UserModel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class SignUpServiceImpl implements SignUpService{
    // signUp
    // SignUp
    @Autowired
    private SignUpMapper signUpMapper;

    @Override
    public UserModel getUserByEmail(String email) {
        log.info("signUp() :: getUserByEmail = {} ",email);
        return signUpMapper.getUserByEmail(email);
    }

    @Override
    public int signUp(UserModel userModel) {
        log.info("signUp() :: userModel = {} ",userModel.toString());
        return signUpMapper.signUp(userModel);
    }



}
