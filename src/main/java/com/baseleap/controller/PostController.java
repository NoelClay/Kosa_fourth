package com.baseleap.controller;

import com.baseleap.common.util.ResponseType;
import com.baseleap.model.post.*;
import com.baseleap.service.post.PostCommentService;
import com.baseleap.service.post.PostLikeService;
import com.baseleap.service.post.PostService;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Delete;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/baseleap")
@ResponseStatus
@RequiredArgsConstructor
public class PostController {
    private final PostService postService;
    private final PostCommentService postCommentService;
    private final PostLikeService postLikeService;



    @PostMapping("/postcommentcreate")
    public ResponseEntity<ResponseType> commentCreate(
        @RequestBody PostCommentCreateModel postCommentCreateModel
        ){
        postCommentService.create(postCommentCreateModel);
        return ResponseEntity.ok(ResponseType.SUCCESS);
    }

    @PostMapping("/postreplycreate")
    public ResponseEntity<ResponseType> replyCreate(
        @RequestBody PostReplyCreateModel postReplyCreateModel
    ){
        postCommentService.replyCreate(postReplyCreateModel);
        return ResponseEntity.ok(ResponseType.SUCCESS);
    }

    @PutMapping("/postcomment")
    public ResponseEntity<ResponseType> commentUpdate(
        @RequestBody PostCommentUpdateModel postCommentUpdateModel
        ){
        postCommentService.update(postCommentUpdateModel);
        return ResponseEntity.ok(ResponseType.SUCCESS);
    }

    @DeleteMapping("/postcomment")
    public ResponseEntity<ResponseType> commentDelete(
        @RequestParam Long commentId
    ){
        postCommentService.delete(commentId);
        return ResponseEntity.ok(ResponseType.SUCCESS);
    }

    @PutMapping("/postreply")
    public ResponseEntity<ResponseType> replyUpdate(
        @RequestBody PostCommentUpdateModel postCommentUpdateModel
    ){
        System.out.println("요기;");
        postCommentService.update(postCommentUpdateModel);
        return ResponseEntity.ok(ResponseType.SUCCESS);
    }

    @PostMapping("/postlike")
    public ResponseEntity<ResponseType> like(
        @RequestBody PostLikeModel postLikeModel
    ){
        System.out.println("postId = > "+postLikeModel.getPostId());
        System.out.println("userId = > "+postLikeModel.getUserId());
        System.out.println("check => " + postLikeModel.getCheck());
        if(postLikeModel.getCheck() == 0) postLikeService.insert(postLikeModel);
        else postLikeService.delete(postLikeModel);
        return ResponseEntity.ok(ResponseType.SUCCESS);
    }
}
