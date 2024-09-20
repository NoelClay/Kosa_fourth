package com.baseleap.service.post;

import com.baseleap.model.post.PostCommentCreateModel;
import com.baseleap.model.post.PostCommentUpdateModel;
import com.baseleap.model.post.PostReplyCreateModel;
import com.baseleap.service.post.port.PostCommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PostCommentServiceImpl implements PostCommentService {
    private final PostCommentRepository postCommentRepository;

    @Override
    public void create(PostCommentCreateModel postCommentCreateModel) {
        postCommentRepository.create(postCommentCreateModel);
    }

    @Override
    public int replyCreate(PostReplyCreateModel postReplyCreateModel) {
        return postCommentRepository.replyCreate(postReplyCreateModel);

    }

    @Override
    public int update(PostCommentUpdateModel postCommentUpdateModel) {
        return postCommentRepository.update(postCommentUpdateModel);
    }

    @Override
    public int delete(Long commentId) {
        postCommentRepository.delete(commentId);
        return 0;
    }
}
