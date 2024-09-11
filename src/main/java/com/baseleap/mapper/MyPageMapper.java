package com.baseleap.mapper;

import com.baseleap.model.UserDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageMapper {
    UserDTO getUserInfoById(int id);
}
