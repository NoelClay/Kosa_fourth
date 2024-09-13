package com.baseleap.mapper;



import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserSignOutMapper {

    public int signOutUser(String string);
}
