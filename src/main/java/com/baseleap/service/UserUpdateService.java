package com.baseleap.service;

import com.baseleap.model.UserModel;

public interface UserUpdateService {

    public int userUpdate(UserModel userModel);

    public int userUpdatePassword(UserModel userModel);
}
