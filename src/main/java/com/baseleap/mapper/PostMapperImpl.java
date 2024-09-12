package com.baseleap.mapper;

import com.baseleap.model.post.Post;
import com.baseleap.model.post.PostCreateModel;
import com.baseleap.service.post.port.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class PostMapperImpl implements PostRepository {
    private final PostMapper postMapper;

    @Override
    public int insert(Post post){
        return postMapper.insert(post);
    }
}
