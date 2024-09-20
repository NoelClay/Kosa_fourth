package com.baseleap.model.post;

import lombok.Builder;

import java.util.List;

public class PostUpdateDto {
    private List<String> imageUrls;
    private Long postId;

    @Builder
    public PostUpdateDto(List<String> imageUrls, Long postId) {
        this.imageUrls = imageUrls;
        this.postId = postId;
    }
}
