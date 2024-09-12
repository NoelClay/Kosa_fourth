package com.baseleap.mapper;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDeleteMapper {

    public int deleteUser(String email);
}
