package com.baseleap.mapper.hyeondongMapper;

import com.baseleap.model.hyeondongModel.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface UserMapper {
    UserDTO getUserByEmail(String email);
    void createUser(HashMap<String, String> paramMap);
}
