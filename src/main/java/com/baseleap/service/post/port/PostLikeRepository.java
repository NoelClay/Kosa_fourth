package com.baseleap.service.post.port;

import com.baseleap.model.post.PostLikeModel;

public interface PostLikeRepository {
    int insert(PostLikeModel postLikeModel);
    int delete(PostLikeModel postLikeModel);
}
