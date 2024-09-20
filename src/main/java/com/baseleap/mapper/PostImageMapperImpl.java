package com.baseleap.mapper;

import com.baseleap.model.post.PostUpdateDto;
import com.baseleap.service.post.port.PostImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Objects;

@Repository
@RequiredArgsConstructor
public class PostImageMapperImpl implements PostImageRepository {
    private final PostImageMapper postImageMapper;

    @Override
    public int create(List<String> urls, Long postId) {
        return postImageMapper.insert(urls, postId);
    }

    @Override
    public int update(List<String> imageUrls, Long postId) {
        for(String bb : imageUrls){
            if(Objects.equals(bb, "")) System.out.println("널인가?");
            System.out.println("여기는 업데이트 맴퍼" + bb);
        }
        return postImageMapper.update(imageUrls, postId);
    }

    @Override
    public int updates(PostUpdateDto postUpdateDto) {
        return postImageMapper.updates(postUpdateDto);
    }
}
