package com.baseleap.model.post;

import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
public class Post {
    private Long id;
    private String title;
    private String content;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private Long userId;

    @Builder
    public Post(Long id, String title, String content, LocalDateTime createdAt, LocalDateTime updatedAt, Long userId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.userId = userId;
    }

    public static Post create(PostCreateModel postCreateModel){
        return Post.builder()
            .title(postCreateModel.getTitle())
            .content(postCreateModel.getContent())
            .createdAt(LocalDateTime.now())
            .userId(postCreateModel.getUserId())
            .build();
    }
}
