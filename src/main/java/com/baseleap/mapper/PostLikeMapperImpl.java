package com.baseleap.mapper;

import com.baseleap.model.post.PostLikeModel;
import com.baseleap.service.post.port.PostLikeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class PostLikeMapperImpl implements PostLikeRepository {
    private final PostLikeMapper postLikeMapper;

    @Override
    public int insert(PostLikeModel postLikeModel) {
        return postLikeMapper.insert(postLikeModel);

    }

    @Override
    public int delete(PostLikeModel postLikeModel) {
        return postLikeMapper.delete(postLikeModel);
    }
}
