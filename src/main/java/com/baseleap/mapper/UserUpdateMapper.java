package com.baseleap.mapper;

import com.baseleap.model.UserModel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserUpdateMapper {

    public int userUpdate(UserModel userModel);

    public int userUpdatePassword(UserModel userModel);
}
