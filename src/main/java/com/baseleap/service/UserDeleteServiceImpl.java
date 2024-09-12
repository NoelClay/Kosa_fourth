package com.baseleap.service;


import com.baseleap.mapper.UserDeleteMapper;
import com.baseleap.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserDeleteServiceImpl implements UserDeleteService {

    @Autowired
    private UserDeleteMapper userDeleteMapper;

    @Override
    public int deleteUser(String email) {
        log.info("email():: email == {}",email);
        return userDeleteMapper.deleteUser(email);
    }
}
