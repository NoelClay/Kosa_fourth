package com.baseleap.mapper;

import com.baseleap.model.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface UserMapper {
    UserDTO getUserByEmail(String email);
    void createUser(HashMap<String, String> paramMap);
}
