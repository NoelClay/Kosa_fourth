package com.baseleap.service.post.port;

import java.util.List;

public interface PostImageRepository {
    int create(List<String> urls, Long postId);
}
