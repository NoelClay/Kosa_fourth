package com.baseleap.model.post;

import lombok.Builder;
import lombok.Getter;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
public class PostUpdateModel {
    private final Long postId;
    private final String title;
    private final String content;
    private final long userId;
    private final List<MultipartFile> updateImages;
    private final List<String> prevImage;

    @Builder
    public PostUpdateModel(Long postId, String title, String content, long userId, List<MultipartFile> updateImage, List<String> prevImage) {
        this.postId = postId;
        this.title = title;
        this.content = content;
        this.userId = userId;
        this.updateImages = updateImage;
        this.prevImage = prevImage;
    }
}
