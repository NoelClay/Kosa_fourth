package com.baseleap.model.post;

import lombok.Getter;

@Getter
public class PostLikeModel {
    private Long postId;
    private Long userId;
    private int check;

    public PostLikeModel(Long postId, Long userId, int check) {
        this.postId = postId;
        this.userId = userId;
        this.check = check;
    }
}
