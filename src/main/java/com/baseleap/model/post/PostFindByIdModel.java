package com.baseleap.model.post;

import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
public class PostFindByIdModel {
    private final PostFindOneModel post;
    private final List<PostCommentFindModel> postComments;

    @Builder
    public PostFindByIdModel(PostFindOneModel post, List<PostCommentFindModel> postComments) {
        this.post = post;
        this.postComments = postComments;
    }
}
