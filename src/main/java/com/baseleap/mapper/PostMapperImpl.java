package com.baseleap.mapper;

import com.baseleap.model.post.*;
import com.baseleap.service.post.port.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

@RequiredArgsConstructor
@Repository
public class PostMapperImpl implements PostRepository {
    private final PostMapper postMapper;

    @Override
    public int insert(Post post){
        return postMapper.insert(post);
    }

    @Override
    public PostFindOneModel findOne(Long postId) {
        return postMapper.findOneById(postId);
    }

    @Override
    public int update(PostUpdateModel postUpdateModel) {
        return postMapper.update(postUpdateModel);

    }

    @Override
    public List<PostListModel> findAll(List<Long> ids) {
        return postMapper.findAll(ids);

    }

    @Override
    public List<Long> postIds(int size, Long offset) {
        return postMapper.ids(size, offset);
    }

    @Override
    public int countByUserId(Long userId) {
        return postMapper.countByUserId(userId);

    }
}
