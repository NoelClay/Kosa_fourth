package com.baseleap.mapper;


import com.baseleap.model.UserModel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDeleteMapper {

    public int deleteUser(String string);
}
