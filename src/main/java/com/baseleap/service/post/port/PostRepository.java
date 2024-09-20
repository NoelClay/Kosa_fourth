package com.baseleap.service.post.port;

import com.baseleap.model.post.*;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface PostRepository {
    int insert(Post post);
    PostFindOneModel findOne(Long postId);
    int update(PostUpdateModel postUpdateModel);
    List<PostListModel> findAll(List<Long> ids);
    List<Long> postIds(int size ,Long offset);
    int countByUserId(Long userId);
}
