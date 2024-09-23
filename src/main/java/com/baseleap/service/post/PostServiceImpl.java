package com.baseleap.service.post;


import com.baseleap.model.post.*;
import com.baseleap.service.post.port.PostCommentRepository;
import com.baseleap.service.post.port.PostImageRepository;
import com.baseleap.service.post.port.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class PostServiceImpl implements PostService{
    private final PostRepository postRepository;
    private final PostCommentRepository postCommentRepository;
    private final PostImageRepository postImageRepository;
    private final S3Service s3Service;


    @Override
    @Transactional
    public void create(PostCreateModel postCreateModel, Long userId){
        Post post = Post.create(postCreateModel, userId);
        int check = postRepository.insert(post);
        List<String> urls = s3Service.savePostImages(postCreateModel.getImage(), post.getId());
        postImageRepository.create(urls, post.getId());
    }

    @Override
    public PostFindByIdModel findOneById(Long postId, Long userId) {
        List<PostCommentFindModel> postCommentFindModels = postCommentRepository.findByPostId(postId);
        PostFindOneModel postFindOneModel = postRepository.findOne(postId, userId);
       return PostFindByIdModel.builder()
           .post(postFindOneModel)
           .postComments(postCommentFindModels).build();
    }

    @Override
    public PostFindOneModel findOnePrevById(Long postId, Long userId) {
        return postRepository.findOne(postId, userId);
    }

    @Override
    @Transactional
    public void update(PostUpdateModel postUpdateModel) {
        List<String> imageUrls = s3Service.updateImage(postUpdateModel.getUpdateImages(),postUpdateModel.getPrevImage() ,postUpdateModel.getPostId());
        int updatePost = postRepository.update(postUpdateModel);
        int updateImage = postImageRepository.update(updateImage(postUpdateModel.getPrevImage(), imageUrls),postUpdateModel.getPostId());
    }

    @Override
    public void delete(Long postId) {
        postRepository.delete(postId);
    }

    @Override
    public PageImpl<PostListModel> findAll(int page, Long homePageId) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        List<Long> result = postRepository.postIds(pageable.getPageSize(), pageable.getOffset(), homePageId);
        List<PostListModel> aa =  postRepository.findAll(result);
        int count = postRepository.countByUserId(homePageId);
        return new PageImpl<>(aa, pageable, count);
    }


    public List<String> updateImage(List<String> prevImageUrls, List<String> imageUrls){
        for (int i = 0; i < imageUrls.size(); i++) {
            imageUrls.set(i, imageUrls.get(i) == null ? prevImageUrls.get(i) : imageUrls.get(i));
        }
        return imageUrls;
    }
}
