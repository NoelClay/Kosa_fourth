package com.baseleap.mapper;


import com.baseleap.model.UserModel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
    public UserModel login(UserModel userModel);
}
