package com.baseleap.mapper;


import com.baseleap.model.UserModel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    public UserModel login(UserModel userModel);

    public UserModel getUser(String email);
}
