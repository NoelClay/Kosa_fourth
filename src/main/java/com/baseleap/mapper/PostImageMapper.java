package com.baseleap.mapper;

import com.baseleap.model.post.PostUpdateDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PostImageMapper {
    int insert(List<String> urls, Long postId);
    int update(@Param("imageUrls") List<String> imageUrls, @Param("postId") Long postId);
    int updates(PostUpdateDto postUpdateDto);
}
