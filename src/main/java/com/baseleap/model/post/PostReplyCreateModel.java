package com.baseleap.model.post;

import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;
@Getter
public class PostReplyCreateModel {
    private final Long postId;
    private final Long userId;
    private final Long commentId;
    private final String reply;
    private final LocalDateTime createdAt;

    @Builder
    public PostReplyCreateModel(Long postId, Long userId, Long commentId, String reply) {
        this.postId = postId;
        this.userId = userId;
        this.commentId = commentId;
        this.reply = reply;
        this.createdAt = LocalDateTime.now();
    }
}
