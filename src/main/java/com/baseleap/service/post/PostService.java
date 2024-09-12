package com.baseleap.service.post;

import com.baseleap.model.post.Post;
import com.baseleap.model.post.PostCreateModel;

public interface PostService {
    void create(PostCreateModel postCreateModel);
}
