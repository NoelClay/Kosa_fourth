package com.baseleap.model.post;

import lombok.Builder;
import lombok.Getter;

@Getter
public class PostCommentUpdateModel {
    private final Long commentId;
    private final String comment;

    @Builder
    public PostCommentUpdateModel(Long commentId, String comment) {
        this.commentId = commentId;
        this.comment = comment;
    }
}
