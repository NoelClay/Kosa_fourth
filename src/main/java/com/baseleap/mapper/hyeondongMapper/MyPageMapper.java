package com.baseleap.mapper.hyeondongMapper;

import com.baseleap.model.hyeondongModel.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MyPageMapper {
    UserDTO getUserInfoById(int id);
    List<UserDTO> getSearchingUserList(String keyword);
    void followUser(int userId, int targetId);
}
