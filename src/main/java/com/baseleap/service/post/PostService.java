package com.baseleap.service.post;

import com.baseleap.model.post.*;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface PostService {
    void create(PostCreateModel postCreateModel);

    PostFindByIdModel findOneById(Long postId);
    PostFindOneModel findOnePrevById(Long postId);

    void update(PostUpdateModel postUpdateModel);

    void delete(Long postId, Long userId);

    PageImpl<PostListModel> findAll(int page);

}
