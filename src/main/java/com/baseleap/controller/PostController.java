package com.baseleap.controller;

import com.baseleap.model.post.PostCreateModel;
import com.baseleap.service.post.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

//@RestController
@Controller
@ResponseStatus
@RequiredArgsConstructor
public class PostController {
    private final PostService postService;
    @GetMapping("/api/create")
    public String create(){
//        PostCreateModel postCreateModel = new PostCreateModel("저장", "내용저장",1);
//        postService.create(postCreateModel);
        return "/post/create";
    }
}
