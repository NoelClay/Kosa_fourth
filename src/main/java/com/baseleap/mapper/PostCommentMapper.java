package com.baseleap.mapper;

import com.baseleap.model.post.PostCommentCreateModel;
import com.baseleap.model.post.PostCommentFindModel;
import com.baseleap.model.post.PostCommentUpdateModel;
import com.baseleap.model.post.PostReplyCreateModel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostCommentMapper {
    int insert(PostCommentCreateModel postCommentCreateModel);
    List<PostCommentFindModel> findByPostId(Long postId);
    int replyInsert(PostReplyCreateModel postReplyCreateModel);

    int update(PostCommentUpdateModel postCommentUpdateModel);

    int delete(Long commentId);
}
