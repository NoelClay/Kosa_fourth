package com.baseleap.mapper;

import com.baseleap.model.post.PostLikeModel;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostLikeMapper {
    int insert(PostLikeModel postLikeModel);
    int delete(PostLikeModel postLikeModel);
}
