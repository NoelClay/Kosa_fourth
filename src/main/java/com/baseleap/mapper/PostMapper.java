package com.baseleap.mapper;

import com.baseleap.model.post.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.domain.Pageable;

import java.util.List;

@Mapper
public interface PostMapper {
    int insert(Post posts);
    PostFindOneModel findOneById(Long postId);

    int update(PostUpdateModel postUpdateModel);
    int delete(Long postId, Long userId);

    List<PostListModel> findAll(List<Long> ids);

    List<Long> ids(int size, Long offset);
    int countByUserId(Long userId);
}
