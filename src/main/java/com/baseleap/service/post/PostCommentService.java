package com.baseleap.service.post;

import com.baseleap.model.post.PostCommentCreateModel;
import com.baseleap.model.post.PostCommentUpdateModel;
import com.baseleap.model.post.PostReplyCreateModel;

public interface PostCommentService {
    void create(PostCommentCreateModel postCommentCreateModel);
    int replyCreate(PostReplyCreateModel postReplyCreateModel);

    int update(PostCommentUpdateModel postCommentUpdateModel);

    int delete(Long commentId);
}
