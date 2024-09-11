package com.baseleap.service;

import com.baseleap.model.UserDTO;

import java.util.HashMap;

public interface UserService {
    UserDTO getUserByEmail(String email);
    void createUser(HashMap<String, String> paramMap);
}
