package com.baseleap.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostImageMapper {
    int insert(List<String> urls, Long postId);
}
