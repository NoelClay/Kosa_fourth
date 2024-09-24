package com.baseleap.controller;

import com.baseleap.model.post.*;
import com.baseleap.service.post.PostService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/baseleap")
@RequiredArgsConstructor
@Slf4j
public class PostViewController {
    private final PostService postService;
    @GetMapping("/postcreate")
    public String viewCreate(
        @SessionAttribute("nickName") String nickName,
        @SessionAttribute("homePageId") Long homePageId,
        @SessionAttribute("profileImg") String profileImg,
        @SessionAttribute("userIntroduce") String userIntroduce,
        @SessionAttribute("loginUserId") Long userId,
        Model model
    ){
        model.addAttribute("userNickName", nickName);
        model.addAttribute("userId", userId);
        model.addAttribute("homePageId", homePageId);
        String imgPath = profileImg;
        model.addAttribute("profileImgPath", imgPath);
        model.addAttribute("userIntroduce", userIntroduce);
        return "thymeleaf/post/create";
    }

    @PostMapping("/postcreate")
    public String create(
        @ModelAttribute PostCreateModel postCreateModel,
        @SessionAttribute("loginUserId") Long userId
    ){
        postService.create(postCreateModel, userId);
        return "redirect:/baseleap/postlist";
    }

    @GetMapping("/postfind")
    public String viewFindOne(
        @RequestParam("postId") Long postId,
        @SessionAttribute("loginUserId") Long userId,
        @SessionAttribute("nickName") String nickName,
        @SessionAttribute("homePageId") Long homePageId,
        @SessionAttribute("profileImg") String profileImg,
        @SessionAttribute("userIntroduce") String userIntroduce,
        Model model
    ){
        PostFindByIdModel postFindOneModel = postService.findOneById(postId, userId);
        model.addAttribute("findPost", postFindOneModel);
        model.addAttribute("userNickName", nickName);
        model.addAttribute("userId", userId);
        model.addAttribute("homePageId", homePageId);
        String imgPath = profileImg;
        log.info(imgPath);
        model.addAttribute("profileImgPath", imgPath);
        model.addAttribute("userIntroduce", userIntroduce);
        return "thymeleaf/post/findone";
    }

    @GetMapping("/postupdate")
    public String viyewUpdate(
        @RequestParam("postId") Long postId,
        @SessionAttribute("loginUserId") Long userId,
        @SessionAttribute("homePageId") Long homePageId,
        @SessionAttribute("nickName") String nickName,
        @SessionAttribute("profileImg") String profileImg,
        @SessionAttribute("userIntroduce") String userIntroduce,
        Model model
    ){
        PostFindOneModel postFindOneModel = postService.findOnePrevById(postId, userId);
        model.addAttribute("updatePost", postFindOneModel);

        //김남영 추가
        model.addAttribute("homePageId", homePageId);
        model.addAttribute("userId", userId);
        model.addAttribute("userNickName", nickName);
        String imgPath = profileImg;
        model.addAttribute("profileImgPath", imgPath);
        model.addAttribute("userIntroduce", userIntroduce);
        //블록
        return "thymeleaf/post/update";
    }

    //김남영 수정함.
    //파라미터 @SessionAttribute("profileImg") String profileImg,@SessionAttribute("userIntroduce") String userIntroduce

    @GetMapping("/postlist")
    public String viewList(
        @SessionAttribute("homePageId") Long homePageId,
        @SessionAttribute("loginUserId") Long userId,
        @SessionAttribute("nickName") String nickName,
        @SessionAttribute("profileImg") String profileImg,
        @SessionAttribute("userIntroduce") String userIntroduce,
        Model model,
        @RequestParam(name = "page", defaultValue = "1") int page
    ){
        System.out.println(homePageId);
        PageImpl<PostListModel> result =  postService.findAll(page, homePageId);
        model.addAttribute("postList", result);
        model.addAttribute("homePageId", homePageId);
        model.addAttribute("userId", userId);
        model.addAttribute("userNickName", nickName);
        String imgPath = profileImg;
        model.addAttribute("profileImgPath", imgPath);
        log.info(imgPath);
        model.addAttribute("userIntroduce", userIntroduce);
        
        model.addAttribute("imgOnError", "this.src=/image/avatar.png");
        
        return "thymeleaf/post/list";
    }


    @PostMapping("/postupdate")
    public String update(
        @ModelAttribute PostUpdateModel postUpdateModel
    ){
        postService.update(postUpdateModel);
        return "redirect:/baseleap/postfind?postId=" + postUpdateModel.getPostId();
    }

    @GetMapping("/postdelete")
    public String delete(
        @RequestParam("postId") Long postId
    ){
        postService.delete(postId);
        return "redirect:/baseleap/postlist";
    }
}
