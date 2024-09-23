package com.baseleap.service.post;

import com.baseleap.model.post.*;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface PostService {
    void create(PostCreateModel postCreateModel, Long userId);

    PostFindByIdModel findOneById(Long postId, Long userId);
    PostFindOneModel findOnePrevById(Long postId, Long userId);

    void update(PostUpdateModel postUpdateModel);

    void delete(Long postId);

    PageImpl<PostListModel> findAll(int page, Long homePageId);

}
