package com.baseleap.model.post;

import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class PostCommentCreateModel {
    private final Long postId;
    private final Long userId;
    private final String comment;
    private final LocalDateTime createdAt;

    public PostCommentCreateModel(Long postId, Long userId, String comment) {
        this.postId = postId;
        this.userId = userId;
        this.comment = comment;
        this.createdAt = LocalDateTime.now();
    }

}
