package com.baseleap.service.hyeondongService;

import com.baseleap.model.hyeondongModel.UserDTO;

import java.util.HashMap;

public interface HDUserService {
    UserDTO getUserByEmail(String email);
    void createUser(HashMap<String, String> paramMap);
}
