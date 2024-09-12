package com.baseleap.service.post.port;

import com.baseleap.model.post.Post;
import com.baseleap.model.post.PostCreateModel;

public interface PostRepository {
    int insert(Post post);
}
