package com.baseleap.service.post.port;

import com.baseleap.model.post.PostUpdateDto;

import java.util.List;

public interface PostImageRepository {
    int create(List<String> urls, Long postId);
    int update(List<String> imageUrls, Long postId);
    int updates(PostUpdateDto postUpdateDto);
}
