package com.baseleap.service;

import com.baseleap.model.UserModel;

public interface SignUpService {

    UserModel getUserByEmail(String email);

    public int signUp(UserModel userModel);
}
