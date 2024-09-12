package com.baseleap.service.post;


import com.baseleap.model.post.Post;
import com.baseleap.model.post.PostCreateModel;
import com.baseleap.service.post.port.PostImageRepository;
import com.baseleap.service.post.port.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
public class PostServiceImpl implements PostService{
    private final PostRepository postRepository;
    private final PostImageRepository postImageRepository;
    private final S3Service s3Service;


    @Override
    @Transactional
    public void create(PostCreateModel postCreateModel){
        Post post = Post.create(postCreateModel);
        int check = postRepository.insert(post);
        List<String> urls = s3Service.savePostImages(postCreateModel.getImage(), post.getId());
        postImageRepository.create(urls, post.getId());
//        urls.forEach(url -> {
//            postImageRepository.create(url, post.getId());
//        });
    }
}
