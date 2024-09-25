package com.baseleap.mapper.homepage;

import org.apache.ibatis.annotations.Mapper;

import com.baseleap.model.UserModel;

@Mapper
public interface UserHomePageMapper {
    public UserModel getUserByKey(Long userId);
}
