package com.baseleap.service.hyeondongService;

import com.baseleap.mapper.hyeondongMapper.HDUserMapper;
import com.baseleap.model.hyeondongModel.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class HDUserServiceImpl implements HDUserService {
    @Autowired
    private HDUserMapper HDUserMapper;

    public void createUser(HashMap<String, String> paramMap) {
        HDUserMapper.createUser(paramMap);
    };

    public UserDTO getUserByEmail(String email) {
        return HDUserMapper.getUserByEmail(email);
    };
}
