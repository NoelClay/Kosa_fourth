package com.baseleap.mapper;

import com.baseleap.service.post.port.PostImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class PostImageMapperImpl implements PostImageRepository {
    private final PostImageMapper postImageMapper;

    @Override
    public int create(List<String> urls, Long postId) {
        return postImageMapper.insert(urls, postId);
    }
}
