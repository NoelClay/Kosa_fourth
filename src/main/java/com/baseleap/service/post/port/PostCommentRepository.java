package com.baseleap.service.post.port;

import com.baseleap.model.post.PostCommentCreateModel;
import com.baseleap.model.post.PostCommentFindModel;
import com.baseleap.model.post.PostCommentUpdateModel;
import com.baseleap.model.post.PostReplyCreateModel;

import java.util.List;

public interface PostCommentRepository {
    int create(PostCommentCreateModel postCommentCreateModel);
    int replyCreate(PostReplyCreateModel postReplyCreateModel);
    List<PostCommentFindModel> findByPostId(Long postId);

    int update(PostCommentUpdateModel postCommentUpdateModel);

    int delete(Long commentId);
}
