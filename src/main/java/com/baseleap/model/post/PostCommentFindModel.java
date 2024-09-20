package com.baseleap.model.post;

import lombok.Builder;
import lombok.Getter;

@Getter
public class PostCommentFindModel {
    private final Long id;
    private final Long parentid;
    private final String comment;
    private final String createdAt;
    private final String updatedAt;
    private final Long postId;
    private final String usernickname;

    @Builder
    public PostCommentFindModel(Long id,Long parentid ,String comment, String createdAt, String updatedAt, Long postId, String usernickname) {
        this.id = id;
        this.parentid = parentid;
        this.comment = comment;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.postId = postId;
        this.usernickname = usernickname;
    }
}
