package com.baseleap.mapper;

import com.baseleap.model.UserModel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PasswordFindMapper {
    public UserModel findUserPassword(String email, String validationQuizQuestion, String validationQuizAnswer);

}
