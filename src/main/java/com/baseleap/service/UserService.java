package com.baseleap.service;

import com.baseleap.model.UserModel;

public interface UserService {
    public UserModel login(UserModel userModel);

    public UserModel getUser(String email);
}
