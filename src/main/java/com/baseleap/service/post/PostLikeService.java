package com.baseleap.service.post;

import com.baseleap.model.post.PostLikeModel;

public interface PostLikeService {
    int insert(PostLikeModel postLikeModel);
    int delete(PostLikeModel postLikeModel);
}
