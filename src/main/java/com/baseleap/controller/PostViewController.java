package com.baseleap.controller;

import com.baseleap.model.post.PostFindByIdModel;
import com.baseleap.model.post.PostFindOneModel;
import com.baseleap.model.post.PostListModel;
import com.baseleap.service.post.PostService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/baseleap")
@ResponseStatus
@RequiredArgsConstructor
public class PostViewController {
    private final PostService postService;
    @GetMapping("/postcreate")
    public String viewCreate(){
        return "thymeleaf/post/create";
    }

    @GetMapping("/postfind")
    public String viewFindOne(
        @RequestParam("postId") Long postId,
        Model model
    ){
        System.out.println("postId =>> " + postId);
        PostFindByIdModel postFindOneModel = postService.findOneById(postId);
        model.addAttribute("findPost", postFindOneModel);
        return "thymeleaf/post/findone";
    }

    @GetMapping("/postupdate")
    public String viyewUpdate(
        @RequestParam("postId") Long postId,
        Model model
    ){
        PostFindOneModel postFindOneModel = postService.findOnePrevById(postId);
        model.addAttribute("updatePost", postFindOneModel);
        return "thymeleaf/post/update";
    }

    @GetMapping("/postlist")
    public String viewList(
        HttpSession session,
        Model model,
        @RequestParam(name = "page", defaultValue = "1") int page
//        @PageableDefault(size = 10) Pageable pageable
    ){
        System.out.println("ssss ===>> " + page);
        PageImpl<PostListModel> result =  postService.findAll(page);
        model.addAttribute("postList", result);
        return "thymeleaf/post/list";
    }
}
