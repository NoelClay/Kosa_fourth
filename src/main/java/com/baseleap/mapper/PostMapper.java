package com.baseleap.mapper;

import com.baseleap.model.post.Post;
import com.baseleap.model.post.PostCreateModel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostMapper {
    int insert(Post posts);
}
