package com.baseleap.service;


import com.baseleap.model.UserModel;

public interface PasswordFindService {
    public UserModel findUserPassword(String email,String validationQuizQuestion,String validationQuizAnswer);
}
