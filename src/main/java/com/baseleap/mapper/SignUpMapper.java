package com.baseleap.mapper;


import com.baseleap.model.UserModel;
import com.baseleap.model.hyeondongModel.UserDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SignUpMapper {

    UserModel getUserByEmail(String email);

    public int signUp(UserModel userModel);
}