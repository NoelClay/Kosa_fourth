package com.baseleap.mapper;

import com.baseleap.model.post.PostCommentCreateModel;
import com.baseleap.model.post.PostCommentFindModel;
import com.baseleap.model.post.PostCommentUpdateModel;
import com.baseleap.model.post.PostReplyCreateModel;
import com.baseleap.service.post.port.PostCommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class PostCommentMapperImpl implements PostCommentRepository {
    private final PostCommentMapper postCommentMapper;

    @Override
    public int create(PostCommentCreateModel postCommentCreateModel) {
        return postCommentMapper.insert(postCommentCreateModel);
    }

    @Override
    public int replyCreate(PostReplyCreateModel postReplyCreateModel) {
        return postCommentMapper.replyInsert(postReplyCreateModel);

    }

    @Override
    public List<PostCommentFindModel> findByPostId(Long postId) {
        return postCommentMapper.findByPostId(postId);

    }

    @Override
    public int update(PostCommentUpdateModel postCommentUpdateModel) {
        return postCommentMapper.update(postCommentUpdateModel);
    }

    @Override
    public int delete(Long commentId) {
        return postCommentMapper.delete(commentId);

    }
}
