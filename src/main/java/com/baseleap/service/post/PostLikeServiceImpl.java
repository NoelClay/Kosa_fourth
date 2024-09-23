package com.baseleap.service.post;

import com.baseleap.model.post.PostLikeModel;
import com.baseleap.service.post.port.PostLikeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PostLikeServiceImpl implements PostLikeService{
    private final PostLikeRepository postLikeRepository;

    @Override
    public int insert(PostLikeModel postLikeModel) {
        return postLikeRepository.insert(postLikeModel);

    }

    @Override
    public int delete(PostLikeModel postLikeModel) {
        return postLikeRepository.delete(postLikeModel);

    }
}
